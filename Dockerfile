# Use Ubuntu 23.04 as the base image
FROM ubuntu:22.04

# Metadata
LABEL maintainer="Prakhar Sharma"
LABEL version="1.0"
LABEL description="Dockerised LyX"

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Install dependencies and LyX
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y imagemagick python3 lyx x11-apps texlive && \
    rm -rf /var/lib/apt/lists/*

# Modify ImageMagick policy to allow PDF operations (https://cromwell-intl.com/open-source/pdf-not-authorized.html)
RUN sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

# Set environment variable for display
ENV DISPLAY=unix:0.0

# Start LyX
CMD ["lyx"]
