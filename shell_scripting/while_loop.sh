#!/bin/bash

INPUT=hello
while [ "$INPUT" != "exit" ]; do
	echo "enter something, type \"exit\" to quit"
	read INPUT
	echo "you typed $INPUT"
done
