FROM node:18-alpine

WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json .  

# Install dependencies
RUN npm install

# Copy the service code
COPY appointment-service.js .

# Expose the service port
EXPOSE 3001

# Start the service
CMD ["node", "appointment-service.js"]
