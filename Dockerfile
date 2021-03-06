FROM node:alpine as builder
WORKDIR /var/myapp
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx
COPY --from=builder /var/myapp/build /usr/share/nginx/html