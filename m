Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08C374735
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711748; cv=none; b=uBeZDwRuf4jNEGLQW9pE7eAtsLc91H7Rd/XH1rJ//+3/Ff1t185ndFNlqMvONolJ1/M1juKDBtga1eoRnKw1cj+qK89UoU7dlSLlyI+oMBaUus2Db+h61oXonHxPp7p99TaCq729thf9o3fSyIRBTt8GVp5xtJiaNfj6YRTxKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711748; c=relaxed/simple;
	bh=9MMcQqbCyatW417RSOpUlF7r32cLepJryAxtTXy4U5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdpZ2eM5jAwJ8bK6+h1mNOdAKdZlFdZmvdUCqtBh6N2P3TOiGRc+TGxmn4UT73d28Lg5cMcPWBY/8xSa9Zzgsx69fYvJLkg/ZijEtSb1+lJH9Yrg/B8j4wVUvH51rP4uxXBOTMDznjwCOMcInmsCCPI8BEj6Butnfo2Rs/2E+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV01132x; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV01132x"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so310581a91.1
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711746; x=1790316546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORxTFOuB2ucPeCFRcbiCodxruveHPk2zly7F4fcoL7c=;
        b=nV01132xKwL6JcRckIO7axgnDzReMhMvUyqj+kPRtyYFdS6qePOnQVVdwPKyiu4Gdh
         56ddUOVed+oOOVSwipuOqyAqyn3t08HzhT5lM9cIURyNuQ9gUw6RjGEWU8fohT7//bMc
         6K9NuK8vN4IVk4WucS5G0usjxulcuuMxE9nhEHWPPEM8WQKR8dpvkbZ3xEm2yK1x5M29
         5zKCSjHtJwGPyRT0mw3CD97F/9r8rOhMBXqPrr3VJyQT+7VOWBkYxrp0XbfMyMmH2JjZ
         MQkbW7aCGy0Xhy6a/37A5nDWqRlX4ogAaNW7L1UrVTjkQhPkimU64jkPS/IeZlMdXvMD
         Yycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711746; x=1790316546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORxTFOuB2ucPeCFRcbiCodxruveHPk2zly7F4fcoL7c=;
        b=wZdZyZeIwwa2Ab3zu+bB/qyCovGFEkpv/aM9ePag/RxXVMm8dnYccQePOM+Rcqohrx
         gPYOfk+urYHYXMbSoCDgN7RLD+vFDw/ugTQ2VXAyZAY8yA3W8ot4dwVWiFfk4jlHCdm/
         Q5jNQ4WsaJKr+vDe11iX7WbZm3rKvPltpYXCaXgI/3A2nT6r5GKCrgpYDIQlIhqCzj5B
         dP/HEEg3ghaH1/+j5/73t3uX+vrhk5FYdqd70FbsmB+kFeMOlRcpVZ/neqCEkN2MBgJU
         2iPTjtWozPC4aqZn345Oj4vDZ31lumxAOSAZzfcpGaaAubbiCHaqvrZS6kAHuY47j+bm
         7USg==
X-Forwarded-Encrypted: i=1; AKwUvBxtLCy9rGDJ3U/LqGQLeb1ctmcTI3IBllzTbneQGtv0dBKnkyY1082Cwq6H4j49S1sRrhD+kHkkL6a+UQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lXhs2DepYMWgwDlnAOkazsawFed/83VStyaS2vN8NLjxXTwFUT
	3C4R1n/NBG56xI+OaH3y+q3o6iWE/0OzStXfN5NsGUEFh2EEwFHT+0/I
X-Gm-Gg: AYBFou1HpOKT02fPjpHczKFum7bGGWUUoMT+GQVP5Uyn8QVOMbAqRxPf/17qKSdObNY
	ELRj/asexLV48D0WkUddGyKhNprNmEqsospdp4xN/ZTo76BeKCn4o6MbKMlC1BaJMneKFMtWY57
	25v5gQVi0zEIcbP2anad/OhImgZBQq9VnDFgi7j0jk1TeqWMqBuGPHbTCy7qJexAqLQ1D670FPS
	rf7s7QpXZtETWCUo1f7z1yh5rGKgb0XhAy5ezmSm05kCOZ6efgnOhgn2LEDYUGVS72P8aeOxc+J
	R0bxxI1g/RTzCf8Qql3ovSk6HEGZ9l1JEMUEOWzdV6jNPvsxoXGMI0t1fgMfO53CGpxTdwvtamq
	17VXuvrPhmlmUf9Ma+wugmR/1M0wki3WGZF9HH1cC1eVXektc/OMvNk3YMZpRLQM2ZDxU21Ten7
	uQytNJu8dJvNLz6P/9OwkKau4s0AaFHmMJu2dlVEg2RkBTPc9hD6xBm6Jz/WAiYQeUeOa1m7gC
X-Received: by 2002:a17:90b:4d8b:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e54e7899dmr3123205a91.20.1789711746550;
        Thu, 17 Sep 2026 23:09:06 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm7695043a91.14.2026.09.17.23.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:09:06 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH v3] kobject: fix uevent socket use-after-free on net namespace delete
Date: Fri, 18 Sep 2026 11:38:26 +0530
Message-ID: <20260918060826.8434-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026091732-armored-lilac-fec9@gregkh>
References: <2026091732-armored-lilac-fec9@gregkh>
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
Tested-by: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Tested-by: Adarsh Das <adarshdas950@gmail.com>
Assisted-by: LLM
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 lib/kobject_uevent.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..cb674c2c3432 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -13,6 +13,7 @@
  *	Greg Kroah-Hartman	<greg@kroah.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/kobject.h>
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
+		if (ue_sk && ue_sk->sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							  action_string,
+							  devpath);
 	}
 #endif
 
@@ -804,14 +810,19 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
-		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
+	{
+		guard(mutex)(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		net->uevent_sock = NULL;
+		if (ue_sk && sock_net(ue_sk->sk)->user_ns == &init_user_ns)
+			list_del(&ue_sk->list);
 	}
 
+	if (!ue_sk)
+		return;
+
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
 }
-- 
2.55.0

