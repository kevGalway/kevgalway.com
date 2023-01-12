#!/usr/bin/bash

jekyll build
aws s3 sync _site  s3://terraform-20230112224202845500000002 --profile personal