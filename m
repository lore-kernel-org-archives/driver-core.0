Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717875;
	b=19EDqalddGmQtFPvainm0Rz5A0tvfBt2Qv0sjukK78sGU3vSVBWVbA3gyuJwAOYCPuh3
	 4AzRogFMDK5jM87UetJSyQnwI5iZNUhsymuefwDwSVkrzG89p2F95/dh4rK5qkKDobBhC
	 il1P9PCxOuWc5j41Jv3wHx/FeGGt5U2694dhdqwvMO4JtkuJexB7ln9Ll7YSy1VKwN3hc
	 CGWK/lzMxXgN7HBD/rl3AWK0BbJr+7ZxeedlDwTrsAirzy22lbslCtPbWXtDib6aOeUB/
	 8lI2sEQ2/CHtsctrs2s9DP+4B73VuB2diM+xljHorHYVynWyiqu03YpqxDtWfMtw4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
	b=v3tB5c4aReIeNDPJvwvLlD7Glnbb9irtX2ihp75EcHa83hrNby/FrmdipReJOyU9bDRR
	 5cNRV+1Zor4jQbyJAB9mhfTCyKmus0TIQNsf/Lmx0E+iUQ/O1eANCh0GRFjmmhjl7TzVo
	 7gq3a6KCNmEvWNTcruxO6fOOQQ/+2o0QHtBCunFROS+MJh6cV2DjhmQuHofu66erx58dU
	 +NzVYcXELjHhtT8vzXrWqHRmay4rOIJbU+cOT9+AfIch9HpztRHwjtJeyGcSf0xtrVBm+
	 sgOfqkesFc/NJYKeGUp3O8rLaYlOUNNQfhK1psb6udpctyAYnDEeSe7ty/E9VtC6Q1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+o8NUdY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCE606D81C
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 14:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FCE606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+o8NUdY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so680910766b.0
        for <driver-core@lists.linux.dev>; Tue, 03 Nov 2026 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717873; x=1794322673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
        b=x+o8NUdYtAZ5jazm57gDyJLW/ZE2/BXhyihhuE/0bCbf61cBY/u4kOQ37h1OnDhY44
         F86v55c0VPGBYnZtGaTvnz+6bqHCgAwA3JTxhdQRGm2nNgqhbdSxDA5TD7Tlj3zfasLO
         UdJ5dvS0/rgqU+jnhPceSjpM6lg+WSZ+ziyi98qER9ZemqPO6H0UbeyfQNDpDw30rBL7
         Oh90HdnpldCs6X5bI5HT6tp8jItMacpA9OcHl2fELKomfJc1e4Tw+Z9PatbQjVZ6r3zE
         pYuWAfX2Ld4L5Lxs98OnCji995hti1yXkfWd+TrrO2ExERYbEzq4QX7vIH0BFhFQz0Nb
         fWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717873; x=1794322673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
        b=DkgK7F0s9cgG2OhggUnrT8OnAmPFVQFa22BlGH3iXak98I4A1kdcSGo0nEz1XSRvZd
         4vLkVr2ns/A428rpFvyug1b0NMN0TE6UP6Z3u1TkhIQ4aBGsVywfufY0yxWPFDrH1g5W
         Pvfi+7UqD501PY/99iL9Hnw1SBA8TcBLRYvlY+mJAA1kLvjnuN5ThWZpXbYQ33hM6yre
         WdKFK+5gXsnNivfq5O5XTP2qCfX7VcNwg0vbSs3n0jeTnWrzZydXRPMT5dDCTKgZ4++v
         m+SdjVyLKGTo3NdpMqCkH3JQHnx7LDJoAy8pukNObLVoX+3yaFPD8MOJLrnuWIk0ftaG
         yOXA==
X-Forwarded-Encrypted: i=1; AKwUvByGZg3WhgpAzGghzI883lBkC3fygU5uuf/Qu9nXe3EcOhHo3NiBTpbsnbD5sf+evOqv7eEfSLFA5krF0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AuOoqMo4mmQX28bFogiAJ6frdNqMJvbB25f1kQHtKPCirH2tM
	rzUtehwaAKpGCk0m+Q+aE3tQwMezzjpNbATrRF6sbtyuKaG0TSg3M8a/Pf9esQADYrQ=
X-Gm-Gg: AYBFou0RohSYSm57JzZTbRd3Fch7MWWDHNhj0uydI/oMAjdiDIoE/81B+BjluFq21+o
	Z/nwqJQXpldaxYfW0BicMXdkkfCEmSWAW6O8NLQk3E49LwR3fdTXYbhcfmtPpMRi/V/r37RmA5J
	jD7GlChrlSNqG+0Bu1puFUIkpJkzAHr2HXmn1RZjR++VdpGyQAS5qPLVzfw26Ytw4AXryq9ujwj
	3WZEQSiN2rLfH9bZCRSbhcHcdUddFjKZPWSHJUBUSZY/9Mk7GNqWApv9TiYtrRtLIpCPqpLF9S6
	embuYnKb0x/BwPIHxqJWbADSQ0RWbz/eS0EgFJekdz32n6gEBKSk6aPlMgZ627tIhqjlILrf9OR
	c80PaYKmOneggBITunIMre4Dj5DStk0i6blAum1jPJshvRTXjKU2JOsoAjiz94b/gjEct+mbbtk
	wgTIpq2khg8KI9euLSB6qphWKhzAWv51pO/m4kv+35m6GnkTym2hw6sHzSwQVVxRuruuDApyoXH
	gKegGLHEh+LsbsP+ZRZ8xhjWs27zSPHQKNSoB1rEKg47YFPpov7xKiRPjO1fmqRnVR7D7eZuiJV
	oUPfmbKUgd2Rae7/1dI3efbV6ZRuec/2rt4ZkC+xzyhNZhTcU+jfzwat798w3vsZDn39MqdFihO
	8xm70PPQCtt/nD4GAYctunnIN+2OT1KCziao+gtqxClP9XeIEfRjfz4/u+U6mC8YMFEcf2L6RWC
	3CVOBcWIlA/xNilvyKlSguH2Az63xMs5cPW/2mD12h5OSrjLORmU4OyeZbcafxYVkbkRf/onc=
X-Received: by 2002:a17:907:c23:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c4ca7ad10edmr1125964766b.41.1793717873240;
        Tue, 03 Nov 2026 06:57:53 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec78f3sm93656366b.23.2026.11.03.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:57:52 -0800 (PST)
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
Subject: [PATCH v2 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Tue,  3 Nov 2026 15:57:43 +0100
Message-ID: <417c773d1719006cc85a3468dc393f5e754bf855.1793715774.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793715774.git.krystianmkaniewski@gmail.com>
References: <cover.1793715774.git.krystianmkaniewski@gmail.com>
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
SYSFS_LOOKUP so that its writable opens refuse splice and use lockdep
classes of their own. Plain read() and write() keep their behavior, and
read-only opens retain splice support.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v2:
- New patch. Together with patch 1, this replaces the v1 autofs change.

 kernel/power/hibernate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e365e440cd5299..9dc5a27f674fa0 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1316,7 +1316,8 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return n;
 }
 
-power_attr(resume);
+static struct kobj_attribute resume_attr =
+	__ATTR_LOOKUP(resume, 0644, resume_show, resume_store);
 
 static ssize_t resume_offset_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buf)
-- 
2.53.0

