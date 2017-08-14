### FORK
*2017-08-13*  
* Not working.  Can not get original to build properly. 
* Changed builds to arm32v7/debian:jessie and arm32v7/golang:latest 
* PI Zero build on wheezy
             
### RUN

```
docker run -d -p 5000:5000 --restart always -v /home/pi/registry-data/etc:/etc -v /home/pi/registry-data/var:/var azcoigreach/docker-registry-arm
```

