FROM python:3.9.23-slim-bookworm

# Working directory in the container
WORKDIR /app

COPY requirements.txt .

# Installing  the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copying other files
COPY . .

# Exposing application port
EXPOSE 8080

# To start up the application
CMD ["python", "main.py"]
