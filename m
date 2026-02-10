Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B421883E
	for <driver-core@lists.linux.dev>; Tue, 10 Feb 2026 00:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683907; cv=none; b=tPBkl9D++Eu+ebjGmxW7xruBTgMcKJGbcRVhiWm1M/jmSrby3bT0X1KJAJu9RSaKNWlYGROXjl/68GU0CSskrqYp92lJnPalTfcfqsH+mYZc26RTv94WabZPRwXXP0L5uwzDh489ZH3r3b2W1H4pbnAZE+FGwoaYgk8/U16RZX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683907; c=relaxed/simple;
	bh=PJxIqY9BILo/Wb6xL9poQCQMqT1HyNX/z+OFEJERO1Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aRCoQDIeU7gtwDP0O+uNqt/OzR9dXJHh7goYIRj+mV6axkAdve9kwAUPlh3zc19kw1QZDXUCxtSmsuGcXEOQdba7sqNMj6bkXph45MOFewZjcv2kiDwgowf0FgkgkRoa+E2wudR/1kwp59ftjxdWJHM4jkTb/yauZwB7POImkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2mMpTKov; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2mMpTKov"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6df833e1efso2144592a12.2
        for <driver-core@lists.linux.dev>; Mon, 09 Feb 2026 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770683905; x=1771288705; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ToFxyLXirio/gELGdBsIPVriUiQfEmrOHh3uciwjmrI=;
        b=2mMpTKov22ibKJu+xZ7qFoQCdc2apUPOrt56RnJE9MIgQ0qqMQ6Q7j9wF3uHQksva4
         D0I60g/tCa8xF4sLv7SlTyjTMS2bh8ECftM8fhL7BFrHhBjxcdOJhPmNzMPmhnnBxRpG
         R9Fiz88mszHprRE/vLdf4sZ53P6V3Zraq1Pd7wW1EAZeV28nYl7l2ILkDgBN7l+gHPDv
         Nwe8KtWRzmwOsNy9DhlaO9LRq4SXmNaShTMps5vMn4k8F0U9ACftOIkOpO/WBEjH2n3v
         3BFi3nJ9ZbjK7fp+vGq5Y1llutpntpLTJ7nNEB19MPZQWqoYTechmzuUJcH7HWd3Oje5
         ei1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683905; x=1771288705;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToFxyLXirio/gELGdBsIPVriUiQfEmrOHh3uciwjmrI=;
        b=TZ/NrmGOEIx7DIe5tz/9eaFltIKfWzZWXvVON/PamHsF/nvq4YCjmNV4/LULUVZGhI
         StjV1p/kbKNAXZ0isEUvM9uIaS9hgAjQ/dBkEX/SQP70VTzQsv1kOZr4H9MQJnvS/zWA
         F6Qh19Li9qMtkuj4AIqWMWOFq1u3YM0iJvfhwOEi8L+Rf2b136SUMmhA6HsmzTPekY3e
         c804JtPOmvBUWBplhwQUV/IYwg+klpPTtWmQdus8Mr+bOcesJvgDZt1sNFy9+nE5cqoL
         Wrj4It6MpLHPBQo1AhmeaOJbhDHZR86CTtTX0a91OnJvwJTEJWufcgAGbkp6fQLH97Tx
         13qg==
X-Forwarded-Encrypted: i=1; AJvYcCUrnkV9297Fq3fHU6g9YCkybxkzxzEpesP0pPb/EhyEe/1XaMUIdnZXKrcQkhUwMLiu9CflBO++tT2ycw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFsxXbBgIFGIJxfXBvIJlvsDsXCejL4mfiyujbLSGaRYtAT60c
	waPAS9nd/WOOpknFVO9oAS0nOnjQtFSsVFOyYQFIBvLTDiMTJk9giPop2CYOYSMMqZH8OXAzhzh
	FSew/DxmaL+ztAzDmyA==
X-Received: from pgbee11.prod.google.com ([2002:a05:6a02:458b:b0:c66:e5c8:842b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9c9b:b0:35d:d477:a7d7 with SMTP id adf61e73a8af0-39417855226mr372906637.7.1770683905284;
 Mon, 09 Feb 2026 16:38:25 -0800 (PST)
Date: Mon,  9 Feb 2026 16:37:58 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210003801.2834976-1-tjmercier@google.com>
Subject: [PATCH 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
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

T.J. Mercier (3):
  kernfs: allow passing fsnotify event types
  kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
  selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
    memory.events

 fs/kernfs/dir.c                               |  21 +++
 fs/kernfs/file.c                              |  35 ++++-
 fs/kernfs/kernfs-internal.h                   |   3 +
 include/linux/kernfs.h                        |   1 +
 .../selftests/cgroup/test_memcontrol.c        | 126 ++++++++++++++++++
 5 files changed, 179 insertions(+), 7 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.rc2.204.g2597b5adb4-goog

