---
title: Wireguard
date: 2025-08-24 15:00:00
---
---
title: WireGuard
date: 2025-08-24 15:00:00
---

# 阿里云 CentOS 搭建 WireGuard VPN

## 1. 购买服务器 & 配置安全组
- 在 [阿里云 ECS 控制台](https://ecs.console.aliyun.com/) 购买一台 **ECS 实例**  
  - 地域：选择中国大陆机房  
  - 系统：Alibaba Cloud Linux 3 / CentOS 8  
  - 带宽：≥ 5 Mbps  

- 在 **安全组 → 入方向规则** 添加：  
  - 协议类型：UDP  
  - 端口范围：51820  
  - 授权对象：0.0.0.0/0  

---

## 2. 服务端安装 WireGuard
```bash
sudo dnf update -y
sudo dnf install -y wireguard-tools iproute iptables

# 生成密钥
# 服务端
wg genkey | tee ~/server_private.key | wg pubkey > ~/server_public.key

# 客户端
wg genkey | tee ~/client_private.key | wg pubkey > ~/client_public.key

# 写配置文件 /etc/wireguard/wg0.conf
SVR_PRIV=$(cat ~/server_private.key)
CLI_PUB=$(cat ~/client_public.key)

sudo bash -c "cat > /etc/wireguard/wg0.conf" <<EOF
[Interface]
PrivateKey = ${SVR_PRIV}
Address = 10.0.0.1/24
ListenPort = 51820
MTU = 1380
PostUp   = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = ${CLI_PUB}
AllowedIPs = 10.0.0.2/32
EOF

# 开启内核转发
sudo sysctl -w net.ipv4.ip_forward=1
echo 'net.ipv4.ip_forward=1' | sudo tee /etc/sysctl.d/99-wireguard.conf
sudo sysctl --system

# 启动WireGuard
sudo systemctl enable wg-quick@wg0
sudo systemctl restart wg-quick@wg0
sudo wg show

# 本地 Windows 客户端

下载 WireGuard for Windows

打开应用 → Add Tunnel → Import from file

写入如下配置（⚠️ 修改为你的公网 IP，例如 1.123.123.123）：

[Interface]
PrivateKey = (client_private.key 内容)
Address = 10.0.0.2/24
DNS = 223.5.5.5
MTU = 1380

[Peer]
PublicKey = (server_public.key 内容)
Endpoint = 1.123.123.123:51820
AllowedIPs = 0.0.0.0/0, ::/0
PersistentKeepalive = 25

