#!/bin/bash

WD=$CONFDIR/scripts/auth/gmail/

oauth2-google --client_id=$(cat $WD/client-id) --client_secret=$(cat $WD/client-secret) --login="monkeyjosephlee@gmail.com" --scope=https://mail.google.com --port=8089
