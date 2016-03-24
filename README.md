## Server container for REST Quest
__Original Project:__ https://github.com/cprerovsky/rest-quest

### Run the server
`docker run -d --name rqserver -p 3000:3000 toughiq/rest-quest`

This will start the container in background, assign _"rqserver"_ as name and bind to port _3000_ on _localhost_. You now can access the server via http://localhost:3000

### Run simple test client
`docker run -d --link rqserver toughiq/rest-quest node client.js`

This will start the client job in background, link it to the REST Quest server and execute the client script _"node client.js"_

To get 2 clients to play against each other, just launch a second client container with the exact same command from above.

### Use docker-compose for autoplay
`docker-compose up -d`

This will start up a server container and 2 clients acccording to the _docker-compose.yml_ file. After each tournament the clients will shut down and be restarted by the _restart: always_ directive. From time to time the server or one of the clients may crash and cause the autoplay to stop. In this case just restart all components by

`docker-compose restart`  

To see whats happening inside the containers you can use the standard docker commands. eg:

`docker logs -f [containername]`
where _containername_ being _rqserver_, _rqclient1_ and _rqclient2_ in this scenario.

`docker-compose logs` or `docker-compose logs [containername(s)]`  gives the ability to see all containerlogs combined.

### Build container from Dockerfile
`docker build -t toughiq/rest-quest github.com/toughIQ/docker-rest-quest`

Build a local docker image named "toughiq/rest-quest" using the Dockerfile from GitHub repo. If you want to make changes to the Dockerfile itself, just clone the repo using

`git clone https://github.com/toughIQ/docker-rest-quest.git`

Make your changes to the Dockerfile and build the container again from local sources:

`docker build -t "toughiq/rest-quest" .`
