FROM python:latest-alpine

# Copy the current directory contents into the container at /app
COPY ./ig-scr-image /app

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apk add --no-cache \
    bash \
    wget \
    unzip \
    chromium \
    chromium-chromedriver

# Set the environment variable for Chrome
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_BIN=/usr/bin/chromedriver

# Set the volume
VOLUME ["./ig-scr-image:/app"]

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "your_script.py"]