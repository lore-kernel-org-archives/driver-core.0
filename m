Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717872;
	b=OHZvPnGPzSvgOsmgn2jYKkWz/yI4A+98RZ8WYIIwiEoEqz6en/1yACXO+8o5Yn92oTbA
	 /0Nx9Hhy7R4zKJJGE5HAi1GNO0wyPc9x66rPMB8asBJSdjipKsKOKLf05yGEBIidDcwKu
	 jzLv1FNMxx9ezpABGM1LI3nukRtr+VJf8D9H6wWIvsrLOh+PWxr13MvB5OvBQrdEp977e
	 b9fNVE2oX4l/mn+jl5RidAxMLk9Kj7iQ65+CeNFN9mgB1aIZyE8BdlUywG2VANvq0JRA9
	 PhUr0JPKGl9BcXF1xJ53ZxsxC/uximgHHqklmE77ufOCIFZmJZPFInxy3vGRBuZq38A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
	b=EuS4bpBCnFd2U7Dyx58weQsJ8MZgurTttPsYfLMMe1lWYU8s65NPy4W6cfZsffeInUit
	 oM/V4KT0JMy4TgttF6Iqyz/m/X84LQAb1oMEPLE+pSyNlEybmnbCmxtgW9v7aDqhUfxRy
	 dxv1GzcIcMKCSoiU+oekeGWDhkYHGh/NIbYA9ZCt7JXvm7tEfwLzUgZeq6v7Q64Y7jx2V
	 ui0/PhWIbD1pdf6HWrEVOcTbN6s3xF/v6mg9mOpia4Vw7AdPAZgtkBo3HxtRRMgndLe/P
	 xpIw3N0OMCyZm/ximUDmwHWhMNVmvy+YxfL9LI683gR34Gk/U/ARF7ad0hpBa4KLhQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVEPhuDE;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A3606B269
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 14:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9A3606B269
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVEPhuDE
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4326803b54so238581966b.0
        for <driver-core@lists.linux.dev>; Tue, 03 Nov 2026 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717870; x=1794322670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
        b=OVEPhuDEDSDODf3o2DHlHBvRyz9hYtsBy1z505Eht8lmuQ/zot51P6o8fZZ/MXZNUm
         +s4SE5oZ9cpja1pcH5TNeMGq8ddAoPp2cQpR41+K8dvDgMVsntz1EwERdZWmsuLCx1Uy
         3g9h6gxPAT9JU/hAm1faB03VKtDv0H09Sl5LRkpowyWnkLlaowkDWxYj8wUFBsecHBqK
         yv1JMtoQehAYWbXytEGMUX291CR62gTeaxnStBnARtwM81TIb74tob+5oEsmTAHiSZuk
         HFUWkWCjmiUNElXotCuCNAf6RJY4IeyYHPiqIn0h/scb/TrctQuz9nrfd0xf+PTzbKf/
         qLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717870; x=1794322670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
        b=np54vCXgyXgr3j1q7qILPewycP/XKbQPJ2dm7dAVUMBukQdkkja3GV9vZtw+skXIFx
         uH6vQQINZXa6CWpSOylsMQfAGe1dtrOmEoa7njUrc25bDvQtnZomx29HEIaJ2t/wdIxu
         CNWWm8jsDEIa4xAKLYFzKPAeFfard2GrJS69lPBxOhikVPVrGdiP5aEnUqeAOv42L51/
         pVATNXVgzf/haU1qKNUTbpqMwMf5kZmcGX7noI6O0U9fmUXvQNmcwR+uzTIt3GfGkqcn
         ux2n4bc1grRGwH5h/p/6fRdFZEWWSV+iJYdJDkBrFT1NgJCB5aBy5NnVVCDae2wJt2cC
         NFig==
X-Forwarded-Encrypted: i=1; AKwUvBwMt5yrVs8AB84UJAbd71WPQT328P4HKq8b4OnsOaBWeK6BkxL4sudv37B93t6qfcwIQmTZq7aAjxoOOQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8uoLQF1XQHN+QBAgtaoD589YU6qmOvxMUEWhdCLgQqhQYxr31x
	Y5KiCfgs/EqkzbovRep59qWbLbjmsh74LBstD3rtfqeDJGrH9gXi2R+L
