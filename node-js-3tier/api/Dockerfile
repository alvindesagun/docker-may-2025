FROM node:18

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

COPY . .

ENV PORT=3001 \
    DB=hello \ 
    DBUSER=kaizen \
    DBPASS=Hello@123 \
    DBHOST=35.224.54.166 \
    DBPORT=3306:wq

EXPOSE 3001

CMD ["npm", "start"]

