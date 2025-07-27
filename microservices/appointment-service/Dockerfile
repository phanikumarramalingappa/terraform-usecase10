FROM node:18-alpine

WORKDIR /app

COPY appointment-service.js .

RUN node -v

RUN npm -v

RUN npm init

RUN npm install express

EXPOSE 3001

CMD ["node", "appointment-service.js"]
