#! /bin/sh

code &

google-chrome-stable --profile-directory=Default --app-id=hjaljckdchhjkhikmngilafdecmnjifi &

termite --name=go-do -e "sh -c 'go-do -f;$SHELL -i'" &

gmail-desktop &

google-chrome-stable &

keepassxc &
