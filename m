Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493029;
	b=cOXBE01fLT/KPC87YbCzPyspT9LJcy4XcqRA79U0OUm8k0aBiowGYqzVRrOxngjco3wr
	 LSq8lqa9MIvtLRwI4pP2vIvF27c2B1UT6h/b/wZhJ20xf8DgfUuxsgD8os5Q7aOfZp9ip
	 B2EtdqC72eiBf8OQ61Spby+WH2HEvQ+6mwAQCvs/OC7RIzCDIDYY020G27oaOV21jAiCu
	 WJRzwNkQwSHBZl9uX87UGJP4sdpErtsa/nkS03VPV+U0BMOZdQqE28iBL+tBVcdE85bkx
	 RcwmxWmlqn1fddbpciymvDTzeDuD2w2assIBXOVDxP7pR2BHCz18rpFX6tarzqtwRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
	b=00V+ZoR22N5MHSYxuMIuLb8+7PgneTFzKjbpFcglqLphlU2oh8hbd7IiOzVHhk7EmKbL
	 FqLOcjawv8f2r2zEDbL66K87sVrqXxfYYPoygTiVc4vm7QSNF9WXDkVJgJQ/kF3EP6nF2
	 DNxhNTlSV7ty3PXX6v/Dy813mtgbcn4kOJjXN7QLr8saIPKuPF5Si6glwh3W1T4V2fGZD
	 qeRGaN1uKrBhCKXQCBEuUgzTJxrbg44eWqMBwvkdsC2MBw6KOA8b8b46zgPFctUhNoAKj
	 LpXNsoq64ckRqfJggplow1pPW2UaiSoiNQfwnjo/mtE9RnXmL9+QQL2SkcdGBaJ6x+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoIgoeVW;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1DD606A33A
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1DD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoIgoeVW
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c506094fd93so413455666b.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493026; x=1795097826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
        b=MoIgoeVWiZwGUJpvSFNPm3iC9zM+IYyM/8u07cjerGCPrDmO5xzA1IusAFfvY56nAI
         meJJOu5DUpGirUsBJWc08/fhos7n4/IWqSRqyIJg/pXFaor4ls5Ivc14QIDpY45S2w+1
         oZaIs8jEceFYHeuJkmSlVI6rY91preTgvQmFNApKG9xV95YMyWoQ+8HZdanqGWHU0hdu
         QP0CRNwnyhG9PSUpcROLrr+UQ5LPLreRH3Buv9iUaAKY4UXSXCWUgE5HTWAEUlSHz2rM
         KChrLhKAhYpL6jRuoSDZxIadheYaUE/z07mD6Y4EPVeWlR3sQ9SAcXIt4WJYg584XsmG
         GBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493026; x=1795097826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
        b=AF5rg/tBTFTZnfOq6dX5xFiaPQ1A318u5P/yqYLL4/7drLU1YLsza5gwI7C5Jg+n4+
         420paoEbkWHyv6U5YTSVPCMNgXDtKXqPZH7Pb/w3sPyrp9PaSnrtK288moTMCwx045lF
         IqOVNteavu8zP72L6PXOqOswsPl3xEQLjt26nQJzqoMBQh3jZlc89K9R1dnPvfuGWIt3
         Lr9Mnh+8sddKbqWAQ6++lkBGagulG2YNI5qBgosYcUu4QM+bK+4WAYRl7IRzWQsrXzoo
         OKq4Zy8ZXRB1Oaq8SLCVo7bvcQWAfdPma+DbPhjaufDX57sNkdQRTrb9yIhbhSjl00b+
         ZUkw==
X-Forwarded-Encrypted: i=1; AL+hErGT6V2IfeNcAYQ1eiRhYhCwdN5HRnDqBbSOEcL133Oeitt5PaDiXQzcvp2SzkWoVFxGQ+xZCbMoLWowrg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/LOc10mEAk050BiskmVuH7FXM83kOD0pT1MKulnMRvMOedeND+
	Y9Ix/MLUC5Djma3YHmSigt68Stw7f36IZXGrYZbQjPBmo2LCtXs/w6kH
