#!/bin/sh
pkill -9 -f "gallery"
nohup ruby gallery.rb >> /tmp/sinatra.log 2>&1 &
