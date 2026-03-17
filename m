Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439A37F743
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774003; cv=none; b=M4LqJxa05KXS35Ox1pSazdejbMY0qPlKdMv4e7Mui3oP/LdNyxN/I/aCzY/H8Nd9HzedNwuAZfnRcgKovTre+L0N7XXd6o6iJIFZOMrKC6vMkUDMGnVFFK7Ne7Ok/PfrK9vS+8jUAsjCXXizZejx6fZRLtT6mgWq83GldTLiiQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774003; c=relaxed/simple;
	bh=7toBs7ZZhUyluOq0svKcjp6u10Tro12z91fbmv9V774=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hf4A9Q2kLkMnekfo1Yb/ILkk9LByrmfOERCCLT6n8lpnzf+sgFff5jdNCsKwwzp6SZH7lYW/5LhLE/mBTJishnNCo/5mJ6JBUAvr/DJFg4ZbSIAibG1LDPImk+OQq8kP0YgGCKiASgC10Q1OoMgzal4th5t5dG1cdv/PVi7OlEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRbH1Pfc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRbH1Pfc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso2528982a91.3
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774001; x=1774378801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PcwMDnihsdnmKVOsfDRGKcGqZ39RTcsdWpVCxqwOIE=;
        b=QRbH1PfcIgfWeCSLNZvv1C1EH83vzFrxa7aHlXD+bODS8yzEi881i1D9G2q5DQ5pHy
         ylPVHouKyQEm2IaZNsXB9IDZMAVy02GCWEKheNDk8Meid6sEFpa7ShhRM9dij/D+9EJn
         W10YxmSMR8yDMzcAxTtnzH9Ob+O+ZviHMlvWNvJU75YnKAWfSYMBUoTTa+8FIqUXSpF9
         WrXKc3EEXyHDrI3E4Xj4OAI4FnB2tPEh9VxDBYZBdSBLNNIiTlZ0J1g4SoReETXWNgep
         RPOfZQA0hLF7b7VE64lHeYFmM6PWgNrYVwFIk9VmK81Uiq6mtxyKbMk+s1O0SPJUbr2u
         cxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774001; x=1774378801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PcwMDnihsdnmKVOsfDRGKcGqZ39RTcsdWpVCxqwOIE=;
        b=HpIiXvJlrm++NIsmI8Qz9xl0sxFjawLAZWsSUaPibWe8YFMJqyKkiweov79UfSQX2c
         qo4H74abW82VnSjXUIRn3n1Kj7LqnrDT/EzWsiZYEjeVFoCtzuC631tGazAXr3yEC1w6
         N6bLOB3bonmYRgp+uaxtvdlrvQBmdZEzdAtlUjKxXesKtIu2eHULUXSuQJzSi1dOijf1
         gGX5kVxOCIbUYxPhze8VdSFev5aHkbjQJhxkgfHTHJhnbjta+gmze3xqEkOLFY5GQESW
         Yd8zNq9QT5PJcW6VrAbjYJKfVmjXJMY3vK8veqVcjo2CNTQFTHOVyrI7oj0fC1kEQlcK
         onyA==
X-Forwarded-Encrypted: i=1; AJvYcCXeA3GLyaC3UwCjNIvVWxv0KDyOO0jySp7x2Z2SKHECOmMvIjKSGtStlADu7Clr2wbxcD9EHL+pdreTjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlYPNCycvm9KFIsgdAMvpvGk3Xf94zxTvWv7iy3+VskkhunBn/
	bQSd8QZFItuhWquOyzSSDH6OvBvx14J+LPYrJmtZ7ZALItxJDJlB5RoA
X-Gm-Gg: ATEYQzwI5kGWtQAhG7QwuI3G0kK1MNQMkpJvuodg0p6z/47tXRhTmWdBXl8hhELb+Yf
	0068LKBRCenpCp2BEFij++8RYvJhKE99YZzXzqYn9/ypDR6DTxtz9coVs+/zdNfB2ntmlDunZ/7
	QMzMgl0PlKEV0NPxbJB7E5qM12DSe0ArEOhurdbI58y0NX1fTeJRiJVtZhKiGrtZw6moWCPmJ99
	GfvRfbY3AtGDzSQIVvuj2Mc8TCaqe9m/Yftzsl4zewdfN+FiixrBTJP4uy4c2+UPEJmzRXroIpC
	dYNf4niBudlsiKMSZzUrL82ZSX49Jnxd+37/K02kThBKKtSLf/6X+vuT0fiIls+4Cau0JJ+we3w
	N2zZVAdhGYYLqy6/XU5drBftAAyhbTUz6F9zO7iWj3sXGwrR4g9+MnLzyNmLznmISVMfqw+992/
	5u+YqPYbyYn+Kx3DeR/OloG2p00izhRQ/WMwEIjS/+ahEzhuFMHKiZ0hSi6JOJXdSPUiKl6Azuf
	m+E7TQKRsuMzGISFv50yH5o+Cu1s+/JKz+oP8afwpOttEEkB/rsKQjfTpFw+7Q8v7feSQ==
X-Received: by 2002:a17:90b:1dcd:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-35bb9e45688mr490920a91.5.1773774001443;
        Tue, 17 Mar 2026 12:00:01 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.11.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:01 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 0/4] debugfs: disallow NULL string creation and fix callers
Date: Wed, 18 Mar 2026 02:59:09 +0800
Message-ID: <20260317185920.43387-1-hanguidong02@gmail.com>
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
fixed [3]. The remaining two subsystems (soundwire and drm/i915) are
addressed in patches 3 and 4 by initializing their respective string
parameters to empty strings (""). The existing logic in both subsystems
correctly and safely handles empty strings.

[1] https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
[2] https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1

Gui-Dong Han (4):
  debugfs: check for NULL pointer in debugfs_create_str()
  debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
  soundwire: debugfs: initialize firmware_file to empty string
  drm/i915/display: initialize string params to empty strings

 drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
 drivers/soundwire/debugfs.c                         | 5 +++--
 fs/debugfs/file.c                                   | 7 +++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0

