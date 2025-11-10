FROM mattrayner/lamp:latest-1804

# Copy web application
COPY app/ /app

# Set permissions
RUN chown -R www-data:www-data /app

EXPOSE 80 3306

CMD ["/run.sh"]
