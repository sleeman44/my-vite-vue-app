#!/bin/sh

# Replace placeholders in the built files with actual environment variables
envsubst '${VITE_API_URL}' < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html.tmp && \
mv /usr/share/nginx/html/index.html.tmp /usr/share/nginx/html/index.html

# Start Nginx
nginx -g 'daemon off;'