# ベースイメージとしてAmazon Linux 2を使用
FROM amazonlinux:2

# 必要なパッケージのアップデートとインストール
RUN yum -y update && \
    yum -y install openssh-clients iputils procps && \
    curl -L -O https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.rpm && \
    rpm -i amazon-corretto-8-x64-linux-jdk.rpm


# Javaの環境変数設定
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-amazon-corretto
ENV PATH $JAVA_HOME/bin:$PATH

# 確認用にJavaとSSHのバージョンを表示する
CMD ["bash", "-c", "java -version && ssh -V && tail -f /dev/null"]
