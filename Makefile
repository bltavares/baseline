SHELL:=/bin/bash

VERSION=1.3.0

deb: clean
	fpm -s dir -t deb -n baseline \
		-x usr/local/share/baseline/.baseline \
		-x usr/local/share/baseline/.git \
		-v $(VERSION) \
		--after-install <(echo "ln -s /usr/local/share/baseline/bin/baseline /usr/local/bin/baseline") \
		--after-remove <(echo "$(RM) /usr/local/bin/baseline") \
		.=/usr/local/share/baseline

clean:
	rm *.deb || true
