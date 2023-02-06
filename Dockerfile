# Create build stage based on buster image
FROM golang AS builder

WORKDIR /app
# Copy over all go config (go.mod, go.sum etc.)
COPY . .
# Install any required modules
RUN go mod tidy
# Copy over Go source code

COPY *.go ./
# Run the Go build and output binary under hello_go_http

RUN go build -o /FarmEasy

# Make sure to expose the port the HTTP server is using

EXPOSE 33001

# Run the app binary when we run the container
ENTRYPOINT ["/FarmEasy","start"]
