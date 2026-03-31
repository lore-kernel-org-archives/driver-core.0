Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF6421EF7
	for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971289; cv=none; b=rlvbUq6E3ZdCe3uT90dsipoPv27Y41+A3VxB5tHlJJ2rwjbqw3XeStfyFO0LYmAmOrwVzMtQsNAyaHXrYiIK1gYnmgXdVHHjddvRtoqmq+AcEvwoH2J7aTjlOhi+QCOQuRzvoWhyrCQvXlqxbWBB9z28VLklzW8TJTg6LsDHM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971289; c=relaxed/simple;
	bh=XlM6zyA0LvUUuCH/AXIgvkuM1NoxliRKcWKJJUdX7P0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JAAVAgVyW5xk38w+BaNJmny9SOycaOd8w/u3zR3WHWImpCKGUrZIOqNgvv4BN0230LfmT2AfQ43APjxFsUwkC6MlGH/AcKAUVfveJl4z7PV/FXSRrHE3gsFNYfkWzKwkFWAcmhayra9AUCfKnUPFH8tLj+h0/NEkmMSfTZCblGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mUDsj/Fi; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mUDsj/Fi"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso10313391eec.1
        for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774971286; x=1775576086; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1KcB7wDgOOcYSPfeHFcgAc3CokvxeOaMFZ2tqdVYZis=;
        b=mUDsj/FiLbkLoSFZRP3qjACeR1Iv4SJunz2qwDgYzEP+lPNhk/ctkhGnJxABbYfvLy
         Vm3BM8zDP2KyYmxxZkTYbC3d/7k6ZY1rjLBDYsC5PCubw+T5y05x6r8o26kOnmGBzzsh
         o7ptgv3s9vUZobmPtjppkm4hcfB+NPmmMsyHQIeoXn8wnSXJNBG2c+ZoOY6kBfVI+0os
         3XYdrX1a8ggd6PWV8AL7DHdJWByQ0qB+Ogb3QNWNGiJ/xdp0i020LZWP3u9aYMlaos3l
         p46VXfjPDjNZ2OibyCnmetJnsTe72s+KxofF41HZFWgXvHEj9KMtVe+WkllmuGuDl+yk
         xVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971286; x=1775576086;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KcB7wDgOOcYSPfeHFcgAc3CokvxeOaMFZ2tqdVYZis=;
        b=kc4ZcaQ1fKjQirLeJnhB+oTMTP4F7uCPjQhEQRdLPy8b+StK0wHhrDMQ2uoiVVNCIJ
         BuKfM8UGm8YMmRABzmwwm/NuDWeUEWfpxAz7zKpOKsFnvREOw1/8+Cbvbq/qgTvL2eAj
         LpVL1m+uwKuA/X2iL/GaLGJ81LH6AljpXmHX49+J1ewWZoXs5jmwbngGNEjZBCSPwoP+
         WdI2PxwQWSaza7yEYtAtaxMzy26oAJa17UTT7gSLyyH8XK1quFyukN3ZqELvANBk1+0H
         5sAC6HPqFzZrImJgkekoIHH2DlxC3cU3+tXBYrFZJNhl4c3gouVZMT7jMbqQaOQ6nb4L
         4hJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqv6EcP3Oo6WWpbYOBh/rOnYPWerB2VrZj2e+eW/hssJkTnn2ZfFPhu302Lq+fFF2KGGR4cTy/zgz5qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD8WZ7Oddeeeo+oaqLTu/TGWwI+VTmP0DVfxK06SnX+n+9wJqL
	/HqV88eXKIuKjNvaf9/Esky89koihQgTiwZ1JTc58phmut8HVtpiiMWgc5EaB0eGz5aOX/qbYPF
	aeYn46Qo4pR6dXQ==
X-Received: from dycts10.prod.google.com ([2002:a05:693c:3e0a:b0:2c5:70cd:ff53])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a146:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2c185cd44a5mr9098490eec.11.1774971285561;
 Tue, 31 Mar 2026 08:34:45 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:34:09 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331153413.2469218-1-wusamuel@google.com>
Subject: [PATCH v3 0/2] Support BPF traversal of wakeup sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patchset adds requisite kfuncs for BPF programs to safely traverse
wakeup_sources, and puts a config flag around the sysfs interface.

Currently, a traversal of wakeup sources require going through
/sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
wakeup source also having multiple attributes. debugfs is unstable and
insecure.

Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
traverse the wakeup sources list. The head address of wakeup_sources can
safely be resolved through BPF helper functions or variable attributes.

On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
speedup (sampled 75 times in table below). For a device under load, the
speedup is greater.
+-------+----+----------+----------+
|       | n  | AVG (ms) | STD (ms) |
+-------+----+----------+----------+
| sysfs | 75 | 44.9     | 12.6     |
+-------+----+----------+----------+
| BPF   | 75 | 1.3      | 0.7      |
+-------+----+----------+----------+

The initial attempts for BPF traversal of wakeup_sources was with BPF
iterators [1]. However, BPF already allows for traversing of a simple list
with bpf_for(), and this current patchset has the added benefit of being
~2-3x more performant than BPF iterators.

[1]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.com/

Changes in v3:
- Changed return type of bpf_wakeup_sources_get_head() to `void *` per Alexei
- Added failure test for direct dereference of wakeup source head
- Use bpf_core_cast() instead of macros in BPF program per Kumar
- v2 link: https://lore.kernel.org/all/20260326112521.2827500-1-wusamuel@google.com/

Changes in v2:
- Dropped CONFIG_PM_WAKEUP_STATS_SYSFS patch for future patchset
- Added declarations for kfuncs to .h to fix sparse and checkpatch warnings
- Added kfunc to get address of wakeup_source's head
- Added example bpf prog selftest for traversal of wakeup sources per Kumar
- Added *_fail.c selftest per Kumar
- More concise commit message in patch 1/2
- v1 link: https://lore.kernel.org/all/20260320160055.4114055-1-wusamuel@google.com/

Samuel Wu (2):
  PM: wakeup: Add kfuncs to traverse over wakeup_sources
  selftests/bpf: Add tests for wakeup_sources kfuncs

 drivers/base/power/power.h                    |   7 ++
 drivers/base/power/wakeup.c                   |  72 ++++++++++++-
 tools/testing/selftests/bpf/config            |   3 +-
 .../selftests/bpf/prog_tests/wakeup_source.c  | 101 ++++++++++++++++++
 .../selftests/bpf/progs/test_wakeup_source.c  |  92 ++++++++++++++++
 .../selftests/bpf/progs/wakeup_source.h       |  22 ++++
 .../selftests/bpf/progs/wakeup_source_fail.c  |  76 +++++++++++++
 7 files changed, 370 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source.h
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_fail.c

-- 
2.53.0.1018.g2bb0e51243-goog

