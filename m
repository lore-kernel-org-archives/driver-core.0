Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836349;
	b=OQCEGeBpCQ5WokLOpkcRopyLevSI81pyLN7MqMIYMv0yGcCfWN0XaKn/T3OLYksyWL60
	 S3FkZp7HSRsRemVangLHO22LTsDH/0u2bxtrARHqWdQUAcfj5Wu8c0GUQHIy8IuRpzmfb
	 aaeJCOal6Di4ozT03zGA/m/ZNk9kU9G6xE7OesS3pIYbDZDsdC2iOb82eXwoP8ljLJHUQ
	 Tmlk0XRurCwMiC70ZWXgPcLLkR6ZtGYuEyN3jMS3adeIynIOaiuIFBjAoiMO95Ggc/xBO
	 Juc2KbEdd98Xput/pDd2ZXaf9AxEqP+7fb98PgWLTlP3ak4h6+Vn4FzXYzBYHkcuGmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
	b=HC1REZJdRLy2oanQChG4JC9cEIRWwOV9MRa+MUk2rpoUM1owWv16VKf+NayeCRhIS+ch
	 7bTOVv4Hz0nCQOdSSdUfmpweH1R380MFzDRg1GR72Xm4mMtFtQ9tJIH5vGzf9876GwQZW
	 2mU2fApFLimgKWaMfJJUNr7hvcAa0Eog2agwJWO1M2jPq6+n/eDyGocvZdqiku6kd49Ju
	 vJuLji8rhtLnQ7xXTaheekcJK/+gXMHFoN17vGSNfUJNkuBmawOLn1W+2wvMQLRmGk6+K
	 nL0YvsoK16i+Z2LvJFKLVdfSb2UTWw556UjOyv8XZwIXl82GuNyiXkp/aRxW6nfp8LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTyy9kqk;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E2606A32C
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 13:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTyy9kqk
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so578069566b.2
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 05:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836347; x=1795441147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
        b=nTyy9kqkT7it5T7Ub8Wqh+r8STWaa0JWZw71t7fji/QCT+wWEqg103p9WGa9s7z1dk
         8kv5mQ90AJeXbhDKZOpe3dnjWzIKVpFr7EgS4Ly7Vur1NNisyFfZA+H90KvABSoplxlp
         2c8T+qlsVXlQMQz8u6un50jRdOK2ZL8DzyPoJLwwZx5l2Xyxqdxx8elHClmPGDPffugE
         b7+3gJn8B1ByNI71oNpUsX5Sx8YmFoPaIOaaw+KLjmPzZIxB/WSGRnCCaVDyxZqflnF/
         FXnBXZtb0wkJ+oojzz02400GX6QrXmyhjL3ChUvaJlsWhSyZPFPgwafAK8XoTRbgDyax
         PlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836347; x=1795441147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
        b=KOvKAVbajxc5fDkJdA6dqE/f5FfzuS4HFU9Y/lyIaxHRCIBOMjuzN6jDVWPHTDlixw
         EaWEnWpgFF51jbu0SUz7byVb/zaXekAYyviqgMHkWuvPCZmCkmf+lGSlYH3kkuP+KtqG
         Uz+OpVQCn3CfX8NoHGObvfQSsTkuvH2e9Co5gP1J1VTPsHndaao73O7/m/IUWYMckybJ
         VcrBFcTjV8HY83Ct6NZRPhx+PxZkKVSo2Xu9CEc5xRqQouQLekC7+OOe5VAM7MeKC7J5
         N7zn6CKVACnM0F/c5hTsmV72xU9YtnvElnCVqUspP1eeao9D3zcsRfhiRZ82XNYM2ORf
         BQHw==
X-Forwarded-Encrypted: i=1; AL+hErEW4WBBHUjWdIQ4W3IhnKiGiXPiKhjiU5I1x4yyBcpgH4GkMzC/Qs+VB99HtrUh/IeIoyriUYUsG9Qmgg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+r195wU0monej2HODE/ro71ffoTu6+FQ9B140gOD3FTtWI/ett
	/x2yo2MX7HkAnWpIHNHhPgg/v9L/aTLIguib30vw5gWy1kBOIzgkHFRp
