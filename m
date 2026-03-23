Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B571684A4
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256437; cv=none; b=jB9Lh/CZI0Svp1nhmD+OoI3VmjOeeOzGjo/FN7dUE4hzSOyRMmtGsrIVsBSjbOk8wdCj73lUeCDhZiu5du/A51wVN5J6kISUtf4s5qJJArKQ8Ir5OoV897fo7VGiQXcvpIsdswInOcqWPyikDnxYx+N/Na/iZ4qecQtyy8Kh2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256437; c=relaxed/simple;
	bh=qQrOSHf0WJEFpQioIq+31gpjWdkGTgezHWFp2FWOmTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Por8MxspWv6ps3lP1FMYKg+SE/0veU5Jo9DMLUVPOHMUAFWtcvwdxI6DEQjLKkUk4kcy66747LDXe431DZfaPfNgUhBW9uy3YRGZJU1QkeWJ12uT9zSaFrnw02mWJT8F1ECGo9H6uj5ITzVV585A30X2FvJXtlF8FpL59YKjxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVq4AQLs; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVq4AQLs"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732165d1eso5006510c88.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256436; x=1774861236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=273aLwz/em1jqAyb3LReQqEgJUsg7bfCsBCihZh13oI=;
        b=UVq4AQLs6JB5JCcgFI6Y7yWVpCENnqFCizNxLpViRY3h/DQKCZmB7jZJQSFivVjHrH
         Aqn3ZFbk7QVSEFntzYVRbQYlZBRgreGrJ6XH6SvmCJQAvJo0qjMl/Y3vrOFBYe5y/K8x
         Q+nnbZZlZxocapgg3QHLLCzf8dEp0ippwjMmGSDqlq3E6X1GFq24rvqUXxZRq0IKykpW
         9M1FrZrqTZ0iYsSFMcgaE+NohaxOF8+3GSO0t5H0IC+LeHFLLsBSsk4XLiC7efXMq9zL
         Y/6ANrqr1WS+gYXi15sZKnq2aWt2x5cVGDtgEICd9guLHIGflpbbN1i3frNsTi/e/rX1
         pwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256436; x=1774861236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=273aLwz/em1jqAyb3LReQqEgJUsg7bfCsBCihZh13oI=;
        b=No9eAbNXNAbM9Q88NpYJo6TmJD1o4vOIMsY3K2oq7Q7eeFBiN9+wlBLzE8iCVfD9Hv
         ockP4dZWek0sHDGo7c9Z5H+VrmKguwZuVixDjuB8xNhth6AGGt1Uy8qs3L+eza2Cur0J
         qOJucOev1T+KtRZciGZReraKQZJMS9YzLinBWUWf0STnwkkGCQTkNKXsM25EW/QP778q
         Qt4yeLROBoVi09c5vp8Aqs4goDhKNIR4jdz1sMhMgdFQhw1fRiWGPoDGqtaQdVqAL9tU
         kh4PkTLp9WiRDwo+ns3hJvOITCSgGCe5WWbZ2ecMDpchS976+B6P/JJ4tv2iP9/JjFn2
         qbZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWEUBObTQhJVUE/pz+cFRrwleFctoCp3ZGNCpWDGmIoYPrsQXfaxsGq4E4TNqhO3rUbi09jFLn5mpO6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj92CkApWd5ztas+GeFyz1d/ANgshuiJNrXrlmGDhet9ihvBWF
	/T34Ee8VCQuWcR/r/DY2EEhVs4LTQWffJuzUQUeq3BUsRW+ukTK/fizZ
X-Gm-Gg: ATEYQzwbdGmDCOuxp7fp+qQsqDE7LOwlEHo3muHkC3c0kHAZaez6YtKDHxmXk3aAHGR
	u0bfQV6Yu4LGv4oRpwRpuCVYRPnb17oAuI3LML6NYNhp2Mk39r9TUnbX2FDxCodiTBhZ6qipHa3
	olXfjvwQu4PPR6Ce+FlpskmUDRnoFZGl3FvBD5lBB9QZuE1hhDEPa/rIoV/g+8mnIwPjVIAHEJQ
	qY/Jbt2xB+F89yjnPZPzr5+ZFpRgPfAdxgUWIWUj/qHRXJqjeBhf94T/NdeAlnsJ4EwaMJ+kfki
	TIg7yb4BWR0Fbj2yG5rfmXied94fjz2x6fDUelTlXUgGdleUnuxOwcYTnf0AE5mHmMFvCi6XoP8
	L/WhNAo99IxJfD6vKpwnFj0iAXPUkGQAqR8Ju50peSzM0GydCEExgwDWuNmeRN1EvIIaIZP9baO
	SC6lQuOmC1tqzAteGqbm3zmOGNeeX7xJQbQ8CPjeWkSnonzNkDMzGO2njQbVtFOyP2xZFCQ/s3o
	tFpzUhceJooS5VwDwUeXbfx6oqxOKyePyp2DgWKv5b/TQLuR5du4giXeSrGbExvAW8=
X-Received: by 2002:a05:7022:252c:b0:128:c1be:152b with SMTP id a92af1059eb24-12a7263d77fmr4636197c88.4.1774256430993;
        Mon, 23 Mar 2026 02:00:30 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:00:30 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2 0/3] debugfs: disallow NULL string creation and fix callers
Date: Mon, 23 Mar 2026 16:58:43 +0800
Message-ID: <20260323085930.88894-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent bug report [1] highlighted a NULL pointer dereference when
reading a debugfs string file created with a NULL pointer. The community
discussed the issue and agreed that creating string nodes with NULL is
invalid and should be forbidden at creation time [2]. Since no fix was
submitted following the discussion, I have implemented the agreed
solution.

Patch 1 modifies debugfs_create_str() to reject NULL pointers, returning
early and triggering a WARN_ON to expose offending callers.

Patch 2 is a code hygiene fix. While modifying the file, I noticed the
EXPORT_SYMBOL_GPL for debugfs_create_str() was misplaced far away from
the function body. This patch moves it to the correct location.

I carefully audited existing callers across the kernel tree. Some
drivers passing NULL have already been independently identified and
fixed [3]. The remaining subsystem (soundwire) is addressed in patch 3
by initializing its string parameter to an empty string (""). The
existing code correctly and safely handles empty strings.

While auditing, I also noticed a devm_kstrdup/kfree mismatch in the 
interconnect subsystem which has been addressed in a separate patch [4].

Changes in v2:
- Link to v1: https://lore.kernel.org/driver-core/20260317185920.43387-1-hanguidong02@gmail.com/
- Patch 1 & 2: No changes.
- Patch 3: Rewritten to use kstrdup() instead of devm_kstrdup() to match
  debugfs's kfree() behavior. Moved initialization to sdw_debugfs_init()
  to correctly handle the global pointer and avoid overwriting during
  slave probe.
- Patch 4 (drm/i915): Dropped. Further analysis confirmed those specific
  pointers are not passed to debugfs_create_str() [5].

[1] https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
[2] https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1
[4] https://lore.kernel.org/linux-pm/20260318024815.7655-1-hanguidong02@gmail.com/
[5] https://lore.kernel.org/driver-core/8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com/

Gui-Dong Han (3):
  debugfs: check for NULL pointer in debugfs_create_str()
  debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
  soundwire: debugfs: initialize firmware_file to empty string

 drivers/soundwire/debugfs.c | 9 +++++++--
 fs/debugfs/file.c           | 7 +++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0

