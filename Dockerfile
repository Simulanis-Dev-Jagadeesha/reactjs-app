FROM node:alpine3.18 as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
EXPOSE 3000
RUN npm run build


#FROM nginx:1.23-alpine
#WORKDIR /urs/share/nginx/html
#RUN rm -rf *
#COPY --from=build /app/build .
#EXPOSE 80
#ENTRYPOINT [ "nginx", "-g","daemon off;" ]