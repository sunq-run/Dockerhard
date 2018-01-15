#!/bin/sh

sudo docker network rm hardeninng_fwnet
sudo docker network rm hardeninng_globalnet
sudo docker network rm hardeninng_mainfwlocal
sudo docker network rm hardeninng_subfwlocal

