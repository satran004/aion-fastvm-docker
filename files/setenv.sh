#!/usr/bin/env bash

for I in `ls /root/app/aion/jars/*.jar`;
 do CLASSPATH=$CLASSPATH:$I;
done

export CLASSPATH=$CLASSPATH