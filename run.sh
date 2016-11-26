#!/bin/sh

/etc/init.d/dbus restart 
avahi-daemon --no-drop-root -D

homebridge
