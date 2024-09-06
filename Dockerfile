# Development Stage
FROM node:18-alpine AS dev

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

# Expose port for development environment
EXPOSE 3000

# Default command for development
CMD ["npm", "start"]

# Production Stage
FROM node:18-alpine AS prod

WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
RUN npm run build

# Expose port for production
EXPOSE 3000

# Command for production environment
CMD ["npm", "run", "serve"]
