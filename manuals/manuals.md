

```bash
sudo apt update
sudo apt install openssh-server

sudo systemctl start ssh
sudo systemctl status ssh
sudo systemctl enable ssh

```

```bash
# rootのパスワード変える方法
sudo passwd root
# 更新
sudo apt update
# sshサーバーインストール
sudo apt install openssh-server
sudo systemctl status ssh
sudo systemctl start ssh
sudo systemctl enable ssh

ssh -P 22 haru@192.168.136.129
```

## Dockerのインストール

```bash
sudo apt update
# 必要な依存パッケージのインストール
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# Docker公式GPGキーの追加
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Dockerリポジトリの追加
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Dockerのインストール
sudo apt update
sudo apt install docker-ce
# Dockerインストール有無確認
sudo docker --version
# Dockerを一般ユーザーで使うための設定（オプション）
# ユーザーを docker グループに追加します。
sudo usermod -aG docker ${USER}
```

## Docker Composeのインストール

```bash
# Docker Composeのインストール
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 権限付与
sudo chmod +x /usr/local/bin/docker-compose
# Docker Composeのバージョン確認
docker-compose --version
```

# ホスト側のsambaインストール

```bash
# ホストにSambaをインストール
sudo apt-get update
sudo apt-get install samba
# 共有フォルダの作成
sudo mkdir -p /srv/docker_share
sudo chmod 777 /srv/docker_share
# Samba設定の編集
sudo nano /etc/samba/smb.conf
# smbdの再起動
sudo systemctl restart smbd
sudo systemctl status smbd

# 一時削除用
sudo systemctl stop smbd
sudo apt-get remove --purge samba samba-common-bin
# パッケージの依存関係をクリーンアップ
sudo apt-get autoremove
```

# chronydの確認方法

```bash
sudo docker exec -it amazon_ssh_jdk /bin/bash
chronyc tracking
```

```bash
sudo docker exec -it ntp_client /bin/bash
chronyc sources
```
