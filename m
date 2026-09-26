Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007D372EE2
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452738; cv=none; b=gsHMjx4xpUccZeYiFv4LfRbrD/5T7JR0SMRUUcZA7+bPcVMWEZhGmd3ZXEUF1oCbhp+ChYKOjg2ZcU31SB/aziGmKgpM+jSiZ8qPwCigB3tD2pz0XQCdTXhIJhSkipFAciFfTKBOOKlKT6sGbK3ykKDxNkwFHkkvuIyg5dAUreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452738; c=relaxed/simple;
	bh=OSBsZUvrhwcSIuPOCdqNSnmPQ4GkNDnc04aQTzCNXic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOROfVcliPqPd0CE1o2OlbOS4+h+pqzMEJqdAUvUwzpKB+UvlhNxfMPxHG4FG13cRFnRcF6UnnmtRNdwt/wXPCykzZD/etCWTTt5Upz+mqDCNE1EPfdtB0YTt2iSff0R/AB6dHOvQNgjr8nrvy8HIVvGLclYN4abgMeSnEcJhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1dYSKB; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1dYSKB"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-9863292a2e9so578022241.1
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452735; x=1791057535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeIZwRgVz0RIdraMrjfODss1t6G6xITndUtYiEdrjvs=;
        b=My1dYSKBPPzreztKomFIyFrp7BvyTMAw4MSunjYMP601LRhyTntdbSBLu/eDOSeUDf
         zsg8ocoWV5mlf9PPPzzkW2UVbzoPXAfC1n2nNSevS7YySLq5rxYyye60deUL8Rppp6vQ
         GBpsOQA4akjO0QNeAxv1F3w3K/PSUEzVuaFhJEhoSc/yb28O1cTs4W17+CcvQkVOtVva
         5t+kVf6lURcbimqptE+IoSv6bQ9bT9EJBMbxXbsjmhvmXeKQAUK68fqjub0SYKkkU1uB
         jX0tHXlCCAsADRivuSJmSeyNQIbJI8HYRmy5aN+t5gNcWwPej37EVIsvId5eT8Vufpc8
         tO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452735; x=1791057535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeIZwRgVz0RIdraMrjfODss1t6G6xITndUtYiEdrjvs=;
        b=YsTOfRhcJbntOUTXJp6N4YLbBPO56dVffbD45hAdmC98fCo8+HMu2zx4aQ/LZNnLfN
         Xx9A/XTefXgBY0HUioDe9+iZ35E+vdrdILiWJQHf9GC5svamhRpJ95pjloXfbrF2C/Sr
         mVhK6uyyNGuQwoX/FKcopGD+/kiGYoFiZe+tY8NVzfAKhB0QDCPeob8J7lns5pUcGlNx
         mXo3OSOgPvdEApoiG7k2yAS2PLiVWzUfqEqmYksqBN/172GkmYExmdNbJUC6MPUqAUn6
         8LoxNLV+Q9cPXlUwmCqeA2G/hxx20M8L8ptmfBUrJSxNsgioca0Gf1plCYV4AMMQjP0o
         Q1bQ==
X-Forwarded-Encrypted: i=1; AKwUvByOaKvZsc5M/bjgzehSwVh5GrbbsnJ8JDp7cYUQ/20DVpzsMdPqAHTeOE1dJO8cYAW7BhGEr5ZEBxxTGA==@lists.linux.dev
X-Gm-Message-State: AFuF++k92u2Timb+YlEBNUHBJNBUJMvFmVSVP37ay6D0Jyiiah9A3lHd
	NZ7SO3juqp6RoHy/aZeeUW5RzcdmOLtFZf1muuqKQOXUeJvVJK57cmHe
X-Gm-Gg: AYBFou1QZAtk+z0HP/Od5kYEQ5P+5mIrPtcA6TRxpZbFd33y8KQi4+wzyf9Ex1hPdHE
	DD23RvnG7GBg+rkdC9HKWjIkDjFcxDlKdqJRl/7nTje2MzD0FUGTlF43YlE2pIKubEUG6TOByjZ
	qY5rLiu5Uf0tkRzDmKR79SN1TDzos9v23eXXDsKUbivYkSdOnCVkiSTydZ9QYOrVX5A6AFk9f94
	dMKGgItwFj6SMWCCfR+4tRRzchhKuzeMiKmAZigkg7KJPDgKP01qrh4Qv5SlofsHSKlpJh6u8HF
	CmPf95qYo7yH4fzGRIGO7ldzk/kFa6wmBCfbrCKNGWrW1gflMfEilOXMd3eGwNPPm5KNqCqcxL7
	sqhg9m5jVZGLJF80akTqgyG/WFfwrZ5D3sE6XhK8/86aE0yVwmkNAyC2NwJpYab7gv0ckbn/q1C
	1QwMCGx3sJZRSCw3OeVxORqXgzB91Q4T+JzbgxB7+Hq3VVkj1TFfIHDmkFVq+rHlYkTpfWeJQlt
	w==
X-Received: by 2002:a05:6102:3912:b0:7a5:9a:3a31 with SMTP id ada2fe7eead31-7af1e0ef5f1mr3624522137.34.1790452735029;
        Sat, 26 Sep 2026 12:58:55 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:58:54 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v4 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sat, 26 Sep 2026 16:58:42 -0300
Message-ID: <20260926195844.1296333-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
References: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:
  - Patch 1/2: drop GFP_ATOMIC as suggested by Danilo.  Measure the
    string length under rcu_read_lock(), allocate with GFP_KERNEL
    outside the RCU critical section, then re-read and copy with
    strscpy() under a second rcu_read_lock().  If the current string
    no longer fits the allocated buffer, retry with a PAGE_SIZE
    allocation (upper bound enforced by the write path).
  - Patch 2/2: unchanged.
  - KASAN stress testing with both fixes applied completed with 0
    reports; the concurrent-writer reproducer produces ~3900 double-free
    reports without patch 2.

Danilo also suggested introducing a struct debugfs_string with explicit
synchronization to provide callers with a proper synchronization
contract.  I agree that would address the broader API issue,
and I'd be happy to work on it as a separate follow-up series
if you think that would be useful.


v3: regenerate patches with git format-patch (v2 failed to apply).
v2: split into two patches, add Assisted-by, include KASAN splat.
v1: https://lore.kernel.org/driver-core/20260925175831.3701812-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  debugfs: fix use-after-free in debugfs_read_file_str()
  debugfs: serialize concurrent writers in debugfs_write_file_str()

 fs/debugfs/file.c | 55 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)


base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
--
2.43.0

