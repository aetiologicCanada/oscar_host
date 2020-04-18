FROM alpine
LABEL maintainer=rob@evidently.ca
COPY ./src /src
RUN chmod 700 /src/*.sh
ENTRYPOINT ["/src/init.sh"]
