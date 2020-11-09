FROM node:alpine
LABEL Maintainer="Purencool <purencool@gmail.com>" \
      Description="Purencool studio development server default image."

##
# https://stackoverflow.com/questions/49582202/cloning-a-git-repo-in-dockerfile-and-working-off-it
# Variables
##
ARG APP_DIRECTORY=/home/app/


##
#
##
ARG ENV

##
#
##
WORKDIR /home


##
# Bash if needed for testing
##
RUN apk add bash vim


##
# Package need to run node
##
RUN apk add --update nodejs
RUN apk add --no-cache git
RUN apk add --no-cache openssh

##
# Add Node and App groups and users
##
RUN addgroup -S node && adduser -S node -G node
RUN addgroup -g 1000 -S app && adduser -S app -u 1000 -G app  -h ${APP_DIRECTORY} -D app


##
# Change user
##
USER app


##
# Clone react software into app directory
##
RUN git clone https://github.com/purencool/purencool-studio-js.git ${APP_DIRECTORY}
COPY ./config/config.js ${APP_DIRECTORY}/src/config.js



##
# Expose port so you can access port
##
EXPOSE 3000


##
#
##
#HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:3000/fpm-ping

CMD [ "node", "server.js" ]