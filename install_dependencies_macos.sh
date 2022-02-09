#!/bin/bash
# Installs Molecule for docker (which also installs ansible)
# https://molecule.readthedocs.io/en/latest/installation.html

# First we setup python 3 because we can only get Molecule from there.
# And may as well get ansible from there as well


brew install python3

# TODO - switch to using virtualenv rather than a global install
python3 -m pip install ansible molecule[docker,lint] yamllint ansible-lint
