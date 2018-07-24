name 			  "python"
maintainer        "Fin Gao, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Python, pip."
version           "1.0.7"

#depends           "build-essential"

recipe "python", "Installs python, pip"
recipe "python::python3.6", "Installs python with version 3.6."
recipe "python::pip", "Installs pip from source."
recipe "python::setuptools", "Installs python setuptools."