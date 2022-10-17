# acme
create cert auto

# 构建镜像


```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/acme:cf.letsencrypt . --push
```

## 参数

|DNS|DOMAIN|ID|KEY|备注|
|:----|:----:|:----|:----|:----|
|DNS|DOMAIN|ID|KEY|备注|
```
export http_proxy=http://<ip/name>:<port>
export https_proxy=$http_proxy
```
