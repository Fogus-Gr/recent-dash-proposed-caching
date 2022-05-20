This directory contains the two versions of the remote main video content public HTTP server.


Execution instructions for the single-segment version:
```console
usage: main [-h] [-a ADDRESS] [-p PORT] [-d DIRECTORY] -r2 RATE2
                 [-s SAMPLE] [--rayleigh]

Single-segment remote main video content public HTTP server

optional arguments:
  -h, --help            show this help message and exit
  -a ADDRESS, --address ADDRESS
                        IP address
  -p PORT, --port PORT  serving port
  -d DIRECTORY, --directory DIRECTORY
                        serving directory
  -r2 RATE2, --rate2 RATE2
                        data rate R2 [from main to proxy] (Mbps)
  -s SAMPLE, --sample SAMPLE
                        sample number
  --rayleigh            introduce randomness in the data channel [from main to
                        proxy] through Rayleigh distribution
```


Execution instructions for the Multi-Segment (MS) version:
```console
usage: main-ms [-h] [-a ADDRESS] [-p PORT] [-d DIRECTORY] -r2 RATE2
                    [-s SAMPLE] [--rayleigh]

Multi-Segment remote main video content public HTTP server

optional arguments:
  -h, --help            show this help message and exit
  -a ADDRESS, --address ADDRESS
                        IP address
  -p PORT, --port PORT  serving port
  -d DIRECTORY, --directory DIRECTORY
                        serving directory
  -r2 RATE2, --rate2 RATE2
                        data rate R2 [from main to proxy] (Mbps)
  -s SAMPLE, --sample SAMPLE
                        sample number
  --rayleigh            introduce randomness in the data channel [from main to
                        proxy] through Rayleigh distribution
```
