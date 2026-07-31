Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120A46F4A8
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524966; cv=none; b=qJYyMqtWVGr4pBlksxtbOC+C0H8CL1DwbrHgCbHWi2tigLiwHfpvjEACwWt1aWp2/xeNmI33xAmBiPLwFKJXIwW7GkrdctLk/AzqYvgx2IczeFkNLCvenIi7YuOndYEmkpn+eEcwWV2Duo69sChrGX9Zuw6RSmQjHfIiXbTCbwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524966; c=relaxed/simple;
	bh=voXzClVd6GoXHUqXOpaLFxIV+kMvz05cQg47euHLCew=;
	h=From:To:Cc:Subject:Date:Message-ID; b=lBuIEhWKURlOqPyE975BF3m13d9DBsbj9YGwTWpk4vV6QdLS42hbwGS39RAVRXqUwNtqxHyCWQWZcJp6/wbOPavyN58ISdtrvaGvOH5/+6gNqJrN/O03PI9fp/3azx9MiFg9GP6C48gs749MivqwVFRU0iu23oYo0tdbdTGGGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=KLxLIXtU; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="KLxLIXtU"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2cc891373e0so14453935ad.2
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 12:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785524964; x=1786129764;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeJqJiUGhw1arV0neXDR3NmNqOCHvAXptXpu44OsOMY=;
        b=nF1h18riXGdtmZ+fpoCGEe5h1vOksjsk0DlvfntjJJmSDNMEe3jiieJpcKlu6lCx1y
         4JitOsFDdWdk1DZR2AsZwoTcZUNREDlC1m+qdzTbNBYkczbUt4s9wLKgTMditSQ142tI
         OBlLTEJpxFQ5LiZN6wtyGL0uq5wNOhmDDlPu0mleXqSXSU5TjLdpS0e0rptnzRK7TLcp
         3RTGfR9QQvw4K/E9SlhG9iRtIweHsftWwGXZcVHkBLU9RlqvvBcw2wK8xwW3GNk50YtA
         sE6wOeUVdMVmZliy6yTD532eDTISk24BAVxm6ISf9EXBQDQjtPoWssTY9lDMhZf0hRyb
         KFfg==
X-Forwarded-Encrypted: i=1; AHgh+RqBwgCh2mRdCtyAQrT5h0a86xukp/apvLDGr90kYCJQeVSsaUaLLIzHB7Qh+c7U9os0B5xk8h+L1Nn3Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO7ZjWi8CZMiICDN/gGfeEu2cFsNJ65v7LeJEd9CmV1QQbvE+/
	UgeS+p6AU7et5KauPUL9CDdoGVtcyiuSNF+7oYMjZDOL9rBgqia2r2xII6qVE33NXs0g68eJYkD
	DyAcbSqc5smtRezcCCPBNCFGvpN47DP5eHA==
X-Gm-Gg: AR+sD11sVMHUgNb3bAEeNxS0KNh7yG7XVOV3N1Lv0KoG7GjSwjfj6r56uZ6LMfiwMpy
	QFYAaZi157KpBhMZHqqhJ7yKIHa6kquAtnPB5CTcAHr6IMQBXW/n0Zv1K+iKZEgMUvoEsAzZWNT
	IXumXocZI/tVxnIH5gcSxHz8ECOD7ttfJnS/xyyhpnop6DhiO+AJyAtuwOZ+WinXqll4y3+nmUq
	wVhogj+2+HD9j8RQkui3BNJBcOkHrkzmn+0Dolh5bewBg2fwFx46AsEr2T1iE6dguF3vThSdGzb
	nWs1nVk5ibT5JL4OSi4ufyoCQHLvjX45jXrsgb+AKbFM6btbTroGJ+JCQr4YC6Mf/mjOL7c1sVL
	O3i6vcdOK+dOdkce9ILncwzW2yBHM/13HFoL0ONlHz4Vo0tZSNEVN5vjk8ABOJFdlgts=
X-Received: by 2002:a17:902:e543:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d052215bb2mr10667575ad.16.1785524963897;
        Fri, 31 Jul 2026 12:09:23 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-52-52-135-65.us-west-1.compute.amazonaws.com. [52.52.135.65])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04aeb6e27sm1886745ad.20.2026.07.31.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:09:23 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1785524962;
	bh=HeJqJiUGhw1arV0neXDR3NmNqOCHvAXptXpu44OsOMY=;
	h=From:To:Cc:Subject:Date:From;
	b=KLxLIXtUuBQkEWgsiWMTEUGFGWArp153Es896sT+jo3LgpGJNvscYeMSf36hwkiF5
	 SA4IUh0Csh1ba1bBIBEA52qipRfD3rksJAPYJ2tQJ3SLtlPgC4RsrSIUhupeLZoWjX
	 GXd7TmjU1u9KqCYMyPgxrslHooBNDNavuxXVcDO5ZDfEwxOqroF86ahz3ClazViRje
	 vEeONshyBzTGL+i10r1/CK7bCAFpt7KLmFr1goF9Dy0LTjZFEuiprULdtIkdLJl8eu
	 J9i0ij9SvAnIa1u8mwYYeNrPUDTF9Aut+ZBiFDw/9FFC9GYBVzajYegdh3c8XAMI3s
	 Jm09/d0rUoDlA==
Received: from kevmitch-g-eos-trunk-2026-07-17.sjc.aristanetworks.com (dhcp-242-248-27.sjc.aristanetworks.com [10.242.248.27])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 89859C0FEF;
	Fri, 31 Jul 2026 19:09:22 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Kevin Mitchell <kevmitch@arista.com>
To: Tejun Heo <tj@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Mitchell <kevmitch@arista.com>,
	stable@vger.kernel.org,
	Chengming Zhou <zhouchengming@bytedance.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] kernfs: fix race to increment for nr_mmapped in kernfs_fop_mmap()
Date: Fri, 31 Jul 2026 12:08:50 -0700
Message-ID: <20260731190850.235909-2-kevmitch@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

Counts of files to be released (nr_to_release) and mmapped (nr_mmapped)
files were added to kernfs_open_node in commit bdb2fd7fc56e ("kernfs:
Skip kernfs_drain_open_files() more aggressively") to optimize
kernfs_drain_open_files(). A WARN_ON_ONCE sanity check was also added in
kernfs_drain_open_files() to ensure that these counters were brought to
zero once all files had been drained.

Modifications to these counters were protected by kernfs_open_file_mutex
everywhere except for in kernfs_fop_mmap(). This caused a race condition
where some nr_mmapped increments could get overwritten even while the
correct number of kernfs_open_files with mmapped == true were present in
the kernfs_open_node's files list. Consequently, the iteration in
kernfs_drain_open_files() would underflow nr_mmapped and the WARNING
would fire.

To fix this, acquire kernfs_open_file_mutex around nr_mmapped updates in
kernfs_fop_mmap.

The nesting of->mutex -> kernfs_open_file_mutex is safe as
kernfs_open_file_mutex is acquired last avoiding the possible cycles
highlighted in commit f83f3c515654 ("kernfs: fix locking around
kernfs_ops->release() callback").

Fixes: bdb2fd7fc56e ("kernfs: Skip kernfs_drain_open_files() more aggressively")
Cc: stable@vger.kernel.org
Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
---
Changes in v3:
- Remove stray linebreak and cc stable.
- Link to v1: https://lore.kernel.org/all/20251119191758.612694-2-kevmitch@arista.com
- Link to v2: https://lore.kernel.org/all/20260731010914.233067-2-kevmitch@arista.com

 fs/kernfs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 8e0e90c93372..76ade0d0be04 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -495,8 +495,11 @@ static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
 
 	rc = 0;
 	if (!of->mmapped) {
-		of->mmapped = true;
+		struct mutex *mutex = kernfs_open_file_mutex_lock(of->kn);
+
 		of_on(of)->nr_mmapped++;
+		mutex_unlock(mutex);
+		of->mmapped = true;
 		of->vm_ops = vma->vm_ops;
 	}
 	vma->vm_ops = &kernfs_vm_ops;
-- 
2.51.0

