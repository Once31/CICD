
FROM node:19.6-alpine

WORKDIR /usr/src/app

ENV NODE_ENV production

# copy package and package-log files
COPY package*.json ./

# ci: clean install --only=production: dont install dev dep.
RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm ci --only=production

# you can secured your image with specifying user. so only that user can access image

USER node

COPY --chown=node:node ./src .

EXPOSE 3000

CMD ["node", "index.js"]