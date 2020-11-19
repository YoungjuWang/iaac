#!/bin/bash

echo "remove ssh known hosts"

sed -i '/10./d' ~/.ssh/known_hosts

echo "terrafrom vm lists in known_hosts"
grep -E '^10.' ~/.ssh/known_hosts
