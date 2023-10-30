# Select a Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the requierement
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest
COPY . .

# Expose the port
EXPOSE 5000

# Define the command to run the application
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
