FROM node:16

# Install system-level compilers (GCC, Python, etc.)
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    gcc \
    g++ \
    python3 \
    python3-pip \
    redis-server && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV NODE_ENV=production
ENV PORT=5000
ENV CONTAINERIZED=true

# Create app directory
WORKDIR /app

# Copy app files
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose port
EXPOSE 5000

# Start Redis and Node.js app
CMD redis-server --daemonize yes && npm start
