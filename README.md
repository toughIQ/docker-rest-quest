## Server container for REST Quest
Original Project: https://github.com/cprerovsky/rest-quest

### Run the server
`docker run -d --name rqserver -p 3000:3000 toughiq/rest-quest`

This will start the container in background, assign "rqserver" as name and bind to port 3000 on localhost. You now can access the server via http://localhost:3000

### Run simple test client
`docker run -d --link rqserver toughiq/rest-quest node client.js`

This will start the client job in background, link it to the REST Quest server and execute the client script "node client.js"

To get 2 clients to play against each other, just launch a second client container with the exact same command from above.
