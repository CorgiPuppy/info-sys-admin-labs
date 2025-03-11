FROM bash:latest

RUN apk add --no-cache pv
RUN apk add --no-cache scrot

COPY src/task1.sh src/
COPY src/task2.sh src/

ENTRYPOINT [ "bash" ]

CMD [ ]
