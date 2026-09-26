Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BDB305674
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430495; cv=none; b=MXSocNhdls0jY1kW2z59FqcBjv4osMbSOY610uSHnq0yZrowqTSjh921NwQh8K3YTdECCv0KfJSbLdd/cNcowsWM4aGKiVqGI/hemE9AP3E7m1HrQRBWO9bE9WX3YEnIgesWd+0g4VbR3Yv3NknR/IqGHUMZoNyZggjz5tTbBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430495; c=relaxed/simple;
	bh=1xYbUdXV7FvMye4KYEHySxDka/b394+z600N3+jHXQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWjk636l5qDqldE1DTQ7GZUYa8umXZ2+eQ4BLGDHXRAsW7RmRa1mQr6CVkeXN2yClUnYYYw4DcCk9i09wvbx1mfXmmI8PzV/+s7W5JOBkUYQmgZxS9warXXpSVa9fqeforsfqbsF7i2RuG7wkmJbLNfjgCJw3WKwxzOgjBZZN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnm7aS4x; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnm7aS4x"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1473287c88.2
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430493; x=1791035293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CjzGFPtBoeNrX1CeVRPuIgYs0oHZqoIr7E47CqmV3c=;
        b=qnm7aS4xUDBLT7VTnZClzxYTYqjO/rHmra8PJnmGi52/xN/y2eqkP2m2xwGrHU6S5m
         W2x3Sm6LtGE5nKXLgQ4dv5nExvDfVY2i8IrvX+/p2ttY4mMz7C4u8m3bokkjHyXZJkhr
         RfQC5zt6OZiPHXj87BLrs4MZJtP2WqetScbFu9R4FLHf4Y/NjN8C4k1Zr1lTMPNGkzqE
         1fd99koYeO8KAJ7jtVFUy/S1TKIDyCsO8ChZ3vj4ndHEYbcMyl3hnJgbXmTEASKpJDvt
         S+ruJEuu68S6HLoGdyVIedsC+Apozpq/qguEPAbWt8GbCcdupuGBrrKJhdy03JQ5kWxa
         RFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430493; x=1791035293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CjzGFPtBoeNrX1CeVRPuIgYs0oHZqoIr7E47CqmV3c=;
        b=qLNSIWyha6wNNUgb300/oZBce8P2RylRmmNVQYyqGhtHLRTAl2EkrTgfycbcd8QqBw
         q9n33C95JA4QdzHmFY/AMVXVFZu8n7UOP8Jv5QH6qiW22iss/5l1fuNE8xjheT1wa9L7
         WZrzxhp5QF4anubKYiD7VZS0/18BMpAXHl3hOaqRieiKImaiGhAi+oVMfdkbCYwSr6Fr
         QtGGBxilrPE8sF+vdnS5QEy9c3ewJjovesEsRtwpZdlJ/ugFns3N/bwa+8hxZgF4/840
         gESfk2EXzoTkS/bCOqskU6w12Gv6homDKBwPXWSOVag0y2LiRiSAvxrluv4jeZ4H0tlh
         j9+g==
X-Gm-Message-State: AFuF++lx0lxANzxltc0+GIEun83DhXqI8CjThvU35fnhd8biuHVIpKjg
	UUjK2wLFVUTh8dMBG41zNnOPQm6ZE6lXSBeRtMo9EJVSTqwzoB6uSU3di5awVqQt
X-Gm-Gg: AYBFou3KKbmZWDywYHYUv/a3s8jSMzQ+OPBbCNlhYaKTdd8riUwtf6wE0OM1YD0IIQ1
	R+rCnYcarAXOlgVLiJ4tyPxHfOFhaZPbrYpyTeFcH4m8QTdI5zy24hHujhiqlflKu75G2jzneC0
	Vxe3xE31KjFyvFlhiCyHACFeldBqUbL0pEAUd0AA7CIHF7srVc8N/aNOHMpfbbZfKg9FM+WuOiU
	YW3zGw0KxEj9D2KykbPb/pmVS2IJVaFYpTJUx2FiL40+bAHi/adJmtmC5itx/fhpKBiS2M36brP
	pvSkPnPPumtE8soysJFknLbqKJFJNc7MCQgkwlo9QfGl69KVRPyEU77tTJbT+2NMl75kKu1P3qk
	EgXiNSHrZQUOwtyRS3t0DOwDsGvcYuNYubuynEOAfizVXBkfdD28WcE4fPr5Q95wYKRJNI5w2Ll
	QMQc8x+C/4aW4JW2xVTaISvpkQFSaYiRvXX0+l96oX/BYZDuNleyBXfGYznFCRm8E=
X-Received: by 2002:a05:701b:220a:b0:13d:a49:8016 with SMTP id a92af1059eb24-146cfcd815fmr4165897c88.22.1790430492565;
        Sat, 26 Sep 2026 06:48:12 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm12124325c88.8.2026.09.26.06.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:48:12 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 10:47:38 -0300
Message-ID: <20260926134738.1063158-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_write_file_str() publishes a new string pointer via
rcu_assign_pointer(), waits for a grace period with synchronize_rcu(),
then frees the old string.

debugfs_read_file_str() dereferences file->private_data without holding
an RCU read-side critical section: it loads the pointer, calls strlen()
on it, and then copies the string.  If a concurrent writer completes
synchronize_rcu() and kfree()s the old string between the load and the
use, the reader accesses freed memory.

Fix by wrapping the pointer dereference and copy inside
rcu_read_lock()/rcu_read_unlock(), using rcu_dereference() to annotate
the load.  Switch to kmemdup() with GFP_ATOMIC so the allocation stays
within the RCU critical section.

Tested on QEMU/KVM (7.3.0-rc4 + KASAN).  While KASAN did not
independently confirm this particular race window (it is a very narrow
reader-side window), the companion double-free in the write path
confirms that the RCU synchronization in this file is incomplete (see
patch 2/2).

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 1b3ace467777..a4b7a5cb5e01 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1019,30 +1019,24 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 {
 	struct dentry *dentry = F_DENTRY(file);
-	char *str, *copy = NULL;
-	int copy_len, len;
+	char *str, *copy;
+	int len;
 	ssize_t ret;

 	ret = debugfs_file_get(dentry);
 	if (unlikely(ret))
 		return ret;

-	str = *(char **)file->private_data;
+	rcu_read_lock();
+	str = rcu_dereference(*(char __rcu **)file->private_data);
 	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
-	if (!copy) {
-		debugfs_file_put(dentry);
-		return -ENOMEM;
-	}
-
-	copy_len = strscpy(copy, str, len);
-	debugfs_file_put(dentry);
-	if (copy_len < 0) {
-		kfree(copy);
-		return copy_len;
-	}
+	copy = kmemdup(str, len, GFP_ATOMIC);
+	rcu_read_unlock();

-	copy[copy_len] = '\n';
+	debugfs_file_put(dentry);
+	if (!copy)
+		return -ENOMEM;

+	copy[len - 1] = '\n';
 	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
 	kfree(copy);
-
 	return ret;
 }
--
2.43.0
