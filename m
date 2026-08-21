Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6691395AE9
	for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328788; cv=none; b=tJ54p6uUqIk4+btXE+1Hoqce5Hxol86mTzg1yL8vu9YVvVAc4gmP2FyS++XSNoiWiIiw4TzD7pP7uTcf/obfd6eXOkDV/aVleYYCaXfHdFU2yfi5PPSqw3DIg3lWOL2uvtA1BmZX0hx4w7n09eWXa6WPjaLaBEM/uGtbCvj1x0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328788; c=relaxed/simple;
	bh=bxejHnhZgOHZCx4l87xaSOkvIQXcM6SB6i/eoU6gds4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mb0cDvt7CSboi9TpLWL3mHzhxZsrCPtbll8tvmAqOGUa+cuW13w6ubL6paqd+f1D959bCTbc1P9pFr9QZ6qVvcH2elASNtN7+gfL8rIt8AypR9I0qXJWkIcneT666SmZeK6oeUvIvV+WO9iTmN2oUwR/f/3VF2rS1y2X1jZsIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=N9UgHtvn; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="N9UgHtvn"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-84c4d4f68c7so1786187b3.2
        for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1787328784; x=1787933584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnEZF2cF3IzXZwcXsx024q0uyKxWL8hRCsuHpl/rWC4=;
        b=N9UgHtvnguOHFaYfBQEAq+OgUoHFK6UHWBhZjaU4ITSxjVgKZqFMGDQHpS4u76vLke
         DyaXhcssdz2fNSLDr02153sNhjk1pxmzRsmxKoE7fiuGgptUfn1DhhpbN8p2DBF2wwVL
         B3jzzRuE6veKNVENfKWn0XTzqzvw/KZQyHtaRQnGP6v5cNad10j7haReDjymFuqaenya
         Ak1od1EDgo2qMyVvC/JX5B9CbqeJ3KoAqyvfoLOWHfxvVHM2dLlPFwwpAwfpxfXqvX6T
         IHCZe7BgwV9uC46YHgW1KOlqrjOt8amuo2tTx8+ogB34Zvr91fG2KXBOCWhqrbwnvQbG
         WeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328784; x=1787933584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnEZF2cF3IzXZwcXsx024q0uyKxWL8hRCsuHpl/rWC4=;
        b=RMw4RpCeRdQWrcyx7NYn9q+jYuOyv8Ea8F3gmMA96AtkxO65CVGi7FAEGAPf2NYyz4
         qUYQxVrPH1x3KDIARWxEX2hMgMYzmuLVKuAYaRuVmlaQd00eb7Afqjff/wochSXLzvF8
         fInBfw+uYnhVejnkNvoOhb/cJmfsUzOpi+dlnquAOWEa9wDDifG40c0hAVQXeU8Vhtgr
         lVgejOQWM9y6Kq7kI3ubRTDczr32OuVD4j4ZyTPDbojctMHBgHQDK6bBl/IIQbWPGKsv
         A1XRN73dl0YO9LYteAaQPPqX/Kg/rIO+PO8vKP2NhCuFP59QWPyAZX9yRiXKtxpLGTZD
         gu/A==
X-Gm-Message-State: AFuF++nRzlq8NL6yzgxl7gjmZXzUagoCjKlQEt7AzKWhIZo3gMKMtyMv
	f7SZheI/yGm1BYOHbShtibSkBDnuKUr3gDw0EHM/XC/bpbPyqS86/yynNMW3auXUDw==
X-Gm-Gg: AR+sD132zm/B2vtUad/j/G8oixaQacDtI694zRTyvMFkxv0dJqyQs5UJTC+0GDDcxkj
	vnCJN3J+SBWPeIKZkSiPZsA+hqTI3uQj4FNm4PQsIhIwPk9Nahp2a87bsNnibGhXPabHSfFtN4m
	WJ5/MivEaDl+EZUCKSNX0g7ipG8s20ZO3itndDrWdHD1/MhxdGNkfdE/qHGqoIXeAF77aPm2DAg
	sYFMWtwYA3XMbmhrUbobPkw3jcxJudjprYtLHiQFcC2CSYN7xlnhn8N0Gnf6QDN+p3gIIE78y/X
	dzxKp7INhTetKz4dm9SaFugMcVAym+ywAQsSQn1yeJvdzUdCsh8ntrt56s2S8lWu+xVLKxSzd1d
	aH7eYgCeR8GU4MiSx02qfc7CdwZS6bkflhIKm9SyEo1h2MZrDk6bqJI0IvNigVvRm8N/q8TGedu
	tOnq/APTYaqMWam/DYVl9MToHTyfS2ARlg0ZWZ2jn1tVn0xwB5F7Tc0Urd7fIpcBYMbTE2yRvFO
	dIgwqpFZ4rDCdzi
X-Received: by 2002:a05:690c:9a86:b0:81f:3dab:372f with SMTP id 00721157ae682-849f1d8b2aemr37464177b3.12.1787328784469;
        Fri, 21 Aug 2026 09:13:04 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84511abc12fsm43056607b3.1.2026.08.21.09.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:13:04 -0700 (PDT)
From: hengyul@cs.unc.edu
To: chenyichong@uniontech.com,
	tj@kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kernfs: preserve security xattrs without allocating iattrs
Date: Fri, 21 Aug 2026 12:12:21 -0400
Message-ID: <20260821161221.1270292-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Commit d5e81a5650b5 ("kernfs: avoid iattr allocation in listxattr")
made kernfs_iop_listxattr() return an empty list when the kernfs node
has no allocated kernfs_iattrs.

However, this also skips security xattr names provided by
simple_xattr_list(). As of now, applications can retrieve the SELinux
label of a sysfs file with getxattr(), but cannot do it through
listxattr().

A similar issue happened before in commit b09e0fa4b4ea ("tmpfs: implement generic xattr support").
It was fixed by commit 8b0ba61df5a1c ("fs/xattr.c: fix simple_xattr_list to always include security.* xattrs").
Perhaps this recent commit needs a fix as well.

The issue can be reproduced with a simple python program:

    python3 - <<'PY'
    import os

    path = "/sys/kernel/warn_count"

    print("getxattr:", os.getxattr(path, "security.selinux"))
    print("listxattr:", os.listxattr(path))
    PY

Before commit d5e81a5650b5 ("kernfs: avoid iattr allocation in listxattr"),
the result is:

    getxattr: b'system_u:object_r:sysfs_t:s0\x00'
    listxattr: ['security.selinux']

After that commit, the result is:

    getxattr: b'system_u:object_r:sysfs_t:s0\x00'
    listxattr: []

This patch will keep listxattr() consistent with getxattr() when security
xattrs are available.

Fixes: d5e81a5650b5 ("kernfs: avoid iattr allocation in listxattr")

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/kernfs/inode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 237dcdd73fc2..bc3c6b939b0e 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -142,10 +142,9 @@ ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size)
 	struct kernfs_iattrs *attrs;
 
 	attrs = kernfs_iattrs_noalloc(kn);
-	if (!attrs)
-		return 0;
 
-	return simple_xattr_list(d_inode(dentry), &attrs->xattrs, buf, size);
+	return simple_xattr_list(d_inode(dentry),
+				 attrs ? &attrs->xattrs : NULL, buf, size);
 }
 
 static inline void set_default_inode_attr(struct inode *inode, umode_t mode)
-- 
2.55.0

