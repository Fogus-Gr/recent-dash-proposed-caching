# Smart video caching for fixed-resolution HTTP Dynamic Streaming


This repository contains the software (in binary form) developed during the study conducted for improving HTTP Dynamic Streaming, as part of the [RE-CENT](http://www.re-cent.co/) project.


## Architecture / model / system design
- [Professor Dionysis Xenakis](http://scholar.google.com/citations?user=0qTbFrgAAAAJ)
## Implementation design, software development, data analysis
- [Nikolaos Episkopos](http://github.com/nbishdev)

---



**NOTE**

All the instructions and the commands that are presented in this guide were executed and tested with the following software combination:
* [Ubuntu 20.04 Desktop](http://releases.ubuntu.com/20.04/)
* Python version 3.8
* VLC media player version 3.0.9
* FFmpeg version 4.2.x
* MP4Box version 0.9 or newer

The video used for all the experiments was [Big Buck Bunny](http://en.wikipedia.org/wiki/Big_Buck_Bunny).

![Big Buck Bunny image](http://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/266px-Big_buck_bunny_poster_big.jpg)

---



## Software Requirements Installation

This section describes all the steps that are necessary for downloading all the required files and installing all the required software, in order to successfully reproduce the results. All the steps should be executed on a terminal emulator on a GNU/Linux distribution.


### Step 1: Update software repository sources
```console
sudo apt-get update
```


### Step 2: Install Git and Wget for fetching remote stuff, and GNOME terminal emulator for software execution
```console
sudo apt-get -y install git wget gnome-terminal
```


### Step 3: Install VLC player for video playback
```console
sudo apt-get -y install vlc
```

#### Optional: If you have a modern Intel GPU or AMD GPU and you want to use hardware video decoding
```console
sudo apt-get -y install intel-media-va-driver mesa-va-drivers
```


### Step 4: Clone the repository locally
```console
cd ~/
git clone http://github.com/Fogus-Gr/recent-dash-proposed-caching.git
```

---



## Video file and segmentation

### Option A: Use the provided archive with the DASH segments for the Big Buck Bunny 30 FPS video

### Step 5.1: Install 7-Zip
```console
sudo apt-get -y install p7zip
```

### Step 5.2: Download and extract the DASH segments
```console
wget http://gain.di.uoa.gr/DASH/dash_segments_bbb.7z -O ~/Downloads/segments.7z
7z e ~/Downloads/segments.7z -orecent-dash-proposed-caching/public/
```

#### Optional: Delete the downloaded archive
```console
rm -rf ~/Downloads/segments.7z
```

The following table contains the video segment sizes per resolution (including audio) in MB alongside their respective duration.
| Segment ID | Segment Duration (s) | 2160p | 1440p | 1080p | 720p | 480p | 320p |
| ---------- | -------------------- | ----- | ----- | ----- | ---- | ---- | ---- |
| 1          | 10                   | 8.44  | 4.41  | 3.33  | 1.57 | 0.99 | 0.75 |
| 2          | 10                   | 19.61 | 10.26 | 6.97  | 3.66 | 2.45 | 1.70 |
| 3          | 10                   | 9.91  | 5.76  | 3.92  | 2.22 | 1.34 | 0.97 |
| 4          | 10                   | 19.04 | 10.94 | 7.49  | 4.07 | 2.27 | 1.50 |
| 5          | 10                   | 8.33  | 4.75  | 3.35  | 2.02 | 1.41 | 1.07 |
| 6          | 10                   | 11.84 | 6.52  | 4.51  | 2.66 | 1.65 | 1.20 |
| 7          | 10                   | 6.92  | 3.90  | 2.65  | 1.51 | 0.97 | 0.78 |
| 8          | 10                   | 11.56 | 6.22  | 4.11  | 2.28 | 1.38 | 1.03 |
| 9          | 10                   | 13.73 | 7.23  | 4.85  | 2.68 | 1.66 | 1.24 |
| 10         | 10                   | 5.19  | 3.12  | 2.24  | 1.40 | 0.93 | 0.74 |
| 11         | 10                   | 7.00  | 3.85  | 2.58  | 1.49 | 0.97 | 0.77 |
| 12         | 10                   | 8.04  | 4.49  | 3.08  | 1.79 | 1.15 | 0.90 |
| 13         | 10                   | 12.63 | 6.48  | 4.22  | 2.31 | 1.43 | 1.07 |
| 14         | 10                   | 9.48  | 5.18  | 3.49  | 1.95 | 1.21 | 0.92 |
| 15         | 10                   | 10.05 | 5.49  | 3.69  | 2.07 | 1.27 | 0.96 |
| 16         | 10                   | 9.60  | 5.23  | 3.44  | 1.96 | 1.23 | 0.95 |
| 17         | 10                   | 8.16  | 4.43  | 2.95  | 1.73 | 1.12 | 0.88 |
| 18         | 10                   | 6.66  | 3.63  | 2.46  | 1.44 | 0.96 | 0.78 |
| 19         | 10                   | 11.95 | 6.48  | 4.33  | 2.50 | 1.56 | 1.18 |
| 20         | 10                   | 11.90 | 6.42  | 4.22  | 2.31 | 1.40 | 1.05 |
| 21         | 10                   | 8.60  | 4.75  | 3.28  | 1.83 | 1.14 | 0.88 |
| 22         | 10                   | 12.72 | 7.26  | 5.00  | 2.86 | 1.79 | 1.35 |
| 23         | 10                   | 10.38 | 5.29  | 3.35  | 1.77 | 1.08 | 0.83 |
| 24         | 10                   | 10.13 | 5.29  | 3.44  | 1.88 | 1.15 | 0.89 |
| 25         | 10                   | 11.36 | 6.16  | 4.13  | 2.32 | 1.41 | 1.04 |
| 26         | 10                   | 11.82 | 6.28  | 4.16  | 2.35 | 1.48 | 1.14 |
| 27         | 10                   | 10.91 | 5.88  | 3.89  | 2.16 | 1.33 | 1.00 |
| 28         | 10                   | 13.87 | 7.37  | 4.84  | 2.58 | 1.52 | 1.13 |
| 29         | 10                   | 13.83 | 7.34  | 4.79  | 2.58 | 1.51 | 1.10 |
| 30         | 10                   | 6.75  | 3.72  | 2.54  | 1.49 | 1.00 | 0.80 |
| 31         | 10                   | 12.72 | 6.92  | 5.15  | 2.97 | 1.67 | 1.17 |
| 32         | 10                   | 13.04 | 7.17  | 4.78  | 2.65 | 1.59 | 1.18 |
| 33         | 10                   | 15.42 | 8.22  | 5.41  | 2.93 | 1.76 | 1.29 |
| 34         | 10                   | 12.83 | 6.85  | 4.57  | 2.54 | 1.55 | 1.17 |
| 35         | 10                   | 10.22 | 5.77  | 3.93  | 2.26 | 1.42 | 1.05 |
| 36         | 10                   | 17.36 | 9.66  | 6.53  | 3.61 | 2.21 | 1.54 |
| 37         | 10                   | 18.96 | 10.24 | 6.73  | 3.76 | 2.20 | 1.58 |
| 38         | 10                   | 13.61 | 7.03  | 4.68  | 2.63 | 1.60 | 1.14 |
| 39         | 10                   | 6.27  | 3.47  | 2.34  | 1.36 | 0.89 | 0.71 |
| 40         | 10                   | 6.64  | 3.83  | 2.62  | 1.55 | 1.01 | 0.79 |
| 41         | 10                   | 8.81  | 4.92  | 3.39  | 1.92 | 1.22 | 0.95 |
| 42         | 10                   | 8.36  | 4.68  | 3.25  | 1.93 | 1.27 | 0.98 |
| 43         | 10                   | 16.94 | 9.56  | 6.67  | 3.84 | 2.35 | 1.69 |
| 44         | 10                   | 23.74 | 13.22 | 8.96  | 4.89 | 2.82 | 1.96 |
| 45         | 10                   | 16.60 | 9.78  | 7.09  | 3.95 | 2.36 | 1.72 |
| 46         | 10                   | 5.95  | 3.28  | 2.28  | 1.42 | 1.00 | 0.82 |
| 47         | 10                   | 17.97 | 8.85  | 5.59  | 2.83 | 1.60 | 1.11 |
| 48         | 10                   | 15.56 | 8.29  | 5.41  | 2.92 | 1.67 | 1.16 |
| 49         | 10                   | 6.67  | 3.62  | 2.47  | 1.47 | 0.99 | 0.77 |
| 50         | 10                   | 6.98  | 3.86  | 2.63  | 1.48 | 0.96 | 0.75 |
| 51         | 10                   | 10.23 | 5.36  | 3.89  | 1.96 | 1.11 | 0.87 |
| 52         | 10                   | 13.11 | 6.76  | 4.57  | 2.40 | 1.45 | 1.10 |
| 53         | 10                   | 14.41 | 7.50  | 5.09  | 2.56 | 1.44 | 1.07 |
| 54         | 10                   | 14.22 | 7.27  | 4.91  | 2.54 | 1.55 | 1.11 |
| 55         | 10                   | 9.90  | 9.55  | 5.74  | 4.53 | 2.43 | 1.93 |
| 56         | 10                   | 11.29 | 10.85 | 6.55  | 5.04 | 2.60 | 2.08 |
| 57         | 10                   | 16.21 | 11.38 | 7.07  | 3.96 | 2.50 | 1.76 |
| 58         | 10                   | 12.22 | 6.13  | 4.47  | 2.24 | 1.30 | 0.95 |
| 59         | 10                   | 19.03 | 12.85 | 7.11  | 4.68 | 2.49 | 1.71 |
| 60         | 10                   | 17.28 | 15.61 | 7.57  | 5.65 | 2.94 | 2.07 |
| 61         | 10                   | 7.29  | 7.32  | 4.17  | 3.24 | 1.80 | 1.40 |
| 62         | 10                   | 0.99  | 0.73  | 0.62  | 0.53 | 0.49 | 0.46 |
| 63         | 10                   | 4.73  | 2.67  | 1.87  | 1.14 | 0.80 | 0.66 |
| 64         | 4.6                  | 2.57  | 1.48  | 1.02  | 0.64 | 0.43 | 0.36 |
| **SUM**    | 634.6                | 703.13 | 393.42 | 251.05 | 134.12 | 70.85 | 46.33 | 25.38 |


Proceed to [experimentation](#experimentation).



### Option B: Manually transcode and segment video

**NOTE**: Instead of the Big Buck Bunny video, you can transcode and segment whichever video you prefer.

### Step 5.1: Install FFmpeg for video transcoding
```console
sudo apt-get -y install ffmpeg
```

### Step 5.2: Follow the instructions in [GPAC's Wiki](http://github.com/gpac/gpac/wiki/GPAC-Build-Guide-for-Linux#mp4box--gpac-only) to install MP4Box for video segmentation

#### Optional: Delete the gpac directory
```console
cd ~/
rm -rf ~/gpac_public/
```

### Step 5.3: With the following commands we perform the following 4 actions:
1. Download the Big Buck Bunny 2160p 30 FPS video (MP4 file).
2. Rename the video file so that it has the name <b>video.mp4</b>.
3. Using **FFmpeg's AVC / H.264** codec, transcode the video and generate **6 distinct MP4 videos** of **6 distinct resolutions (2160p, 1440p, 1080p, 720p, 480p, 360p)**.
4. Using **GPAC's MP4Box**, split the generated MP4 videos into segments each one with duration 10 seconds, and generate all the additional files that are required (manifest.mpd, etc.) so that it can be streamed using MPEG DASH.
5. Place all the segments and the additional generated files under **[public/](./public/)** directory.

If you want to change the segment duration, change the value of 10 in the 4th command of the following set of commands to the desired number of segment duration (in seconds).
```console
wget -c http://ftp.halifax.rwth-aachen.de/blender/demo/movies/BBB/bbb_sunflower_2160p_30fps_normal.mp4 -O ~/Downloads/video.mp4
cp ~/recent-dash-proposed-caching/transcode.sh ~/Downloads/
cd ~/Downloads/
bash ./transcode.sh 10
mv ~/Downloads/manifest.mpd ~/recent-dash-proposed-caching/public/
mv ~/Downloads/*init.mp4 ~/recent-dash-proposed-caching/public/
mv ~/Downloads/video*.m4s ~/recent-dash-proposed-caching/public/
```

#### Optional: Delete the downloaded video file and the transcoded / extracted files
```console
rm -rf ~/Downloads/video.mp4
rm -rf ~/Downloads/video_2160.mp4
rm -rf ~/Downloads/video_1440.mp4
rm -rf ~/Downloads/video_1080.mp4
rm -rf ~/Downloads/video_720.mp4
rm -rf ~/Downloads/video_480.mp4
rm -rf ~/Downloads/video_360.mp4
rm -rf ~/Downloads/video_audio.mp4
```

---



## Experimentation
Change to the repository directory
```console
cd ~/recent-dash-proposed-caching/
```

For the video streaming experimentation, two separate executables are provided, depending on whether you want to experiment with Multi-Segment or Single-Segment video streaming.
For each executable you are required to input the numeric value(s) for **R1**, **R2** and **L** (multiple values for these arguments are allowed), the string value for the caching method choice, as well as the values for the rest of the required command-line arguments, which differ per executable.


* If you want to experiment with Single-Segment video streaming using the VLC player, use the **[automation-single](./automation-single)** executable as shown below:
```console
usage: automation-single [-h] -r1 r1 [r1 ...] -r2 r2 [r2 ...] -l l [l ...] [-d TARGETIPD]
                              -c {random,ripple} -a {sag,swg} -dl {predictive,fixed} [-p PATIENCE]
                              [-s SAMPLES] [--rayleigh] [--suppress] [--proposed]

Automation script for experimenting with the single-segment proxy algorithms with the use of VLC player

optional arguments:
  -h, --help            show this help message and exit
  -r1 r1 [r1 ...], --rate1 r1 [r1 ...]
                        value(s) for data rate R1
  -r2 r2 [r2 ...], --rate2 r2 [r2 ...]
                        value(s) for data rate R2
  -l l [l ...], --buffersize l [l ...]
                        value(s) for buffer size L
  -d TARGETIPD, --targetipd TARGETIPD
                        target initial playout delay (sec)
  -c {random,ripple}, --caching {random,ripple}
                        caching algorithm option
  -a {sag,swg}, --algorithm {sag,swg}
                        proxy algorithm option
  -dl {predictive,fixed}, --logic {predictive,fixed}
                        DASH resolution logic
  -p PATIENCE, --patience PATIENCE
                        time to wait until playback completes (expressed as a fraction of the video duration)
  -s SAMPLES, --samples SAMPLES
                        number of samples for every parameters combination
  --rayleigh            introduce randomness in data channels through Rayleigh distribution
  --suppress            suppress video and audio playback
  --proposed            only run experiments in which L>0, R1>R2 and R1>=Required_throughput>=R2
```

In the commands above, the standard arguments can take the following values:
| PROXY ALGORITHM | DASH LOGIC | CACHING ALGORITHM |
| :---: | :---: | :---: |
| `sag` | `predictive` | `random` |
| `swg` | `fixed` | `ripple` |


* If you want to experiment with Multi-Segment (MS) video streaming using either the VLC player or a custom multi-segment client, use the **[automation-multi](./automation-multi)** executable as shown below:
```console
usage: automation-multi [-h] -r1 r1 [r1 ...] -r2 r2 [r2 ...] -l l [l ...] [-d TARGETIPD]
                             -c {random,ebc,tier} -t {client,vlc} [-p PATIENCE]
                             [-s SAMPLES] [--rayleigh] [--suppress] [--proposed]

Automation script for experimenting with the multi-segment proxy algorithm either
with the use of a custom video client (recommended) or with the use of VLC player

optional arguments:
  -h, --help            show this help message and exit
  -r1 r1 [r1 ...], --rate1 r1 [r1 ...]
                        value(s) for data rate R1
  -r2 r2 [r2 ...], --rate2 r2 [r2 ...]
                        value(s) for data rate R2
  -l l [l ...], --buffersize l [l ...]
                        value(s) for buffer size L
  -d TARGETIPD, --targetipd TARGETIPD
                        target initial playout delay (sec)
  -c {random,ebc,tier}, --caching {random,ebc,tier}
                        caching algorithm option
  -t {client,vlc}, --tool {client,vlc}
                        tool for performing the video streaming
  -p PATIENCE, --patience PATIENCE
                        time to wait until playback completes (expressed as a fraction of the video duration)
  -s SAMPLES, --samples SAMPLES
                        number of samples for every parameters combination
  --rayleigh            introduce randomness in data channels through Rayleigh distribution
  --suppress            suppress video and audio playback
  --proposed            only run experiments in which L>0, R1>R2 and R1>=Required_throughput>=R2
```

In the commands above, the standard arguments can take the following values:
| CACHING ALGORITHM | TOOL |
| :---: | :---: |
| `random` | `client` (recommended) |
| `ebc` | `vlc` |
| `tier` |  |


The `--rayleigh` argument can be used to introduce randomness in data channels with the use of a Rayleigh distribution.

The `--suppress` argument can be used to suppress VLC's video and audio playback, performing the whole video streaming procedure in the background.

The `--proposed` argument can be used to only run experiments in which coded EBC caching can be utilized, i.e. L > 0, R1 > R2 and R1 >= Required_throughput >= R2.

In the caching algorithm selection, `tier` stands for 1-Tiered EBC (Recursion_depth = 1).



For example:

* if you want to reproduce our experiments for the combination of Random-SWG-Fixed, you can use the following command:
```console
./automation-single -r1 1.4 2 3 5.7 8.3 12 15.8 18 -r2 1 2 4 6 8 -l 0 50 100 200 300 400 -d 10 -c random -a swg -dl fixed -p 10 -s 3
```

* if you want to reproduce our experiments for EBC-MS_SWG-Fixed, you can use the following command:
```console
./automation-multi -r1 1.4 2 3 5.7 8.3 12 15.8 18 -r2 1 2 4 6 8 -l 0 50 100 200 300 400 -d 10 -c ebc -t client -p 10 -s 3
```

---



## Results
After all each experiment completes, a log text file with the corresponding parameters in its name will be created under **[cache/](./cache/)** directory.

In order to process the logs and extract the results with the corresponding metrics to a CSV file, which can be used for performing data analysis, use the [raw](./results/raw) executable following the instructions in the respective [README.md](./results/README.md).

The number of segments which are considered as being part of the initial playback delay/buffering before video playback starts, may differ between different video players and may vary depending on the delays occurred. For the VLC player this number most of the times is equal to 1.

Afterwards, under **[results/](./results/)** a CSV file with the prefix **<i>all_results_</i>** will be created, which will contain the results as raw data with values for all metrics per experimentation sample. Furthermore, a number of smaller text files with some statistics will be created.

In order to extract detailed results per experiment with limited metrics but with timestamps for each segment individually, use the [precise](./results/precise) executable following the instructions in the respective [README.md](./results/README.md).

Afterwards, several CSV files (as many as the number of experiment logs available) with the prefix **<i>analytical_</i>** will be created under **[results/](./results/)**.

---

**NOTE**

The mean results only contain the values of R1, R2 and L that can be used for a full performance comparison (i.e. for charts with a full X-axis).

These values are automatically selected based on the output of the proposed coded caching algorithm and then by filtering out the combinations which produce fewer variable groups than the rest (and thus can not be directly compared through charts).

---
