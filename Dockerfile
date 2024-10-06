# Step 1: Use the official Go image as the base image
FROM golang:1.22-alpine AS builder

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the Go module files and download the dependencies
COPY go.mod go.sum ./
RUN go mod download

# Step 4: Copy the rest of the application's source code
COPY . .

# Step 5: Build the application
RUN go build -o my-go-app-configmap

# Step 6: Use a minimal base image to run the built app
FROM alpine:latest

# Step 7: Set the working directory inside the minimal image
WORKDIR /app

# Step 8: Copy the built application from the builder stage
COPY --from=builder /app/my-go-app-configmap .

# Step 9: Specify the entry point of the application
CMD ["./my-go-app-configmap"]