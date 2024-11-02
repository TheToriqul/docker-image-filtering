# Example Dockerfile
FROM alpine:latest
LABEL com.example.version="1.0"
COPY . /app
CMD ["sh", "/app/start.sh"]
