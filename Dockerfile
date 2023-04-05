# Container image that runs your code
FROM python:3.7-alpine3.13

RUN echo "https://uk.alpinelinux.org/alpine/v3.17/main" > /etc/apk/repositories
RUN echo "https://uk.alpinelinux.org/alpine/v3.17/community" >> /etc/apk/repositories
RUN cat /etc/apk/repositories

# installs git on container
RUN apk update
RUN apk add git
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY . /action
RUN pip install -r /action/requirements.txt

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/action/entrypoint.sh"]
