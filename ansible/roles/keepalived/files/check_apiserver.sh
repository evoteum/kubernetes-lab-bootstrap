#!/bin/sh

# Check that HAProxy is LISTENING on 6443
nc -zv -w 2 127.0.0.1 6443
exit $?
