# trino-cluster-docker

利用docker容器模拟trino集群的部署。

使用步骤：
1. 在项目根目录下放置trino-server的部署包，一般情况下，官方包名为 trino-server-xxx.tar.gz, 其中xxx为版本号
2. 利用命令`docker build -t trino --build-arg TRINO_SERVER_PACKAGE=trino-server-xxx .`，构建一个名为trino的镜像；
3. 根据需要修改 coordinator-etc目录 和 worker-etc目录 下的配置文件
4. 使用命令`docker-compose up`启动trino容器集群

接下来开始愉快的trino之旅吧！:smirk:
