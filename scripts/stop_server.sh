#!/bin/bash
for pid in $(ps -ef | grep '[s]erve' | awk '{print $2}'); do kill -9 $pid; done