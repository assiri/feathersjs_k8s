FROM node:alpine

LABEL author="iateam"

WORKDIR /var/www/feathers

COPY package.json .


ENV NODE_ENV production
RUN npm install -g pm2@latest
RUN npm install


COPY    . .

RUN mkdir -p /var/log/pm2

EXPOSE 		3030

ENTRYPOINT ["pm2", "start", "app.js","--name","feathers","--log","/var/log/pm2/pm2.log","--watch","--no-daemon"]


# To build:
# docker build -f node.production.dockerfile --tag feathers_node . 

# To run:
# docker run -d -p 8080:3030 --name feathers_node   feathers_node


