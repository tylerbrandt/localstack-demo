#!/bin/sh -e

source .venv/bin/activate

docker-compose down
docker-compose up -d

zip index.zip index.js

# Note: "--role" is required in awscli, but it appears to be ignored by localstack
awslocal lambda create-function \
  --runtime nodejs6.10 \
  --function-name testfn \
  --handler index.handler \
  --zip-file fileb://index.zip \
  --role IGNORED
awslocal lambda invoke \
  --function-name testfn \
  --payload "{\"foo\": \"bar\"}" \
  log.txt
