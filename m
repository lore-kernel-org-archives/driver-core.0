Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D58428DF2D
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 03:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771384967; cv=none; b=BW4PpH3CN1zVgwQeSIcWv2igqrNdb1NMr0i/O/e7XHgv1dr7nyPifUgs0puM3/LKYmo7/Di4YFTH+hZ+ehO8lnT97Fxz/+MccOuUF6gPXGv/OctyrWR6+THQ2KQhJNt3pDCZm7fg63uM4Vkelx2nY0mvNawTQ96Nx2S1F6EfCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771384967; c=relaxed/simple;
	bh=32HF38AOD/I/0DWJn1DNDyTIUijzlwxnIPrqmmhrMEc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T7s4mHRHrLj5o7RNM+/QsTiwgwThrwuyESvUfwfPQwvCOeNygoLwadk0HIRS/xeKsODIhSpzsn/dMc8aXOz3q2B5kUh29h7iYwVC9hcVZhyBXJgLJZZJQhJNptDlkxx1uylR+hIRKQsYwuTaxiPp3jyiU4of/mVk90KBi6b0F2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jDE3k8Fr; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jDE3k8Fr"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so5113068a91.0
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 19:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771384965; x=1771989765; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5oh2GGuUIGHttG6QQKJrDgyvg+KF11aDAOaopsiwdo=;
        b=jDE3k8FrWo/ukjbfSFjlKMIcIIG6vpYveBCcIIfKEhSKEVd82ivbJGZd3AgzuH4jLW
         iyT0IfwQVNXHpSBSjs1komDiyuAk6FSU9/QElZCfNqANvhkUj2Az0eRacRrFpvIBOPm1
         86BaNK5HIgxCXMjrq2+I3slGt0F5ShvTs4wJvU0+UNvmTq0apYRk9Ak3qLm721fpdNRI
         KaAt1CzUIHeXCSXUjkzkEaA/OFKO/Sk+dlgCXk0r8ZM1USzshXmuRWliPEmb8QRld7c7
         3fh8F36yVD4TWeWHuEo09JMLJGVfdfrM2kzQ7QlqxOYzexpv1NLZIyMDLREVtfxyGu75
         YLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771384965; x=1771989765;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5oh2GGuUIGHttG6QQKJrDgyvg+KF11aDAOaopsiwdo=;
        b=vLa+GwyCMN1ESkkdQPQwfKWPBw2qLQRnQEXR+40yn0x4imDB2sRcblnry3+mzvON7V
         HEwIWBkBK57d9+keRo12dRutIsrVlpB9VJY4ehyhVoFeHWcaY/hNyoI7a7nAaLwMDGBZ
         QCI0CS1wgbz57Q3ZWIx0rukzddgytYjjy5oVbsQym/D6azLzqyL0HRMNpG4cZ1//ZkSC
         XyKIri107O1/NZKV1w8j0ff7/sarw+ebzf64J4pbU/CpFxO4xGvHpAajk6GdYfjLrE3J
         2Hikp0qhy2zUXH6XR+x9g+NmESdgymg4vnBm8UI2nxGpXGi8NhreIYd7U5ETHkiX3vS6
         gG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmaEH/QLAytbPAiFtD7gf+yNlnzerDPq3dvOiCOCm7WvrQpD2WghcDc7u52GzQhxj8oP+U+feXpXGz2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+HpVg7ejyDWz4vmENyBA0uauWAbRs56foq0FPEABqoneebV+q
	YS4QvFk8+m+lwHL+O+amcff5BSJE8zmBNCnZe72ETEot5W2XDOYnOBoEtFmSLdWCXMd/HLbigRY
	1iZMjoSUMAL7HZ+8iqg==
X-Received: from pjal2.prod.google.com ([2002:a17:90a:1502:b0:34a:bebf:c162])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c08:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-35889194a48mr474071a91.26.1771384964802;
 Tue, 17 Feb 2026 19:22:44 -0800 (PST)
Date: Tue, 17 Feb 2026 19:22:29 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260218032232.4049467-1-tjmercier@google.com>
Subject: [PATCH v3 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
 for files
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
events to kernfs files.

Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
but fails to notify watchers when the file is removed (e.g. during
cgroup destruction). This forces userspace monitors to maintain resource
intensive side-channels like pidfds, procfs polling, or redundant
directory watches to detect when a cgroup dies and a watched file is
removed.

By generating IN_DELETE_SELF events on destruction, we allow watchers to
rely on a single watch descriptor for the entire lifecycle of the
monitored file, reducing resource usage (file descriptors, CPU cycles)
and complexity in userspace.

The series is structured as follows:
Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
        on file removal.
Patch 3 adds selftests to verify the new behavior.

---
Changes in v3:
Remove parent IN_DELETE notification per Amir.
  Refactored kernfs_notify_workfn to avoid grabbing parent when
  unnecessary for DELETE events as a result.
Use notify_event for fsnotify_inode call per Amir
Initialize memcg pointers to NULL in selftests
Add Amir's Ack
Add Tejun's Acks to the series

Changes in v2:
Remove unused variables from new selftests per kernel test robot
Fix kernfs_type argument per Tejun
Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Tejun

T.J. Mercier (3):
  kernfs: allow passing fsnotify event types
  kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
  selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
    memory.events

 fs/kernfs/dir.c                               |  21 +++
 fs/kernfs/file.c                              |  49 ++++---
 fs/kernfs/kernfs-internal.h                   |   3 +
 include/linux/kernfs.h                        |   1 +
 .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
 5 files changed, 175 insertions(+), 21 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.310.g728cabbaf7-goog

