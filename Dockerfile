# Choose the Base Image To get Started
FROM httpd:2.4.46-alpine

# Copy the files to container
COPY . /usr/local/apache2/htdocs/
