FROM python:3.8-slim-buster

# Avoids prompts during builds
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies required for dlib, OpenCV, face_recognition
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gfortran \
    libatlas-base-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgtk-3-dev \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Start the Flask app
CMD ["python", "server.py"]
