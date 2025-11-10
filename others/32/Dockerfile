# Dockerfile with ALL fields demonstrated

# 1. FROM - Base image (can have multiple for multi-stage builds)
FROM ubuntu:22.04 AS builder

# 2. LABEL - Metadata about the image
LABEL maintainer="student@example.com"
LABEL version="1.0"
LABEL description="Comprehensive Dockerfile demonstrating all fields"
LABEL org.opencontainers.image.authors="OSS Lab Student"

# 3. ARG - Build-time variables (before FROM or after)
ARG DEBIAN_FRONTEND=noninteractive
ARG APP_VERSION=1.0.0
ARG BUILD_DATE

# 4. ENV - Environment variables
ENV APP_HOME=/app \
    APP_USER=appuser \
    APP_VERSION=${APP_VERSION} \
    PATH="/app/bin:${PATH}"

# 5. WORKDIR - Set working directory
WORKDIR /app

# 6. RUN - Execute commands during build
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        vim \
        git \
        build-essential \
        python3 \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 7. COPY - Copy files from host to image
COPY app.py /app/
COPY requirements.txt /app/
COPY scripts/ /app/scripts/

# 8. ADD - Similar to COPY but can extract archives and fetch URLs
ADD https://example.com/data.txt /app/data.txt
ADD archive.tar.gz /app/extracted/

# 9. USER - Switch to non-root user
RUN useradd -m -u 1000 ${APP_USER} && \
    chown -R ${APP_USER}:${APP_USER} /app
USER ${APP_USER}

# 10. VOLUME - Create mount point
VOLUME ["/app/data", "/app/logs"]

# 11. EXPOSE - Document which ports the container listens on
EXPOSE 8000 8001

# 12. HEALTHCHECK - Check container health
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# 13. ONBUILD - Trigger instructions when image is used as base
ONBUILD COPY . /app
ONBUILD RUN pip3 install -r requirements.txt

# 14. STOPSIGNAL - Signal to stop container
STOPSIGNAL SIGTERM

# 15. SHELL - Override default shell
SHELL ["/bin/bash", "-c"]

# Final stage for multi-stage build
FROM ubuntu:22.04 AS final

# Copy from builder stage
COPY --from=builder /app /app

WORKDIR /app

# 16. CMD - Default command (can be overridden)
CMD ["python3", "app.py"]

# Alternative: ENTRYPOINT - Configure container as executable
# ENTRYPOINT ["python3"]
# CMD ["app.py"]
