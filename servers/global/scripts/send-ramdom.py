#!/usr/bin/python

import time
import socket
import os 
import random
from datetime import datetime
befsec = 5
host = socket.gethostbyname(os.getenv("rHOST"))
#host = "127.0.0.1"
port = 12345

def send_random():
      try:
            c = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            c.connect((host, port))
            ram = str(random.randint(1,100))
            print "Send>>" + ram
            c.send(ram)
            c.close()
      except:
            print "connection error"

while True:
    sec = datetime.now().strftime("%S")
    if int(sec)%5 == 0:
        if befsec == sec:
            continue
        befsec = sec
        send_random()

