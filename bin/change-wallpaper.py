#!/usr/bin/env python
import os, sys
import random

wallpaper = random.choice(os.listdir(sys.argv[1]))

#print wallpaper
os.system('gsettings set org.gnome.desktop.background picture-uri "file://'+sys.argv[1]+'/'+wallpaper+'"')
print('gsettings set org.gnome.desktop.background picture-uri "file://'+sys.argv[1]+'/'+wallpaper+'"')
