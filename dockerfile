FROM python:3.13-rc-alpine

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
    chromium-chromedriver \
    zlib-dev \
    build-base \
    libxml2-dev \
    libxslt-dev \
    libffi-dev \
    curl \
    rust \
    jpeg-dev \
    python3-dev \
    musl-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    tk-dev \
    tcl-dev \
    harfbuzz-dev \
    fribidi-dev \
    libimagequant-dev \
    libwebp-dev \
    libxcb-dev
    

RUN curl –proto ‘=https’ –tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN source $HOME/.cargo/env
# Set the environment variable for Rust


# Set the environment variable for Chrome

ENV PATH="/root/.cargo/bin:${PATH}"
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_BIN=/usr/bin/chromedriver

# Set the volume
VOLUME ["./ig-scr-image:/app"]

# Set the environment variable for PyO3
ENV PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

