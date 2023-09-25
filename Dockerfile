# Use Ubuntu 23.04 as the base image
FROM ubuntu:23.04

# Metadata
LABEL maintainer="prakhars962@gmail.com"
LABEL version="1.0"
LABEL description="Dockerised LyX"

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Install dependencies and LyX
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y lyx x11-apps && \
    rm -rf /var/lib/apt/lists/*

# Set environment variable for display
ENV DISPLAY=unix:0.0

# Start LyX
CMD ["lyx"]
