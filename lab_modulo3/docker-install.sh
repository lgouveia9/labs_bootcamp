#!/bin/sh
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $USER
echo added $USER to docker group
