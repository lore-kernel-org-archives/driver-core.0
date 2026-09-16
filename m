Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C43B47CC
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527310; cv=none; b=TzFRaSgGkF92exrpXHItNprGpL8oL1fAuiLFKiBvy3krIx0Mq+rv9jg0NXsQhrDGFJ79PkBSm5l7Z1kwX6QgwdI+PljfaoHPOj/N1GrBSnLdUW9iTBIyGKNvUmSzFLwJhZwJtT4QNM58EY0xazgVzAJz2v2MiBO8x30P+J066hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527310; c=relaxed/simple;
	bh=6aoADYZhEbJzfqIFYcBKU0TdtEge9Kahj4tWqSWoqSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S81XpJk/ukQqBo3ufSt3m05qw+aRFOOWUrE0PAl6UF3Pw1smJTVQhqy1uoIye+P1bWgwMNbsmJmS5h/ycnt+IXplMTMfvpMfae6tci9yz7Xgr03Q2b50NPc8UYp4W8S+buPq3CiUBArx24XVkzNO1YfacE8cuguOBNFNbB0n9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l9ia9M93; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l9ia9M93"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789527304; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Q1Qi+5EG35R0OHrrtzCjjbDLK1TPbvDmlv6vtfqNgNs=;
	b=l9ia9M93ikqBbmxLbskfsTJvVcKl7fw6zkpC/JnkG8ue2NrM8S2bedQbLyw7XT+O5DwP7K1u0+WZYv4fjvChKmO8CCDRgYCg7ENl+8acb5tcGOdcTUm+CGeH1if67eHizDM6gmKBSKvh1+i8u/V5SWsXShf0n+KIi0m25hxol3c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XB3UqDQ_1789527302;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XB3UqDQ_1789527302 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 10:55:02 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Cc: linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH v4 1/2] driver core: Add conditional guard support for device_trylock()
Date: Wed, 16 Sep 2026 10:54:52 +0800
Message-ID: <20260916025453.3532614-2-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260916025453.3532614-1-kanie@linux.alibaba.com>
References: <20260916025453.3532614-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a conditional guard version of device_trylock() for scenarios
that must not block on the device lock. device_trylock() returns 1 on
success like mutex_trylock(), so the default binary condition applies and
ACQUIRE_ERR() reports -EBUSY on contention.

Suggested-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 include/linux/device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..a8d6cf76d137 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1121,6 +1121,7 @@ static inline void device_unlock(struct device *dev)
 
 DEFINE_GUARD(device, struct device *, device_lock(_T), device_unlock(_T))
 DEFINE_GUARD_COND(device, _intr, device_lock_interruptible(_T), _RET == 0)
+DEFINE_GUARD_COND(device, _try, device_trylock(_T))
 
 static inline void device_lock_assert(struct device *dev)
 {
-- 
2.43.7

