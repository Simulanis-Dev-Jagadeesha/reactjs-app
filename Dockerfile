
FROM node:18-alpine AS dev

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .


EXPOSE 3000


CMD ["npm", "start"]


FROM node:18-alpine AS prod

WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
RUN npm run build


EXPOSE 3000


CMD ["npm", "run", "serve"]
