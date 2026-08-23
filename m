Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84D38A70B
	for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512385; cv=none; b=UMYN7sPJnW4R2oUfNvghVSapkZiPk/NyePXxvH/ww8sKx1DqJdiUZAf+VIGsL5g1DU0RayJOad/uyXfEOp6gMVwXoSptqHx3zO1+hRchjFdMa1kKD00rMX+nmHCahSYqK3x5DEkechGWGKJ5Ft6ObR+x6+3GXrRHyvt+5CBX30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512385; c=relaxed/simple;
	bh=Owu2yQZ3ssiTZF54WlJcep8/1pFQFocuIQQmghBWd3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=LAxQ6r1nILINTCknqEv7u5mHMhMVyHo0yBf8Lbf3bVYlEKBdYsxYzlx/u1RlVm/qxGFw0L7VRhAWXhmDE4mqrk+eWqBm+P2cJPmwTLTWiWdUyKkiQ/L47WcLFVgT/lmVLq2i+gh2bXLg5MlBA5GML7I1QCEBhQR0M/aiD6QfpyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jysf1SIr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jysf1SIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787512382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dyMUHwcFZHWvzwaQJRcLCXJOSAtnM8sZrtYfPFtbokg=;
	b=Jysf1SIryrI1vCAR5hsGvIetFsY7LZShJdjjRwduBLUjSy9hCARPieybYvMWn+1SvYplvU
	sGP0TXb5ZUSZ7fzqgadOPj5uk7ikYfuWEjp8MJJZh+J2iA8Pd7SDnLcoy/Y3WfVMdhBUPu
	cJ+C5QKaD/+c8GXndjmXWD4iQjM7J8Y=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-caWVKvLZMFmIj3v2wjwwcA-1; Sun, 23 Aug 2026 15:12:59 -0400
X-MC-Unique: caWVKvLZMFmIj3v2wjwwcA-1
X-Mimecast-MFC-AGG-ID: caWVKvLZMFmIj3v2wjwwcA_1787512378
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so4773579b3a.1
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 12:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787512378; x=1788117178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyMUHwcFZHWvzwaQJRcLCXJOSAtnM8sZrtYfPFtbokg=;
        b=KquAIP/ySKOESpiEA41mpr4QJAQ2OubiDROTkw8QjuIUZU1KgZ6CzNcpIDGK3zLvyW
         NIg+jaSr8k81bfQZyUOVyV+XRpnP80RkxYiMmdn54r8ufNs0ChOJ4Q33TTQtn11EXwcy
         VbtYYEynS83rJZLZzpQTPevMUDK1UZYOfSPJvA3TWYMO+xu8yYicm9su6c9m/sZw4o9B
         gpG0vwAG0aB7kaDABpXY36EYixmYSYiWbK/Q/ZreNscCzgEefod2/3xXdkoq3d7wOTtw
         2OGfViQlEdS7DAFMNqelo8ySiQ1zp9dIGLEA7jHQ/blzd8QEPwzJwM93K4+9Agfe9pae
         24/A==
X-Forwarded-Encrypted: i=1; AHgh+RpL4QnrpE7sdkGcBzF0zz8YKyFYzUMsOpW2zt6jr0KJZjLVX+CR/gJmLPpdo2FMO4GqqG6/sHfTpiDGXg==@lists.linux.dev
X-Gm-Message-State: AFuF++kDauWDtpJph1XFehng49oq+KLjtc2XJWlz7mUqVeUNC+QTkUPd
	9//hKMCqZfB8zXIbjdDNprXo9gNL7wwKHjgS9W4dV9i6Zagp0z35TIFbWUY89cneq9f7pdqjTN8
	7z4krKGZnMA8YZ84Bk0K/bUEBNAr+oIB9O8x+PadT609d7vnYuytJKwFgtQ2t4sX9
X-Gm-Gg: AR+sD116l0C/W99O3KGr5C/SOW5D1AD2Lr5ehiIB7mmslmqgus7FLI5LxMJ1tNgvoMc
	7ZjlSjYuC0Nb/qF44E4waW3aXx2a6NZVcMRIZChAc74D34ZXj1l3ZWvyvXn+ZO4gfkvLlKe7Wqo
	om0dJ248rF4EN9Skn9nQAZhtJUJvd7jO156+1b2yftNnt5q10Js0pBKESYtMfqGXke++mBHQIDf
	Wi8bbwbh7PURTJaH4VdXGG8dH0BMqTqyfKlN4CFgMDc8Tg/99w3gOLSdk7n1ZoOCzFWCCbWI3te
	1zc1C3mWdSBzsq3YbnHlD/XQt3rcCMKQ6B2d36xjmFC8G6CqrGprHSqCmTjQKMOY8inJIgLbVkB
	F8c3CLad/GOZR70UXUoEyZGZx
X-Received: by 2002:a05:6a00:bd03:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8520ba55d99mr20210453b3a.14.1787512378311;
        Sun, 23 Aug 2026 12:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd03:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8520ba55d99mr20210390b3a.14.1787512377847;
        Sun, 23 Aug 2026 12:12:57 -0700 (PDT)
Received: from kernel-devel.tail62cea.ts.net ([240d:1a:c0d:9f00:be24:11ff:fe35:71b3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f161701sm1224422b3a.53.2026.08.23.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:12:57 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] devtmpfs: apply mount options to the existing superblock
Date: Mon, 24 Aug 2026 04:12:53 +0900
Message-ID: <20260823191254.3696641-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sNTAdczV5MwByQQIfMCGfVb3NMB6OxQHDj1-w0-AqT0_1787512378
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Commit cb0e0a8bf4e1 ("devtmpfs: replace ->mount with ->get_tree in
public instance") dropped the reconfigure_single() call that
public_dev_mount() used to apply the options of every new mount to the
single, internally created superblock. devtmpfs_get_tree() only takes
a reference on it: the options are still parsed into fc->fs_private,
but ->reconfigure is now only reached via reconfigure_super(), i.e. on
remount, so they are discarded by put_fs_context().

For example, systemd mounts /dev with "-o mode=755,size=4m,nr_inodes=1m",
so size= is silently ignored and /dev falls back to the tmpfs default of
50% of physical RAM.

Call the underlying ->reconfigure from devtmpfs_get_tree(), the same
way tracefs and debugfs do; ramfs has no ->reconfigure, hence the NULL
check.

This restores the behaviour of commit a6097180d884 ("devtmpfs
regression fix: reconfigure on each mount"), which fixed the same
regression when devtmpfs was first converted away from mount_single().

Fixes: cb0e0a8bf4e1 ("devtmpfs: replace ->mount with ->get_tree in public instance")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/base/devtmpfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
index aef0fcc6aba1..f0798fc1bc34 100644
--- a/drivers/base/devtmpfs.c
+++ b/drivers/base/devtmpfs.c
@@ -80,6 +80,18 @@ static int devtmpfs_get_tree(struct fs_context *fc)
 	atomic_inc(&sb->s_active);
 	down_write(&sb->s_umount);
 	fc->root = dget(sb->s_root);
+
+	if (fc->ops->reconfigure) {
+		int err = fc->ops->reconfigure(fc);
+
+		if (err) {
+			dput(fc->root);
+			fc->root = NULL;
+			deactivate_locked_super(sb);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.55.0

