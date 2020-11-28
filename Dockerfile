FROM node:alpine
LABEL Maintainer="Purencool <purencool@gmail.com>" \
      Description="Purencool studio development server default image."

##
# Variables
##
ARG WWW_DIRECTORY=/user/src/app


##
# Add git
##
RUN apk add --no-cache git



##
# dumb-init is a simple process
# supervisor and init system designed
# to run as PID 1 inside minimal container
##
#ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
#RUN chmod +x /usr/local/bin/dumb-init




##
# Setup application directory
##
RUN mkdir -p ${WWW_DIRECTORY} && \
    mkdir -p ${WWW_DIRECTORY}/www && \
    git clone --depth 1  https://github.com/purencool/purencool-studio-js.git   ${WWW_DIRECTORY}/temp  && \
    cd ${WWW_DIRECTORY}/temp/www && \
    mv ./* ${WWW_DIRECTORY}/www && \
    rm -Rf ${WWW_DIRECTORY}/temp && \
    chown node: ${WWW_DIRECTORY}

COPY ./config/config.js ${WWW_DIRECTORY}/www/src/config.js

USER node
WORKDIR ${WWW_DIRECTORY}




##
# Install application
##
#RUN git clone --depth 1  https://github.com/purencool/purencool-studio-js.git   ${WWW_DIRECTORY}/temp
#COPY ./config/config.js ${WWW_DIRECTORY}/src/config.js
#RUN cp ${WWW_DIRECTORY}/temp/www ${WWW_DIRECTORY} && rm -rf  ${WWW_DIRECTORY}/temp

##
# Setup web server
##
#COPY package*.json ./

#$ENV NODE_ENV production
#RUN npm install --only=production

#ENV HOST "0.0.0.0"
#ENV PORT 3000
#EXPOSE 3000

#COPY . .

#ENTRYPOINT ["dumb-init", "--"]
#CMD ["npm", "start"]