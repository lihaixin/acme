# acme
create cert auto

# 构建镜像


```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/acme:cf.letsencrypt . --push
```
