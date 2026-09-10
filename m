Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95D19067C
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033231; cv=none; b=nmxPwaBwbUOd+/ePAhGqtv9Lb7cm34FMEGQiI04vM6I76EPKIQOCKY5YFw67nrWsTJNQDmx98SQAEjrXhsfY/7RRlcSNrGSkm66UQrDveHdb+pyZ9ahjTqfdkPjCdvusIha8CJShbgqW9LYn0M4LUIG3QOajwEZvpRK7Nfr6V6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033231; c=relaxed/simple;
	bh=depx8N+P2xv+qgzBbEAyaUbgfZTX1i8CJLN92ZSy08M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehhaVwKTS9dK8BF1cCvqFGu3C4fAvHw1XogCQRNg0U5nQq0DCzeEOuL4Z/aQl6FPpwZdGZ8fxshLKuCsgiGi3tFKl634Jkv7xGHD4cMXwCQUMXFdpPtVU06INa8OWv3qru7SI3tVyX/Y4Ncy5S6GJql9JqSYpeZv33veWJe2YTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YxDQrQsg; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YxDQrQsg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789033226; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/0/ASqNkL3kIvU5svHuqc4GsouS+jUailSatNxqxSIU=;
	b=YxDQrQsgcOs5UqoSsxNit2Rp3sLqZDPqb+gIzCCBAM9VSIp8k64pY6hoX5pjoMdQDzjFiLtNqNTeI2RYxu2VnW3rPO9lZR+DLmhDdYcbvno6pinNjKgU1Z6siPulWb1R907xXMn6WIkmwyfdSRyTxROOOZfCwFyaXfakx9VmYGo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XAhK-6j_1789033225;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XAhK-6j_1789033225 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 17:40:26 +0800
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
Subject: [PATCH v3 1/2] driver core: Add conditional guard support for device_trylock()
Date: Thu, 10 Sep 2026 17:40:16 +0800
Message-ID: <20260910094017.4032170-2-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260910094017.4032170-1-kanie@linux.alibaba.com>
References: <20260910094017.4032170-1-kanie@linux.alibaba.com>
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

