Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA449CF4B
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436309; cv=none; b=t7d5PHXS6EYZTsxFDEnjMgQNU9CdJZHQcme0yXhH/bznJ/F/84b2v7m3BQxjKJRV6yt7m//i3WqKftNktNSyyXQ1cS52mHAFu26N32xY1AM/O/EmfX8rjnxVcVcwS4jwOORPuPTruXWkKrYo7dkD/QHGLmQHCk7B2lxnku/co7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436309; c=relaxed/simple;
	bh=I/o0B+U6DalnOsTcEmAG0rK+NVMF2eOxour2nwHS6uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDnTwslbb7R7Zke2v8w10pgw+goLkn0UQ333yljUGVNuf1B/QEpDiSf2Vojzp3bobWJkMpdX4mXv0RAjcqltwgy1W36D1YzctO6tNC4jAvX2OqVfnftMFj/tyYENEJPmb8v4S3GE58qXGuDxyAhxdfxaxhTSUfJWv9pB0vq/z94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5jK9sxD; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5jK9sxD"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2544ff970dso330587166b.2
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436300; x=1789041100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Uzx/sArEiSDEeDHsMNzdeWeAZ++sejZ/sbaE6acPVQ=;
        b=Q5jK9sxDP1MRcc0Q3i51yeVM9ZOPu56LY/29hkhP4A0hEhIRelTUYBS3eq6ZPHw6bC
         8MZpDXxdVzrSa/R8hWRARlkEZFXjadwIyxbp7o6Oy1c4rHqNw3LaV4mphmFQBl14EaCP
         bcKGJOs/5XxQnELPtY+UApdVETSHQWNzW5g7AbENSlryWDcY244v4vsXCgVIswPGnVMs
         jjMjZn2tn14QynYH5zhEuw2MlRNJXWtV5v28KoWfBbN/4yS1Pq9DO42xr0xhSicBtoUy
         YwuwkyGcomse37G5g3wXRULA/F3UEgZV80929N2sxbTfplzrEbHqMOkxBhtVjq8tlMiZ
         zjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436300; x=1789041100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Uzx/sArEiSDEeDHsMNzdeWeAZ++sejZ/sbaE6acPVQ=;
        b=a1kgA5ojyrw14ykIiykfHh+8CPq6xlIT5mN0sN2/TxzRl2JeotqqgHtua+OQySRuDF
         jb8UIcWtoBI2xT7z1v3vm2vCMIFSmoRfVvnvsjDD8XE7ZQWsKb8SVMfAUPd/PBwl7aXP
         HxD038oLgs0vRe0S6ADuXbENv5qqGs3VuhMwoxm5isgXTW7+tR/BSGK0eRAFEINn6pBf
         Vu3ZjqCF03NTza8YRYp7p5XyLtQ7i6Xg6wzm2aRJA/GU05H896JCnNLBTTOl79gXqqYE
         irQBKp6WmOHdmLfbUAcG19YCbJ6m7IjjVtgsEvkPXupp/WomvCP0irbgBhvwcrEhyXOJ
         EM+A==
X-Forwarded-Encrypted: i=1; AKwUvBxJi/lc6NElkhRkzzYTdsrZ61mmnNAMnQfvlIkHDc0qCHoIpeQU1ZcYNU1oE4G6thlKPPa6vxCyD3VB/g==@lists.linux.dev
X-Gm-Message-State: AFuF++liw8IHIETl0DmMKLI8tqkNhQAdrCpR7YmxGaUTTwetSrxxkUHb
	bJ+3fgHKxBJAJu+ui96+EDS9wlz4vPk6wAvobZpIMrDO5cmCutj4siiS
X-Gm-Gg: AYBFou2v6FUFlozYtx7bQvhgblQadMKKiNGyvpjQC/2YJJ8qjxVsjbadSUh7JBWfbcL
	xCm35wtI2qnfarGag8DC8myw42cnFttsW51nv53XPLeQ0WGDKmdziWZei399fHH/Syab8cQpXAi
	VWetxseCTxXSYPT49Qpd+wtXs092Y/CzXGjBbN19+mv+CHotT3CnUI/xYJVS7EqLoQYDyCr6Jgm
	045nOD1HsGR+AqO0g2N4qwI6w62g7BIGPZP2Yx9BPDC7DHRB5R1iW/jR4I5L1ae0eiYadoXRH8j
	XFovckRtkkOeHr/ThSXLv0JWu60sYSdJLnX+PyHa/k4iB3Z5kONf8nWSsWawztFshhc6IY2hXqg
	xZqmMj4XUs/GAklrIPU5U1h0W1HT7Yu0m2S6GiSs08uNljf3oqDvBVyF7YBjbrLCPXXO9OsMPLq
	tNxfjFxJXcw6ovS7CLojWxQv7r1mGgVOq8GUaxZ+0ySO1B2re7F+0D5uTQbNeeDmhrncqC6nRO4
	2gouD+sngzXDkOmI9b9oC+LSQtBhNvO2Lpoz+2c87wV4ArDJTP353hcgCRw
