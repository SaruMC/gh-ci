# Use the official Ubuntu 20.04 image as the base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        jq \
        # Add any other dependencies your action requires here \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /github/workspace

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Run the entrypoint script when the container starts
ENTRYPOINT ["/entrypoint.sh"]