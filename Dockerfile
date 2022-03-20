FROM node:alpine as builder 

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm install

ENV CHOKIDAR_USEPOLLING=true

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