X-Received: by 2002:a17:907:3e93:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c25d54e1bcbmr699666066b.17.1788436300312;
        Thu, 03 Sep 2026 04:51:40 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a104fsm87815766b.28.2026.09.03.04.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:51:39 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] debugfs: don't warn about uninitialized debugfs for an error parent
Date: Thu,  3 Sep 2026 16:51:35 +0500
Message-ID: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c3a280ff728a
("debugfs: warn if file creation failed due to uninitialized debugfs")
every boot with CONFIG_REF_TRACKER=y and CONFIG_DEBUG_FS=y prints two
errors before the root filesystem is mounted:

  debugfs: Unable to create file 'net_refcnt@(____ptrval____)',
    debugfs is not initialized yet
  debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)',
    debugfs is not initialized yet

Nothing is actually wrong.  Both files show up under
/sys/kernel/debug/ref_tracker/ once the system is up.  The kernel is
reporting an error for a condition the caller has already accounted for.

net_ns_init() runs directly from start_kernel(), before any initcall, and
calls ref_tracker_dir_init() for init_net's two trackers.  debugfs_init()
is a core_initcall, so debugfs cannot possibly be up at that point.  That
is by design: ref_tracker_dir_debugfs() is documented as safe to call
again later, and net/core/net_namespace.c has a late_initcall() that
re-registers both directories once debugfs exists.

ref_tracker also states that intent to debugfs.  ref_tracker_debug_dir is
initialised to ERR_PTR(-ENOENT) and only gets a real dentry in a
late_initcall, so the early call hands debugfs_create_file() a parent that
is already an error.  debugfs_start_creating() honours that and returns
the parent error, but only after the new pr_err() has fired.

Move the IS_ERR(parent) check above the debugfs_initialized() test.  A
caller passing an error parent is propagating an earlier failure, which is
the pattern debugfs documents and which the warning is not aimed at.  A
caller passing a valid or NULL parent too early - the case the warning was
added for - still gets it.

One behaviour change: an early caller with an error parent now gets
PTR_ERR(parent) back instead of -ENOENT.  All callers of these interfaces
are documented to ignore the return value.

Fixes: c3a280ff728a ("debugfs: warn if file creation failed due to uninitialized debugfs")
Link: https://lore.kernel.org/all/6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net/
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

Tested on x86_64 (AMD Ryzen 9 7950X), Fedora, v7.3-rc1 plus fixes
(940de590b839), CONFIG_REF_TRACKER=y, CONFIG_DEBUG_FS=y, with KASAN and
lockdep enabled.

Before the patch the two errors appear on every boot, and
/sys/kernel/debug/ref_tracker/ still ends up with one net_refcnt@ and one
net_notrefcnt@ file per network namespace, including the initial one -
the early failure is recovered by the late_initcall() in
net/core/net_namespace.c.

After the patch the errors are gone and the same set of files is created.

#regzbot introduced: c3a280ff728a9039c72cd64ad0b32bc3a28c25b2

 fs/debugfs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index e054e62919ec..a4d08bd3743b 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -368,6 +368,9 @@ static struct dentry *debugfs_start_creating(const char *name,
 	if (!debugfs_enabled)
 		return ERR_PTR(-EPERM);
 
+	if (IS_ERR(parent))
+		return parent;
+
 	if (!debugfs_initialized()) {
 		pr_err("Unable to create file '%s', debugfs is not initialized yet\n",
 		       name);
@@ -376,9 +379,6 @@ static struct dentry *debugfs_start_creating(const char *name,
 
 	pr_debug("creating file '%s'\n", name);
 
-	if (IS_ERR(parent))
-		return parent;
-
 	error = simple_pin_fs(&debug_fs_type, &debugfs_mount,
 			      &debugfs_mount_count);
 	if (error) {
-- 
2.55.0

