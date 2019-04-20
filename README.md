## Tomcat8
### Author: BALAJI POTHULA <*balaji.pothula@techie.com*>

alpine linux image with openjdk8-jre, tomcat-native, sqlite, redis.

##### Extracting "webapp" tar ball.
tar xzf webapp.tar.gz

##### Installing "docker" on Ubuntu.
sudo sh install-docker.sh

##### Pulling image from Docker Hub.
docker pull balajipothula/tomcat:8

##### Creating or Building image from Dockerfile.
##### username/repo:tag.
docker build -t balajipothula/tomcat:8 .

##### Saving docker image offline into local machine.
docker save -o tomcat8.docker balajipothula/tomcat:8

##### Loading offline docker image into machine.
docker load -i tomcat8.docker

##### Running docker image with volume(-v) stdin(-i) daemon(-d) with port(-p) 85, 6379.
##### Port 85 for Tomcat Server and Port 6379 for Redis DB Server.
##### (It will create a volume inside the container)
docker run --name tomcat -d -i -p 85:85 -p 6379:6379 --privileged -v $(pwd)/webapp:/webapp balajipothula/tomcat:8 sh

##### Executing docker container by name with stdin(-i), startup  tomcat server.
docker exec -i tomcat /webapp/tomcat/bin/startup.sh

##### Executing docker container by name with stdin(-i), shutdown tomcat server.
docker exec -i tomcat /webapp/tomcat/bin/shutdown.sh

##### Executing docker container by name with stdin(-i), redis process with config file. 
docker exec -i webapp redis-server /webapp/redis/conf/redis.conf

##### Login into docker container.
docker exec -i -t tomcat sh

##### Starting docker container with name.
docker start tomcat

##### Stoping  docker container with name.
docker stop tomcat
