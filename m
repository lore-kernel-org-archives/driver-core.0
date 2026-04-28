Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C53D6CD6
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366352; cv=none; b=cC4+PVzQfY96mPEopYsunogwmQaqQqTpFgVsXcvFssZgix7zDSyXjlklNwda8Cdy7TLYBY/cpkbps8ibbMoHDm+vKlpQI7AZMhhe96KqRWQpypj5BquLRVcaPIT1ocH+NQWBORJtOgOqmhNSscwlUH/3Mp3Xg0eO2a2Jp8u4bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366352; c=relaxed/simple;
	bh=RLwD2N0mv9roKLCXFV0rn/6h7B6QYUYygiZ/+w9HG6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PV6HfA3c5PIPec/dn2hHq1Tw1fmYB5GgkRZI0bAbBQKxU6VSZWkjnR6gN1oWB/2mEDTnOQJjEQiUbPON3YNhB+KDneJ4mhhN/UR4uActIhriYNDBmRCKmvq6X082SQveV/EhHRA7aNNGLh7J1yoS9YkQ8DqMr3mgtW3bsHrfjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WxWzLWhh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WxWzLWhh"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso7312102a91.2
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777366348; x=1777971148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3sNHSEvdT5tHKgIgohZAf9cczsNpU7ZSQz8YQr/Ej8=;
        b=WxWzLWhh/9EnMe9SDEY03Mfh9tULmqHRxIGJ7X2E+GDgBbDaAWycXKSET8INVglMkL
         6p5lpAriPWVI4WF/jfam2HbUCrAIPAvgNjnQm7gz2PDtYl22UFwMkpz2/PSYMwWHKTtF
         UMLhLzSl75uYxo/j5AogWd4HgAUx4Mj8vlXk3U3FmmsRZ7WzEEP3xZQSjaMk1h4i13px
         nV/O61Tj44vBM12lAo151Hkt3WIMWzChMOGxvjN3HEDbjhDDhntgTqZbg46qyCa3Ap/v
         TIbcmyzrHMMl+1T5Q1p+Ndl4yiuPMeVuHY9OsoVT5pay7pM3Ac7HuzmoUE1PbYSK9KXy
         sG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366348; x=1777971148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3sNHSEvdT5tHKgIgohZAf9cczsNpU7ZSQz8YQr/Ej8=;
        b=tUaSH+8uGtWIi+X2NKgZF4JOr1draI3XnrjH26vMszECgCEw3xO/WWA/VgeMLkFg0H
         Y07/CdQdD3Nh2ta34J6uaSejjXOfWyfKX7WjCTNxctir4Z35fD/0+F+YuQZ34VBIvdLF
         CrcJ5ZDYkx8tN4QWOFNJintZJBYGh+TneHHOD3aGr+z+VbWz4TKuhw0lDXYf0QZEKLh8
         nx28fJ4+lXIh6ZKdRY5gx4Tpkbtgh+757Z0Wid2eg01Z2N0FZIS4WYPuri+j8sbmJnAU
         zP/vtkQM6gA24QsOFQuyL+KdYKKWjfqvHo/28lYspgOoDcR4MS8p60QY31dZMB3n6dth
         NH9w==
X-Forwarded-Encrypted: i=1; AFNElJ+pN8JfNLIXE1GBib7U+GUuBpL3iMJ7fYkckeqftiiWdE2cEfqGgVKRTELWfJCTY/mnN5bYqbaHa+LbAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUk1OGTXfskQXFrEV9X9ebdVYUsDGhuFpsVwz22TZVrf/bNc2M
	alltR/ppjKw0e3Co1wlk8B1UzmA/Qk/ghc3k1G2lcXERXuPTCeYAVorZC5jbYAMlD1I=
X-Gm-Gg: AeBDieuxB5nBhYkBE65GYApEhC2cDQGak/mIapaul9vAZxWEqF7slgUQ1lg8EGbd3Ks
	FHDVC98wcSjWHGQ7CP6g+tmDi73qG23D6o85yBY2WzMveRjRjLa4AdASTtl16+mDkQjtxiTjBIx
	PptU7uV28z77Ct8/XxJvfDg6McJF5Bw52/yQ/JZcUF2dcYBTfWe8b2F5EFWXmWeeUj02PFj+nqc
	WcvMp4faX62VfAi1MokU0gDJ/2YaC05jKIuZIwvR12SW/45lPBe6mj7IxZSVkTPj5pvE527MYrg
	cjBLg22INgTr/o/BkI/3CrWM6gE0u0ApNlFNBNwQt5KBXDqfIPcs6Ii8SyYsNxhc5JbnWcPMbqq
	ABLL6PLvh8iBr8xZEzEERKdKYsjBbjxlt/yMUYwUXfOJ2Beht28ldbQ+avy8sFKqJ05fY9TclMZ
	9ReDwCBDDErA23zwJnYbEO5TUencrRWeI9K1vLXhFj8weaWz8PFesT4QA=
X-Received: by 2002:a17:90b:2ccb:b0:362:ded3:bbcb with SMTP id 98e67ed59e1d1-3649204c801mr2305930a91.25.1777366348422;
        Tue, 28 Apr 2026 01:52:28 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm2889080a91.15.2026.04.28.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:52:28 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Vishal Verma <vishal.l.verma@intel.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 0/3] mm: Fix memory block leaks and locking
Date: Tue, 28 Apr 2026 16:52:16 +0800
Message-Id: <20260428085219.1316047-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two memory block device reference leaks and one
locking issue around the per-memory_block hwpoison counter.

Changes in v2:
- Add Acked-by from Oscar Salvador to patch 1.
- Keep the series as pure bug fixes; defer
  memory_block_get_by_id()/memory_block_put cleanup to a separate
  series.
- Add Reviewed-by from Miaohe Lin to patch 2.
- Add device_hotplug_lock handling in patch 3.

Muchun Song (3):
  mm/memory_hotplug: fix memory block reference leak on remove
  drivers/base/memory: fix memory block reference leak in poison
    accounting
  drivers/base/memory: fix locking for poison accounting lookup

 drivers/base/memory.c | 18 ++++++++++++++----
 mm/memory_hotplug.c   |  2 ++
 2 files changed, 16 insertions(+), 4 deletions(-)


base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
-- 
2.20.1

