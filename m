Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE4315D35
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566909; cv=none; b=GB/ju/Lp0R4UFLBv7zfnBt6oLUGKDcSwFZDwkbOtIYH7VPyP4eXaTjqR0Xr33ZQLKgWFU6byNsIze77VgIV/OpIXT8E/dvZcuhI7KwNfT9Om7Dh/esjU3DrxSMD9pIY1ApIJIrmEs+I2t2myKlJbRGjkIdG24riiHozJCnDy1UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566909; c=relaxed/simple;
	bh=SETEcec1D+mm0BU0dgNl2Gb3HG9APdLtZ19G+u8CMQc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c96SyqSIgHBAoXC6qbs1fyoHr+Lvoo10mTRD+2zalSsg0wcLnonTa2Oj1uzTxh8pq14JOjYDJ80Aww6SWdJWUG2/NI9ltlHyZktaIJDjTPBR2A2WOjadfkylblKyIo5O6jVhRUdAB1SRaVkBQ7o3YySRSeV84/DCB6B4nnitrXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=re4orYks; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="re4orYks"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-352e214cce9so1259584a91.1
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566908; x=1772171708; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PhOr9xc8hsjU1exlkJ9o+lRZ6CwgWrB0En0qqwGcrsk=;
        b=re4orYksvPD+q3UUEix5kmhp6F6QmUafSbwvmhCgK9vcxTG5hNB9NL0btaRvSbZAxz
         mn43Le0xDf/5QoscYDBjmmS3reH+kH3RfP1vAuBT4cNDO3TVCV+Hxm7YSPIqMtFt+S0t
         ojfzwsiuEFjLoMVuwEA1dd2dTjkdsl9eaT2MVLBMauogAYuJmrXNCFmASk0mZq4cYsiL
         c8kbsfny7AqtaV9RmMzI2qDemuCs7rqhgdKe87LpPyWRzp4wyL43KRbvFPZRRylBO5jS
         iXYmbgtle7cARtaOs6fJ9Ti6g/6ojRHC6vLcLqALYQtUMffiRwTHjhkKdlB0rzucg3xS
         ri1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566908; x=1772171708;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhOr9xc8hsjU1exlkJ9o+lRZ6CwgWrB0En0qqwGcrsk=;
        b=WW0bEvgr/UyzHhc6GiV1wcgAoAfRyGzL70LnT75D/jlZjeTUoK92egbXBwFcl6BNYt
         AIUwn1v2vzRevnMxFlEuu7n3g22XOArvXZhdHeeL2grQ5xdBp9z4A3SCz6LjTLOb2OJ7
         QO5rSpZzddr4pZNli7zBnfyYh3emO1/4Dn6apAgBK6lhBtGQtIYOSktY9BZJxadS2OJd
         4Qhn60OyZeXdtbJVhSM2/Dihq3CN+D6IcwszvNBqShJ4zfGEERnxvPsHOUu8NhI3AkMf
         H4d6DpxHEqLcxXTNA48F5KONDWZwSEVDp4YIc7cf3+m/N8rJEAjaiY7o+lvW+2xCFRl0
         x85A==
X-Forwarded-Encrypted: i=1; AJvYcCWvRy6MKk19nRSQopPjsyJCAxEGZftu/YtB3nQCVFcInM7mkWZ7VbK9fmcsRGTD/0jYTI/YfuoMRlmvUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy301d2GXKM8TgHpXMHycROpgVUsgJqVlJpBKi66tQthjup5Fp9
	umpCZZa2XhPGSMgmgIzoWcbKsAUP+tfBOi1QKphsIfKU0wrPhztotewGpjSJpv2zGOkuKddT6QO
	0oY7iHA1ZI6T9SQFJVQ==
X-Received: from pjbsj6.prod.google.com ([2002:a17:90b:2d86:b0:34e:90d2:55c0])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:da86:b0:354:a9f3:68bc with SMTP id 98e67ed59e1d1-358891cb92bmr6358367a91.30.1771566907697;
 Thu, 19 Feb 2026 21:55:07 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:45 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-1-tjmercier@google.com>
Subject: [PATCH v4 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
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

 fs/kernfs/dir.c                               |  32 ++++-
 fs/kernfs/inode.c                             |   2 +-
 .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
 3 files changed, 144 insertions(+), 2 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.414.gf7e9f6c205-goog

