FROM node:6.4.0-onbuild

# Compile app

RUN mkdir -p /var/www
RUN rm -rf /var/www/*
WORKDIR /var/www

# Run webpack?

# Install Node Deps
ADD package.json /var/www
RUN npm install

# Install app
ADD . /var/www

# Exposes this port from the docker container to the host machine
EXPOSE 3000

# The command to run when this image starts up
# for dev, non-optimized mode
#CMD ["npm", "start"]
# for production, w/ optimized files
CMD ["npm", "start", "--", "--release"]