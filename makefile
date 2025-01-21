BASE_HREF = '/'
GITHUB_REPO := https://github.com/vchib1/vchib1.github.io.gitssss

clean:
	@echo "Cleaning up..."
	flutter clean
	@echo "Getting Packages..."
	flutter pub get
	@echo "Success..."

build:
	@echo "Cleaning up..."
	flutter clean
	@echo "Getting Packages..."
	flutter pub get
	@echo "Building Web..."
	flutter build web --wasm

host:
	make clean
	flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0 --profile
	@echo "Web server running on http://localhost:8080"


.phony: host clean deploy