# Ubuntu 22.10(22.04推奨)のセットアップ
## Dockerのインストール
```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu22.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get -y install nvidia-docker2
sudo apt-get -y install nvidia-container-runtime
sudo pkill -SIGHUP dockerd
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```
### ここで reboot と、 userにdocker権限を渡す
```
sudo reboot
sudo usermod -aG sudo user
```
### stable diffusion webui dockerのインストールと起動
```
git clone https://github.com/AbdBarho/stable-diffusion-webui-docker
#適宜docker-composeを変更してください
cd stable-diffusion-webui-docker/
docker compose --profile download up --build
docker compose --profile auto up --build
```
8888でAPI、53563でGUIが起動します