### FORK
*2017-08-13*  
* Not working.  Can not get original to build properly. 
* Changed builds to arm32v6/golang:alpine3.6
* Rolled down to alpine to 3.6 to make compatible with pi zero.

             
### RUN

```
docker run -d -p 5000:5000 --restart always -v /home/pi/registry-data/etc:/etc -v /home/pi/registry-data/var:/var azcoigreach/docker-registry-arm
```


