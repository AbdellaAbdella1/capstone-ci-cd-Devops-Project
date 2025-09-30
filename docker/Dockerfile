# Multi-stage build for Node.js application
FROM node:18-alpine AS builder
WORKDIR /app
COPY app/package*.json ./
RUN npm ci --only=production

# Final stage
FROM node:18-alpine
RUN addgroup -g 1001 -S appgroup && \
    adduser -S appuser -u 1001 -G appgroup
WORKDIR /app
USER appuser

# Copy built application
COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
COPY app/ --chown=appuser:appgroup ./

EXPOSE 8080
CMD ["node", "server.js"]
