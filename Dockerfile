FROM alpine:latest
LABEL Maintainer="Purencool <purencool@gmail.com>" \
      Description="Purencool studio development server default image."

##
# Variables
##
ARG APP_DIRECTORY=/home/app/


##
#
##
ARG ENV


##
# Bash if needed
##
RUN apk add bash


##
# Package need to run node
##
RUN apk add --update nodejs npm git


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
RUN chown app:app -R ${APP_DIRECTORY}
RUN cd ${APP_DIRECTORY} && npm install && npm run start


##
# Expose port so you can access port
##
EXPOSE 3000


##
#
##
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:3000/fpm-ping