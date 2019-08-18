#!/bin/bash
kill $(ps aux | grep '[s]erve' | awk '{print $2}')