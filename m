Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A954CEE51
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656150; cv=none; b=dk5uw/fGhun4bBIYw8v3v9+N8TBR8vFY/HSPIM/mWhQc3kt/IgJkdKovCSI1Ph+bpbpbxauanarLkmClF6qGqZieDQ27BJp8gXq9zQNkwLLZIROsM3G6jgD+B4wLZUvDsxw+GvV6ElXmwLIQKr4LPs28k8w77+Y21Ty7Ns35Vr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656150; c=relaxed/simple;
	bh=kw4TipmbKGg8CFX/QSiBbtXEfjEf0OiG5AFkDXCIye0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFQ5ptW/z21OcI6FcYo1wSPjfCCozCKyd/uR64ysIrE9jl/q4/JSd0/hcchqWOoP4k6kzM4bpfsVQ/QNdwPcDwJ6+/MvZr2SOd0kBWt67Eqme3YJ3u0vw5Lf2wr0WsbHcEtpjNT3Xy7jzTEu57HXMMYMDxGQdxAqrwl0Vx9C2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0HfwUz8; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0HfwUz8"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-805440319deso550569a34.2
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656136; x=1790260936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLiAuQyw2H6SVXJcusiyWm3lbA7Z/rT3zG0bbVq+oY8=;
        b=U0HfwUz8iAEheYzkkCA99r4hre/0qhxL8MQvNnN4KtsCRaxaK/b+CLJpwZtfPxv1yR
         Pxh852OvjVP1RygCDHxnqJmEgUcpkPnZ/UQ6ulgnBQ0ROVelnHxUA7lFBeNJpu44OImR
         vIznun0Q5Qbf5FkVwZ/elDgLvZ7dHkXexGUoN+5q2H+6hGimNPCElYEJRS+eiViMt5Ca
         IV2xgB1Dl7OOTRxN/9COIKLHS2ftSehGK5+lOoRqVjwU9UvsXTFMnb8vuRB8oHljXzwg
         ssfam3iNySFHDfJgy2Qt+Bg/cbw/MTxguIFdaVUZzd2Bu2lhrO/VQd7oOOshhHXRdF9+
         wWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656136; x=1790260936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLiAuQyw2H6SVXJcusiyWm3lbA7Z/rT3zG0bbVq+oY8=;
        b=P47it5OoYjpGAosZPGm5R7wn+FHU1JGrqHBejhBpXRqoAaTI8SRVtDfB2eD4Ik3Hip
         tFVCkg9wMccmqgMdkgDcXNKhkqBR/dxxqa249ZHsWUF2wB0sSM/ou3hXLcuGVbOOG/cG
         x63kh4ogA+kI3ZePHkUiYLLfhfuJbKTpM+/CviGK7tZuUaZAhdJ69MBmJfs2Rsyc2mXf
         h8w8m3C7P2zL/q4UNKwBA8IUw9XMQTvhHAIY2i8bLqFbVgp+9Pvxy9NPesf6Qpk08zX2
         1O2VION0vFHr3z9QvdmrxWfmkp5owEL17g8ek51mR7ZgX1qAGRJOp0z+fWVa8i/cTg6T
         HAvg==
X-Forwarded-Encrypted: i=1; AKwUvBzTiJZ0y57Lmx+73XI4IBjsOEUyFCQFpsmRr0z5AoWujaYejMmehIJTAc2lhpz6+92ZVyhD4sQGDcYx/g==@lists.linux.dev
X-Gm-Message-State: AFuF++lHjzrFgTEXVrjKPUrOqX+xyeCYzbKAZO38dK04IIQdwdJV2+/i
	6w9xqzwFKKAcbe8en2tiuixT19p73fypHwA23gZ0P2Q569Z0HqgJ/4lKF04V8/2Q
X-Gm-Gg: AYBFou0B+EnxgyZSpsKForOtbKALjK1mDSf0/9DZx/UEVfXE0ONN1rQVEoQ+6IjvdHa
	sNg9nx54rtIMZsX4+deZ3IwMU08dnnVXci5V0Y4oIJ/gpqmXnS7D/MQvBaV+Roiuhm/4S/VTwMa
	RjJwfvIL4aBCPlN68HL7dgqLpQZDoc6Tgjrj5xji36UqcweNq8SMMdUEe34uw8zYqa+UscIoQEl
	mXLOTWwBo2pdVkCkBs4uNaEyzHL4rBlEezicShQAudFolUGGE+e9I0gy9XtuWcKFe7PYTaDSxnG
	QvtpJftH9mJVa/Kt2nmKhGEksBpzNgaIwsuEJIzwBwSYWu26VeqRr8c/nrzhtzgzp4pX69L21CU
	gOFaa9PtSISSClGn9OtUJ3GTQ6IjtBJA/flSZFfsREKz0Qy5NodE7nEYn48SH6TMxN9foMxt6Al
	8uUH1YPNddZPIj4Vb8eELtRshghOu+x5pM2uWdsU/Zc2vLjImpcMRPKd2U6Z5nLsPNaVxqc6Dk
X-Received: by 2002:a05:6830:6b09:b0:7fa:ac4f:77d with SMTP id 46e09a7af769-80b2f9e3449mr6878507a34.28.1789656135911;
        Thu, 17 Sep 2026 07:42:15 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c4619a868sm3092468a34.8.2026.09.17.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:42:15 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>,
	syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Subject: [PATCH] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 20:12:06 +0530
Message-ID: <20260917144206.85836-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a network namespace is deleted, we free its uevent socket. But
sometimes a device in that namespace is still being removed and tries to
send a uevent through that socket. The socket is already freed, so KASAN
reports a use-after-free.

This patch attempts the fix of taking a lock around both the send path
and the free path, and clear the pointer before freeing so nobody uses
it after free.

Reported-by: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 lib/kobject_uevent.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..ecba33abb6b1 100644
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
+		if (ue_sk && ue_sk->sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							  action_string,
+							  devpath);
+		mutex_unlock(&uevent_sock_mutex);
 	}
 #endif
 
@@ -804,13 +810,17 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	net->uevent_sock = NULL;
+	if (ue_sk && sock_net(ue_sk->sk)->user_ns == &init_user_ns)
 		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
-	}
+	mutex_unlock(&uevent_sock_mutex);
+
+	if (!ue_sk)
+		return;
 
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
-- 
2.55.0

