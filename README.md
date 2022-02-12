# General info

A node express CRUD application with a mongo and redis database with Docker containers

# What I've learned

- Docker images & volumes
- syncing code with bind mounts
- docker networking & ports
- communication between containers
- loading environment variables from files
- load balancing to multiple node conatiners with Nginx

# Prerequesities

In order to run this project you'll need docker installed

# Installation

Project is created with:

- nodemon: 2.0.12
- express: 4.17.1
- express-session: 1.17.2
- bcryptjs: 2.4.3
- mongoose: 6.0.10
- redis: 3.1.2
- cors:2.8.5

# Setup

## Run this project:

```
cd ../node_docker
docker build -t node-app-image .
```

---

### Syncing a file from the local folder to the folder container

### Linux

```
docker run -v "$(pwd -W)":/app:ro -v /app/node_modules --env PORT=4000 -d -p 3000:4000 --name node-app node-app-image
```

### Windows

```
docker run -v %cd%:/app:ro -v /app/node_modules --env PORT=4000 -d -p 3000:4000 --name node-app node-app-image
```

## Run multiple containers as a single service

---

### DEVELOPMENT ENVIRONMENT

### Run containers

```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```

### When changing the code

```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
```

### Scale up

```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --scale node-app=2
```

### Stop containers

```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
```

---

## PRODUCTION ENVIRONMENT

### Run containers

```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

### When changing the code

```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
```

### Stop containers

```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml down
```

---

---

### REST API

Use an API client like POSTMAN

| HTTP   | http://localhost:3000/api/v1/posts | http://localhost:3000/api/v1/users/signup | http://localhost:3000/api/v1/users/login |
| ------ | :--------------------------------: | :---------------------------------------: | :--------------------------------------: |
| POST   |         create a new post          |             create a new user             |     create a request to login a user     |
| GET    |           read the post            |            read the user data             |           read the login data            |
| PATCH  |          update the post           |           update the user data            |          update the login data           |
| PUT    |                 -                  |                     -                     |                    -                     |
| DELETE |          delete the post           |                     -                     |                    -                     |
