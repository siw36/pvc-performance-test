# PVC performance test
This container is designed to mount a persistent volume and test the read/write performance of the mounted pvc.  
The output of the tests is pasted anonymously to https://paste.fedoraproject.org/.  
The link to view the output is posted in the logs of the container.  
After 5 minutes after successful test, the container gets terminated.  

![Docker image](https://www.docker.com/favicon.ico "Docker")
Official Docker build: [Dockerhub](https://hub.docker.com/r/siw36/pvc-performance-test/dockerfile)

### Tests
The tests are performed with dd.  
#### Write
- A 1GB file is written to the PVC

#### Read
- The previously written 1GB file is read from the PVC

#### Latency
- 1000 x 512byte is written to the PVC

### Example on OpenShift
![OpenShift image](https://www.openshift.com/favicon.ico "OpenShift")
You can find a example PVC and pod definition for OpenShift in the file [ocp-objects.yml](ocp-objects.yml)
