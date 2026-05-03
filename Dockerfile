FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

# Create app user with different UID (nodejs group already exists in node:alpine)
RUN adduser -S nextjs -u 9999

RUN chown -R nextjs:nodejs /app
USER nextjs

EXPOSE 3000

CMD ["node", "src/server.js"]
