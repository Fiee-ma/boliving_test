#!/bin/bash

for i in {1..100}
do
    ./../srs-bench/objs/sb_rtmp_load -c 1 -r rtmp://localhost:1935/main/test${i} &
done

