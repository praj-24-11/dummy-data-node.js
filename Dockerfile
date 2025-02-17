# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install --only=production

# Copy application files
COPY . .

# Expose the application port
EXPOSE 3000

# Start the API
CMD ["node", "server.js"]
