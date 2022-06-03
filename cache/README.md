This directory contains the two versions of the video cache proxy HTTP server.


Execution instructions for the Single-Segment Send-After-Get (SAG) / Send-While-Get (SWG) proxy version:
```console
usage: proxy [-h] [-a ADDRESS] [-p PORT] [-sa REMOTEADDRESS] [-sp REMOTEPORT]
                  [-d DIRECTORY] -al {sag,swg} -r1 RATE1 [-r2 RATE2]
                  [-l BUFFERSIZE] [-dl {predictive,fixed}] -c {random,ripple}
                  [-s SAMPLE] [-n NUMFILES] [--rayleigh]

Single-Segment Send-After-Get (SAG) / Send-While-Get (SWG) video cache proxy
HTTP server / client

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
  -al {sag,swg}, --algorithm {sag,swg}
                        proxy algorithm option
  -r1 RATE1, --rate1 RATE1
                        data rate R1 [from proxy to client] (Mbps)
  -r2 RATE2, --rate2 RATE2
                        data rate R2 [from main to proxy] (Mbps)
  -l BUFFERSIZE, --buffersize BUFFERSIZE
                        buffer size L (MB)
  -dl {predictive,fixed}, --dashlogic {predictive,fixed}
                        DASH resolution logic
  -c {random,ripple}, --caching {random,ripple}
                        caching algorithm option
  -s SAMPLE, --sample SAMPLE
                        sample number
  -n NUMFILES, --numfiles NUMFILES
                        total number of files required for a video stream
                        (automatic proxy termination when reached)
  --rayleigh            introduce randomness in the data channel [from proxy
                        to client] through Rayleigh distribution
```


Execution instructions for the Multi-Segment Send-While-Get (MS-SWG) proxy version:
```console
usage: proxy-ms [-h] [-a ADDRESS] [-p PORT] [-sa REMOTEADDRESS] [-sp REMOTEPORT]
                     [-d DIRECTORY] -r1 RATE1 [-r2 RATE2] [-l BUFFERSIZE]
                     -c {random,ebc,tier} [-s SAMPLE] [-n NUMFILES] [--rayleigh]

Multi-Segment Send-While-Get video cache proxy HTTP server / client

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
  -r1 RATE1, --rate1 RATE1
                        data rate R1 [from proxy to client] (Mbps)
  -r2 RATE2, --rate2 RATE2
                        data rate R2 [from main to proxy] (Mbps)
  -l BUFFERSIZE, --buffersize BUFFERSIZE
                        buffer size L (MB)
  -c {random,ebc,tier}, --caching {random,ebc,tier}
                        caching algorithm option
  -s SAMPLE, --sample SAMPLE
                        sample number
  -n NUMFILES, --numfiles NUMFILES
                        total number of files required for a video stream
                        (automatic proxy termination when reached)
  --rayleigh            introduce randomness in the data channel [from proxy to
                        client] through Rayleigh distribution
```
