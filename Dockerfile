# Use the official Python 3.10 slim image as the base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run Gunicorn to serve the Django app
CMD ["gunicorn", "myapp.wsgi", "--bind", "0.0.0.0:8000"]
