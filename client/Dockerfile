FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
<<<<<<< HEAD
COPY --from=builder /app/build /usr/share/nginx/html
=======
COPY --from=builder /app/build /user/share/nginx/html
>>>>>>> a204385c283b106539f3740610537fbc7edabe46
