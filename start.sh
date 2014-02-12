#!/bin/bash

# environment variables
env

# run SSH
/usr/sbin/sshd

# start authentication agent
eval `ssh-agent -s`

# add ssh-key
ssh-add
