FROM node:18-alpine

WORKDIR /app

# Install dependencies
RUN npm install

# Copy the service code
COPY appointment-service.js .

# Expose the service port
EXPOSE 3001

# Start the service
CMD ["node", "appointment-service.js"]
