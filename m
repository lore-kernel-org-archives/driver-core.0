Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FBB481FA2
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911831; cv=none; b=uCnY1d/1uMf8xP3uR7/7TBiHsKPUP180VOBRO+XlAAf+0O2X8ZwTHd7t1VYCMg5X9W0zNAQFUVBlpwo4zdVZDmBgOzZYbZccglM742j5uDlI1JVIPKky4tKQxDlATSdtOeQ3WnH4Vj8lyfubNUfi4JHbqKhD1IPXv4lS5FWjQH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911831; c=relaxed/simple;
	bh=zPE7UMZ3qKtKwpd/VqKMkqn0PqhkyEss7hmcUFm5+As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYMM4zcRJcNKlXyYWMDx8p59DfzMiNH9i70qpbLP+xAo4lgyh/Tn/qrNrrqw1dgrfOmvPgd6sK+rqfnONsTKqScfK5AIWjc4X7t0zbIoM9O/4wKBv88ST9bzByS7rWED4+2tqsmDb+zcKW7ZRUvLFk1QqdC5xeHQ8Zmxf9u3bR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDg0vHgX; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDg0vHgX"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2c9afadd78eso1980725ad.1
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 06:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782911829; x=1783516629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhdKovstj5wOL0OrmNNoLk6CAFA0IOcvZ3J/XZB8tu0=;
        b=SDg0vHgX4wZ8a84L2gsfjE1V8iF+AcfQZRH1XW/HmWPCY+21bFobAsI45x5IGJBg9x
         eCyMv/jEwqxSRyG74reyl2YmlglXHm2noTYQDAHKoXzUlJy73gPDpoCM9lbwoNgtnsbu
         zDdYRkWdqJs3HnEPRAcpuvtyyTguqzHq4zpya2lzhPtfEYIinPgpp4QE8xRFD/EndgLb
         F7vIs0BQWcyxQEXH0Ss6J5fi4M6pc5mEl/1C8CQCoRtsuvhMVlJiuhO9/J5r9J3GlaTI
         3vUBluCIk+hi/ByypFXDokF+fhlelt1/kCXOG6KPBH9hYEWqoHaPrhGOQY/HTkJPh/en
         DIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911829; x=1783516629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhdKovstj5wOL0OrmNNoLk6CAFA0IOcvZ3J/XZB8tu0=;
        b=JIh7acSvyfWGpwSG6nIVRdoX59cg8VvCF4Ik0TZ16lU+8hEs709z8vwyIduX8SZ/00
         nqLIoOB2LV1AVa7o9ycEgADejYfaqSCZg5RPrloFIqZwQZJu+vZIWCtlgaq/Ec6UNTqJ
         i8lizgTMdDR3Dozb+8dZMe1AvbYfol+cEJSxIjNoOqMAVEziJuQo8LddnGTabsA1rIR/
         8froflCWW13W1LB7rNUOo9NrImZUsz/dHNqS2uJIMldSWf+gsUApCg+CyZP5Cp+OSlzX
         gNqv9AxkPLsYJ2lqe4KI0biiAwoTukvW5RjeGxlFAq3aN7MRVa0ATE5RcLsfFpJXjAfB
         ZZyw==
X-Forwarded-Encrypted: i=1; AHgh+RoZQud2CAlw0a2uhvVMd3jXH2Xme0bm74nzI2micLjPW8rE1QX9Gc2IgXoYP6tHdHKNaC1kswp28PDVuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxceBNhz/F8xdXBontYnxyDhxEGHvGuRvpH15UxEQ0eoCQBxDOH
	6HNpuxcujp+qoHOLZTgSWfDHWSIKpdYueJ+ruYk7qD0cuBPSTLTUgvTp
