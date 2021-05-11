# Kerberos-Auth & SSH-Docker-Jailing

This repository provides all the necessary customizations to a Debian 10 (Buster) system to install Docker, include authentication against a user defined realm, and lock SSH sessions into a (volatile) Docker container.

## Before getting started

Due to mapping the complete `/etc` path to a docker volume, the most changes on the container image (like installation of further tools) won't get active for existing users without deleting the existing volumes! Due to this fact you should check if the docker image fulfills all requirements.

At the moment the students are able to solve tasks as `root` inside the docker container. Providing root permissions is generally not the best idea, so the containers run isolated in a user namespace on the host. If someone manages to break out of the container, he would not be root on the host.

## How to use

For a simpler installation everything is provided as an ansible playbook/role so a recent working ansible installation is required. Afterwards the installation & setup is quite straight forward. Simply place the login names of the students inside the `host_vars/localhost.yml`, configure the Kerberos Realm and Server and run the playbook `playbooks/setup-docker-jail.yml`.

### Example configuration

```.yaml
students:
  - alice
  - bob
  - foo
  - bar
krb5_realm: AD.LOCAL
krb5_server: ad.local
```

At the end of a semester removing the students data is as easy as the initial setup. You only need to run `playbooks/delete-students.yml` and everything should be gone.
