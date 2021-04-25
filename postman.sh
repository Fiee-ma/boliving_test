#!/bin/bash

#value表示你要录制多少路
value=10
i=1
#url表示服务器地址和请求的路径
url="rtsp://localhost:1554/live/livestream"
echo -e "{"\"taskId\"":"\"uuid-123456\"","\"recordMode\"":"\"SINGLE\"","\"storePath\"":"\"./\"","\"segmentMode\"":"\"DURATION\"","\"segmentValue\"":3600,"\"logicTasks\"":[\c"
while(($i<=$value))
do
    if [ $i -eq $value ]
    then
        echo -e "{"\"append\"":true,"\"fileNamePrefix\"":"\"uuid-${i}\"","\"resources\"":[{"\"url\"":"\"${url}\"","\"x\"":1,"\"y\"":2,"\"width\"":400,"\"height\"":300}]}\c"
        break;
    else
        echo "{"\"append\"":true,"\"fileNamePrefix\"":"\"uuid-${i}\"","\"resources\"":[{"\"url\"":"\"rtsp://localhost:1554/live/livestream\"","\"x\"":1,"\"y\"":2,"\"width\"":400,"\"height\"":300}]}",
    fi
    let "i++"
done
echo -e "]}"
