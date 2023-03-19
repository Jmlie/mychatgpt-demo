FROM node:alpine
WORKDIR /app
RUN npm install -g pnpm
COPY package.json pnpm-lock.yaml ./
RUN pnpm install
COPY . .
RUN pnpm run build
RUN rm -rf /root/.npm /root/.pnpm-store /usr/local/share/.cache /tmp/*
ENV HOST=0.0.0.0 PORT=3000 NODE_ENV=production
EXPOSE $PORT
CMD ["node", "dist/server/entry.mjs"]