X-Gm-Gg: AfdE7clmhQkqN4RceJDS/m6WYqB/WQ+yZLHhYHeMsEtOInP4qgZUNrGDa7JgWcouWff
	mfvpXCqX+g9gRtZQUVj4FFsLWTK/YLXWwjotrSSDv2Y+CEwVUjTAmbfansDP9bnEVQczhu9Q8Yf
	sNwOEYqIalZwxNdUIh0zN6uMQGnOcOOzUJJhNC5Rp7rZIEvtAXtXNZMnu+7ADT5IzY+RcHWVjCD
	I7M6QFNDGyKIlAT/nv/64TU3F/A5A1gK0UtvCofvWkxhlOkAX4mRSaiA/QGRNcApOAJKcAD2Ynw
	wQZ4qT0la6K/qq31YNe9klOdYUVrgjaMbzcOoby3Ep/39Bz3sgEakyEvhnV2KVHft/kL2XJAwbT
	A0K0o6ZqpgHseF6HR2pTupwZIN65KwB++gD/n+oH1lfzjLo6aIn7iivB3cQKgJbUqdT5NRwRN5d
	41JrK9oVRpAIB5YdtIphjNAA==
X-Received: by 2002:a17:902:fc8d:b0:2c9:97a7:b1e9 with SMTP id d9443c01a7336-2ca7e91bd60mr18739275ad.40.1782911829328;
        Wed, 01 Jul 2026 06:17:09 -0700 (PDT)
Received: from LAPTOP-1HUHJV8R.lan ([122.230.221.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828b0f2sm33012545ad.54.2026.07.01.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:17:08 -0700 (PDT)
From: l1za0.sec@gmail.com
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sysfs: fix use-after-free in sysfs_create_dir_ns
Date: Wed,  1 Jul 2026 21:16:58 +0800
Message-ID: <20260701131658.11369-1-l1za0.sec@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haocheng Yu <l1za0.sec@gmail.com>

A KASAN: slab-use-after-free Read in kernfs_next_descendant_post is
reported by a modified Syzkaller-based kernel fuzzing tool we
developed.

This problem is caused by a race condition between sysfs directory
creation for a child kobject and removal of the parent kobject. In this
case, the ueagle-atm driver starts an async firmware request for a
pre-firmware USB device. The firmware work falls back to the sysfs
firmware loader and tries to add a firmware class device under the USB
device while usb_disconnect() is removing the USB device from sysfs.

sysfs_create_dir_ns() reads kobj->parent->sd without taking a reference
to the parent kernfs_node. sysfs_remove_dir() may concurrently detach the
same parent from sysfs and drop the last kernfs reference. The following
kernfs_create_dir_ns() then uses a freed parent kernfs_node and
kernfs_activate() can dereference it, triggering a use-after-free.

To fix this vulnerability, take a kernfs reference to the parent while
holding sysfs_symlink_target_lock, the same lock that serializes
sysfs_remove_dir() against kobj->sd detachment. If the parent has already
been detached, fail the creation with -ENOENT. Drop the temporary
reference after the child directory creation attempt completes.

Signed-off-by: Haocheng Yu <l1za0.sec@gmail.com>
---
 fs/sysfs/dir.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
index ffdcd4153c58..1883a4380250 100644
--- a/fs/sysfs/dir.c
+++ b/fs/sysfs/dir.c
@@ -46,10 +46,16 @@ int sysfs_create_dir_ns(struct kobject *kobj, const struct ns_common *ns)
 	if (WARN_ON(!kobj))
 		return -EINVAL;
 
-	if (kobj->parent)
+	if (kobj->parent) {
+		spin_lock(&sysfs_symlink_target_lock);
 		parent = kobj->parent->sd;
-	else
+		if (parent)
+			kernfs_get(parent);
+		spin_unlock(&sysfs_symlink_target_lock);
+	} else {
 		parent = sysfs_root_kn;
+		kernfs_get(parent);
+	}
 
 	if (!parent)
 		return -ENOENT;
@@ -61,10 +67,12 @@ int sysfs_create_dir_ns(struct kobject *kobj, const struct ns_common *ns)
 	if (IS_ERR(kn)) {
 		if (PTR_ERR(kn) == -EEXIST)
 			sysfs_warn_dup(parent, kobject_name(kobj));
+		kernfs_put(parent);
 		return PTR_ERR(kn);
 	}
 
 	kobj->sd = kn;
+	kernfs_put(parent);
 	return 0;
 }
 

base-commit: 665159e246749578d4e4bfe106ee3b74edcdab18
-- 
2.51.0

