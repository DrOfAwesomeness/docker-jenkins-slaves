FROM ubuntu:trusty
RUN adduser --disabled-password --gecos "Build Agent" build
RUN apt-get update
RUN apt-get install --no-install-recommends -y default-jre-headless git
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
ADD start.sh /
EXPOSE 22
CMD /start.sh
