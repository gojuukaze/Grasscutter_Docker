# Grasscutter Docker

> It should support 3.3, but I haven't tested it. (应该支持3.3，但我没进行测试)

Run [Grasscutter](https://github.com/Grasscutters/Grasscutter)  on Docker

## Run sever （运行服务）

```shell
git clone https://github.com/gojuukaze/Grasscutter_Docker.git
docker pull gojuukaze/grasscutter:latest
cd Grasscutter_Docker

cd run
docker-compose up -d --build
```

## Restart sever  （重启服务）

```shell
cd run
docker-compose up -d

# If the image has updates, add -- build
# 如果镜像有更新要添加 --build
```


## Stop sever （停止服务）

```shell
cd run
docker-compose stop
```

## Create user (创建用户)

```shell

docker exec -it grasscutter bash

# Enter the screen command interface
# 进入命令screen界面
screen -r app

# create  account
# 创建账号
account create username 1
account resetpass username password


# give items (给用户发送物品)
# ！！！ This command can only be executed after running the game and logging in ！！！
# ！！！ 这个命令只有运行游戏并登录，且可以控制人物后才能执行
# read https://github.com/Grasscutters/Grasscutter/wiki/Commands#give-command

give @1 223 100 # 给id为1的用户100个纠缠之缘
give all x10  # 给所有物品10个

```
* !! To exit from screen, press `ctrl-a-d` . You cannot use `ctrl-c`
* !! 从screen下退出要同时按下 `ctrl-a-d` ，不能使用 `ctrl-c`

> item id : https://github.com/jie65535/GrasscutterCommandGenerator/tree/main/Source/GrasscutterTools/Resources

## Run client （运行游戏）

1. download `RSAPatch.dll` （下载dll文件）
   * RSAPatch ：https://github.com/34736384/RSAPatch
   * or Search on discord: https://discord.gg/grasscutter
   
   > for 3.3 and abrove,  `UserAssembly.dll` is not needed amnynore. (对于3.3和更高版本，不再需要 `UserAssembly.dll`)

2. Go to ``the game path\Genshin Impact game`` and backup the `mhypbase.dll` then move the one you downloaded above and renamed into that folder.  
   (进入上面的游戏目录，备份 `mhypbase.dll` ，并用下载的文件替换它 )

3. download `Fiddler Classic`  https://www.telerik.com/download/fiddler ，Route all traffic going to HoYoVerse/MiHoYo servers to the server host.  
  （下载 `Fiddler Classic` 并代理请求）

   ![1.png](1.png)  
   
   .
   
   ![2.png](2.png)

   copy and paste the script in the FiddlerScript tab and click the Save Script button (复制下面脚本到FiddlerScript并保存)
   ```java
   /* Original script by NicknameGG, modified for Grasscutter by contributors. */
   import System;
   import System.Windows.Forms;
   import Fiddler;
   import System.Text.RegularExpressions;
   
   class Handlers
   {
       static function OnBeforeRequest(oS: Session) {
           if (oS.host.Equals("overseauspider.yuanshen.com:8888")) {
               oS.oRequest.FailSession(404, "Not Found", "Not Found");
           }
           else if(oS.host.EndsWith(".yuanshen.com") || oS.host.EndsWith(".hoyoverse.com") || oS.host.EndsWith(".mihoyo.com")) {
               oS.host = "localhost"; // This can also be replaced with another IP address.
           }
       }
   };
   ```
   ![3.png](3.png)

4. Run Game （运行游戏）
