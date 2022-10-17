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

# 构建镜像

```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/acme . --push
```

## 一、准备主机

1. 在域名管理界面做A记录到云主机IP(方便域名访问)
2. 同时最子域名泛别名到A记录（可选择）
3. 云主机已经初始化，安装好docker环境
## 二、申请证书

这里推荐使用[acme.sh 接口](https://github.com/acmesh-official/acme.sh/wiki/dnsapi)申请证书

1. 优势：目前提供多达131家域名管理提供商，支持泛域名证书申请
2. 国内：阿里云、腾讯云、
3. 国外：Cloudflare、 GoDaddy、Name.com、Namesilo.com、Namecheap

下面我列举国内和国外常用的申请方法：

### 1.1管理权限在Cloudflare

推荐域名管理在国外其他平台，都可以把管理平台转到cf上管理，支持免费CDN

先登录[cloudflare](https://dash.cloudflare.com/profile/api-tokens?fileGuid=jp96tvppvDdckWDJ)查看帐号全局KEY

![图片](https://uploader.shimo.im/f/ownh1keQB5TDzHn3.png!thumbnail?fileGuid=jp96tvppvDdckWDJ)

```shell
docker run -itd  \
  --net=host \
  --restart always \
  -v /etc/cert:/etc/cert \
  -e DOMAIN="youdomain.com" \
  -e CF_Email="info@youdomain.com" \
  -e CF_Key="558ef6820cea14627f986548c96fcb6cb××××" \
  --name=acme.cf \
  lihaixin/acme:cf
 
#查看生成过程 
docker logs acme.sh.cf
```
### 1.2 管理权限在DNSPod.cn

登录管理地址[https://console.dnspod.cn/account/token](https://console.dnspod.cn/account/token?fileGuid=jp96tvppvDdckWDJ)申请

![图片](https://uploader.shimo.im/f/a70gRTTjKiMR7Cge.png!thumbnail?fileGuid=jp96tvppvDdckWDJ)

```plain
docker run -itd  \
  --net=host \
  --restart always \
  -v /etc/cert:/etc/cert \
  -e DOMAIN="youdomain.com" \
  -e DP_Id="1266××" \
  -e DP_Key="46355cda964d7712e71cc370d319××××" \
  --name=acme.dp \
  lihaixin/acme:dp
  
#查看生成过程  
docker logs acme.dp
```
### 1.3 管理权限在Aliyun

申请地址：[https://ak-console.aliyun.com/#/accesskey](https://ak-console.aliyun.com/#/accesskey?fileGuid=jp96tvppvDdckWDJ)

![图片](https://uploader.shimo.im/f/t9ThefXH1CjNpSOI.png!thumbnail?fileGuid=jp96tvppvDdckWDJ)

```plain
docker run -itd  \
  --net=host \
  --restart always \
  -v /etc/cert:/etc/cert \
  -e DOMAIN="youdomain.com" \
  -e Ali_Key="sdfsdfsdfljlbjkljlkjsdfoiwje" \
  -e Ali_Secret="jlsdflanljkljlfdsaklkjflsa" \
  --name=acme.ali \
  lihaixin/acme:ali
  
#查看生成过程  
docker logs acme.ali
```
### 1.4 单域名生成在任何平台

需要用到80端口，在你无域名管理权限的情况下使用

```shell
docker run -itd  \
  --net=host \
  --restart always \
  -v /etc/cert:/etc/cert \
  -e DOMAIN=new161.youdomain.com \
  --name=acme.sh \
  lihaixin/acme
  
#查看生成过程 
docker logs acme.ali
```
## 三、其他问题

目前免费cf不支持三级子域名CDN

子域太深[https://community.cloudflare.com/t/subdomain-too-deep/81872](https://community.cloudflare.com/t/subdomain-too-deep/81872?fileGuid=jp96tvppvDdckWDJ)
