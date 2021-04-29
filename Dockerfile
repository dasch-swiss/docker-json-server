FROM node:14-alpine

RUN \
    echo "==> Install app..."                && \
    npm install -g --production json-server  && \
    \
    \
    echo "==> Remove unused temp..."         && \
    rm -rf /root/.npm                  \
           /usr/lib/node_modules/npm


# configure
EXPOSE 8080

COPY ./db.json /data/db/db.json
COPY ./index.html /data/public/index.html

# Define default command.
ENTRYPOINT ["json-server", "--host", "0.0.0.0", "--port", "3000"]
CMD ["--watch", "/data/db/db.json", "--static", "/data/public"]
