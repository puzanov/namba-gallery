#!/bin/sh
pkill -9 -f "gallery"
nohup ruby gallery.rb >> /tmp/gallery.log 2>&1 &
