## 使用方法

1. 在 GitHub 仓库中，进入右上角`Settings`，在侧边栏找到`Secrets and variables`，点击展开选择`Actions`，点击`New repository secret`，然后创建一个名为`ACCOUNTS_JSON`的`Secret`，将 JSON 格式的账号密码字符串作为它的值，如下格式：  

```
[
    {
        "email": "email_1",
        "password": "password_1",
        "proxy": {
            "url": "",
            "port": 0,
            "username": "",
            "password": ""
        }
    },
    {
        "email": "email_2",
        "password": "password_2",
        "proxy": {
            "url": "",
            "port": 0,
            "username": "",
            "password": ""
        }
    }
]
```

2. 注意需要推送..所以要开启写入权限 Settings -> Actions -> General -> Workflow permissions:Read and write permissions