FROM      node
WORKDIR  /app
COPY     package.json /app
COPY     server.js  /app
RUN      npm install
CMD      node  server.js
EXPOSE   7007