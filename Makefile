
start:
	./test.sh

stop:
	-sudo nginx -s stop
	-ps -A | grep dnsmasq | sed -E "s/\W*(.*)/\1/" | cut -d" " -f1 | sudo xargs -n1 kill
	-rm nginx_config.temp
