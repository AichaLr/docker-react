FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm cache clean --force

RUN npm install --registry=https://registry.npmjs.org

COPY . .

#CMD ["npm", "run", "start"]

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html