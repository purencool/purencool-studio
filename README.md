# Purencool Studio 
Purencool Studio is a docker wrapper for a React, Nodejs Application that runs in a browser on any host operating system.

### Build
For this to build you will need to do the following
1. config.js needs to be installed
2. run `docker build -t "purencool_studio:latest" .`


### Development

The below commands we use commonly in the development of this docker image

#### Docker build commands


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

##### Stop all docker ps

```
 docker stop $(docker ps -aq)
```


##### Removed all images that in a halted state 


```
 docker rm $(docker ps -aq)
```

##### Removed all dangling images

```
docker rmi $(docker images --quiet --filter "dangling=true")
```


#### NPM Express server tests

```
 npm install --only=production --suppress-package-metadata-warnings
```