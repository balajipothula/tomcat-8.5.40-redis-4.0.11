# Tomcat8
## alpine linux image with openjdk8-jre, tomcat-native, sqlite, redis.
### Author: BALAJI POTHULA <*balaji.pothula@techie.com*>

#### Cloning tomcat8 from GitHub.
git clone https://github.com/balajipothula/tomcat-8.5.40.git

##### Extracting "webapp" tar ball.
tar xzf $HOME/tomcat-8.5.40/webapp.tar.gz -C $HOME/tomcat-8.5.40/ 

##### Installing "docker" on Ubuntu.
sudo sh $HOME/tomcat-8.5.40/install-docker.sh

##### Running docker as non-sudoer.
##### Note: Reboot required.
sudo usermod -a -G docker $USER

##### Pulling image from Docker Hub.
sudo docker pull balajipothula/tomcat:8

##### Creating or Building image from Dockerfile.
##### username/repo:tag.
sudo docker build -t balajipothula/tomcat:8 .

##### Saving docker image offline into local machine.
sudo docker save -o tomcat8.docker balajipothula/tomcat:8

##### Loading offline docker image into machine.
sudo docker load -i tomcat8.docker

##### Running docker image with volume(-v) stdin(-i) daemon(-d) with port(-p) 8080 for Tomcat.
##### (It will create a volume inside the container)
sudo docker run --name tomcat -d -i -p 8080:8080 --privileged -v $HOME/tomcat8/webapp:/webapp balajipothula/tomcat:8 sh

##### Executing docker container by name with stdin(-i), startup  tomcat server.
sudo docker exec -i tomcat /webapp/tomcat/bin/startup.sh

##### Executing docker container by name with stdin(-i), shutdown tomcat server.
sudo docker exec -i tomcat /webapp/tomcat/bin/shutdown.sh

##### Executing docker container by name with stdin(-i), redis process with config file. 
sudo docker exec -i webapp redis-server /webapp/redis/conf/redis.conf

##### Login into docker container.
sudo docker exec -i -t tomcat sh

##### Starting docker container with name.
sudo docker start tomcat

##### Stoping  docker container with name.
sudo docker stop tomcat

##### Removing docker container with name.
sudo docker rm webapp
