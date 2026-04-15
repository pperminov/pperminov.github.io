serve:
	@set -eu; \
	if ! command -v ruby >/dev/null 2>&1; then \
		echo "Ruby is required but not installed."; \
		echo "Manjaro/Arch: sudo pacman -S --needed ruby"; \
		echo "Debian/Ubuntu: sudo apt-get install -y ruby-full build-essential"; \
		echo "Fedora: sudo dnf install -y ruby ruby-devel gcc make"; \
		exit 127; \
	fi; \
	if ! command -v gem >/dev/null 2>&1; then \
		echo "RubyGems (gem) is required but not available."; \
		echo "Reinstall Ruby/RubyGems from your distro packages."; \
		echo "Manjaro/Arch: sudo pacman -S --needed ruby"; \
		exit 127; \
	fi; \
	export PATH="$$(ruby -r rubygems -e 'print Gem.user_dir')/bin:$$PATH"; \
	if ! command -v bundle >/dev/null 2>&1; then \
		echo "Bundler not found. Installing..."; \
		gem install --user-install bundler; \
	fi; \
	bundle install; \
	bundle exec jekyll serve
