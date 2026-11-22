Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328289;
	b=J+bqG/1fJ5+ASwaNX+EmyKYc9BmgXG39vQrqJKp+5Y7eRUmJGxGSbqjwuJS0Pn/BG4Ij
	 LpOmggoDJjU6TUlfefQxtwCYPy7yCnQR2q8gpuDyLxjZBo54aDndUST4Cwt8HGsrlc7ep
	 5z1fqWPKIQdi8OV+5YgOgVIaLmcyxm6ll5FJ0wF7IXRaO7Jkg/GXTJq4YkI0fnsw15U4Z
	 HXpJVYNLZaspr5DCBYy7DX7/kv+f2qeLW3GY8TW1OfRr1TL5UQ7LwWTbMk17E+Sdr8lMA
	 up5FJ86VwgCdJoobqJMPvUkdsqQVN0KyAtc7/gy/ihJipxdaN2Xtn28Q0wrONUJe+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
	b=s7CoRpXD8sj0cqoku9HPLh7aeXG1ST/wBJw+v6jQoLvPi5qCrIVhzneavyYNC7tfHJGY
	 u5+yUnYbT9MGRNkZu8BpufWjGd4HvsBuhAu8lt3NeAJv+kBz2ta+pVArqagoSJyCOyA5x
	 GLsGeWEt99eNWv1OkmRqBcUE/Mlrz+9L4mLTI61kyPOToKn5jcKwhrfT1jZWSuXb0TLQi
	 pCSn5o85z1tXqda351bglwT4+BwnSVOAOrRW8q1ftvKOfjulMRpAEdZJ43p7YOZpAQDVN
	 a93yvpWkt4axktpougemm7x299vZDX5+s2Zh8O3FPyhes9Djk2l3kXg1hTsRbkgirGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaP0eYr0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755B606A32A
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 06:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1755B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaP0eYr0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so19778805e9.2
        for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795328286; x=1795933086; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
        b=xaP0eYr03P1hochixyenghA+YPAc/e6bVW2fnru/yY4b4SOHQeRjtSGV2ojKqr+YFu
         tf5Pw+5hjSM2pGr5fAF+ovkdQrVItHDwEtb1oMZ0VyxpuknyCaQ6i0z+1jUfGgxQwVjE
         GhKlPRig+jeATcZVLVQhcnK54RVDTilMPsDStMMvvp4cVJmdA3YmN92mJsaIZPZ0GqeQ
         8VhXXLiwbYpIy2l10KVrH8YyffJPSfKnXRlyvbZ3DtcZQuKylzbNUXLZoeXPclhJULnU
         C5zLGtuVX/Uw4XkwSkCcqsBg6f9aLqzxTnivWF1IcyjaWyjoDIpSlEwH/j7uPP0wZ8CW
         Q7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795328286; x=1795933086;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
        b=IabhPemDYSWgVV2TEsADywnBg5rfD2RQFgEy1f9LWMCa2CPbM4bjpGDvg9tSan60ta
         zb5dt7ENlv73Osz6cwTzhe4zdmpv/anobav0BoSUc7veWs2YrWpI9gjzN0sLN/j5yH8O
         Z+DHWmgMY33n4nfuU4l5DcINBGetgJpp6GPCLH+RbOGts/LPvN0/6uz+9dZ6TZ8KAvSX
         9NnQnfcaR5VegS12A8PBiZv7JmK+LgaSG3tGYB2E/CfRwEY2mF0dhquXgtaSEMZagOYK
         X1+LNGEn/gPGv2uw1svFS3zd2LGDgtmfZYjwT4hM/kkbqmEXLYFjt8jnzUs8oFcZYoZM
         MPZg==
X-Forwarded-Encrypted: i=1; AL+hErECVhmUr57ab+SN61alLWPwK3+bsbdx46AEfGwG84StL/d3Wwrbu4jYSHaKZE29Y4ET5t6IIhC9IfBOfQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8YcVqeT86LDS4bk+z86FZ+n8LIWc8a55iHUNJm7sJWK0kFqzgu
	W/Ezs+1KfiZu4I9YgAkHIYsiKBq0q0rDxCw10l8IIJ3PK2IWxmiTE0AY
