docker kill $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker rm /registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2
