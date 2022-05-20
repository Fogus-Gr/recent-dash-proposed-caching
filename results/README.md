This directory contains two executables for processing the output logs and generating performance metrics and results.

Execution instructions for generating mean results with all metrics:
```console
usage: raw [-h] [-i INIT] [-p PATH] [-t THRESHOLD]

Performance evaluation metrics and results generation of the video streaming
experiments

optional arguments:
  -h, --help            show this help message and exit
  -i INIT, --init INIT  number of video segments considered as part of the initial
                        playback delay
  -p PATH, --path PATH  path to directory with proxy outputs and video metadata
  -t THRESHOLD, --threshold THRESHOLD
                        time threshold under which delays are ignored
```


Execution instructions for generating detailed results per experiment with precise timestamps:
```console
usage: precise [-h] [-i INIT] [-p PATH] [-t THRESHOLD] [-c]

Detailed video streaming progress and behavioural results generation

optional arguments:
  -h, --help            show this help message and exit
  -i INIT, --init INIT  number of video segments considered as part of the initial
                        playback delay
  -p PATH, --path PATH  path to directory with proxy outputs and video metadata
  -t THRESHOLD, --threshold THRESHOLD
                        time threshold under which delays are ignored
  -c, --combine         combine different outputs' timestamps for better comparison
```
