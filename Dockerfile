FROM node:carbon
ENV NPM_CONFIG_LOGLEVEL error
WORKDIR /src
ADD . /src
RUN cd /src \
 && npm install \
 && npm run build \
 && npm run prepublish \
 && npm cache clear --force \
 && rm -rf ~/.npm \
 && rm -rf /var/lib/apt/lists/*
#ENTRYPOINT ["npm", "run", "dashboard"]
ENTRYPOINT ["npm", "start"]
