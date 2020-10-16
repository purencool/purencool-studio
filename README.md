# purencool-studio


### Development

```
docker images
```

```
docker stop purencool_studio
```

```
docker rmi -f purencool_studio
```

```
docker build -t "purencool_studio:latest" .
```

```
docker run --name=purencool_studio -d -p 3000:3000 -t purencool_studio:latest
```

```
docker ps -a
```

```
docker exec -it purencool_studio  /bin/bash
```

#### Remove all images 

```
 docker rm $(docker ps -aq)
```