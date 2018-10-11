#!/bin/sh
./basic `fbset | grep "mode " | cut -d \" --fields=2`
