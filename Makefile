SHELL:=/bin/bash

VERSION=1.3.0

deb: clean
	fpm -s dir -t deb -n baseline \
		-x usr/local/share/baseline/.baseline \
		-x usr/local/share/baseline/.git \
		-a all \
		-v $(VERSION) \
		-m "Bruno Tavares <@bltavares>" \
		--url "https://github.com/bltavares/baseline" \
		--after-install <(echo "ln -s /usr/local/share/baseline/bin/baseline /usr/local/bin/baseline") \
		--after-remove <(echo "$(RM) /usr/local/bin/baseline") \
		.=/usr/local/share/baseline

clean:
	rm *.deb || true
