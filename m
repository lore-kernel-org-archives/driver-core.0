Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB533BBAB
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058850; cv=none; b=rg+eLp2ZQWvu+Ri3lJvBrrBg+htwLNXxu1ewvClc0GF3TKblIXhWgTW4m9i5Uv1CbVdisKoGNS11WE+7iabAOBtYgbH4xwmY6cD92wvMIpHn4svsWxFxfQj3zxMM0arfunGE+RpZbbg1+6CEbGiL0fEW+bjSXc3+VTPBZt7ApEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058850; c=relaxed/simple;
	bh=vFBhJxCAsIAwYNZ/g3MViZPMIkoQrogOPMTX+aObVJo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LLfffqn4harHSmYShZSvFxlB18idtl9B6tlLIGfx3pDUEOl+EXM8+focGHsSGCaJjCMqKFnsrkliw99Pyl7k2MMcoHVi6O9UThReKquJkwrr2DOijPPJ+7rHamnFuk4kUKDdlc++ZG0cKlYTHZCCvWnRBb/IMWnzvoCd4l1xD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C0vNnK2B; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0vNnK2B"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8273494d873so78253b3a.1
        for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 14:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772058849; x=1772663649; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HB0CfyRs1BRb9GE8lihqLejpd0gkHTcJItDcn1kg/F8=;
        b=C0vNnK2BZv9m+enlsPb2VvJN/7qBnY1sxWF74fCcz90iwwzF55C82m5xRueOVHPspi
         O+aIETUR/btHTnR6S9WhUzjblcDlzSlnxfDXZ3F16a22Mis4XIDLvm3f5Xo/qqVeI1Mm
         ubol6PEUODKHtm+JLlLiZZ8tV0ZbyougPdMz/Cnfg0oT2m3Y0VsIzkkB2863pTESWIUU
         VewmobYm4cPvpQgZkcbUnrk4rtDNtBdjCMG51MgjIhw84sbnS/UfW/63tYliiFx5WEX9
         tXPPsEdG7ncVVNIdgY+i9HC+EQXKl/GCww8IGX47C8OY8Sl81rJo5DI4VV1kkVxr+PrZ
         FOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058849; x=1772663649;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HB0CfyRs1BRb9GE8lihqLejpd0gkHTcJItDcn1kg/F8=;
        b=rB6qQkDW07sJ6Bm6PqJB1SvKFRQiVoSvKQ0ec6x1DvRmgReommz8KswInlQGiYRq61
         lTrCtuMMtzOMpISePP98HGiXX11sfsjA2xvWVcv51YpM1H+K1qKwFynlu9lDQMEm7G5E
         EYM+9ZGk9o6AtaLkOsAjFzXTP2qleYAOEKgbhAdh8OCeHX1Z7iJTYG2MidT2hwTTyrJ0
         DSw3cG89Lca95oycaNU9UF9bg4jO6IuL6QmVEo+ULyM+GEEeYoiMSxl2WP0HpU+h0JjM
         kAx4B1LfdQHYe2yYcdx54+JfcJztdrXD+1WnM8B1/b1536pLBWD8QKTubmr3ar/wKU5c
         H9vg==
X-Forwarded-Encrypted: i=1; AJvYcCVRC2HgCQ5mhxanMLcG9h0dt7t6D6RIxdpkFzsKCdYe9B6RDbUnCZBgI8HUXWkX2h4ju5eO0V4QJDuQ4w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6wZHu5KUYc2wcL0dvuF2bJOk3aZq2g20LJzwP5e2LYJkG8w7n
	e1wb8tD5XSNAEWPuql/KLCoFmp8O+3XKDBmRm7Q0STKEH3M34gOb3/6sCgf+JEOAPQLmLiwEHIC
	A6ersre8dls+/nlFtkw==
X-Received: from pfbbk2.prod.google.com ([2002:aa7:8302:0:b0:7fa:f279:2d1d])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:cc8:b0:827:2b7f:e1d0 with SMTP id d2e1a72fcca58-82739827658mr536889b3a.24.1772058848945;
 Wed, 25 Feb 2026 14:34:08 -0800 (PST)
Date: Wed, 25 Feb 2026 14:34:01 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225223404.783173-1-tjmercier@google.com>
Subject: [PATCH v5 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
events to kernfs files and directories.

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
Patch 1 preemptively addresses a race to set/clear i_nlink that would
        arise in patch 2.
Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
        on file / dir removal.
Patch 3 adds selftests to verify the new behavior.

---
Changes in v5:
Add comment about inotify, and fanotify limitataions per Tejun
Add Tejun's Ack to new patch 2
Fix circular locking reported by syzbot in patch 2
https://lore.kernel.org/all/CABdmKX3jMS5ha2s5FMpnAMW0c9+Wmpmyc+8=D-24KyhVjBJvYg@mail.gmail.com/
Add Tested-by: for syzbot as requested

Changes in v4:
Clear inode i_nlink upon kernfs removal instead of calling fsnotify
from kernfs per Jan. This adds support for directories.
Abandon support for files removed from vfs_writes.
Add selftest for directory watch per Amir.
Add Amir's Ack to selftests.

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
  kernfs: Don't set_nlink for directories being removed
  kernfs: Send IN_DELETE_SELF and IN_IGNORED
  selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED

 fs/kernfs/dir.c                               |  56 ++++++++-
 fs/kernfs/inode.c                             |   2 +-
 .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
 3 files changed, 165 insertions(+), 5 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.414.gf7e9f6c205-goog

