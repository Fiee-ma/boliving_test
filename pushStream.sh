#!/bin/bash

for j in {1..500}
do
    ffmpeg -re -stream_loop 1 -i ../下载/culture_1M_bit.mp4 -vcodec copy -acodec copy -f rtsp rtsp://localhost:1554/live/livestream${j} &
done
