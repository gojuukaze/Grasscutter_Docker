#!/bin/bash

mkfifo /Grasscutter/stopFlag
screen -S app -dm bash -c "java -jar grasscutter*.jar ; echo 1 > /Grasscutter/stopFlag"

cat /Grasscutter/stopFlag