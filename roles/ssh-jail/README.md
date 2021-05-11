# SSH Jail Role

This role provides a ssh jail using docker containers and forced commands in the sshd_config.

Therefore several things are changed:

* The docker containers are isolated using an user namespace.
* The members of the group `students` are forced to run the script in `/usr/local/ssh-jail.sh`.
* This script starts a new docker (temporary) docker container with limited privileges and maps the path `/lab`, `/home` and `/etc` to a volume. The `/etc` path is required for persisting changes in the `passwd`, `group` or `shadow` file. The `/home` is required for the (new) user dirs.
* All passed users in the variable `students` are created and put into the group `students` & `docker`.
* A docker image `ssh-jail` is build using the `Dockerfile` inside `files`.
