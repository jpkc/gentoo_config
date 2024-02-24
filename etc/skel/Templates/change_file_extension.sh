#!/bin/bash
find . -name "*.opus" | while read i; do mv "$i" "${i%.opus}.mp3"; done
