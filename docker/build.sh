#!/bin/bash
# Build Geth container
docker build -t stratis-geth:latest ./geth
# Build Prysm container
docker build -t stratis-prysm:latest ./prysm