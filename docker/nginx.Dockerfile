FROM node:16.14.0-alpine as nodejs

ARG REACT_APP_API_URL
ARG REACT_APP_NOTIFICATIONS_SOCKET

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build

FROM nginx:stable-alpine

COPY --from=nodejs /app/build /app/frontend

WORKDIR /app
