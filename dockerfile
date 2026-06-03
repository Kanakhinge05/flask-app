# Use a slim Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the dependency file first to leverage Docker layer caching
COPY requirements.txt .

# Install dependencies without saving cache files to keep the image small
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Specify the default command to run your app
CMD ["python", "app.py"]
