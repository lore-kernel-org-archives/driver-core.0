Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E73B7A8
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347002; cv=none; b=bWVJQD1xnreyXcXBMiOB9QKMlCEb+wT/QGZNVr+CHfoqihoYlX/tXHB7za5VEHXB8fb2NF+0CHy8NIyJB6/s4AKB+vuZ+4YwgrthHK+BiIqAkOSJWRlY4Q34VnniE9oD/tfuJ8+LDbtrwXiR/UieqLV+Jhs1fACZk3Asp6wQSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347002; c=relaxed/simple;
	bh=pmr33UPV80r3AimG84BDA6JGI5flGSsHOl9kycOo5uI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7dMagdUjboOzkUpLWadCKGYVElU/cILNxDRMlfmpBIVWBHnq2IUCNXTbHJ29se4+XypZVpQy5Z+UqAYP4TvGNPdYybHdMiWOG3b4RFl9vS9AgXNwEWTFccO5aWAudDenEwNOe+iWIqRg96XpCYRZyYPTFff9I/HpG/UG5VruuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20251104.gappssmtp.com header.i=@u-northwestern-edu.20251104.gappssmtp.com header.b=V6RJ6myM; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20251104.gappssmtp.com header.i=@u-northwestern-edu.20251104.gappssmtp.com header.b="V6RJ6myM"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8dbbc6c16b2so99063485a.0
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20251104.gappssmtp.com; s=20251104; t=1776346998; x=1776951798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faRnu299rc8RbF72AIXkrSjnL+KG7jYZt+i3QwegYds=;
        b=V6RJ6myMXkEpk6nDcUMyohamlhXUuWLnRMZNpu22H8+hKB165VBcD2bEHN6zQM80zI
         9q+H3tU+ucIjrMsFErret/HAca6tcqfVnvvutwRL8mFe6wiR+xO2q8S4pnmGIsXvsA6G
         Kz5BT6hhbVjY4gGU5URh7pqQA1VTB47zCaYpy7UmcbmIuAJw9kWY9YzxvkG7hAz2ZjWN
         5wHmt3cSPKaFDY14cj2JBw28TMwCsbeNEYUInqSewywJHptcnlYTIHsqsmVfZM0eYux2
         YyBugNvpqEhGPLBEHqPyGqyFTmhDf0FIsYpbSYoZBdXCSF04rp+P4wMFnDPef1Qm9Sbe
         19+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346998; x=1776951798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faRnu299rc8RbF72AIXkrSjnL+KG7jYZt+i3QwegYds=;
        b=BSE8d/YCX43S9a2Vr9dXQASemSGyC5KhKa8A4lNjVq4QvW9ogXIaPwX77uE2uuJVpI
         23LlIHzgvWziblse1D2JPAr9sHezsSZqvMT/mQI9CUjwZlTJFHGydSi/MOy8AN7G+MGU
         wVEzMsyLB5mqUUcE0PNd3DH498iVI97pBpjP3Sz3Pwz3J77VSin43YG3dg9IGOC5eYbL
         fniG/VBBNiGzoBl/yWE27eEmd2ftkfSXMMuXCBcOxqvqSgaroPhpMzYMMcyrofGYrPPw
         sHu1uEzTSMusLh8RFM1K/MPdlOqSdxCZnfNilhvtRTGUqnDWwj0dMCyGL9oVBba36O+X
         gB8g==
X-Forwarded-Encrypted: i=1; AFNElJ+Yfg7qMvKcAm8q3ZM4E9tASG6iW7JgohbTVXEO6s+oAEFdSeLsK20p+SL+O/rKSy4s8TFZQA0TuYr5AA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+SiLj/OQA2Wwc/2pIaUpVDurYkroBYeW6gen4OB1XnxwlHbYM
	mXLhpJ8XyJaYQYdb5Z6l2/Jz3gNZuMn6ef5dICRh1AWu18Us+I1dtY649bppuSgEDQM=
