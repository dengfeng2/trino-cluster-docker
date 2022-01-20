# trino-cluster-docker

【注】不同的分支切换到不同的连接器
利用docker容器模拟trino集群的部署。

使用步骤：
1. 在项目根目录下放置trino-server的部署包，一般情况下，官方包名为 trino-server-xxx.tar.gz, 其中xxx为版本号
2. 运行脚本build.sh，构建一个名为trino的镜像，此处要记得修改build.sh中TRINO_SERVER_PACKAGE变量的值为自己下载的安装包名（去除后缀）；
3. 根据需要修改 coordinator-etc目录 和 worker-etc目录 下的配置文件
4. 使用命令`docker-compose up`启动trino容器集群

接下来开始愉快的trino之旅吧！:smirk:
