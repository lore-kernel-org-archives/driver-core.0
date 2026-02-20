Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166532BF41
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566916; cv=none; b=Ol36VCrF57ks4apbzrJ6ICoXk3a80SmirSjAQBdUU+pJM2y/HHjagBMuPjkcOsODiICNmczDPItyhdF+J3pJS0uZqqwwuQUFNpoEqxjplLLsl4rXM11yacNma0HegK/wZ3+jANyHeahT+h9qF8nCwrVHBoKT6AGJGmoDzVBsrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566916; c=relaxed/simple;
	bh=d/Njxo6LsxfyrmnJNgQrbf4Jrkxu+B4X3AZ0DsjVEVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jI2BPBtnxfv27S/ArK8ygHYPtaw5/ASQPlNaZ32ci5EPOpcVbgVUCORfFRQrPMQodozU4aNYFBI6htBz1HYEZIbVy5rZ8AZdyTt0iPA95IlM02gNTw3uh7+9NV2RRkFRgGbbVOBdsTXbP3N64ozm9qukXMckK4kFrF9zqHPe/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=btW932Zy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="btW932Zy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ab0b2e804cso21005675ad.3
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 21:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566915; x=1772171715; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=btW932Zy7RtQ6ZduMCB8lj9xFdavmTrPNZNHP/8ij/6VrN+wC2ij44KIwL3im5xzUV
         +jGEeES26goNbMKdto9zKUwNFY4mM3FvDeRY6X4jICBWiCBIo8plbajMO8NPPXsrgrS4
         5bPe0ViHvHo1qhDeTXdznFKJPSdOQ9wxLwv0oH/7gqtCB/+KO9y8Oxns4l/Rw4Dhpm23
         JE8d/Ku06GnZKgUD2ORN0IpUUOXBztEhFVLrdkZVn6FBTkZjAsyIbkuCnyRFtThVJkSi
         v8TvtNCgw9381ZPqgLZ/WzNgwn7GCiAb/CG6sk8a6PWBm9Z99RxjSNDLMaMgm+5uMW8k
         6Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566915; x=1772171715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=KvA2mfn/t3Vlciks9VrFGvm2tnkcJ9m16h5SBR87IF2GDYZRG4OuvL68w/ZD6qsarr
         oPbgeB6H7jWPinwhmjmJKqfWNsw5Uxl16v9utb8kjwd1otmwMCM6AZFRBWEf9PSR5ask
         ROxmtShZAQTrVj5Kv/FUg9Hjhgn6eUjujyJ6LsG4IaJoasx6J0zWw7vl5t6c0so5fqDN
         AD4X3yAxcoC1JzsKB26HoHow+Trtzc8v/DrFW1y0eEPuBErpJOTNUIAeomOgjkPl6puC
         ebl3/uM2vm2+e2YZ19qnajLE3l1l+o8eT7QNx8CSdNYW4MF9z5ckr0E7uNLrYK3oApHS
         aeBA==
X-Forwarded-Encrypted: i=1; AJvYcCUd2U7/wje3kwiU+hG7PRUCv1TzPRHUBK3R9o6DGAM1BtJgxy01a64iKvWgequ28KuPweScd1dI49KP7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAl4JvRGXOrf74r4F/HuVDGULJIfAVHYrpd4jsOTDi2opzO+Cx
	2lcFsZAc1r92nf3LVJRStqQHXRE4Vkkl99BYvSbXPM51mb1OjT9rlj/7gtlpraSsy4GpIHAgkSO
	Dj7A8NB+sIhSdQA2A6Q==
X-Received: from plma8.prod.google.com ([2002:a17:902:7d88:b0:2a0:92b7:79c1])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3bd0:b0:2aa:dc84:251f with SMTP id d9443c01a7336-2ad5aec750dmr47251955ad.2.1771566914488;
 Thu, 19 Feb 2026 21:55:14 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:46 -0800
In-Reply-To: <20260220055449.3073-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-2-tjmercier@google.com>
Subject: [PATCH v4 1/3] kernfs: Don't set_nlink for directories being removed
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

If a directory is already in the process of removal its i_nlink count
becomes irrelevant because its contents are also about to be removed and
any pending filesystem operations on it or its contents will soon start
to fail. So we can avoid setting it for directories already flagged for
removal.

This avoids a race in the next patch, which adds clearing of the i_nlink
count for kernfs nodes being removed to support inotify delete events.

Use protection from the kernfs_iattr_rwsem to avoid adding more
contention to the kernfs_rwsem for calls to kernfs_refresh_inode.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c   | 2 ++
 fs/kernfs/inode.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 29baeeb97871..5b6ce2351a53 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1491,12 +1491,14 @@ static void __kernfs_remove(struct kernfs_node *kn)
 	pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
 
 	/* prevent new usage by marking all nodes removing and deactivating */
+	down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 	pos = NULL;
 	while ((pos = kernfs_next_descendant_post(pos, kn))) {
 		pos->flags |= KERNFS_REMOVING;
 		if (kernfs_active(pos))
 			atomic_add(KN_DEACTIVATED_BIAS, &pos->active);
 	}
+	up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 	/* deactivate and unlink the subtree node-by-node */
 	do {
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index a36aaee98dce..afdc4021e81a 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -178,7 +178,7 @@ static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
 		 */
 		set_inode_attr(inode, attrs);
 
-	if (kernfs_type(kn) == KERNFS_DIR)
+	if (kernfs_type(kn) == KERNFS_DIR && !(kn->flags & KERNFS_REMOVING))
 		set_nlink(inode, kn->dir.subdirs + 2);
 }
 
-- 
2.53.0.414.gf7e9f6c205-goog

