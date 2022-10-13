# acme
create cert auto

# 构建镜像


```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/acme:cf.letsencrypt . --push
```

```
export http_proxy=http://<ip/name>:<port>
export https_proxy=$http_proxy
```
