Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B239F165
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431777; cv=none; b=X6d5OltgGAzFJVNczfa86GpWkZCmdBTwfeWNtZ1QIKU1ePZeXw/Ch6mOg7uM7jw0XEH69RTs9nbR0lb0cz3JZFLozdFM7Lc/cgm7eQPdQifPVueOOb2DRNs4o2rvl0kbQZbHOH4UUIRhqaWW71ZvxmI3wjzazrZBLlbB1yPX0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431777; c=relaxed/simple;
	bh=7dEQXdIsFiQaQViJWe/ksKmwTQFYfQ/wRhMfnWYWOXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIo8wet0L6z6elmitH8Xuf40DRSK3QphrJyqNdddxzXDQ9sW3zH7jkwz3yxFXAQswbTLK02xp8+9ZfaZjMW+veujScH8RJPfg/Incl7QbECewnvGsJBBOOq2gfN8pDd/eGJ+QkoY0oyxMjAd9N2BIMDLlbx4Bj+iR3V3GE9ye7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMv6MvaW; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMv6MvaW"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b314b72db8so431593137.1
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431769; x=1791036569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X8eNJVAyhVOanlShxEr6z4UEdYhV6pC0beFMBsEd6c=;
        b=YMv6MvaW2g3X3mU3cUxBveiJffL7zYnQbYbJMvRUX06q1Dz3rohl8VyHBgNIBRBraZ
         rtZUTHv4DV5My+ZlOqs/HdIi1vZZvMxauswtUof4pL6IvDxxOFM4KZ2RwbW71GTUSBAa
         rsLOEzyzYZ3yss0bWxrM3xXSAELUGnlcBDgPX4s3pae0xzkyTO16Yk+aEuRteZvu6I9W
         1fNvPbOEQTaM6zwV2ADRd+m4AxxHDOEPhpkG9pYyVU/0jAdiKtRWdOUMh5CtPdTLjJpk
         7Xz3kFlesVLD6Q95udLIjIXHWMleZjzRQYL309+hLuyejC53r93dmgsGMps6B2bZZxhn
         +hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431769; x=1791036569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1X8eNJVAyhVOanlShxEr6z4UEdYhV6pC0beFMBsEd6c=;
        b=qrXZbL3Lmzqeb9TW/x7FefVtkHqJCNUlgmb6vAE0aD4UDi9bvxYB1daKot2Q1A15DD
         SZ12UZIzbGirvQVtmkexsszQtRcB3dwqRvkkgTqZzw1qrfjmGUxtIGy6GXssPbqW9iOT
         ey+Rsm83KzAlBvMyoIjTE6HZuXheo37tD+C/amqgfW11XeMG2j+dTaybjhwiZ+7+c3Xj
         J6z6mH8rr4WVF5tGrWf5LM9yflll8AIuw/kQXp8b/EP6lgHATwooxyir7J4pTjQxmnGd
         xj7tiUYZ84r8d8LI0NJpd3QVGRZfWSS2E4BXeFDQ7/QeZBq7kVJNF+jOOfKeTqLuypEl
         F5Gw==
X-Gm-Message-State: AFuF++lH1tc1niKE4/oGh3RgdHPItnz79cpe7wr1wWVjbdIz5Y11kWIY
	E4DjqdVKGb/nHLEwmkPrGiVZMyuYKGq5WzrQZ4DSQD7shE0KD6n7wnNR
X-Gm-Gg: AYBFou1P/wisV1qqA5+mcx/8Vm4wUn2gU/faI3mG8rMmV4R1qHtKWE5TOYyeVfWWc/m
	onAgvbNL2gWGy7OmfKNobuEat+MOFN+M1izAPHzSIh13Riq4eofyP5sX4r8JhL3d4amG6atNDeZ
	dAvpAuXkEQ18f+TarpxD1d/pSDESMaY6yYr+UXgyjG9lxtRSzuXgCnwB80Pc8pumUDPdlhVpXrT
	dYm8H27lNL0OOXsQQX4R1eEJSnnym9V7s3sePpu/7qOYGg7+QAJTxU2lTPsYAd5XyIINP7sLF4O
	TfLmrEbiSMgDAwMMcECWgiQa2xtt+wW50oXMK0SgCvJKy/rJEodd+gRRCcMvCOstABmpeb6ETmv
	kJrcsL8GYmtWdQo82UW1o9i0feJTgr6T5hbLZIFWAuM/pvwy+Hdd2UVFdHkZBBHkTbv7bnuTIbp
	Z3eEucEfo9msJzycuHpYUIu3ZVIZTFmK7QU5hybqSniTJSZfJC1XYxJo86FvMX3h4=
X-Received: by 2002:a05:6102:32d2:b0:7a5:4d80:a913 with SMTP id ada2fe7eead31-7af1c58fa50mr3194324137.7.1790431769438;
        Sat, 26 Sep 2026 07:09:29 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee8b75sm2432674137.2.2026.09.26.07.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:09:29 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 11:09:18 -0300
Message-ID: <20260926140918.1077347-1-qwe.aldo@gmail.com>
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
the following patch).

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a..ac4199e9f 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,34 +1018,27 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
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
+	copy = kmemdup(str, len, GFP_ATOMIC);
+	rcu_read_unlock();
 
-	copy_len = strscpy(copy, str, len);
 	debugfs_file_put(dentry);
-	if (copy_len < 0) {
-		kfree(copy);
-		return copy_len;
-	}
-
-	copy[copy_len] = '\n';
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

