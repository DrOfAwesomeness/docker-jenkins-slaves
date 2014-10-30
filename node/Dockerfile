FROM drawesome/jenkins-slave:latest
ENV NODE_URL https://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz
RUN apt-get install -y curl
RUN curl https://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz > node.tar.gz
RUN tar xvf node.tar.gz -C /usr/local --strip-components 1
RUN rm node.tar.gz
RUN npm install -g grunt-cli
