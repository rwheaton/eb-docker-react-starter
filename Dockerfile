FROM node:6.4.0-onbuild

# Install Node Deps
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /var/www && rm -rf /var/www/* && cp -a /tmp/node_modules /var/www/

WORKDIR /var/www

# Run webpack?

# Install app
ADD . /var/www

VOLUME ["/var/log"]
VOLUME ["/var/www"]

# Exposes this port from the docker container to the host machine
EXPOSE 3000

# The command to run when this image starts up

# for dev, non-optimized mode
CMD ["npm", "start"]

# for production, w/ optimized files
#CMD ["npm", "start", "--", "--release"]