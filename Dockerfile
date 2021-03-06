FROM node:alpine
LABEL Maintainer="Purencool <purencool@gmail.com>" \
      Description="Purencool studio development server default image."

##
# Variables
##
ARG WWW_DIRECTORY=/user/src/app


##
# dumb-init is a simple process
# supervisor and init system designed
# to run as PID 1 inside minimal container
##
#ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
#RUN chmod +x /usr/local/bin/dumb-init


##
# Setup application directory structure and software
##
RUN apk add git && \
    mkdir -p ${WWW_DIRECTORY} && \
    mkdir -p ${WWW_DIRECTORY}/www && \
    git clone --depth 1  https://github.com/purencool/purencool-studio-js.git   ${WWW_DIRECTORY}/temp  && \
    cd ${WWW_DIRECTORY}/temp/www && \
    mv ./* ${WWW_DIRECTORY}/www && \
    rm -Rf ${WWW_DIRECTORY}/temp



##
# Install server configuration and setup node as owner
##
COPY ./config/config.js ${WWW_DIRECTORY}/www/src/config.js
COPY ./config/* ${WWW_DIRECTORY}/

RUN  cd ${WWW_DIRECTORY} && npm install --only=production && \
     rm ${WWW_DIRECTORY}/config.js && \
     rm ${WWW_DIRECTORY}/config.example.js && \
     chown node: ${WWW_DIRECTORY}
USER node


##
# Install server software
##
WORKDIR ${WWW_DIRECTORY}

EXPOSE 3000


#ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "server.js"]