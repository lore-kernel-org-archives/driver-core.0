Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141133262A
	for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520481; cv=none; b=luKMVjssfATsH2x10vR2DvMVkGFoiYIGP0ed3u88vDGhG9DH9omCqQCbkr56wgVnH01GEh7Bj/evQ+I9poJs73q9zIltUYO2B8dJu5zjFmp/gE+1vYhLR7ISvm80+bM2J9xSxGbSrwyHLb8BRJ8loCNXwlRQrnNUAFd7xj6UEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520481; c=relaxed/simple;
	bh=WJa4UCVH02RHe9+Oq31r/RrrcBb96N2j4OM1JKwV2Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYjsUYbO19nSOmPEJtwZ0lrNw3tpya9lHRDXgvzJSAbv98MZIU16D+Axj1jutDSv35JIppRrhAFCjwFqS1eZIQfL3f7wF+afwnP+FZ17e3a6DdfTzHW+0evrnm3pCYLGUlQgk3r4xHSwtunbChosDTJY0hj5I0Nbp6qABL/7e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMcXYx+h; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMcXYx+h"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304ec41197bso3473283eec.1
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520478; x=1782125278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eD5p1FqpKBE/WpLH7RPMIfnZsLIdey33cIaJtrksyMY=;
        b=VMcXYx+h9LA0bJ8vT+aCbQHkJ57t+0jgqnTbZkca+WXJXkj+XNuy8RjtpfkzVlxTKH
         TIoAs22AiwTmVALH+/XIb6gWwBZyqYvry3qsbmQrOQHDD/BAv8aFqlilQ69YIMlz9BdS
         GTLO/HPw0Hof9njAtbuF7Fr16KMsZTH6x51QvjaS50UBcAdwzdUUC0VMmwDVyCy5H1Um
         eoOB6ahgmTxplp+mxXOZWqWgFl2sHd0ysiZpRiXxxq5yJF0mEZVSYgLBfwkbTe4vS4vn
         Cud35A2xHtoNfGJIxOAK/Qw6/4bkTtDwL+E5tsR9cjSfXtuyGT59dYgaqx4JCuoCIQ1y
         aHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520478; x=1782125278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD5p1FqpKBE/WpLH7RPMIfnZsLIdey33cIaJtrksyMY=;
        b=dDFT3lhQnpkJ2CqKsVyQqXZQbOkStC11Ck9V9hZdZsMCM580p2DQLTnktHn60oJSJB
         98+8ZFuy0aZ+/5HSMoACLOiJvfQbK1G6cOk6d+4VsRkW79VssJgkYEZ1cN3CLr4aXfBo
         zGBtp86rBS7EDtwb0TC/MQ/31EnZ2V6TftjNbI8BfaN2NaQU6VPYtqE4uxlKrhKnwG8Q
         N7qQ2iH+UwEKk2srh+XqyhwVxI9i5Ha432Yt5CGUqJahnFkSneuS3OBXlIxVxDMBKaeZ
         eislt3ZdYz1yeBdW6uhGskacjedqOyzLodJxlX3VAy6I5cud6Q0FOMCDTfWdtCzU9UqR
         vhiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gO5YNsopr46f3YsulHKVConmStq3bwxOBq+RITLVM4Q0aPzTYt3t1gLUgxNHpSHPwlMJACcJtKnnaDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDPtK6SCTQQXTM/mfma+NZJAuwbcwUZMv6WSdo0Py6Z1RD5Chf
	eVQQ3hg6dCsoV4GNKgn33FPcNU2GFdNF43XE2G4hjXPlhto3vRmTqN/P
X-Gm-Gg: Acq92OEL+pjDHuaaog+NaHEmXQpROZTQ34Ekv34Xvu9PE5+yyxj8i+1e2GuGC7+Gb/E
	GRaszGpGtapn04gdo6exENC+gGljGEzj8RNFswbvAQ59v6CMWcI/zilTYyUxme6fXUkcL/NKCpr
	hi2UPCrFxKcnvPtQXP2rOclBnO5H1Q1oMMy6rWC9h2PQ2CyXhG5QyTR6UBJq3j1c1IJVQZvFrZb
	oTOOeJ2JI/pdkgzsx45FRkuwdl1OyUVAH999MeJ/dhuHHHII14lgpZVfYovmt28+LLKZ8yp9Gyt
	5PjZJUjt7ti9kKg9TwrOB34WpxcPp/lEwQUYukgVjOQF+gJGuRQL8BSFuAUsXssHjFYeerRRI/i
	d6C0cTGOv+IApomvOv7JLak1gn4qF5xBJlpgchhnML7HT19EDBApLkrtxfmJdOHJmJH2De4cihl
	+6RNVDZrpt+g166Ph6MYqk7Q==
X-Received: by 2002:a05:7300:501:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30820096d98mr7471008eec.25.1781520477763;
        Mon, 15 Jun 2026 03:47:57 -0700 (PDT)
Received: from linux-691t.suse.cz ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm15480774eec.4.2026.06.15.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:47:57 -0700 (PDT)
From: Chun-Yi Lee <joeyli.kernel@gmail.com>
X-Google-Original-From: Chun-Yi Lee <jlee@suse.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Chun-Yi Lee <jlee@suse.com>,
	David Howells <dhowells@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] debugfs: Fix lockdown check for mmap_prepare
Date: Mon, 15 Jun 2026 18:47:50 +0800
Message-ID: <20260615104750.1000-1-jlee@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chun-Yi Lee <jlee@suse.com>

Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
changed the `mmap` file operation to `mmap_prepare` for relayfs, but
the lockdown check in debugfs was not updated accordingly.

This prevents debugfs from being locked down when the kernel is in
integrity mode if a file uses `mmap_prepare` but not `mmap`.

Since the conversion to `mmap_prepare` across the kernel is not yet
complete, update the lockdown check to look for both `mmap` and
`mmap_prepare` to ensure comprehensive coverage.

Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")
Signed-off-by: Chun-Yi Lee <jlee@suse.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
---
v2:
- Add explicit From tag to match Signed-off-by.
- Fix Lorenzo's email address.
- Add Cc stable for backporting.
- Check both mmap and mmap_prepare as suggested by Lorenzo.

 fs/debugfs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index edd6aafbfbaa..08de6652a4f3 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -273,7 +273,8 @@ static int debugfs_locked_down(struct inode *inode,
 	    (!real_fops ||
 	     (!real_fops->unlocked_ioctl &&
 	      !real_fops->compat_ioctl &&
-	      !real_fops->mmap)))
+	      !real_fops->mmap &&
+	      !real_fops->mmap_prepare)))
 		return 0;
 
 	if (security_locked_down(LOCKDOWN_DEBUGFS))
-- 
2.43.0

