#!/bin/sh -e

virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
