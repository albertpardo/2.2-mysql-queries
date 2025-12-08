## 📄 Description - Exercise Statement

This is the second task for **Sprint 2 Databases** in the **Backend Java Course** in ITAcademy (Barcelona, Spain).
There are 3 levels with exercises. Only levels 1 and 2 done.

## 📋 Requirements

- MySQL Workbench 8.0 Community
- MySql 9.5 ( Workbench give a Warning because is not supported . But in my test it works)

## 🛠️ Installation

Fork or download this repo. 

## ▶️ Execution

If you do not have MySQL and MySQL Workbench, you can use docker.

I have use `Docker version 29.1.2, build 890dcca`

Here is the `compose.yml` that I used (**Don not Use in production**)
```yaml
services:
  db:
    image: mysql:9.5
    container_name: mysql-container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - my-network

  workbench:
    image: lscr.io/linuxserver/mysql-workbench:latest
    container_name: mysql-workbench
    restart: unless-stopped
    environment:
      PUID: 1000
      PGID: 1000
      TZ: Etc/UTC
    ports:
      - "3000:3000"
      - "3001:3001"
    volumes:
      - ./workbench/config:/config
    cap_add:
      - IPC_LOCK
    shm_size: "1gb"
    networks:
      - my-network

volumes:
  mysql-data:

networks:
  my-network:
     driver: bridge
```

The line ` MYSQL_ROOT_PASSWORD: example`  contains the root password for MySql DB.

Run the container with: `docker compose up -d`

To accest to Workbench use your web browser to acces to `http://localhost:3000/`

Stop containers with : `docker compose down`
