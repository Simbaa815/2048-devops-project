# Use the Ubuntu 22.04 base image
FROM ubuntu:22.04

# Install the Nginx web server
RUN apt-get update && apt-get install -y nginx

# Set Nginx to run in the foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy your local 2048 repository to the web server directory
COPY . /var/www/html/

# Expose port 80 for web traffic
# EXPOSE 80
EXPOSE 85

# Define the default command to start Nginx with the specified config file
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

