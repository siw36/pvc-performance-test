#!/bin/sh

echo "Starting performance data collection"
echo "-------------------------------------"

echo $(date) >> /tmp/result.txt
echo "Testing write performance"
echo "-------------------------------------"
echo "Write performance:" >> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt
dd if=/dev/zero of=/mnt/pvc/test-io bs=1G count=1 oflag=dsync 2>> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt

echo "Testing read performance"
echo "-------------------------------------"
echo "Read performance:" >> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt
dd if=/mnt/pvc/test-io of=/dev/null bs=8k 2>> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt

echo "Testing latency"
echo "-------------------------------------"
echo "Latency:" >> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt
dd if=/dev/zero of=/mnt/pvc/test-latency bs=512 count=1000 oflag=dsync 2>> /tmp/result.txt
echo "-------------------------------------" >> /tmp/result.txt

echo "Creating result, logs can be found at the following links:"
echo "-------------------------------------"
fpaste /tmp/result.txt

echo This container will sleep for 5 minutes and then gets terminated
sleep 300
exit 0
