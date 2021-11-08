#!/bin/sh
ssh-keygen -A >/dev/null 2>/dev/null
exec /usr/sbin/sshd -D -e "$@"
