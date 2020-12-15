FROM debian
COPY runOnHost.sh /
COPY wait.sh /
COPY ossec.conf /
COPY authd.pass /
RUN chmod u+x runOnHost.sh
RUN chmod u+x wait.sh
CMD ["./runOnHost.sh"]