FROM node:14-alpine as builder

WORKDIR /app

RUN npm install yarn

COPY package.json .
RUN yarn install
COPY . .

RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html