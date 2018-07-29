#!/usr/bin/env python

from optparse import OptionParser
from chef import ChefAPI, DataBag, DataBagItem
import sys
import socket
import json
import gitlab
import base64

def main(opts, args):
    gitClient = gitlab.Gitlab("https://git.5gdcs.com", opts.token, api_version=4)
    chefRepo = gitClient.projects.get("pcs/chef-pcs")
    pubkey = open(opts.pubkeyPath).read()
    def updateUserDatabagItem(itemName, itemObject):
        with ChefAPI("https://chef.5gdcs.com/sestra-pcs", opts.key, opts.client, ssl_verify=False):
            dbi = DataBagItem('users', itemName)
            dbi.update(itemObject)
    def getUserRepoFile(username):
        return chefRepo.files.get(file_path="data_bags/users/{0}.json".format(username), ref="master")
    def saveRepoFileWithContent(file, content, message):
        file.content = base64.b64encode(content).decode()
        file.save(branch="master", commit_message=message, encoding='base64')
    def addUserKeyToRepoFile(username, k):
        commitMessage = "Added chef generated key for {0}@{1}".format(username, socket.gethostname())
        itemFile = getUserRepoFile(username)
        item = json.loads(itemFile.decode())
        try:
            item['ssh_keys'].index(k)
        except ValueError: # we only want to add it if it doesn't exist yet!
            item['ssh_keys'].append(k)
            saveRepoFileWithContent(itemFile, json.dumps(item,indent=4), commitMessage)
            updateUserDatabagItem(username, item)
        return 0
    def removeUserKeyFromRepoFile(username, k):
        commitMessage = "Removed chef generated key for {0}@{1}".format(username, socket.gethostname())
        itemFile = getUserRepoFile(username)
        item = json.loads(itemFile.decode())
        try:
            item['ssh_keys'].remove(k)
        except ValueError:
            return 0 # short circuit, no reason to perform actions on repo or chef master
            #indent="\t"
        saveRepoFileWithContent(itemFile, json.dumps(item,indent=4), commitMessage)
        updateUserDatabagItem(username, item)
        return 0
    if 'add' in args and len(args) == 1:
        sys.exit(addUserKeyToRepoFile(opts.username,pubkey))
    elif 'remove' in args and len(args) == 1:
        sys.exit(removeUserKeyFromRepoFile(opts.username,pubkey))
    else:
        sys.exit(1)


if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-p", "--pubkeyPath", dest="pubkeyPath", help="absolute path of pubkey to manage")
    parser.add_option("-u", "--username", dest="username", help="chef users databag item to manage pubkey for")
    parser.add_option("-t", "--token", dest="token", help="private token for authenticating to GitLab API")
    parser.add_option("-k", "--key", dest="key", help="client key for authenticating to Chef API")
    parser.add_option("-c", "--client", dest="client", help="client name for authenticating to Chef API")
    (options, arguments) = parser.parse_args()
    main(options, arguments)
