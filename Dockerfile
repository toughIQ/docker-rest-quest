FROM node:slim
MAINTAINER toughiq@gmail.com

# update system and install git
RUN apt-get update && apt-get install -y git

# fetch source code
RUN git clone https://github.com/cprerovsky/rest-quest.git

# change to code directory
WORKDIR /rest-quest

# change BASE_URL param in client.js to work with docker
RUN sed -i 's/localhost/rqserver/' client.js

# install node packages
RUN npm install

# set server start as default
CMD ["node","server.js"]

