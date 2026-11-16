Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836351;
	b=CIKRyVegoW+bu67dDUILibf2tWa7mKADQGJmWBtLVlW6tXsr8vhKnRWmzfDT3vMa7tj/
	 iNHyKaZ/nQHh4Cn9JZoX/YBgp2gqlcomiQc7/7KvQHEGhViUkWFZ5FaLDn8MyRNoPSFIm
	 TNYe3KQ+QQCgoyCWma2gviQ4HFE0l+vskRf+VWpJhhhnRYT1hjk+qwDtE43HjmbAbVQoa
	 d035YYQbr6TJAfRcNGxTbqVBo+GY0IUsak3T5/NOxRj7cdopQwx1G1A3xSM1HQC31RtZY
	 h3jA1zJGIl/7q/c2ISdpZBRfNISg+jrL4lX/X9ORIO5SRcsRVS1ZWLqJEvAqGNW7Bsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
	b=pBB7Q/1Cue7oclVcoPFNwFD0vXfiJOQ2HjbEpz03ATBPIFBAIjzdEs6EZbLkmMpa6vFD
	 ObcKaoavXwYW1N9Ee38mH6rlbKQ+qyLn74aPKsnIf32Oc18qUwFGVd/Bj9SUI5AFJJ5s6
	 W6GsXaQ6FmiSUUNRu67XKN/GJK6Go6382BTFdp6pPc/9VrM+aSFTMs/ZUH0QOpXnbdrZd
	 V0SQmh1LbpbciNVY7NMYOrCJlj6XitzBpLxgFz4G9gufOpK5q4a4V0PNi0G8f9URUsSib
	 FmUYHK5TqNvpP7lxw4E3qlqeQrViOHuBL62+F0GL9NmHEvgrddg+w7lnG04uHFKqupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkZ88OuB;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663F606A334
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3663F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkZ88OuB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505186727fso93085866b.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836349; x=1795441149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
        b=hkZ88OuBQ4E0nysXj6LffPnq7ZgdBNkfaH6Q55I8pVRXvm0NJjAWfK9GuSCYMwusYl
         Jvk3DCogMl4cSIvf7uBqdjx1fqrTruK3y53YTuigCmwVtVfufpk0t8gUlSA5HI/PBKKV
         XOdkgpOPU5m9FneECSlonWhfdv76gbul5icyABkVU7MI9mTfwTel2C9uE7nd5YyOU7NX
         nWHlaJIz0B6H1zVSSStDq0nJW1Qr+9PwpHTA22enWHckeZPvQTkQ3JTKNf7gj1E7AgrQ
         nsSPKF/uCWLP3p4cEnXdsmjwFFrHRL7H+fIXfUW1yc3wWhBMLUjUjHn2bSdbMTMuIgkh
         lefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836349; x=1795441149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
        b=yUZjjR+V6W+IRYQs/mcz+DEP+zdoHJdR2aYExqEp/y+lxs48ppI30K4Sjy1v9PGHxp
         3Z5z8i174zkY0d6OseLDVSO6KAM9Hco9LqKTWoypS4EkdNU/ST1dZOY1h/6JoAQw4IOw
         wFY9mpOQxO3SPv2WgPfW3jdOrjnGKxPfyxPUAPp+o47cLRwbAlA1OvRHZU4ws6KLrP/+
         2w6HZp9/vgja1ncsfGJiLIK4+2vQ8aOGZfv1MCpv2DUEP9nzK/hPLsfai7iNP9uuijRW
         KZCK5lR7RiTv6Q8BW8VDnU/e/UBCfMXfRtauVw/l3pP5G4pEt2J36mqrxFOitbmEoViO
         PC1w==
X-Forwarded-Encrypted: i=1; AL+hErGB63PbucjMwPWXASvwUWE2GuAxbC6Y1FvoHmKsMGuuaB+gjl45sE+R/5Tb5ZnK6ilzzKdVSEjJUhzvdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/TI+porm+BSAZaAFr2kY8mHaSwlltFBb/x/Jx4NpcjotZTVlK0
	NZrD/wj8qQSQlvN/DR2F8ZR20JVGsTvZGEbpk+TJGUZhJrkgjbqlGYTN
