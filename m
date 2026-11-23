Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450012;
	b=Bsl0MCLfbKbH9qxcVTgWZ66C+89649LixfyHDpDEwoo9uPphDCnmGr7uH3l774gY0yyN
	 AozAn/N87s92wY3WYGD+ECaLOzZa6GlJoo8emDWVszColTa763Vek5PGlIW5vTfvh3qOB
	 +Xy/prShd4cOVYAHYBEmsDwDlDzknB+aXz8QFvZEAUdPszDe9oFcc91+/RQvXxe7ZyP06
	 B495z+WcAcegiTUlqWK1Pl0horUHuQNCP7ZxZAPdxh9AdGT5RzNu+zbFL3to+OvDz0it9
	 CPlRGcvpPJ+PbWE5TOiOH+Bq1aP2EIrwIDkVBmgw6DVXotsW3onnAy6I7PHfReOEBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
	b=b+JvqafyRwug73tN11POLA/FkM6Q1fPY8+7oSBnGgiL7jJTQgoT7hWwyc3xhwVyNlOhc
	 H+v+96vwCPVgFR8OcomFH7B6PpVj14V3dmbFZqMiwm1LZgkP3tshWt++EOPhFVu0U9ZJB
	 ZF3x4qTFEMPLzLgKIQL+vrQQI9Zj5R40hE4pRI80kyUJ1AlgAnaLPfDKpgXQI6zu8z2LF
	 52xx17J7iR5+UaDZafSff+Qr1c0NXiFyjPjgNR/+lx5fHXaO3A7tKm/CnlfQofK6CQ4TG
	 LvGN3DBhVj2PCQZlmaDR/VlGq2b4KS2wPfKaXM0tVY6eLGTSSC554PX7QlYOx4wUUmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jxOFE+V;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E657606A31F
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 16:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E657606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jxOFE+V
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2668894f8f.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450010; x=1796054810; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
        b=0jxOFE+VvdEwOytx/bVEm7xS5aGJlYro2kjE3YtL1iz9AP5PTGzWRUkMehmvOEJi7b
         AQvXI4mGR/aJ29GGnnWmlO9Qg/1Y9jmZSiJAGqlY0YxA9QgHLtzVlpNC4KlFL1NJi/ff
         BIayySo3Po4InEJYWyZfHhmRBC4iyqPd5UkldBUrmn95BRNNDjYyY5zuAfwMerF6tvUv
         AqNjpvQ5/Zo00iWiXgGcJKyzVZZ2v40omypHFIlsHubrXS0qVM3ugmtq8x+nuGW0slFW
         goltPVjZSbPpC5H6DHrwxs0SBkV/r3+eRtLCNiNtJjHrIO0NPTeu+7sxZucouBC6lc/x
         9bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450010; x=1796054810;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
        b=BT+iH9cGaq3BpmngABo7TLJwDGSONmItaRcA2xjBXAXA9rBMEr5ZyWuB9s3gSHq23m
         esnBVTTBzzEdBYOgnal3iB2agnUlxvzrSuZ1W/g3sOwPSIC/MmlsRQdjlZK+u853DwLa
         jgYRE+25cRbXL0D8WFPVBb+NfBxhx4++Tvv7nnwYbdDWcV1BYhsp7GuGmSp58FwIVoEL
         PpUv9NlzTTmgfiJtDb0FfTJajy2eZDrsQbVJq1O6vuqDhbJzrx3VECzwyl74+uuepffH
         S/+k2AZ0vTfsTEAUeuN5rJVD5C3inpE1tE/2kDwmTmiK0DNpcBoDZ5Bu/ZF1RFyj1FLQ
         bEXQ==
X-Forwarded-Encrypted: i=1; AL+hErHIKrr5EpXqd5Rz481y48vXGgMsZHfFz8ArGrU8eZzmuO0HQao3DNLFleNmbuEVG8bxTVchxq/XsGLwcg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/K51FSB7GLIA7iuhpylysUARFEAGuwLWNdJkAU2EFcRc1zyhUW
	kG0eNloqGDDhvm5M/2bd9h6hJQwSeCirkZHKjODRTB10pBwVsVZMUqGW
