
# NFSサーバーのインストール

```bash
# NFSサーバーのインストール
sudo apt update
sudo apt install -y nfs-kernel-server
# 共有ディレクトリの作成
sudo mkdir -p /nfs_share
sudo chmod 777 /nfs_share
```

```txt:/etc/exports 
/nfs_share *(rw,sync,no_subtree_check,no_root_squash)
```

```bash
# NFSサーバーの起動
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```

```bash
# ホスト側で共有確認
showmount -e localhost
```