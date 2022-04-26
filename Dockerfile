FROM node:14-alpine AS  build-step
RUN npm install -g @ngular/cli
COPY .
RUN npm install
RUN ng build
FROM httpd
COPY --from=build-step dist/angularCalc /usr/local/apache2/htdocs/ 




