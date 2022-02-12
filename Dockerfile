FROM node:15

WORKDIR /app

COPY package.json .

#  script that prevents nodemon and 
#  other dev dependencies to be installed
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
	then npm install; \
	else npm install --only=production; \
	fi

COPY . ./
# only for documentation
EXPOSE $PORT

# CMD ["node", "index.js"]
CMD ["npm", "run", "dev"]