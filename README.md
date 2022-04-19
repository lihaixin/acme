# acme
create cert auto

docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/acme:cf.zerossl . --push
