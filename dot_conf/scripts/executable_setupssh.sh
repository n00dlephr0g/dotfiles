#!/bin/bash
ssh-keygen -t ed25519 -f ~/.ssh/scallop -N ""
cat ~/.ssh/scallop.pub | ssh n00dlephr0g@scallop "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

