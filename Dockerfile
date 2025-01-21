# Use the official Node.js image
FROM node:20 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight web server (Nginx)
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
