Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55BA288C2C
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460195; cv=none; b=cQLtaZpPwMAZ6URygyi09w1fpkiEjWcVduq55mUpQngrzeV16U7O8laTOqsKmAACSBZL9379FjoFRhlbASWDzdWNVT933xPSPWIwk5J2B6jmn8f7bQmOLrBvPGxUqVN4ndkCc1ERXWk6un0WWS27+ZE8z3Yn8/YlYu0XzzSFdTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460195; c=relaxed/simple;
	bh=tP7tQ+pTjIAwpf3y+Xztia2Y3JUoH0aFbVahV6X1rPw=;
	h=From:To:Cc:Subject:Date:Message-ID; b=kVApK1KanOhZmVTDm2lzCDS+m5Rr1Ic44UTNZnftaY+moWWwIlopYPi67pnu0bCurofVizyOaQqgJZiIZiD9qPPPghClypqvJerM4bfnc3VYJ+evAJWz6D1tKPyELhMq496bvnXQ0ENNeyNl/LmkvjwDzxa2OqXQpyoUHKsFl/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=O4Qw18lW; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="O4Qw18lW"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-74aa416ebb1so134753137.1
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 18:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460192; x=1786064992;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YhryDmCXAdMa371dc3J+Gw1lOXK58NsnYTGb1lLpE=;
        b=LBw9+iF7WnjFAPe8Yeg6UHRhX8RykDTVMcH1XvLPNs+HHoeUhHCaAw4N1OkNexAi4n
         DwppO1kjFpFjf6dTwRoLixtS3e2o872q/mfur9VEA8fR7XEhnsQgiBXpD4phShvuWfaB
         F6L3UscGxU+089Gfu+iJKEyg/7qZbRcnycxbcfbv8/QpZmDIapKTJX4hXE4W/s+zkwHF
         fQwXeX/HWGdWw08a1MiGlMjVMLuM+YfKDxffDRch6ZtQkdtvx+i+mSg3CyvLbnxOJoXE
         vLtTiv2Xw3ECDL5er8CexlnhY3oGQMhEHJjMRNuVGCkbSkqm9wRyMvkmtHPj0uYsw5at
         346w==
X-Forwarded-Encrypted: i=1; AHgh+RoutU7s+Mz03xUeIhblObC13X/PVWhIyks9BZhdem8nBPOcSC8M/U0cgrOvMB1QeyaIzDHYQFqm7up+ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE7hmisFmk8ywZ+1Xsy5BKCC7LfHYu7BJonJr9zJns8Q8K88Kq
	1iZZJMs9PTe8ee7ssDq3pyY9TE/U8bs5aYx8Ws8XmiFIa4MLfh4a6Aq+ujm/9dvDzvn8ttF6bfr
	m8uX+WOCDl/PZw/np9pCDlyIkrpCfUgjHbg==
X-Gm-Gg: AR+sD12h8qxk5JxwBgfCmFfeyIcYuL812FGQDVZnTi92DKCpk4P/cTIyAGWwUDLlZgi
	niwpvRD6yqy6iv5tdJMmW7L7Ee/Lh92EV1dt61bJc5GlSgKHSY+cdji0RQnoWISibW2Id+di58D
	0MmeoZRP5FEDv4a9rJL22KpKs5zZyKWS3Gl27Vz2+LosF7yFO1VDtMAyP10l62aeAqnPCJPGm5G
	UkSc87jrE0Dy4cekUI+yQUA0sXwym3VY3fEkrlYQ+tfSkuc/PHm9p9GfIYc1243F9xlxvVwk+2/
	euXGou8gXr4uvaaIshdE7zrpIVVXU2bA/F7L+B6u2uHafuMfcJLNHzM7k60Em2W5lxp3495PWW3
	xFr0lTsKCrGHF9YBXuq9gy09aL8/qpzza/1hGJ0s5PcckAnoGoX2FIgYFuY8=
X-Received: by 2002:a05:6102:3e85:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-7575057a17dmr1840340137.29.1785460191607;
        Thu, 30 Jul 2026 18:09:51 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-54-84-120-176.compute-1.amazonaws.com. [54.84.120.176])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7575b860c6fsm318490137.18.2026.07.30.18.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:09:51 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1785460190;
	bh=e4YhryDmCXAdMa371dc3J+Gw1lOXK58NsnYTGb1lLpE=;
	h=From:To:Cc:Subject:Date:From;
	b=O4Qw18lWDiQL8Ys/wSXOZf1Qbqza8ySrnPXD6DmHtmterPmzKdm+xzGS4SwRkqp37
	 o633UhREFEa9+JIwCgZAU2rnfbkMSLvuYu0d1cUJF+MVABnsy0dXDoM/wANrWzocDb
	 4fOwW0ClyifB+krVpQXXhS2pWcwqwvyyFjYO1O8lrbtbClhH2S/ZuZYcRN6108psgO
	 TDiDEzr/tg6oC9Z8eVadSPnRILucbt93TH+gnYM+PQVuFufG4BsHvhlUk0dlsDP9ue
	 5ZR7xPI886DLDWqnnleJ1ceZn7X/8bA/BUNkRcTxbwbDY5GTAd23asGqxAruJaluU+
	 4MtUjda+PL26w==
Received: from kevmitch-g-eos-trunk-2026-07-17.sjc.aristanetworks.com (kevmitch-g-eos-trunk-2026-07-17-us117.sjc.aristanetworks.com [10.242.248.27])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 836FEC271E;
	Fri, 31 Jul 2026 01:09:49 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Kevin Mitchell <kevmitch@arista.com>
To: Tejun Heo <tj@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Mitchell <kevmitch@arista.com>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kernfs: fix race to increment for nr_mmapped in kernfs_fop_mmap()
Date: Thu, 30 Jul 2026 18:09:12 -0700
Message-ID: <20260731010914.233067-2-kevmitch@arista.com>
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
Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
---
Changes in v2:
- Rework the approach to use kernfs_open_file_mutex_lock instead of
  atomics based on feedback from Greg KH.
- Link to v1: https://lore.kernel.org/all/20251119191758.612694-2-kevmitch@arista.com

 fs/kernfs/file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 8e0e90c93372..6f63eb6be1cd 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -495,8 +495,12 @@ static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
 
 	rc = 0;
 	if (!of->mmapped) {
-		of->mmapped = true;
+		struct mutex *mutex = kernfs_open_file_mutex_lock(of->kn);
+
 		of_on(of)->nr_mmapped++;
+		mutex_unlock(mutex)
+;
+		of->mmapped = true;
 		of->vm_ops = vma->vm_ops;
 	}
 	vma->vm_ops = &kernfs_vm_ops;
-- 
2.51.0

