# purencool-studio

### Build
For this to build you will need to do the following
1. config.js needs to be installed



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
docker exec -it purencool_studio  /bin/sh
```

#### Stop all docker ps

```
 docker stop $(docker ps -aq)
```


#### Removed all images that in a halted state 


```
 docker rm $(docker ps -aq)
```

#### Removed all dangling images

```
docker rmi $(docker images --quiet --filter "dangling=true")
```