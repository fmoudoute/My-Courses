"""
Server Side
Sending and Recieving Data with Sockets
"""
import socket
import sys
from _thread import *

host = ""
port = 7777

headjack = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    headjack.bind((host, port))
except socket.error as error:
    print(str(error))

headjack.listen(1)
print("Waiting for a connection...")

def threaded_client(connection):
    connection.send(str.encode("Type here:\n")) #Python 2 does not need encode

    while True:
        data = connection.recv(1024) #originally 2048
        print("Received ", repr(data.decode("utf-8"))) #print data
        #reply = "Server output: " + data.decode("utf-8") #original test
        reply = input("Reply :") #raw_input() in python 2.7
        if not data:
            break
        connection.sendall(str.encode(reply))
    connection.close()

while True:
    connection, address = headjack.accept()
    print("connected to: "+address[0]+":"+str(address[1]))
    start_new_thread(threaded_client,(connection,))

#while True:
    #data = conn.recv(1024) #recives datae (1024 bytes) using conn and store into data
    #print("Received ", repr(data)) # print data; Data is the message the users types
    #reply = raw_input("Reply: ")
    #conn.sendall(reply)
