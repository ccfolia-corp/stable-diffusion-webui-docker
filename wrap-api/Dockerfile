FROM node:16
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm i
COPY main.mjs .
CMD ["node",",main.mjs"]