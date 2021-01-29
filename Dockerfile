FROM alpine:3.7
MAINTAINER "Anjul Sahu"
LABEL "USE" "WAZUH INSTALLER"
RUN apk update  && apk add --update util-linux && apk upgrade --available  && rm -rf /var/cache/apk/*
COPY runOnHost.sh wait.sh ossec.conf authd.pass /
RUN chmod u+x runOnHost.sh wait.sh 
CMD ["./runOnHost.sh"]
