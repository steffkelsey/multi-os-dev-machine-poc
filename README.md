# multi-os-dev-machine-poc

[![LINUXCI](https://github.com/steffkelsey/multi-os-dev-machine-poc/actions/workflows/linux-ci.yml/badge.svg?branch=main)](https://github.com/steffkelsey/multi-os-dev-machine-poc/actions/workflows/linux-ci.yml)
[![MACOSCI](https://github.com/steffkelsey/multi-os-dev-machine-poc/actions/workflows/macos-ci.yml/badge.svg?branch=main)](https://github.com/steffkelsey/multi-os-dev-machine-poc/actions/workflows/macos-ci.yml)

A proof of concept for an Ansible playbook that provisions for macOS and Ubuntu
Linux with molecule tests.

Requirements
------------

For macOS, you need to have homebrew installed.
For Ubuntu, none.

Setup
------------

For macOS, there is a convenient setup script to install python3, ansible, and
molecule.

    $ ./install_depencies_macos.sh

For Linux, there is a convenient setup script to install python3, ansible, and
molecule. At the time of writing this documentation, only Ubuntu is supported.

    $ ./install_dependencies_linux.sh

Second, install the dependencies for the main playbook and the roles.

    $ ansible-galaxy install -r requirements.yml

Running
------------

To provision, navigate to the root directory of this repo and run:

    $ ansible-playbook main.yml --ask-become-pass

There are two ways to customize the result of playbook. The first is to use the
`--extra-vars` flag to change the variables. If you didn't want to install asdf:

    $ ansible-playbook main.yml --ask-become-pass --extra-vars "asdf_install=false"

Alternatively, you can make your own version of the default.config.yml, setting
`asdf_install: false`.

See below for list of variables and their defaults from the default.config.yml

Variables
------------

Controls if asdf should be installed (default=true).

    asdf_install: true

Controls the asdf version to install (default=0.9.0).

    asdf_version: 0.9.0

Controls the user who should get asdf installed (default=the user who called ansible)

    asdf_user: "{{ lookup('env', 'USER') }}"

Controls the HOME folder of user who should get asdf installed (default=HOME for the user who called ansible)

    asdf_home: "{{ lookup('env', 'HOME') }}"

The checksum on the source for the release in GitHub. Required by the asdf role
used for Linux distros. Not required for the macOS role.
(default=f2ab54bf1d17e10f17e405c2fac29f0620a66b5c7a5200b5699e50e28ed210c8)

    asdf_sha256: f2ab54bf1d17e10f17e405c2fac29f0620a66b5c7a5200b5699e50e28ed210c8

Controls the plugins and versions that asdf should install. (default below)

    asdf_plugins:
    - name: nodejs
      versions: ["14.17.6", "16.13.2"]
      global: "16.13.2"

All current defaults can be found in the default.config.yml at the project root.

Dependencies
------------

From the requirements.yml:

For installing asdf on Linux

    baztian.asdf

For installing asdf on macOS

    osx_provisioner.asdf

License
-------

MIT

Author Information
------------------

Steff Kelsey  
gh: @steffkelsey  
tw: @thecodevik!ng  
