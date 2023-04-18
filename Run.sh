#!/bin/bash
ifile="file.txt"
slinestr=$(xargs < "$ifile")
echo "String is : $slinestr"
