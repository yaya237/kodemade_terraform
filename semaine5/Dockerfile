FROM node:16-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
