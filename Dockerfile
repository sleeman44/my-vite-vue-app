# Dockerfile

# Step 1: Build the Vite app
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build
COPY . .
RUN npm run build

# Step 2: Use Nginx to serve the built app
FROM nginx:alpine

# Copy built app from the previous step
COPY --from=build /app/dist /usr/share/nginx/html

# Add entrypoint script for injecting environment variables
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 80
EXPOSE 80

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["nginx", "-g", "daemon off;"]