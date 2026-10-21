Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587120;
	b=MN+Lkxz+C2tNzRAEH2Zph45W4BB5x1ZOODujPKElmowQdRc9egqFt6q0YQwFt13W1yQH
	 uCfGLtt62BGQyoRUqNVvqPw1F5dTGDDkEpHRx48wDj3vdd+ZX/Y1EzUTxXktpmLMminhB
	 TX4qxfJOxCq4vpjAV6L+/p6MkP1BRKZP4Wz+GOhzfcK1fsLxi+9NsAZw+Bxcd7t8DFMtr
	 evxrbqB6Z/JldfYwmOqUdKxPLJcIR6QDJuHDNVqbRFEm7080ZVwyteh05SajO+tcwew4G
	 zJqnV3sz4VvST0YK78roeLRcJJ5rKOHU0/hZsALuR1vvCCx35PV1zNuhDHJSCVfwigw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
	b=uG+TJMcQzCy7ueLq3cqn72TTI+vgqkVXsvOwYkVLSjcjNSkuBzOeywZc7vCawa6PnoqD
	 VHfnARneyLpIBSB0OefgRduoh3Mo4R7eshWqSuX3EKw2mKP1Gp34itdJ12IhbVnVHXv3h
	 I0Cb9pLtk+zQ1DS7E7XnaJUF+6s8fxCXaD1wPv0yrmp+34pJmRbmhn/EYh0UmUpjsFM31
	 xcGEjP3dHGULdt+JruqDQLrSbMvuHQIdmR9MfuDeBC9qKN7o1Yy3CljIVBm/0dGwtHGan
	 I8cHDGKdQP4hNQpEQbYFKua/b94Q2CvdLbUuwSHZPxH2Lm3nH2kTpLrqa/YYLTEGyNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IfXFLySx;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5464606A32D
	for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 12:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5464606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IfXFLySx
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1079613a12.1
        for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587118; x=1793191918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
        b=IfXFLySxTtmylGCchD083svxaoCHf8zi44GD12GHFED1kCifqdmgk2A6r0MpZePZm5
         2HIeL+OqOklY6FzOml6oIFvv+PzQ6PHEXauFLyS+EV218zo70gnNdX8WO0MZXu/fd9KL
         ks58Ksve4+nEy+hwXCSejKMd0X222uIbRgQBTJLuO94vJ7dc0mQsp07vFSWVBlu062Uq
         G7YLg5n/ND5d6Tbivzs9+azdr59YrGsCCV72gsT+CXYcKgVn1vgzJl2ZNP1KkNpDClVO
         KD7uLL9N4jWAI9vMsyhvxrnL4YfK5GxNdh0n1OUJBasD6JykaUlblfu1zUkZ8mGVk9be
         arvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587118; x=1793191918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
        b=pbrgr42HbQLmR6giP4ssloCTjHYWDnFy8xjr/5DNJkveIloo/IQjITMPxzoohw+cqu
         0s2PlAGpYrBYptgiyBaFdna+1gNvCoMKXZdxsL3jYbkQ3FbUFHSzqgS/0HAE7+wIJWPi
         /XBnyk30JLb6SeoH0suOGidl94sKGRuTvapQwaegiSsGNNz4FqGaHeEj+9Gums1MmnsK
         edFMwS+i4hQCi50CDTKJcUQiST2cA4Wqjvfja8cBVWLyZn5js0lrV3UkX7zJ1mE6ZdHS
         Mvu3WmADwaRYuCJqdHQvPaYTsbDpVebYjPzrhWUIplyc5lsOJ33Nrj1cSCAC7WMBOOQw
         Mxfg==
X-Forwarded-Encrypted: i=1; AKwUvBzRWCX4P9hE6+ahI7sGFjXJGhAHeMpEM7oJ0bmVk5Rbym6WEHaRqtecpg15UpA6yL6jW00yuKkq9ReC7g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKj4K8NFENSWbr/HNBfYmf2uOAr9s7oxONBdhCCgOqhmYUWpPTf
	e6BjDlHFVWFSkfz/HQVCVLuVU1dWA1wDYUbdmBiLx/u0cPuxrdxTTuznkyJsXOgwxDGUCe9I