X-Gm-Gg: AYBFou0xAuPu43tzSvv0Rla0Tk6SIfWQxdb6K4wMCJ4UaEQEFwn2y6zRivSs2n+UHlY
	yXyQhdj3Agt141Ipke7Mg1ebf+3yysnG/RYWsUAtG8QYtMnt+BaxDhjqeISdTt4Tkpv9mUu+Nph
	V2yT0LyOw1eZpob29EE+16awAQo4D3IpuPcdAVzRIQSZ6Cu/W6WsuzTa1+nHBcKH0Yilo4g+Voi
	glYgNLOLzpuoqzFiKxm+bOPICoLTsW/ZDDSSehUnAe2DwYyBIGWG3QNleAp3mW7UNLm2KsewVIm
	3fdUhT9dk8NmsquVPhqgvzWpB61wP+M0JV25SU92PtgrawgOpUV0duWgKo4BSBZD8SmYS7BPPtZ
	FAG09Gk3mwRpWPofUyXiG6rsnNimCsgwydtkBaHqNlGrkU0YH6LYu7D96g05oOsACmHEDINwp9i
	ZyPYLmConfyborp7UDCeoRSoMqFETgrdmx7YHJ/09/E16ZlGUBjRNN1mobsY9goCduoIGh/aQ3y
	kYLxyHfJplzCCPGagCE6dVslUZrNeNvxETGe3kCkIImcY3RIakMmR5hB2QDlipwpoWxbkfuBGiT
	LRjLWmkXh7Z7ooARmHVMGrj2vvkD+sSkrHwlXPdPqGLUE7ejNqpGyp2etcE3Tqs2UlYXPjHPNfP
	19Hja8YK+k93tLikkZNg9ah0QBDvxfSQDu+H2S+ji7e+dHE0JmUoZzn8QrBFJBlFsO30ixlSyQ6
	fd1xdNWC4JKoYXrLqvS9GNBEYNPVQVnHUZ1KlWYKWTi2zqFTL+AQ==
X-Received: by 2002:a17:907:7f90:b0:c49:bc1f:fe2d with SMTP id a640c23a62f3a-c4ca7a858f3mr1272502166b.28.1793717870207;
        Tue, 03 Nov 2026 06:57:50 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec78f3sm93656366b.23.2026.11.03.06.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:57:49 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v2 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Tue,  3 Nov 2026 15:57:41 +0100
Message-ID: <cover.1793715774.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Tejun, Ian,

This is a narrow replacement for the earlier kernfs serialization and
autofs changes. It follows the suggestion to refuse splice only on files
whose write callback can look up arbitrary paths and to give those opens
separate lockdep classes.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A normal
write to /sys/power/resume records of->mutex before the autofs pipe locks
when resume_store() resolves a relative path.

Patch 1 adds SYSFS_LOOKUP and kernfs_ops->may_lookup. Writable opens of a
marked file refuse both splice directions. Their of->mutex and seq_file lock
use separate classes. Read-only opens retain splice support.

The new property cannot be combined with mmap or preallocated buffers.
Kernfs rejects those combinations for direct callers, and sysfs rejects
SYSFS_LOOKUP together with SYSFS_PREALLOC before selecting operations.
Binary attributes do not support SYSFS_LOOKUP and reject it at creation.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs.

Other stores also look up paths. They remain outside this minimal series and
can be marked in follow-up patches after the interface is accepted.

Tested on v7.4-rc1 in a QEMU guest with the syzbot kernel config.
Without the series, the C and syz reproducers trigger the reported
lockdep cycle, and a splice from the autofs daemon pipe into
/sys/power/resume deadlocks. With the series, neither reproducer
triggers a lockdep report although autofs receives the same requests,
and that splice fails with EINVAL. Plain reads and writes of
/sys/power/resume, read-only splice and splice on other sysfs and
cgroup files work as before.

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: refuse splice on writable files that look up paths
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 54 +++++++++++++++++++++++++++++++++++++---
 fs/sysfs/file.c          | 29 +++++++++++++++++++++
 fs/sysfs/group.c         | 12 +++++++--
 include/linux/kernfs.h   | 10 ++++++++
 include/linux/sysfs.h    | 22 +++++++++++-----
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 118 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