X-Gm-Gg: AZFdTZdmj3bIKAhF5QyWp9KsDvjWhYw/GiT5mlzVp19NtZ+mmyvGwbM4AZsZaZjyzt1
	Owk7vlfiRzx3WqVQ04Rp9HchlHvqtRzhsZzt1l9mnj+feXaYxiJzF/9kMcGifs4TkV5HQ2SR81y
	XMZkT8Q9DmHLK7VKUyv4DIJPn/4wnBfwR29nD7qo7SO2ukvWrWcti6b1uUWDDOZNNC9CWRIeC20
	2aCKG0onleq36VR8E2XxvuFfTvHIIVNQbPuuToAnPRz/IwLxi0RBl5jz2QW806djwkZHmtpZpCr
	fUPB+nH/rDSe9TC+53RMEKcppa3TguXiyKnroyA0tU7FeiW8b/zoXefNZ+zrMYgMMHFyZs3h6sv
	OMvP1nq0LSQ7REU4Men/I464oRzdMKDvAoFP9UsjG8YwXD7lp3wAQTcAL3e+qJKOG9feZJjktIJ
	lrPEE0ZTbHBopBKDT/magg6kAyewCYPUMagAb3C6idMhyFBhDPMg9C+yi5+A6qhpMqyJ24KS3ub
	nx8QL4GT60HFn8TCGT+HVPo4Lwfh2CHTyY1SkyVjWNjfS8Wxilc4rF6N4ruoxmq4PUnHPuN7PX9
	z8gvEj2L0arl7HU5WYI9roCaSw==
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr23817893f8f.22.1795450009406;
        Mon, 23 Nov 2026 08:06:49 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm24580960f8f.1.2026.11.23.08.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:06:48 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	edumazet@google.com,
	brauner@kernel.org,
	stable@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH v3] kobject: fix use-after-free in tagged uevent broadcast
Date: Mon, 23 Nov 2026 19:03:16 +0300
Message-ID: <20261123160615.1074229-1-omermetekaya0@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Switch from explicit mutex_lock/unlock to guard(mutex) and
    scoped_guard(mutex, ...)

 lib/kobject_uevent.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..768540433c7f 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/spinlock.h>
+#include <linux/cleanup.h>
 #include <linux/string.h>
 #include <linux/kobject.h>
 #include <linux/export.h>
@@ -411,9 +412,14 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
-
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		struct uevent_sock *ue_sk;
+
+		guard(mutex)(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							     action_string,
+							     devpath);
 	}
 #endif
 
@@ -743,6 +749,7 @@ static int uevent_net_broadcast(struct sock *usk, struct sk_buff *skb,
 static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 			      struct netlink_ext_ack *extack)
 {
+	struct uevent_sock *ue_sk;
 	struct net *net;
 	int ret;
 
@@ -760,7 +767,12 @@ static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EPERM;
 	}
 
-	ret = uevent_net_broadcast(net->uevent_sock->sk, skb, extack);
+	guard(mutex)(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	if (ue_sk)
+		ret = uevent_net_broadcast(ue_sk->sk, skb, extack);
+	else
+		ret = -ENODEV;
 
 	return ret;
 }
@@ -794,9 +806,8 @@ static int uevent_net_init(struct net *net)
 
 	/* Restrict uevents to initial user namespace. */
 	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+		guard(mutex)(&uevent_sock_mutex);
 		list_add_tail(&ue_sk->list, &uevent_sock_list);
-		mutex_unlock(&uevent_sock_mutex);
 	}
 
 	return 0;
@@ -804,12 +815,13 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
-		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
+	scoped_guard(mutex, &uevent_sock_mutex) {
+		ue_sk = net->uevent_sock;
+		net->uevent_sock = NULL;
+		if (sock_net(ue_sk->sk)->user_ns == &init_user_ns)
+			list_del(&ue_sk->list);
 	}
 
 	netlink_kernel_release(ue_sk->sk);
-- 
2.56.0

