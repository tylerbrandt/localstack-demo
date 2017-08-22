#!/bin/bash -e

function lambda {
  awslocal lambda $@
}

zip index.zip index.js

# Note: "--role" is required in awscli, but it appears to be ignored by localstack
lambda create-function \
  --runtime nodejs6.10 \
  --function-name testfn \
  --handler index.handler \
  --zip-file fileb://index.zip \
  --role IGNORED

lambda invoke \
  --function-name testfn \
  log.txt
