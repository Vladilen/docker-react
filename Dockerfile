FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build


FROM nginx
# change to --from=0 for AWS (and remove tag in 1 line)
COPY --from=builder /app/build /usr/share/nginx/html

