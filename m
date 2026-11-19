Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116339;
	b=0HhGv3bljwZHjHEeNOU01bqXvF8I4MREGknIS50EESXGwea6Sm5UnoKR29XGL4/n7cXR
	 YkbBGvwR+PHG3SEgfCvTOKP6b28AstT0kc3HT44lS8K4fGSnIWAL1UOTvYErgFSIYKqzr
	 oPEINps4tr/b3dtF5GtndXglQVE7AC8fAzV+1nP8w/3wspvfQnszMR6Z3r5bFED5wCotz
	 vwcoTTuT+lyZWGQfAtOYE6ol/JIDkCM3UjoIo8kH1T/14TLs7xHgyokmaHnqRxqTB7AJF
	 diEMpJRfUJHoUOdMLtmfe23zg/IQHuQp4F9t0qCaucWdLZTX8xqEgKdwXILCsbwRLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
	b=GQ/THZEqGmTlgvgJgqcV2u2U7gI5FAjFsyF2GwEn05KC875jS0IUFnck2Ee98Tk+rnMp
	 I/JCkiSMOHA7YXer7lHdouvR8RwUfKGy6IXfMgsdwcelulKz7lOKKGB+jXASd7lV03pAz
	 AFyLTDlPxmqEQyzYM9gxQ/Vjb2NEEKOLM0ELcOtTltua6v/ZVUZizV8rfyVcTS9IYkt9E
	 K3oxbZZaJNwosI43msCdLBgpUL5RKj4+NqQXNnIIGF2QLA88KSeLkEXLpjNmhwR11uLAb
	 DRBSKOenLG51K8GwmTxNN3XIPQPI2nNhGXSCEbQIqA490il7P2ZI3K9Jbh9tH+6g75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SEgD34cS;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BD260A2607
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 19:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BD260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SEgD34cS
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so216225b6e.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116338; x=1795721138; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=SEgD34cSRnsknYvG8/z3lgVUD6kq6Kbl933e5kv8Af+5rl0e4Mcpn3fHbsw0QXw45O
         MssAJ7m0vtwThliZTkHec0PLeXgDrQx0ByYkwt/9Jy7IKJE4MRnGFUlMK1LVn8LlHqsX
         Az7Le9iAMoT5Y8x5xhzK1e3hNtFq22kIM00GX74ZMygz313KoqbNmOk6sohO9jUuUtGK
         M9+84J3c+5k2fpEpbbIWLpRwyALMCZ7Wmrzud6gQIH+XsmTz2ymSGxAxnNfS83AAJyZk
         tl15CliByWGiiLXEPFaMVYgbx1lAFzhHTSKfzwFOLkJ0VNx3iNB0DEWsZLgpVkdtFsnI
         K/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116338; x=1795721138;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=DP8f/El4CnbDV8qjxdEow+F1juQfVuflVfA7SXLom7iTq9CK8JKP/SlWFS2WsjhGdS
         V380v7x59GtjyqBi9u4kbjm/XW5lJ243RSFG3jVV9jYNAOeLNpeJB6HM8uaCwxsmoYwH
         6gNejYq+DjOvxkQZbBZcKwdFZrXuX7MLMe2hoqd/rK5WTT7HEYw1HGH2RBvllAQgRK9F
         xXi6ZjPyijsjPPUfXdzDDfSbaz185SeacaoUlCPAAaY/jPanXoojWeKzI5wsuO+Eg87s
         +dfE2TVILDgTGQhGRXPUxz6ExpXS2Olw/9N4XhqNw4g6hgQEW2s37akzXEuE6F2nLrMm
         Ya2w==
X-Forwarded-Encrypted: i=1; AL+hErFCRmYob1xSwdiY1cCeKGfq7BjZFgZVxk30D6IGXwDeY6LUA99RwKPa/yN5oFI0v3CQk99Is6s66OlZaw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/w5iQzcJFpQqXn0xgv88FnoLL5IN13TH8xOl2zBeDD1mzsUEQ9
	JxCJQZ/+qzLGpFj8L799iqtwcZoAhgew5xo31k7AanzfYWshIremaf1BgdQwVVRlF9g+S6a2ux3
	XbptClUrtKA==
X-Received: from ilmp8.prod.google.com ([2002:a92:c608:0:b0:51e:1b8:eceb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c110:b0:576:4595:9836
 with SMTP id 5614622812f47-57a0ba52419mr994155b6e.40.1795116337420; Thu, 19
 Nov 2026 11:25:37 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:13 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-3-irogers@google.com>
Subject: [PATCH v4 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Reviewed-by: Srish Srinivasan <ssrish@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.1.708.g77570a6a1d-goog

