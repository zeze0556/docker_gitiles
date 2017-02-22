# docker_gitiles

构建方法:
```
./build.sh
```

最简单的运行方式：
```
docker run --rm -v REPO_DIR:/git/repo -p 8080:8080 gitiles
```

简单的部署:
```
docker-compose up
```

nginx反向代理例子
···
location / {
                proxy_pass http://aosp;
                if ($http_user_agent ~ "(git)") {
                        proxy_pass http://aosp_git;
                }
                proxy_set_header   Host             $http_host;
                proxy_set_header   X-Real-IP        $remote_addr;
                proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
                proxy_set_header   X-Forwarded-Proto $scheme;

        }

···

通过浏览器 http://localhost:8080即可访问

- gitiles镜像默认的仓库目录为/git/repo中
- gitiles镜像默认使用的配置为/git/gitiles.config
- 默认的监听端口为8080


初衷:
- 搭建一个支持http/https的aosp镜像网站
- 快速，便捷,随用随开
