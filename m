Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177585;
	b=LAq5kJnP1K4A2DhLPH2uBKDpENfepQWCb8BEZdC1/v/AC0Wk9S/iLn7gGm/ORibq+fSz
	 hLyHgOr1W5WiG/F1RIT2WT4lHsvc3WbVoLg9DOGCWl33Wr1Ln+89iuZnwogWIqwigB51p
	 vwHoc9mKbBxoWKjHPCh5i5sFmOM3i6EzdBRuhXEQkBK69whpApM/fgqVC7jlZ86ZoRclJ
	 SgGN5zssaF7l4r3OMbwNrnxDhGIaXZTGS3APQQeHO8e+/+vKS5SVnzpo6sCf4UCMMR+cy
	 ExQU3wHqKsnOA7Bv0lodQXooNeeIFCXmL3r2wI9j5FxBWbnWojZU4cEnOI31q2+iKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
	b=omtjXSmeOMSI1Pgh31CUH6Il1Y3iViemUBQR7jA07ufXJvV9Bo1XTRYK77YhjMy5Glu9
	 7iQYMSgOGZTTQWm5SpoBk2zV7bEvpShAK12wD2xNnZke6kPqlcZXaXCtvzk93YCHreXrO
	 Rxsk/YphrkCpJ8I4VH/gsgHytGQBoZZjnRFr8UHDXdmZiAe5PIb+AkrLoOtuoL1Uf28VZ
	 FNaU9zy9QESliLcrsRr0kdpmIEL5FhtnkYq2sMr0udJiahgo3jx0yDnH/52UYA6Y4GA53
	 oITN2LlCjkVob12pGwqtf324wX+UCBM0ouOCzUF3S37mmUEalvPLWRUAgUakgz6B5Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPoDPQa0;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA9606D823
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 22:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EA9606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPoDPQa0
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b0d864826cso1320303c88.1
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177584; x=1794782384; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=CPoDPQa0wuL0eNdjELBwZmbVyllrfVfdzCUczJ6XOQ8uadHBJD6VU+YftI9ItrO9ht
         kqpa6U6YBxaE9kcuzfBPhEhE6XOz8TcpTPIlmOdQebkHcRSq6W1BTv3CEwcLC5YJxv4T
         m3drqCoChPFfeRe6RlyjnUJl/HTaGVYGVlyBe8DOMb9DoVSIYb4pZLFLZ3ykAc6yc5rq
         +rBO0BhWM9S24I1dUT7CCGgMuY79+vKQ7oOYFqOJbqh7P7vlAJTHTl/JsNOZ0BWiG1J1
         LOt0szfYRdSZa6Fu5P5vaMZfNtXCUR9ILTDPTr0GgTxdauJqXQ4TBaNfeeH7Fsc0b5vt
         9Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177584; x=1794782384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=J0MSz+Tu2ipfLwig61Mhlreywuzatb76M9C+OUjM+dcPqZfKKKLwCpFur0nafBC8f7
         XeE1/1eNDpUExaP/ts+CGETmm6NBNIZL0Vz5xgmYf+qrMghUAMkgWQOGmen5cpB0hqaj
         JT3DSUETUeU919TWpStX57scdfx8EbtUoC+oeYpjYpBnMHE38CWFuG/Wu9NrKH3AJ2es
         bDV75B1azYn4mGwe01JMO4xuxRmjPoTkZV6lg1oUw5UBNFJUHHKt9TBHCYVcbDHquqNX
         rLZSatB8hHP+UcLm/tCOdj5SWNsvNYWwrdRBcV/IIBI3MYETrCKH2UxggP+NB82k7ofS
         HUWw==
X-Forwarded-Encrypted: i=1; AL+hErEdAfEI5De+8YlDq/AVsdkBuxGvqt7ZlsM40Cwp8cl9b6MB+IxtlW55Yz4b1QxmTC5mz3DlUfuyobs0sA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+k4c8LgK/6wqP0zMP2dKIq94GH8+oZYf4e965qKh5DdemTyfC0
	misklxOv/T4WF6TqgUdiMjKSJusi87TvCrh0fMBQqk3mJd+TzJau6F9fvFnPm9MGxriNnKjuPpj
	U2qEV0yFPGQ==
X-Received: from dlad1.prod.google.com ([2002:a05:701b:2201:b0:1b2:6421:f4fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8a:b0:163:bee9:b250
 with SMTP id a92af1059eb24-1b39fedbec2mr3348910c88.22.1794177583902; Sun, 08
 Nov 2026 14:39:43 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:06 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-3-irogers@google.com>
Subject: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
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
2.56.0.455.g6c5a503b38-goog

