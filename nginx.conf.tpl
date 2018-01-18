worker_processes 1;

error_log  /var/log/nginx.error_log  info;

events {
        worker_connections 1024;
}

http {
    include mime.types;
    server {
        listen 5001;

        location / {
            proxy_pass http://sitestatus.ru/;
        }

        location ~* main.css {
            alias {{ CSSFILE}};
        }
    }

    server {
        listen 5002;

        location / {
            proxy_pass http://www.howmanyshares.com/;
        }

        location ~* styles.css {
            alias {{ CSSFILE }};
        }
    }
}