X-Gm-Gg: AeBDiev04m+D8eA5OskKaExM30QbmP62NQL9P1zdVy+8wLRXUg8hS00mIwKHfvp2EUh
	SpXEf2mFfXg3fKaJYIJSG9aOsiuJDeqh/WmN3O2Z0JxoOegr8ntsC256Hb4BxLsK22nXvJ4L/wx
	8IZv69A5APacRHj5peW5qZpP982e+15MZkIHcYSQHQEvM1dCEsa/w59HYkEDEe3atSmWS1AuoV2
	CtyNr926iWVBtiznDORLzCSpEPUgrTbkMCRfeYh7UscfHgwLeZ2BnMw7B5SDhYQzj7LtFguhCcM
	VM+98D+y5i9pO4XMtilaaz9Ul1LE9w0/2zryqJW9pLnYNTqrWI+/2tN1pCVDRGHGdsazVJ+ob8z
	bpsQMaY5ncjTHisdUfshXVZ4S0TzbsJsXR0k1dcV36a+wo4lWpcr+WnVgxXdrV1G2U5taPQj1hW
	yNTiZN6vxkxxhwDQy1DnjjkZ9p+zCKQ5/vBe2Ir8xX4CWq/5ZD8t2RJ6URc2H4AgscPqeEyTkC3
	T5aGzSPvDZE1xTrpOl8l90=
X-Received: by 2002:a05:620a:2682:b0:8d5:8815:ffc6 with SMTP id af79cd13be357-8e689142d78mr201792685a.13.1776346998019;
        Thu, 16 Apr 2026 06:43:18 -0700 (PDT)
Received: from conor-Inspiron-3020-S.mynetworksettings.com ([2600:4040:44b8:3600:d171:db71:e260:ff8d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4ef33bc4csm363886485a.12.2026.04.16.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:43:17 -0700 (PDT)
From: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>,
	syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com
Subject: [PATCH] kernfs: fix suspicious RCU usage in kernfs_put()
Date: Thu, 16 Apr 2026 09:43:15 -0400
Message-ID: <20260416134315.1474726-1-conorkotwasinski2024@u.northwestern.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
converted the WARN_ONCE() in kernfs_put() to read kn->name and
parent->name via rcu_dereference(), but kernfs_put() has callers that
hold neither kernfs_rwsem nor the RCU read lock. The inode eviction
path driven by memory reclaim is one such case:

  kernfs_put+0x53/0x60 fs/kernfs/dir.c:602
  evict+0x3c2/0xad0 fs/inode.c:846
  iput_final fs/inode.c:1966 [inline]
  iput.part.0+0x605/0xf50 fs/inode.c:2015
  iput+0x35/0x40 fs/inode.c:1981
  dentry_unlink_inode+0x2a1/0x490 fs/dcache.c:467
  __dentry_kill+0x1d0/0x600 fs/dcache.c:670
  shrink_dentry_list+0x180/0x5e0 fs/dcache.c:1174
  prune_dcache_sb+0xea/0x150 fs/dcache.c:1256
  super_cache_scan+0x328/0x550 fs/super.c:223
  ...
  kswapd+0x556/0xba0 mm/vmscan.c:7343

lockdep complains with "suspicious RCU usage" whenever the WARN
fires from such a context.

Wrap the rcu_dereference() calls in an RCU read-side critical section.
Gate on the active-ref check so the lock is only taken when the WARN
is about to fire.

Note that this does not address the underlying imbalance in
kn->active that triggers the WARN.

Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
Reported-by: syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0dfe499ea713e0a15bec

Signed-off-by: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>
---
 fs/kernfs/dir.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 4f9ade82b08a..e88b71607f1e 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -597,10 +597,13 @@ void kernfs_put(struct kernfs_node *kn)
 	 */
 	parent = kernfs_parent(kn);
 
-	WARN_ONCE(atomic_read(&kn->active) != KN_DEACTIVATED_BIAS,
-		  "kernfs_put: %s/%s: released with incorrect active_ref %d\n",
-		  parent ? rcu_dereference(parent->name) : "",
-		  rcu_dereference(kn->name), atomic_read(&kn->active));
+	if (atomic_read(&kn->active) != KN_DEACTIVATED_BIAS) {
+		guard(rcu)();
+		WARN_ONCE(1,
+			  "kernfs_put: %s/%s: released with incorrect active_ref %d\n",
+			  parent ? rcu_dereference(parent->name) : "",
+			  rcu_dereference(kn->name), atomic_read(&kn->active));
+	}
 
 	if (kernfs_type(kn) == KERNFS_LINK)
 		kernfs_put(kn->symlink.target_kn);
-- 
2.53.0

