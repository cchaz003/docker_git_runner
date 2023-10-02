#Deriving the latest base image
FROM python:3.9


#Labels as key value pair
LABEL Maintainer="cromer"

RUN apt-get update && apt-get install git

RUN mkdir /repo

# Any working directory can be chosen as per choice like '/' or '/home' etc
# i have chosen /data
WORKDIR /repo

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]