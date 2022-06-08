This directory contains the local video content HTTP server and the multi-segment HTTP client.


Execution instructions for the local video content HTTP server/client:
```console
usage: local [-h] [-a ADDRESS] [-p PORT] [-sa REMOTEADDRESS] [-sp REMOTEPORT]
                  [-d DIRECTORY]

Local video content HTTP server / client

optional arguments:
  -h, --help            show this help message and exit
  -a ADDRESS, --address ADDRESS
                        IP address
  -p PORT, --port PORT  serving port
  -sa REMOTEADDRESS, --remoteaddress REMOTEADDRESS
                        remote server IP address
  -sp REMOTEPORT, --remoteport REMOTEPORT
                        remote server serving port
  -d DIRECTORY, --directory DIRECTORY
                        serving directory
```

An example execution could be the following:
```console
./local -a 127.0.0.1 -p 8002 -sa 127.0.0.3 -sp 8003 -d .
```


Execution instructions for the Multi-Segment (MS) local video content HTTP server/client:
```console
usage: local-ms [-h] [-a ADDRESS] [-p PORT] [-sa REMOTEADDRESS] [-sp REMOTEPORT]
                     [-d DIRECTORY]

Local video content HTTP server / client

optional arguments:
  -h, --help            show this help message and exit
  -a ADDRESS, --address ADDRESS
                        IP address
  -p PORT, --port PORT  serving port
  -sa REMOTEADDRESS, --remoteaddress REMOTEADDRESS
                        remote server IP address
  -sp REMOTEPORT, --remoteport REMOTEPORT
                        remote server serving port
  -d DIRECTORY, --directory DIRECTORY
                        serving directory
```

An example execution could be the following:
```console
./local-ms -a 127.0.0.1 -p 8002 -sa 127.0.0.3 -sp 8003 -d .
```


Execution instructions for the Multi-Segment (MS) video streaming HTTP client:
```console
usage: client-ms [-h] [-sa REMOTEADDRESS] [-sp REMOTEPORT] [-d DIRECTORY]
                      -r {2160,1440,1080,720,480,360}

Multi-Segment video streaming HTTP client

optional arguments:
  -h, --help            show this help message and exit
  -sa REMOTEADDRESS, --remoteaddress REMOTEADDRESS
                        remote server IP address
  -sp REMOTEPORT, --remoteport REMOTEPORT
                        remote server serving port
  -d DIRECTORY, --directory DIRECTORY
                        serving directory
  -r {2160,1440,1080,720,480,360}, --resolution {2160,1440,1080,720,480,360}
                        video resolution to be streamed
```

An example execution could be the following:
```console
./client-ms -sa 127.0.0.3 -sp 8003 -d . -r 1440
```
