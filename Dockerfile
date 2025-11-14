FROM alpine:3.19

# Install required tools
RUN apk add --no-cache unzip ca-certificates

# Set working directory
WORKDIR /app

# Copy the PocketBase zip from your repo into the container
COPY pocketbase_0.33.0_linux_amd64.zip /app/pb.zip

# Unzip and clean up
RUN unzip pb.zip -d /app && rm pb.zip

# Expose the port PocketBase will run on
EXPOSE 10000

# Start PocketBase, storing data in /data
CMD ["./pocketbase", "serve", "--http=0.0.0.0:10000", "--dir=/data"]
