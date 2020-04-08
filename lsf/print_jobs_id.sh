#!/bin/bash
string=$1
bjobs | sed -n /$string/p | awk '{print $1}'
