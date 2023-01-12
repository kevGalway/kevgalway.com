#!/usr/bin/bash

jekyll build
aws s3 sync _site  s3://kevgalway.com --profile personal