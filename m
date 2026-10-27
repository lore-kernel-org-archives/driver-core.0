Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140759;
	b=CVE/lBs2xDmkq1UBgnYIDSIsVlF5LC0WMKlCfKgBRa8J8kjLjFS21DXcBipzWgPq6yJq
	 gvUcXGDCEXyCinIf0Xv/8IpnHAGwXQg7b6Vi99MNgy12+Os1CLQY8MH8cBar8JKMTyOCx
	 0LJzPszYexNlYr1KhwHDnZFQrSJ7BAhHnlF8TAzMU5KhZdRRDcA5QHXuYMTgnat6QmYZB
	 k7krEuIxxZNKlS83sdBs8maXQXD5suf/QtX8FP8luiEAXDc5wr+byEd3JmcId1L1m52rg
	 84QYd9BLKZ+2Zh+jiFzxcwRhQlMyd/Neba2yub/Vn83djxiaSTGai09d8GvjP0GGfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
	b=3JLGjCYHB/b8vYck35tvZIEykeFejflmqAucA3o25RseBWNO5rVdQ1HDK6kcCvYbEgms
	 BldcvttUcyOGJwjcb/nl0gKat0kJXMcEijlMuqdWRgV2hgoUg7nu9TPbXaXktnVqQnqUY
	 TNw0KcPWEZQojku/tSQrlSDhFQGk93hsCAbbQC8CmWR86ge8q/sV75RraFVrxJ6MJMVgt
	 Mx1YqXEqZye69vobC51nIKmw00q8oVisfLcFm94YhdxGZOnjcZ8TMDdeM4c1RJH7ILHKW
	 9JO0Az3NfKOPe9JhW9kuwmT5ggPuc7JaijX69Eyoyq9H+Zfl8EH41VlCo5hVfZVn20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CEPbCgzd;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9FA60A260A
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 22:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9FA60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CEPbCgzd
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso551610b3a.0
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140759; x=1793745559; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=CEPbCgzd+lTjshmnoA51ZLAGxWXXJ0MjiwZ6jMsTpXIlRN0qFbm+61zLAHuollDRrq
         NRZ8ELGdDPIzjKxGmPM89+pSHxM9Mnor8QV6Fi5ySAk1UcWH+mB9f6WYdlH3StFwEMj+
         NcvdQZ+kNvWt2RSyhynvOaD5yWTOAfC+0GaGTatxaCzXiV78V03fg9B1c6tjmWuyHyDj
         qBw31cF8bZD0w6FRALP9XWaecHjAkSkBCOP+mNoT8E51I3rNR01dLYtn2uBI8M/UIv5A
         b50C7QctzF4uZfjjNQQCS8LX+AChP8iBrZvqw6qjdSrxo8IVcCeptCO2N9j7D9iCFwHq
         08wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140759; x=1793745559;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=iUfS2TSg/SNlYyWws+mGfktvIse0p7FUaOAVUS2stYpso4p7GxxrCqTNQDNNPWw+M+
         L7HJzdpLdNCyOnNjB9bfIJGk9wuTNI1fnT238JDkJUv5VwRHjWLKDy/LgSH5Oe6uMGRz
         X4uajV9Ws6eq09tNlv3Hrc7TCyljhfkKwTNE1541946J4pqKqr55Enbp2FH9sH83H33p
         OYD3dE2uULE/Ko+VZgUd3vt9VVkhv79QQjGp9WgAg4JWqZxJZOfzRdazqrgPOQR83eFT
         g4ElYp2qUGn5mNWbRg7PHYce3/aM3I++DKX0N8EpmnlW/aIc5uwJgNgJxtoIS+T8PW3M
         nJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwU4lx3RCN4gwt+aQ9AJU1RT6kPqewuSM+DuyrXMVJSBNJW9CHCmo9jv1xJPGNIB3pCT0uNvXftryExWw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK/97r/y70t/D2h5KLVK1xN/vojuGKVvkqODarh9LZjklZclrTJ
	n1VyNpa4X2jX53CO/Wb99x5g1fcb1jfxEifg2fsO5UBhhWKWhRdMaxS019r6fz5rDRN4rr6KJ/Y
	gX0Y3mXhPww==
X-Received: from pfbdw21.prod.google.com ([2002:a05:6a00:3695:b0:89f:827e:eb47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4293:b0:876:194e:b8fe
 with SMTP id d2e1a72fcca58-8a6e70e832amr492696b3a.26.1793140758450; Tue, 27
 Oct 2026 15:39:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:38 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-4-irogers@google.com>
Subject: [PATCH v2 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Mundt <lethal@linux-sh.org>
Content-Type: text/plain; charset="UTF-8"

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 908a8e09113b..f33864958487 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops = {
 	.store	= sq_sysfs_store,
 };
 
+static void sq_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static struct kobj_type ktype_percpu_entry = {
+	.release	= sq_kobj_release,
 	.sysfs_ops	= &sq_sysfs_ops,
 	.default_groups	= sq_sysfs_groups,
 };
-- 
2.56.0.313.g2479322e68-goog

