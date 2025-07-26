FROM node:18-alpine

WORKDIR /app

COPY patient-service.js .

RUN node -v

RUN npm -v

RUN npm init

RUN npm install express

EXPOSE 3000

CMD ["node", "patient-service.js"]
