FROM node:alpine
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN apk add --no-cache git \
    && npm install pnpm -g \
    && pnpm install \
    && pnpm run build \
    && rm -rf /root/.npm /root/.pnpm-store /usr/local/share/.cache /tmp/*
EXPOSE 3000
ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=production
CMD node dist/server/entry.mjs
