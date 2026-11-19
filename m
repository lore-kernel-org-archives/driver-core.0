Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116342;
	b=V2y2UqAGxIXcA7pDdW7GyRn+AO1Io5Zhfnf1Jt4m5mM/CiX5aj0UQatZwAn3b0VGdTU6
	 gW1K3bVLPcRWDATBwqVpmAFk2nA97cYCiK9M5TvjoDjBMY+GZuTgIlJvNy0TEhSKXiDtX
	 zbVDKsAamH3RYeGVKE0v2N5ENU5mcBI8jEcnxPj7kFCdLprgQXnOBcSVjFVoUTmfxfSKC
	 9qytqqO8Jv8VaQ6oxjNbSMEipYn5Yxl2Z5RRJWD2P0EqltuPzL27gaw2Jl4vRJ9vEFxvd
	 wZOqFfVquR31+v3kAfhIEU63iZ8qzCOPLivVq1OfSbIdrWqzlfANrvw5fSq3iXKxM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
	b=Ipt8MPhhutDBBuqB1OUPkHNo7AVAiGNWkkFPkS7kyALlE0WjEcLlZMhIP5benaszl6lK
	 CjsK0nqY3bkbyW+XNtArudDTqDUtMSJiLtOTfegFvHZGldPf7AYtCosnlUKwa7Yeu/IHz
	 7cT+MxaQH6LTGiCzAyH43f8mJyQocaIvYBMy0gMMnN1mO30G6+NrtI6NrYPXanZwqF6Jq
	 4Zzvgn1Lag3Gz7w0QLhUrCKOrCnqzuJ0ZuehB80CWfRTEp57Wt9JHwIkODeBDTneiZ9Wh
	 iE/jjsallTlZRGWHsQCRcsRk0J0KhBQlN0oU6VuigRsAn5P2RZ8wadKJRd5ihTEh9kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpXAv5bq;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024760A260F
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 19:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F024760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpXAv5bq
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f040056fd0so1594165ad.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116341; x=1795721141; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=mpXAv5bqYApX6ypwPk8eAHqRcGIsXHopmncKcik6Xj7H/NDLc1vp67RC4lIPu5sfnZ
         SHyikXWPtgDu0IY/I9UVMyIzu6AqELYB6LcGGFNdllfx04519afVqG8cAYjIq8calyqN
         hndI+15X5H7CdtEyurdVV4FA3QuTx8LxRmi0bsKMO+n6FIYg3M9DJVm3Sz3F2Hj9BxrJ
         gZqAbXmdpM+CUqYqof4rVHhDBv1myGNNVsvy3b+Xxs5Np+0zEKeEKVnYA2k58boGsvEY
         0Ih7Z8tUHQQjb2Z4sfAmuXl+wjO/ZDjG7YD+lSScTMDJvrCmFS/1815tpkPZDc54DC8A
         kJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116341; x=1795721141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=q53bF+j6i9Vw1VewGoU0TH+OLvTsDLilVu7A9uSgvfnWzI7L+NnmNdx3M4Y08ORT5T
         gIRLs0gxObM/1zktLTJhwEX6bDrGYfqhd86AdhTB90LDLWH+tEbakaQZf+owc/xNFazm
         /fi3Xscu+Trrkwz7/5+KkL1wiU7qlbilU6ibs8rvK7wPPKyqsusmxrZRINj0ZCpHP0+/
         O8SHWTP0TtkiXUMws6Z8Bx34u+ev0qwn9buxeZB1fptmDF5N/jBapA/SFhREgsX4U1BH
         V+yTt14ENn826QkNKn0SJex+d9R7XSIxRI+1m1RbT+CHhAKzWRqkdUAshJkdslQr21AX
         eL4Q==
X-Forwarded-Encrypted: i=1; AL+hErGrsZgyouql86FHNFvO0p/f1hEpOxazJmGHGkGqUSV+wkdeVACkab9P0tVKVomjIN1H3ytElm1JEv5zHQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9HF7qCyEBWa73jUMViOq8lIZy9TLwiPIItLmorPDFAL76WLFlb
	j2odYNVW5aFhjVxbPMLPwVOTYgln9VXCzI+dNjBZHRjJ1N9bbsptPeG1lk8Cs/FlCXoxq21c+Nf
	dPUHhmyEKfA==
X-Received: from pleu15.prod.google.com ([2002:a17:903:41cf:b0:2ef:d860:1c85])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fda5:b0:2ed:fb0:bfd6
 with SMTP id d9443c01a7336-2f031e08699mr15736045ad.11.1795116341051; Thu, 19
 Nov 2026 11:25:41 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:14 -0800
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
Message-ID: <20261119192520.1983406-4-irogers@google.com>
Subject: [PATCH v4 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
2.56.1.708.g77570a6a1d-goog

