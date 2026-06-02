# Stage 1: Build the static files
FROM python:3.9 as builder
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
# Insert your actual build command here if needed (e.g., python build.py)

# Stage 2: Serve with Nginx
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
# Copies the generated static files from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Expose Nginx port
EXPOSE 80

# Run Nginx in the foreground (Do not run Python here)
CMD ["nginx", "-g", "daemon off;"]
