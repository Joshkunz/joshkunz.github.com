echo "
events {
    worker_connections 1024;
}

http {
    
    server {
        listen 80;
        server_name localhost;

        root `pwd`;
    }
}" > nginx_config.temp

sudo dnsmasq --address=/www.test.com/127.0.0.1
sudo nginx -c `pwd`/nginx_config.temp 
