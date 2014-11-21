FROM drawesome/jenkins-slave:latest
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup | bash
RUN apt-get install -y --no-install-recommends ruby1.9.1 ruby1.9.1-dev nodejs build-essential
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN gem install jekyll --no-ri --no-rdoc

