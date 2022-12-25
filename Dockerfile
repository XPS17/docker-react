FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# to run, in wsl terminal type:
# docker build .
# docker run -p 8080:80 9ee696a4c3a472ee85d9de7dd44a344ca