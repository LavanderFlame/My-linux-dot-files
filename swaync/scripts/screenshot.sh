#!/bin/bash

swaync-client -t
grim -g "$(slurp)" - | swappy -f -
