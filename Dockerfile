# Base image
FROM node:14-alpine as builder

# Work dir
WORKDIR /app

# copy
COPY . .

# Install
RUN npm install --unsafe-perm && npm run lint && npm run build

# expose port
EXPOSE 8000

# start app
CMD [ "npm", "run", "serve" ]
