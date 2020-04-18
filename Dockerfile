FROM alpine
LABEL maintainer=rob@evidently.ca

RUN apk update && apk add bash

COPY ./src /src
RUN chmod 700 /src/init.sh

ENTRYPOINT ["/src/init.sh"]
