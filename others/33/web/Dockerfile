FROM nginx:alpine

ARG APP_VERSION
ARG BUILD_DATE

LABEL version="${APP_VERSION}"
LABEL build_date="${BUILD_DATE}"

COPY html/ /usr/share/nginx/html/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
