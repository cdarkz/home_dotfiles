#!/usr/bin/env python
import os, sys
import subprocess
import random

PID = subprocess.check_output("pidof -s nautilus", shell = True)

if not PID or PID.isspace():
    print "Could not detect active login session"
    exit(1)

ENVIRON = subprocess.check_output('cat /proc/'+PID.strip()+'/environ', shell = True)

QUERY_ENVIRON = ""
for line in ENVIRON.replace("\0", "\n").split("\n"):
    if "DBUS_SESSION_BUS_ADDRESS" in line:
        QUERY_ENVIRON = line

if not QUERY_ENVIRON or QUERY_ENVIRON.isspace():
    print "Could not find dbus session ID in user environment."
    exit(1)

wallpaper = random.choice(os.listdir(sys.argv[1]))

#print wallpaper
QUERY_ENVIRON_INDEX = QUERY_ENVIRON.strip().find("=") + 1
CLI_COMMAND = 'DBUS_SESSION_BUS_ADDRESS='+QUERY_ENVIRON.strip()[QUERY_ENVIRON_INDEX:]+' gsettings set org.gnome.desktop.background picture-uri "file://'+sys.argv[1]+'/'+wallpaper+'"'
os.system(CLI_COMMAND)
print(CLI_COMMAND)