X-Gm-Gg: AYBFou0u6WmIY8+7eglXuKAAD8EQOP7iQMZCoFSdZ0c+sQsrnV86Ia3BuLS7aH7NvMa
	X8gmgoWqSm5ZyogTsR8rSWf3YyqKsTcocPSK/rP3/j80/z0qHckhTqd7fDfqtgXO8sx8PfcTUKG
	NxBRR2Wrl4HzS+XRTQt/ujNhBGAjTit2zKd9hNEWjsBvE9W+6ASOkqy2QCwY2Iw44kyf3KbRuX/
	blveyru7PN8f5rPbHW1TrnIPWg10Knl48u1YaOWurekT3iAQRdgHK6Sd9O6NF9htNQez6lZ04Oi
	g9+IrQjYVP70x2lkzgakiH7jylbIMEU9bZCPNfROgE6ayjZcMUerDpbSn0ozOQaiS3K9xdVYEKu
	BACjPW/zV7Az+U1OC6fCNXtNSYDM7nufChsrDV9FWhho2ezr5bdqAzFjVX1872ZQ2qVEeiwtd2q
	k36StfnbyfY9lUWx8+hz3OLsx7EpX+dqFa71ws/7bRe4Bw2GDTg8wc6opX6V/v0I8IcQNH6nJrV
	i9Xg/jZmsWul6f+8sDrrpHWOs8+r90y4jbImFsKsWqO0pFr6S+IU2ulBl1KO3z0hM4WFZyPWWeS
	c59jYQxuvd2STebUDBnpzLuCGet+6RT+JIPWAH8roCfb7QH/FNEtAHEUWYPTN3MkM5teSYK3ZsL
	FJCd+Ub4pmInuCCjF1ldrVx2QzpiDjBLrxK1H/Re/dmRga7jIM39m8/ZUfTGDulalT6PLg0D6Ko
	to6Tk0T3aiaJezeXqRYj2hSMc7GgtFtuPKRFq3WnQ66jCaztGMUw==
X-Received: by 2002:a17:906:9fc4:b0:c41:5a0e:3356 with SMTP id a640c23a62f3a-c5066cf82b8mr489669866b.41.1794493026263;
        Thu, 12 Nov 2026 06:17:06 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm360156466b.16.2026.11.12.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:17:05 -0800 (PST)
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
Subject: [PATCH v3 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Thu, 12 Nov 2026 15:17:00 +0100
Message-ID: <cover.1794479968.git.krystianmkaniewski@gmail.com>
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

This series refuses splice on writable opens of /sys/power/resume and
gives those opens separate lockdep classes, as Tejun suggested in the
v1 discussion.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A
normal write to /sys/power/resume records of->mutex before the autofs
pipe locks when resume_store() resolves a relative path.

Patch 1 adds SYSFS_NO_SPLICE and kernfs_ops->no_splice. Writable opens
of a marked file refuse both splice directions. Their of->mutex and
seq_file lock use separate classes. Read-only opens retain splice
support.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs. Rafael
acked it to go together with patch 1.

Other stores also look up paths. They remain outside this minimal series
and can be marked in follow-up patches.

Tested on v7.4-rc1 in a QEMU guest with the syzbot kernel config.
Without the series, the C and syz reproducers trigger the reported
lockdep cycle, and a splice from the autofs daemon pipe into
/sys/power/resume deadlocks. With the series, neither reproducer
triggers a lockdep report although autofs receives the same requests,
and that splice fails with EINVAL. Plain reads and writes of
/sys/power/resume, read-only splice and splice on other sysfs and
cgroup files work as before.

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

v2: https://lore.kernel.org/r/cover.1793715774.git.krystianmkaniewski@gmail.com
v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: add SYSFS_NO_SPLICE to refuse splice on writable opens
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 46 +++++++++++++++++++++++++++++++++++++---
 fs/sysfs/file.c          | 18 ++++++++++++++++
 fs/sysfs/group.c         |  4 ++--
 include/linux/kernfs.h   |  9 ++++++++
 include/linux/sysfs.h    | 22 +++++++++++++------
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 90 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