X-Gm-Gg: AYBFou3b4MI/mDPJu4yak0jRG6a2w40GAvr3p+c070AQsHXirvh/YEVu4RzW0b9VAWK
	QbPUtjc+HvR9CennpQ9lF7gLaUk3G95Gbrx/sn4vjIExLcKDRT+KwfzbydR1+yPZWq/o5bxHy0N
	9I9obIEME6KhB/NWFkFvdXQz6P6+NRNBUbcMXLsaSRvLu0ILVMT6ci9Q5RPOZxfAQ2dQsATAXro
	LkIJNgPRfkJ7BGUCvwFMV60lL23lt2kOyqNtnOU1HHst0806MX1ys8vW2FbVo/i/EaBdQv2F324
	QEA599X+Or5UmTCQnEN/ziktufcSOLERNXozPgNsvsF+H0YFeKIvVwMrYqIS4iYEu0zEOdBewpD
	IsuAfyrRAQ/fCgP0CroT0SUxRm1UGsMC8FJz81nuEu8G4aipTBbp7SQfJGcUruRfPwZ4I0E6MI4
	jUB4H5J6mAb89b9WZsSEPgRaFsNnxgU5JQj3E6e6nUghr+g0hncVwqpmLaMmg+Kc92SIhVZXeic
	qcAq9Ua59cDdqROaDqcosrExGb2S7CyNhC90AUjhBK/AUmQgnk/Q9mqaPJpV8PCl/ezHQWyxtFN
	dH4ySnyXyq38ZNcYFW+tpBlkQn2/xeHTdNNqiXorWA0wdaWiPFwhdNNBSyWMBkOPdiLF3mToMuG
	uIjIErQWwN/5RIdrBcxJaLu9/FZbyydNMht2xTFTiPu65jFjSXAN7wAj7Ykrb59GjjCw9MfkI0v
	mFitwqeaAcB81Ny9oK2ND18W5VwUsAvRQJSgX+PLcyCVccNGmZDKrqgKgW0rehQ9K6GVvrqWP0N
	w==
X-Received: by 2002:a17:907:1c8f:b0:c31:fb29:a137 with SMTP id a640c23a62f3a-c5096313a83mr870027766b.21.1794836346930;
        Mon, 16 Nov 2026 05:39:06 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm61267066b.35.2026.11.16.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:39:06 -0800 (PST)
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
Subject: [PATCH v4 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Mon, 16 Nov 2026 14:39:01 +0100
Message-ID: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
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

This series refuses splice on /sys/power/resume and gives writable
opens of that file separate lockdep classes, as Tejun suggested in the
v1 discussion.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A
normal write to /sys/power/resume records of->mutex before the autofs
pipe locks when resume_store() resolves a relative path.

Patch 1 adds SYSFS_NO_SPLICE and kernfs_ops->no_splice. Every open of a
marked file refuses splice. Only writable opens use separate of->mutex
and seq_file lock classes, because only they can reach the store
callback which creates the reverse dependency.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs. Rafael
acked it to go together with patch 1.

Other stores also look up paths. They remain outside this minimal series
and can be marked in follow-up patches.

Tested on v7.4-rc1 with fresh builds of the exact base and the patched
tree. The original C and syz reproducers report the lockdep cycle on the
base and run without a lockdep report with the series. Splice and
sendfile from an O_RDONLY open of /sys/power/resume return EINVAL with
the series, while read() still works. All 33 QEMU cases booted and
completed in both phases. The builds, W=1 checks and Coccinelle checks
introduced no warning or report.

v4:
- Refuse splice for all opens of marked files (Tejun).
- Keep separate lockdep classes limited to writable opens.
- Add no-splice operations for read-only regular sysfs attributes.
- Keep Rafael's Acked-by on patch 2, whose code is unchanged.

v3:
- Rename SYSFS_LOOKUP and ->may_lookup to SYSFS_NO_SPLICE and
  ->no_splice (Tejun).
- Drop the mmap, prealloc and binary attribute checks (Tejun).
- Add Rafael's Acked-by to patch 2.

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

v3: https://lore.kernel.org/r/cover.1794479968.git.krystianmkaniewski@gmail.com
v2: https://lore.kernel.org/r/cover.1793715774.git.krystianmkaniewski@gmail.com
v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: add SYSFS_NO_SPLICE to refuse splice
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 51 ++++++++++++++++++++++++++++++++++++----
 fs/sysfs/file.c          | 23 ++++++++++++++++++
 fs/sysfs/group.c         |  4 ++--
 include/linux/kernfs.h   |  9 +++++++
 include/linux/sysfs.h    | 22 ++++++++++++-----
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 99 insertions(+), 13 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

