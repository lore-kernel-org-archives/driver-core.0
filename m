Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440185;
	b=iTi6JPNZ6rgP5Ko/4DKNdH8dFQVVsfVDTsNR4nwvg78kFA28gz2cHc5FNO8EFWXt3Oaz
	 huKth+JTEfXrerFNuHY+P7bheHh5T9tJGPRQEokNVHGcOit9b2SVyL07l+AQ4oUJbreiR
	 K14sZ9KNnN66gMjR8E8YgIxQBnTafYULyHISMP/bYLO95kLVkPxezKyf3YOEtixti3frA
	 m2RvK3Q8YuHuCi7m4eX3jUtULtRxYXBqMomXcwjo4jPcyFeDjW24cO/XPNSQoiyfWPRp7
	 rNLcDyQc9yaV4FhkYVtjSA78pU9Usn3ACZPr70V8oOgMyrBlHEKeocdibPx/kgS8yUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
	b=OSKvg5BZzEGNcKdodPDzu4O9bVmTZPBZHs+U1BjQuUsw75EGN1jeDPjCtSxGK4PVjyEd
	 8cnbOtqgynMuPBlRWopnk2s3ZilnmNO3RQstRIBGmIWQtolgTp/r1l2wOEnXZ0MsWniSH
	 MHb/1xBaEI8tJ31RXFy39R/P7Zxncuet+Bu3RlyWaDbTXQ44Z0SXK6yPUfzxCcEHITbTd
	 C4aFzTpyIaF+rI8MhYsp1qfAvz/EU1aQRhE+EMAeojKY12CIucrnCNMBwvDPrHDyhF34z
	 hzBI14m8NZ0wZz6pQcqm/D1nysEz9rG399gkfUvmlB2wlAIgEleLByc9VbE/3kKt3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHYHWbZP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535BB606A31E
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 13:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHYHWbZP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so31778755e9.2
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 05:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440184; x=1796044984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
        b=BHYHWbZPA7q98PqiX+RS6nOxSjbZmwD9NXf1IL02Exn9LWX6CUyzmAbw5Da3j91R2s
         sUaLU82SejR3QjPChWQU+5s2vClQSuTszhDAY3hs0JN9HknJU3mfvBXiilf4jy67iV0N
         mnOBI5lMX4oXKujZKD0czT7OfGeVMGCbKDma/Cj7x0wettF7qBHXMxvkE883OkKVr+92
         JCKo2yeZ2xh+hmp/0CBqNVHVK2lhzZOefoo8DQIKv4Zf6JgFMV7byV0fX7gBHHNLytJU
         JEDJHuI3MDTtWxIJmvrSxXtNW/MXdeDpiQKEiIkBkm0/VSSe04Qur6zVweeaWgubA2RL
         +e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440184; x=1796044984;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
        b=zS37s/fCTdb5t8JUFCOanm+4Vj84R95RC++zHc2OppWDXr7PC43d0OOJsN4J7bdtzC
         I7RL46FTkezbIfxOWH0cluwaZkD0SBcELBpVy7G7fucT7mlVrkpNMnnPRvtPGFWh9bGn
         L63818R6BvotdI/APcU00k+Ade8e2JAiC5XEEhwNDv7QMjPVE+4fwWULsx6fhy1MXdFg
         mndRpv7HPGNUzeqLDrLBNR4qjaSkW8vBrdJu07xAJZBE4wJ70xcYlZJSxMTC4PyktPhd
         daj8rgtAXLXiJyDED/Gsm0ntm3aBuqI3qlzRwPN2ltJJMahTLFiLifDSS2DIKXW76kNP
         aTDA==
X-Forwarded-Encrypted: i=1; AL+hErEh1g3t8wykaQl/3YUyAQwbo8i1sh+xpJ4CeYgKfu8qapWJefq3eND1QNm1TwFScIhpfZ9Q4+A4Hl/zTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+BmOGPPpP42nX0FPSy48wV5OEyTiD4y1jAY2/3L81eu32rhx88
	E1a0AQQ8ZzoFSx1wpuj1LL2B4Ht6nsBxfoKifNAIQzHEfY35E3zP6Zoh
X-Gm-Gg: AZFdTZeBlYlSF7dgMpVUdzxI+KmSxOtP6B0jqj3aiKB2wvyW7P6SkpcwMaZ024GOvhb
	dOvGSXvJWm+zhU64CVM5sx2/TpZ8BdlGho7sRcPBzhjEFMKQqHs8oWERbYWFHia4nNfAWqbVqm9
	G5Lf5oM97DdVo69ZzlDvpd02B75FeGn0xPlp3tBld9eb3JA5186UdF5aLJyOC8SWHh8TGF26tja
	lbIeT49APxiJRVu9Tcyc8lNQLYDVahq5EM7R3gL3dC4fkdYUAThTxMKGibN2zDuEv/9RsKOVdMZ
	8EGF5n9AmegtbwZOECNYusiulH7z9VgdOVbLLbSWq0uvvERHA9Z0nCiMU2+9grq9HHs6rfmFyoC
	BCM9K/5dce6wCUQsWrREMgAth2KQMuZC/CDKTSOtwp4cuZWXBh9M49fAR39IN2rpsVNsTHoW5bF
	xdtjqO1bIVh821/kMGW3FNp1y+3hehA/veZmJUm36oYgCfEOIbbbKGQtXofyrw6NvfZU1bsDX43
	qiW2fYtE+Sni88YBvx0p8OqWSZh0ijbTXOBTsijYyCaExPN8giktQcusaV4KY7exd8v192HiuE9
	ycRx54YPx4WEadLgG0FBME5ZAG5FsmYJNAFk/JoEA8/0RMA=
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr267550845e9.8.1795440183501;
        Mon, 23 Nov 2026 05:23:03 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm546674425e9.14.2026.11.23.05.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:23:03 -0800 (PST)
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
Subject: [PATCH v2] kobject: fix use-after-free in tagged uevent broadcast
Date: Mon, 23 Nov 2026 16:16:50 +0300
Message-ID: <20261123132246.220476-1-omermetekaya0@gmail.com>
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

Closes: https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0
Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v2: Add Closes: tag.

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