X-Gm-Gg: AYBFou3K+NFtDBs0hvzFmBaA6G/luKJ82IU5/FysZvjLEYZZjzFFc7EXmhnQNOYZ31v
	stTXb14SAY1CSbh3+Bw2m1YvFQY2cr/o7WGVDcpKAtJdGuPtwzke4fnp0TOZ4h6McBmoDKSmx8R
	3G2IThLDFPWW0FU/7NEAoJwGOifSRlbUEhO4bJjIf6l9STshiO4E30UR204EwHjJTXESO89/93/
	5l9KPVom/3LCHURKkj35ToO5jEL7Hep2FklEZOouiSz+ilIHD3pt/8Cc8wHrOqbECzfh2yNhav5
	BcUakHHMx98MfHBNrhzLGZWVw6ijBZ9oYgCwoDBPOwsFSMvRGeXULC2gktVupQ19MKMfRwrLJ01
	axDPWFsmXGSlQM9SrgnWNgF+CqdzWOPtrwSDlhf+HRfa8RxWWEqDG/wWnL04p4DrQAIvPDyO9W0
	Ffe9M1/OAEqt2AdLeu+rS2t4erZtWqhukedZEf0+nWwM5WZamev8c7/2Y8Cqkrbsp+Y4v2xl3rA
	iJd9yE0l6TT3kzib0LowJr8a6xm/h8aeFqtmaAZ5LxjRYodLMWbznUM7pWtMwkBO0S7Y0qcMmoX
	AkxGHF6j5eMIh2t7XyPKWMa9+H3pr431a4qSQ/eoq/rn43meRU6MSz+FUVph0WE5eAukYCm8qIk
	cFegR1a4vxZ6Ac4dMM420KUGrugxn7iqqOgMEQtV9vlB66qrIwMthz1xJpS/CflvpX7bdNmxkEm
	YjZiq76v8oPRgwfkmxOouCldPD
X-Received: by 2002:a17:906:99ca:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c4679594c9bmr175067366b.19.1792587118009;
        Wed, 21 Oct 2026 05:51:58 -0700 (PDT)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679004464sm73128366b.67.2026.10.21.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:51:56 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Kent <raven@themaw.net>
Cc: Tejun Heo <tj@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	driver-core@lists.linux.dev,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs stores
Date: Wed, 21 Oct 2026 14:51:48 +0200
Message-ID: <cover.1792577179.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a lockdep cycle &pipe->mutex --> &of->mutex -->
&sbi->pipe_mutex. splice holds a pipe mutex while it calls the write or
read handler of a kernfs file, kernfs takes of->mutex there, and a write
to /sys/power/resume looks up a path that can make autofs write a request
into its daemon pipe and wait for the daemon.

Patch 1 stops holding of->mutex around the ->store() callback of regular
sysfs attributes, which do not get the open file and already run
concurrently for separate opens.

Patch 2 handles the case that patch 1 leaves. A store called from splice
still runs with the pipe locked. autofs no longer sends or waits for a
request in that context and returns -EAGAIN instead. A new mount is
refused before it is marked pending, so no other lookup sends the request
in its place. This also removes a deadlock in which the spliced pipe is
the autofs daemon pipe itself.

Patch 2 changes behavior for one narrow case. A lookup from a splice
callback that needs an automount fails with -EAGAIN instead of waiting.

The series was tested in QEMU with lockdep using the original C and syz
reproducers and focused splice and autofs cases. The target reports were
not reproduced with the series applied, and the paired functional cases
matched the unpatched baseline.

Krystian Kaniewski (2):
  kernfs: do not hold of->mutex across sysfs ->store()
  autofs: do not wait for the daemon while splice holds a pipe

 fs/autofs/expire.c     |  6 +++++
 fs/autofs/root.c       | 28 +++++++++++++++++++++--
 fs/kernfs/file.c       | 52 +++++++++++++++++++++++++++---------------
 fs/splice.c            | 13 ++++++++++-
 fs/sysfs/file.c        | 18 ++++++++++++++-
 include/linux/kernfs.h | 11 +++++++++
 include/linux/sched.h  |  2 ++
 kernel/fork.c          |  1 +
 8 files changed, 109 insertions(+), 22 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