X-Gm-Gg: AZFdTZcmFytVAxiyU2c9eyWI7yxQcHW7APKn1zcgJbg/2SuEta/p6dRqbUP1sE4+OAq
	Zv79qNM87b7kaIu0G8ze6qXUkbFok+lACmLFXir78j0CirhgKn3gRx9ml4naAC1G46ZsPL+Drad
	/q7UGycUJugcb8zTE0mxKGUyl2A1ALEoRzfMiP3NyEyb7YezNppSgLzw2frhKzrWc6kKDfVbMrf
	VqnzUD/avOxb6BxiG6UoENUTcUzIk8USiEuo/qdCRbwL4qgtfa1qP3E+hVsrRjUVgTkLPksmuQd
	JBFgi1Z0KYvkgRpd4gOgl8h9rC33Jl4DzbiGvAhR3xr46uOXoLjSHuY3BDlu7v7KpSCJFlNpewJ
	sCUMKWMzF+xv6J3LK4mkw3Li1wipSpMYkcFxhArdG6h/wnMtSslGX2Xg6n1+141EPWfBDi8PBty
	FIEFWoFKuIW5TQH2iRfpMTrBdE1o1nOgSzuUE5uGIM0e98mh4bRaUDmh++YG0XyuC/4voWC2Xls
	RNJ3ZyMYEA7eUWOWaguzguDWvXQ3v2xXqN0XwOKnJ+n2G+1mo609sZX8UFyUsQuIxXBSJ+1E1t9
	K8q/Z0yA7JHRnw3GN2qs9rVHfg==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr179340275e9.6.1795328286170;
        Sat, 21 Nov 2026 22:18:06 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm147735705e9.2.2026.11.21.22.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:18:05 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	edumazet@google.com,
	brauner@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] kobject: fix use-after-free in tagged uevent broadcast
Date: Sun, 22 Nov 2026 09:17:46 +0300
Message-ID: <20261122061751.178540-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kobject_uevent_net_broadcast() accesses net->uevent_sock->sk without
protection in the tagged (namespace-aware) path. During network namespace
teardown, uevent_net_exit() frees the uevent_sock while a concurrent
kobject_uevent_env() call can still reference it, causing a
use-after-free.

Extend uevent_sock_mutex to cover the tagged broadcast path and the
netlink receive path, serializing them with teardown: in
uevent_net_exit(), set net->uevent_sock to NULL under the mutex before
releasing the socket. In the tagged broadcast path and in
uevent_net_rcv_skb(), check for NULL under the same mutex before
accessing the socket.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 lib/kobject_uevent.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..fd61307c045e 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -411,9 +411,15 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
+		struct uevent_sock *ue_sk;
 
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		mutex_lock(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							     action_string,
+							     devpath);
+		mutex_unlock(&uevent_sock_mutex);
 	}
 #endif
 
@@ -743,6 +749,7 @@ static int uevent_net_broadcast(struct sock *usk, struct sk_buff *skb,
 static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 			      struct netlink_ext_ack *extack)
 {
+	struct uevent_sock *ue_sk;
 	struct net *net;
 	int ret;
 
@@ -760,7 +767,13 @@ static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EPERM;
 	}
 
-	ret = uevent_net_broadcast(net->uevent_sock->sk, skb, extack);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	if (ue_sk)
+		ret = uevent_net_broadcast(ue_sk->sk, skb, extack);
+	else
+		ret = -ENODEV;
+	mutex_unlock(&uevent_sock_mutex);
 
 	return ret;
 }
@@ -804,13 +817,14 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	net->uevent_sock = NULL;
+	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns)
 		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
-	}
+	mutex_unlock(&uevent_sock_mutex);
 
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
-- 
2.56.0

