Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E06E346AED
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524333; cv=none; b=sRIXlahqvDvcGOcgkDTvtG22fwQK6nrhLuqN20efgHIUBTAHiPJ7jcw7YSg/2L9ged1DXMf+O9mNROJGwcXLxf1lFQwsHLpCcguZ/OUuk/7+qb8Ah9JO0BY8Ji0D7Z3CmhP78b8Lh0L34aT3YSJQ3BnkVxqAO1jPPVeyIJSOBRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524333; c=relaxed/simple;
	bh=xg9KEybftToIhyeKvi3LSZ8BdXiuPOyUQjSLweID3Q8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IctNy3mnxfhqkO4rpoOsiR6dOQKo9LkC4g7ruXPtwyYldxFlXTK1W7jKjGVsoBHuZqDTBBL7DLOAcHGKpts7PrWoawLGpuPy9aLAW5CRedEeHWWaakrE3ifsVjiLsO1CUw6ehMpbWNivRK4vL3bubIf1JqOfTJO5COpR3FI/imE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIQ6O/UL; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIQ6O/UL"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-128ba70cc99so520229c88.0
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774524329; x=1775129129; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ay8G1oJZ1K8BN/IzLR5Hr0MTltSuhb2JjZXdZm6J5LQ=;
        b=WIQ6O/UL9jsjxXsApw+ofph1e4bx2QN2JahUYzd3CLWaONjCJtwaCR7tLchjTPXYcn
         BbkPs8v8LGUBQjet77UNL0cHYlaKit8R0OYl+b87gYjtY+QHVJFJPxAgs7Rcy0Ua9eIU
         kVDRjNa56F2rz2kUXPx49PMw6PkGLxL9FTZE4++f9ukL4sIL8BJmdMbp3qloTOxydFnL
         eAz5nyoTnRB4//2JJ4xTwVLV3Jjxr7uN7JVy1RyNvB6VsFV5eDxzeuMSo5kJwz4Dut6K
         18Zwj/tr5p7eX4wZjBDPjX1JNZp9LKX3U16rZQw2f6fr4pTYVcPYPgLLtMfNNC3Zyyrm
         DcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524329; x=1775129129;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay8G1oJZ1K8BN/IzLR5Hr0MTltSuhb2JjZXdZm6J5LQ=;
        b=kImify1DdBIqoPEeKzhRjl80wWnR1gKtni8ontzxwqzij5iakH6KX4kr5qM9UdBf+T
         DkFk4fqFsLni5SMj3xNsH8XYPLsSEiWUBVNClfOW7QG8pK2zLdY3tYwhaohGpw/9bldC
         az4XeU4iaWkNdevzn4H4y0SzASLoZIVHKNuta2aQlxVON+/QsrPcoCXyo9hHLnmcU2zU
         V2tRcRvWaG8j6Hcxzttg31sFiVXaYWqFXRBkKsbEegGwlOfCXZo1oKOSXrAAkXC/cZcw
         1iFQWcgMpcVjXDDBEqfu6m+bQhnv8j/0f54mXKbz5X4oDOKo8k3jPmEnSn3mX+/0Nzhs
         8Q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsdNYRHOg4guNrf63tktJSYHUsc0ZInrSSRgPlFgHbPjwrkMALFS14ZsPLYvdHbEvFzBu+VvwKFixMzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKWrxuDdxgEb83YuNRp+IcJniSttzNW30+uDCZbUxq55OFkbxZ
	NX/iOmsHaMCe1+t+813uKgdv9jdJ2oEXWTPXsrGDjWoveX3T5GvbJSixBwj7lANxF/D1+wE3I8/
	RO6aCYF476ATLyw==
X-Received: from dlec13-n1.prod.google.com ([2002:a05:701b:428d:10b0:127:89b6:8d2a])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:125:b0:128:d084:e921 with SMTP id a92af1059eb24-12a96e5d6famr3734825c88.14.1774524328974;
 Thu, 26 Mar 2026 04:25:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 04:25:18 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326112521.2827500-1-wusamuel@google.com>
Subject: [PATCH v2 0/2] Support BPF traversal of wakeup sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: memxor@gmail.com, Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
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
 drivers/base/power/wakeup.c                   |  72 +++++++++++-
 tools/testing/selftests/bpf/config            |   3 +-
 .../selftests/bpf/prog_tests/wakeup_source.c  | 101 +++++++++++++++++
 .../selftests/bpf/progs/test_wakeup_source.c  | 107 ++++++++++++++++++
 .../selftests/bpf/progs/wakeup_source.h       |  22 ++++
 .../selftests/bpf/progs/wakeup_source_fail.c  |  63 +++++++++++
 7 files changed, 372 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source.h
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_fail.c

-- 
2.53.0.1018.g2bb0e51243-goog