X-Gm-Gg: AYBFou0n+RuZQ1o/3k+K6cRj8gyVSct7w/wHA0Dn0Zq4+6snq961YC52cjvs/G0ky47
	E3FmJxVglS2+Jgw3IEsjaOQ5R/57mQQG251iQvnei6LhqIYarRRuUJ38mKWx+HWx7ztIM3UhZ70
	RJZqMbDzLkCz1Bn/kErijeOrrr+oki/DOi0PgaTO8iIDtjAHqRbLnB70bUAoG0K3Gd53qlsjYfF
	gDmuuyNqA8jMo8W3/thylqDtSUzp3naVtPGTnyx/GYpJJH2uyj8rturp4lnhdJP0lV+MMkLMw2v
	G58915ep9Zbj3AVpbv8EqiI+dP+8++EbD3fZ5eaVM/dPNRRnFJWF6BVwAQ/PGnfnfr/nTZ9Bgsm
	1HLHdusiQ9eqnVYfIslYrO3/WKA8AqOO6Pkl+ePCjpc3lAlVaQ/uhZPoTaK+ox+2bZtL7T+bv51
	+W84jRg7/cUodw9+E6cX1zeNk1yf54zbmec+ogmFyMsFqoJUAbgxxPcdaR+g7/u8wUrpP6jNLwh
	ymcGpEaxYnLnVxb4PYa9EzmnZGEGclliPcNRvsvG2QpQSNdrtQPoxqR2lsT6p2X72DvzUCdbsYA
	9G3YsPbWYJML6RaZ9vdo6mt4zve4Clfe5L3BX0xWPMNMF//xSPqlZShv1OWLaxjJvD/lS2UcucI
	JQAY4lYOMUVnRa5IZU4FgqgwSfX8Hl8bH9DBCaZI2nLva+tEsd44xK0WwymlNHDB5xKSoCUqFGy
	6gGULLE7dAxExas5vn7XOTBl8GIRnR+n1G6Dk1TqobdsO573Bg6DU4OSovshSIS+IKhAJXLVPSh
	g==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c50963967fcmr876042966b.29.1794836349492;
        Mon, 16 Nov 2026 05:39:09 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm61267066b.35.2026.11.16.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:39:09 -0800 (PST)
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
Subject: [PATCH v4 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Mon, 16 Nov 2026 14:39:03 +0100
Message-ID: <20261116133903.400202-3-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
References: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
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

resume_store() passes the written string to lookup_bdev() before it
tries to parse it as a device number, so the string is resolved as a
path relative to the current directory of the writer. The syzbot
reproducer writes a relative name from the root of an indirect autofs
mount. Autofs writes a mount request to its daemon pipe while kernfs
holds of->mutex. Together with a splice into a writable kernfs file,
which takes of->mutex inside a pipe mutex, lockdep reports

  Chain exists of:
    &pipe->mutex --> &of->mutex --> &sbi->pipe_mutex

A splice from the daemon pipe into /sys/power/resume deadlocks when
the written path triggers a mount request. Mark the attribute with
SYSFS_NO_SPLICE so that its opens refuse splice. Writable opens also
use lockdep classes of their own. Plain read() and write() keep their
behavior.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v4:
- Update the description for splice refusal on read-only opens.
- The code is unchanged, so Rafael's Acked-by is kept. With patch 1,
  read-only opens of the file now refuse splice as well.

v3:
- Use __ATTR_NO_SPLICE after the rename in patch 1. No other change,
  so Rafael's Acked-by was kept.

v2:
- New patch. Together with patch 1, this replaces the v1 autofs change.

 kernel/power/hibernate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e365e440cd52..da5590ffe6cb 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1316,7 +1316,8 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return n;
 }
 
-power_attr(resume);
+static struct kobj_attribute resume_attr =
+	__ATTR_NO_SPLICE(resume, 0644, resume_show, resume_store);
 
 static ssize_t resume_offset_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buf)
-- 
2.53.0

