Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BEA4FDA4F
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664914; cv=none; b=rQQnv6MAL+dZWfxrN9TGA4PK5eq8rMH55UiadaJ208feuDh4dwXsap0l0WKpp+h9bYykJr3W1hMljjXITyac6n94cx8Ktz7+/nKX6uqqD0sKwkmuAxkHVm1P0YlMXkSK+iOEsWuH5TIdNnZtw0KR4wtJEuN8JrP0qH0vU0hkmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664914; c=relaxed/simple;
	bh=KjkJcTuJHjrmVijk9slNWWr20w469I1INEteAa7loK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxZnAyhY/lpujc7XBpDFFkGmn+tvj8Zer7DqYyf48s15ZFNd2tuxbnJ5Bu210MLZl29t1VwIqCaO1bkXWX+rzhbWCpxgT5MKDr8SM/KmNT9A0Bs+kd/Yx2qSeoVo8UljIJY4O/CKppv1xCE7mowfUPa498NkQt3ax4j3a7jRFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJEN40iW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJEN40iW"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso9357195ad.1
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664913; x=1790269713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auzHkbE4quU1N/0aznjpHRbsdXF6x1Ysfc7XFJa0Adc=;
        b=aJEN40iWObrn4NGRol15JdsMxzLsRAqzSngnypsStrfECUHFee0WkAoww46Nj9r8wI
         ezmsemgCVcm7756NdNvOkT5R7Kg2kqcg7OLl45HdHf6QHuxkv3Wmuukm0pO+y1rVzPjw
         +aBSjDMYEMwSnPKwdXC6/5cct73rLDhH35MENN//lfiTcJlGR/8oXEGckLEyCM/qmwM2
         bieoqZfrXjkSrmFpfiLhBNUmchiq/+oVJcURdFh/7v2TuhsGgUYUOVWlYbKOf5oCQdQD
         4wFqAxE+jaxl8LO/Ac5GfPJqFOZcWehW3zEV2P57AxokPbcUYk0OK/pQ+tt6Yem3XqVT
         Hg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664913; x=1790269713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auzHkbE4quU1N/0aznjpHRbsdXF6x1Ysfc7XFJa0Adc=;
        b=QKQcf2mcC7bCHid1NmRHPUuikdjbS5D2POU5U9MAJvzUF+PEEnzovHv3x/fKjAotIt
         b9TE8i5RRlpXMGsmEgWG0Af4KJlLmLmWnrPVSiwhFPWYRov84KEdMVzupCfP8VgNUA+n
         uyBHIwH+CsRDKPNjU7nUwDDoWzPkd+4GEcFnyeU5G+PiVzoc+6Hrtu8m28G4OdNWK4bP
         /CS7Wx8CmN9hc3T1JIoI/S5/NbbtUTZLj+BcJBF73eXlyd/DWN8Z7F9NDzlIpiimlOmF
         bTTw8r83rhJyNI4KVO0FKYd+n908vT3k++Zo2/N5BNxRgeNcjg8l4FPWmEShPcXJeCDb
         kgMw==
X-Forwarded-Encrypted: i=1; AKwUvBw/XWJ4MOvq0Iw+2QnJaGDonw2WyOpOG8hPm4MCIe79CO1chxuzUkJZ0+LxiKme9WIE3ku8W2LZTPxOKg==@lists.linux.dev
X-Gm-Message-State: AFuF++lpouMYxRUuM5xvOS4IRD8im1gATYWc516+XYw7EZ7WTUSvZ6Xr
	3iPHpXfXLB0iUZWzgUCXZ0C09Hde0K79tGFlkpCuNzjJvQi2QVETlvs6
X-Gm-Gg: AYBFou2T+iZnDsE9/4hCjM+7erBfOHPd6k/FSEwTRzj7NLKTTnlt/Swb/FVEIe6w5Jx
	CwK/cGRO0wdT9n51wjmrv38hvzucTHRSVouzb6GgX5vlUmtIjiF/lDf4f95OxLuxmq48cmXr5oW
	4poOFsnod/Xc2SNX5g4vbg7oDHDUJDg5sdK5UBfWH6hcPxTEmLbpmz8Ohk0cKLIiNQW0T/vIWo6
	ftIL6n6h2Q+W5m71sraz4+oOX8rDHP5Ilwl4MXMgVzUuyszLeS1loY1q9ANYMPeH2wqVEd2v11t
	IcOCwXuTwWv/37MnpLPxIMdbUUfQioeMapslY21mxDLFuFhW2/9uuxPERdh/F/EOvvxOiIeacuU
	hmIVtou4smMnwrzEzrrIQJPepX+hqrTpiOl98JN6+iTeh72pvhTP3otIKWKjjUc9QgslDa7Lgd0
	sst2KLMULcZ6r3W4ljsij2oDx9JO6Px88QkcQ0Q+AOBtZHd5eKK90WWScozmdsnmM8Yul5pOh+s
	EeLNoCdvb90
X-Received: by 2002:a17:902:ed45:b0:2dd:ad74:ac2c with SMTP id d9443c01a7336-2ddad74ade4mr14163785ad.30.1789664912433;
        Thu, 17 Sep 2026 10:08:32 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe2esm30438215ad.6.2026.09.17.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:08:31 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>,
	syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Subject: [PATCH v2] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 22:38:26 +0530
Message-ID: <20260917170826.102362-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917144206.85836-1-adarshdas950@gmail.com>
References: <20260917144206.85836-1-adarshdas950@gmail.com>
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
Assisted-by: Cursor AI
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

