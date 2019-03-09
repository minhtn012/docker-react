FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN nmp install
COPY . .
RUN nmp run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx