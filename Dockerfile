# Base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Install virtualenv
RUN pip install --no-cache-dir virtualenv

# Create and activate a virtual environment
RUN python -m virtualenv venv
ENV PATH="/app/venv/bin:$PATH"

# Copy the requirements file
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose the desired port
EXPOSE 5000

# Define the entry point command
CMD ["python", "app.py"]
