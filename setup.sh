#!/bin/bash

ls -A --ignore={.git,setup.sh,README.md} | xargs -I @ ln -s $PWD/@ ~/@

echo 'if [ -f ~/.bashrc_my ]; then . ~/.bashrc_my; fi' >> ~/.bashrc
