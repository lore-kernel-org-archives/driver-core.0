Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C772773E4
	for <driver-core@lists.linux.dev>; Sat, 22 Aug 2026 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787375853; cv=none; b=Pe3aNdaaXui0JWmpmCVbBl4sH8BC7TJHNKQ0tOeAsgvOW5nb1xEK737QgfsvapfkuSINaL3/a4eUFOvpzeQsfvV7SfujtRZ84trDL/WQVu8jffOEFVsDfkScSCrJBsbZ/3yesCrtCVr4PRz74KcwiIXKhG98eu2cdoWAnR0kYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787375853; c=relaxed/simple;
	bh=JI/MWOMfUtza6fLR6APHNqEFtX5Ifei+2Obda2PjPdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTvqTm7uAzhDoaBc+O9YFWc0Pn5LKqh1ksy0kCTdmYz2UCLDuDyOT9qzIB65dG5ORAT5r8PPfsKFLwnWAk5QkekuDC3wNA04FT9RRCdpY1l69c5OU1mNgAJdu3YklDTD1RFcCRbu25sGWxbGA4bcGXBiv/IC3HSHLx2R0VmRipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=NECaqpV6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="NECaqpV6"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836cde02992so21236237b3.2
        for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1787375850; x=1787980650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObzK49S08DHWC6VkAKkzJZzxLTHEkWBeL1S/7Ye9ivQ=;
        b=NECaqpV6+ysqBaPW0Sq1NlvSrxTfwz9YFnYts04TSvjZ4hbcCkw9hlPMEfUiu6PqLP
         HaGpqBSnH/ANAlkxuT6XiNV68s+6b8bj4RP8Ic5jaNsfyRGW4yEm+MI6eJV5Y5yfNwCf
         GUFfhS9EcX8TKYcw/Oe4RNfXJ7+hq/mn2t43InBSBWj3tOnpNwQnO95K6o9SOXtwnmFa
         yILAJM+UHcxdXvvvz4oxsuhfCzp9LSuvtJQgjYbognaztVwYm71yTjIUfu7sM+2DHp2N
         I9ya0IBBZugKi2fU5WLu/fiMeeBzZp5NUaQP+MUdyJBN/u3cJYo7DTZd3AIuV9etg48Z
         gk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787375850; x=1787980650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObzK49S08DHWC6VkAKkzJZzxLTHEkWBeL1S/7Ye9ivQ=;
        b=TaWJwUrc/6y5vgPDbiUcImYDPOguZyXRojPHW203+TkVyJ+9iKW5goUixYennkIV+Q
         lVE3vpJBR8cxyOSBHKIqZDjAepmbWZmvWQ8BDnCWeYDmP8Yt8sOM0TTG+IrCne81nFeC
         X6nQsCZEHJ1ItSn5ioNr3W2DEnqpJ3oqB1Sb3+biTUFxV5mdRsetwDgCnmNdD9NwEwQ4
         d/2s6HqWIA3NRWYI1JFgbZPUml9l7ARsVVwZLnT97izv/eQyfVkSsP0TrjY3JuVOf9Cu
         nYVM1nkKZM7Wfj7iASAz4D7SYWYEbgdTRwDCQ48EpL4feXcNpzoRQoXJA58CYavRFuus
         l0ng==
X-Gm-Message-State: AFuF++kzH2dI7udeOhYAkJHKayfmnN0fEAVgaSd4T7JK1Qy3+uTc/vP+
	l7xzIPVTItarddsT0wpr3A133fAiuZ6uAIsX8K9E6ZyDn+qBznnpp4CYd0gg1sndAA==
X-Gm-Gg: AR+sD13OaIlA3q19KI4oWJJN7s7O2/iQNGWJsLPcE0QAc0dmoLZ/0RBDwgY5cQxSLL3
	PI2PspUBbCS2ZurEkhaKQA77eBLRCSvqhRiwLCMLhuYTh8clUVxf+3Qy95tbxMacYAn3Llf3Wnh
	3x5qBMsAhljt8qRzZ+QtggzHpsb6FZ8aG0LWWdGkEZ3BquLt8XsiEgIx8KOzuKs1sS/zGqt17JT
	L34b3C8tGLZJ+kgCA+PI+26en8EnmgN/yD2WDL2d9K1ue2nr77Eml0mRn6qKgfoVE4UzEn3wXgp
	7Kvw7jU222U1LQCK1JdAfcSo95aUVGyrvLvlaJkINV3GrinZ/MNrjNv/3FeScn9T530B/rdRtMR
	8f9ogYAu3ado3AUBGugODeIjMU3Qr1g31hRLU3ZNw7jaLMCcEpzY9NMdCIVj4ZuwW6mzaHgUqfu
	80ez2NcQNjAxYeDF3DIzsgidhEaz/tiZlMt5GljLJ7FDul0oOgemHGT6bcRb/J/BPyl1dzDpTqd
	0b3dqmBOPY=
X-Received: by 2002:a05:690c:a08b:b0:82d:aa2e:2a66 with SMTP id 00721157ae682-849f67b0ac6mr35953267b3.23.1787375850496;
        Fri, 21 Aug 2026 22:17:30 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac5ecceasm6504357b3.46.2026.08.21.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 22:17:29 -0700 (PDT)
From: hengyul@cs.unc.edu
To: chenyichong@uniontech.com,
	tj@kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kernfs: preserve security xattrs without allocating iattrs
Date: Sat, 22 Aug 2026 01:17:05 -0400
Message-ID: <20260822051705.1761850-1-hengyul@cs.unc.edu>
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

A similar issue happened before in commit b09e0fa4b4ea ("tmpfs:
implement generic xattr support"). It was fixed by commit 8b0ba61df5a1c
("fs/xattr.c: fix simple_xattr_list to always include security.* xattrs").
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
Acked-by: Tejun Heo <tj@kernel.org>
---

Changes in v2:
- Remove an unnecessary line break.

v1: https://lore.kernel.org/driver-core/20260821161221.1270292-1-hengyul@cs.unc.edu/

 fs/kernfs/inode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 237dcdd73fc2..abb286bc3474 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -142,10 +142,8 @@ ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size)
 	struct kernfs_iattrs *attrs;
 
 	attrs = kernfs_iattrs_noalloc(kn);
-	if (!attrs)
-		return 0;
 
-	return simple_xattr_list(d_inode(dentry), &attrs->xattrs, buf, size);
+	return simple_xattr_list(d_inode(dentry), attrs ? &attrs->xattrs : NULL, buf, size);
 }
 
 static inline void set_default_inode_attr(struct inode *inode, umode_t mode)
-- 
2.53.0

