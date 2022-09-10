# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install npm@6.0
RUN npm run build --prod


# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/realexample /usr/share/nginx/html
