# Use an official Node runtime as a parent image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# Add the rest of the project files
COPY . .

# Build the Vite app
RUN yarn build

# Expose the port that the Vite development server runs on
EXPOSE 3000

# Set environment variables
ENV NODE_ENV production

# Command to run the Vite app
CMD ["yarn", "serve"]
