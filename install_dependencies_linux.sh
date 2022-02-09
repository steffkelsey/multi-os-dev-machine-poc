#!/bin/bash
# Installs Molecule for docker (which also installs ansible)
# https://molecule.readthedocs.io/en/latest/installation.html

# Grab the distro ID from lsb_release
id=$(lsb_release -si)

# First we setup python 3 because we can only get Molecule from there.
# And may as well get ansible from there as well

if [ "$id" == "Ubuntu" ]; then
  # ubuntu setup
  sudo apt-get update
  sudo apt-get install python3.8 python3-pip libssl-dev
  # TODO - switch to using virtualenv rather than a global install
  python3 -m pip install ansible molecule[docker,lint] yamllint ansible-lint
else
  echo "Not setup for distro: $id"
  echo "EXITING WITHOUT INSTALLING ANSIBLE"
  exit 1
fi
