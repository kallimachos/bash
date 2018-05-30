#!/bin/bash

# Display last 50 lines of deis logs in human readable format

deis logs --lines 50 | awk '{gsub("\\\\n", "\n")};1'
