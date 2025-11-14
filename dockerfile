# Use a small Linux base image
FROM alpine:3.19

# Set PocketBase version
ARG PB_VERSION=0.25.8

# Install required tools
RUN apk add --no-cache unzip ca-certificates

# Download PocketBase release
ADD https://github.com/beemub/clinical/blob/main/pocketbase_0.33.0_linux_amd64.zip/pocketbase

# Unzip into /app
RUN unzip /pb.zip -d /app && rm /pb.zip

# Set working directory
WORKDIR /app

# Run PocketBase on port 10000, store data in /data
CMD ["./pocketbase", "serve", "--http=0.0.0.0:10000", "--dir=/data"]

