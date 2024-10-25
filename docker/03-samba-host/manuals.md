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