Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93435BDA0
	for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933508; cv=none; b=E6HezcYakLGR57hqU+7OJrzEqi9yh8+SJf8u8mRs97mBvbiglBFhj4J5fPcP5NyI0L3c7rbwrzpO4yHGNESIQ1lI9KHq4yZGy1tPxTbhn/oBFqhptfFNtV2aiFyGF96cBeUW6NUW4tAQyaQW5CbniZaNsw/i0MMorPd2tL5ROB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933508; c=relaxed/simple;
	bh=rvm09WjgPTpfJFIcHNYOPR/b9d2nODdgLBbyUw3INaM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cjKeUNGBcla5ze5qFVSaG8yD0uBp0cqOiPTFOsu1g2ktTZIDwRi2vo7zkGaC6FEKhV1pJ3m53nlaGJol7tovdEAL/wum4TvKT7xQTzt5R8roC8ZlwH2SNJT7/LRQGUvBi5DEr6kzqzi4d3kA1h6frGx9qAB2Xn/HpAuY6La1YNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/0nsGP+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/0nsGP+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a7a98ba326so2819655ad.1
        for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 13:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770933507; x=1771538307; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IGPiVsRR2IN2A+m6Bv8PgAftkVsRzQaURBceo4FlM+o=;
        b=O/0nsGP+Lx8Gxa/CaUVHFN7/6syWXH8ex4tM3JqOJQyYxQFoswWy0WmjLM8caeuqeF
         1sbM2pHMsrxjHP5f5HkU25ZGQdyB5/TSjlwhw17ju/G+WcW2dd6RbOAKDdiuQ4dm9iNv
         jmKxrJBCQEqxRaggpY9gYcDc4yq7EAh/MUJg/82Y/bk35KdR1PDGaIkDWHQW9RFVKLab
         +HomKzqDWLjTORmHhPyy5Z/wEmzurzQrE2wu/fliGrrjVLXQJkLxTJocvJxToEJbG/jv
         oqv0y/tddfqRpbqEqunpk1KHtpGzBTskCt9+f1HGLnZ5JFNOl4CDA2MsR+bwNG0LqthX
         HpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770933507; x=1771538307;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGPiVsRR2IN2A+m6Bv8PgAftkVsRzQaURBceo4FlM+o=;
        b=L+vwi8ARiPJZPK+DLvcsw0WChfPGQtnihH9tS8eW67JIhZLQbFfZYwApdX3Sa2ic3K
         PFoHHhh4BI+gsgWr9lkGVwMNqPy1vikk/gFX+l0WSu8UG5ei4YicN0x5v/6qWll5eLID
         0fQZ5YMoULmyp8U2aNtoclioDtHZtPq2zlgSEDWLZKcw8tU1sLOatr1YPB3TblLRl58v
         B4dvWpYbOOI2GvUXBFozEgOh/AIRDURAPlaDm0NvPR/8mfCEl0YOc1XxRo/MHsyzTqpK
         yj1hYsHEebVhLwz4stZVJBRhP18zMBOVybQPfyg9ErhkPG+mZmxc2jXKFoAK6A0u7C/o
         pGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxKbyAKNAq3FuzkLT4Gq0l0NXDNoBsPrhxIAq8Nn+hrUbjXvjA3yXM7cFW+ygRTtxmgCMp5qepJKdoBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQTlHKKB46/y5fNr0T74bWieflGSKeCN04zoTUmpPEtBqpE9H
	xIwZVmFF6oQDWNsPy9EhRgm3iUGE4UOLxcStm7n2n8L6YDLVLbjvZc0jDmVW6aiOm45Cdu76oHD
	hA14jzkgaK5OYtIbnUg==
X-Received: from plbkn7.prod.google.com ([2002:a17:903:787:b0:2a7:73f7:74d6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:b47:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2ab3ac3ea7dmr43993265ad.28.1770933506507;
 Thu, 12 Feb 2026 13:58:26 -0800 (PST)
Date: Thu, 12 Feb 2026 13:58:11 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260212215814.629709-1-tjmercier@google.com>
Subject: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
 for files
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
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
 fs/kernfs/file.c                              |  20 ++-
 fs/kernfs/kernfs-internal.h                   |   3 +
 include/linux/kernfs.h                        |   1 +
 .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
 5 files changed, 161 insertions(+), 6 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.273.g2a3d683680-goog

