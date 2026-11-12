Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493030;
	b=P+JfYYgFUZnwQBLJ1iwubulIgLdWoFfo3LbMVgcBaWcmiyEEibIwF2P4n1wDDKofBJlD
	 IdJuv6i4peYA5YxjDmS1oxDStC8IJ21K8wcEajYyrSGnZ0LiobXdnOYveF7TtTRahRKp6
	 zuMRcKC1oK/uEgf+YK8D4hCAiBB0tHYSGkOdSTG03u5B5KfRyVnOCS/OS4J2P9uohlSRn
	 YrsPUcLdhq5FoTRzQTYiNob1ZJRTet6KyMakTNW6YUrFQ3Y29JB4Kwj28Obt2eFBkpnze
	 q/64JhEsIkb/2SQUJI/bLD4aFaVn7gqvZt3tUZbA/DVERDiW9UBX3LzRS9fOwstvoWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
	b=XPOsSvudg4T3SS2VaVKWaBtO4Ttvx9N945daweWIdXmEKmbgePjz9zT6sS/mc2Kx9wgk
	 7Csesqv+WSckKxi27w6JCFgX3+vKbX9kEjglOnRntjFuO7V9PJzpLltmS00X/z1uSsuzg
	 PAmuZPDME5wcuq/YwzOtX+79OIWghvb3Ru2afeKJXMZC0OhkIMuzouUCR6KFtceI5zCNG
	 KcU9qdbWp4oVvtLMDbZKIFYWBlTJ8+9htUKEK2SJJJZCdKdaBOpscUkRBXwRuycoyUzb9
	 ZRs2T1qaqXJ/eMRVal+nUcj1cXFJf1feLH2SPpSdHJfPFm6IIJ+aeC6XxcoLe43k/Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXMYZP4k;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148360A3817
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7148360A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXMYZP4k
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so6048513a12.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493029; x=1795097829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
        b=vXMYZP4k6yDfKlmzzaqxsoRYp2EK8+XXiYg92txdYDTkNSBg3NUn/H6TF8eK16WX9f
         rTFcDvSntB5I9hqBQxn/yWHDlH6pFeZgXzKvc+pzfQ9V60eh+eR8qPDVzMm62fICv+e1
         Jo9RqQNSqe4/XBsB70+XAF6N7CAzc4m6wBygdtq6ALrdjKjr3frWW1GJEjA5GpArF/sZ
         czzw4c5arTOdreQN+IJhZ5w7Lcj27FRldte5ViC0RI/8Ou6z1QeJokL2b6AuLvd/C872
         PuqZ/LyOufD+Yrv309SKuDjXQW8913t22ayqqRY31HHOsVbaneFsg3XzK0Z44saONnpf
         LlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493029; x=1795097829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
        b=gAQrB/akiD86zd87vTPkJcKuNS0GrwuzrZiTUXbUAyd74ta5Gjqc34yEa9OBgT5lyL
         gqPF1PMcfrvU5gXE/ZAMMwSK6D4mbcpCPCiI5FW1hePrfN/XOxzAl46LYUhysw44gRwx
         eBgu3lsGNVYO3d311Ak0xouFSMLkWxikC5aURSKhLxTFe2OAld4PiYoIlx42VQCu+kdX
         +y589SBTF3BI3Vddlw5JYtFihq2QDSSZqj2t4z7YWhAtOQYEmmcXYrjrMFhyCkWIWrKX
         7EuTjgdQ/oyOK6tTYL7yLJxppWQaFD51LKJgmryNXOLH+srGz0KjZoKgYV1H/aT+0osA
         xklw==
X-Forwarded-Encrypted: i=1; AL+hErEVya1FWIAS4qDDS4IAlJH1adR7i4UJyk+gLPwHcXNENITQeWhuQVR7wF+aHER5LDTieRUJ3/Wydub7Rg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/h3a+mR5ZXfKz/8ymLk0fgp+8ma5hvt9kvkDDAcvqKRhcUUA6Q
	1ufAe7QfvrwwjcJ6HJ1EpZpvCLC+hwa6fucoP7jsBIgdKSjS6Oew/S/Otjk2GdF5+mba7O2z
X-Gm-Gg: AYBFou3oGVJsEPwY3fNq+mLbrcCCejbIfJT5RB+oZePqKTNKd7oNceUD4dG5uizgU47
	gEjDVHMTvL7EMwCVIy9VON+/SZ799pS42+t0zBeXe1cgUrpWl411msfOXvTt0peeZWatz/3OYi7
	nIt0RCKTgnlwS4yHqJl6mF0iAGwsvAjtjrO1lGBn2aeC5FLjZISq6MJKzfzbU4gXfYY4w/sxHzE
	1oAHb5cmE74vp6Xcd3JhlXzGMoSUmZcZwEt3Xt8nH/abHCBpezQSJm2Q1h11Ai5VHsiRjPutRXO
	kM/Mu10BvQmos6m2Aej9jqWkF0URkr7K17T+NkXIHxFv9jv5LNJ34hAV+SvypvXxblCen5p3zvo
	JGyHlYrZDlginjCmdqxX+iwOu004Wk9MQA1Q8nuGe81hQcM/VxUkd8O2HZgVfRmBiAbH3rHDH4r
	7aAJhBKgDGd/f5IsRIq9loj0QQ2vi3juPSC5FIrJ30zrRfUWeUJXPVMJjZVHLIc18JTsZeZ7uqf
	z86bSr+2NsvMhHYiUO8fzntN5GHbxYRd4IYVj8urZw11TcxW7ili4imnlveBpkuBiEYaO7RuJI9
	4smgFQmfjnWBYtkH8tgfvDdoF+XYDYwUzKNSjc16FT4IuHQ49dBWtUeMhcRX8aYOMsmb17ghmgE
	RBXfWbf/Kwk1rKgVlnYx0F6R5M+qurrj3+eRFUxGlSJvte8XFSqnjqE5GWtwQ0gMj1q6MLfQRYd
	AEOorM9Pdq1ppDnMI5yY/Z3ya2lsQ8/ClkvQYzY2ews/qpleab1F8fVL58a1L2f+honkF8aQg=
X-Received: by 2002:a17:907:3f24:b0:c2e:4292:d27e with SMTP id a640c23a62f3a-c5066ae263fmr504242866b.22.1794493028760;
        Thu, 12 Nov 2026 06:17:08 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm360156466b.16.2026.11.12.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:17:08 -0800 (PST)
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
Subject: [PATCH v3 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Thu, 12 Nov 2026 15:17:02 +0100
Message-ID: <aae0f774a25c8e2048c09919d3b6b841e2b1c1dc.1794479968.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794479968.git.krystianmkaniewski@gmail.com>
References: <cover.1794479968.git.krystianmkaniewski@gmail.com>
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
SYSFS_NO_SPLICE so that its writable opens refuse splice and use lockdep
classes of their own. Plain read() and write() keep their behavior, and
read-only opens retain splice support.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v3:
- Use __ATTR_NO_SPLICE after the rename in patch 1. No other change,
  so Rafael's Acked-by is kept.

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

