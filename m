Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177587;
	b=Xyf4MQo0f5zj/AcxQBhUUuxXAyyMqUEJDO6j3ZReEhhzsvKsn9lFxWpqRYjwICF4oUzX
	 0GNG4KlK8Idcmsng6sPJ1cYecIxQazMyHD5mDxYexomdIkrn7nisNEFYXDNak52NoKZZt
	 GpXJMn1sm2733NqFnoRuOxa+fhYo/OASeYoLDw/9xsp3TBQo5Nz5B4s4kuDRW8Rzda3b7
	 mdKUJQbJKkUs+UKxh6cBWHVnaP5nzr0CzQFNL0C82QSafoRLsBhnK4YNh0CHmqdF1z6T0
	 Ka187EQ8jKd+IUzt2HrRpqjm5gEwMwMIFXG9lcts3qo+a2bVE+R3K2MGeyddEJE6ClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xwXDua19Tz/IicJklctcGTeEqQvEHLiE8QZruqc+WN4=;
	b=Ac+BpgoaSN7Kul5q+7h4Xf7UQLX1J5+t8e8vvGhHQIwe/+UmiDk06ClqWDQHKh54Kfw2
	 nPeZTaq3liw3x8hYEp3vydStX58w56lZvSqIJeXc4GOfPEk1GXavPgJr6MijV83rxCX4R
	 DWcEhr1oI2bFR0MVOsuEx6CedL4w8SmlfiK9NQX/4NzD44nqEBM6UYLUdqvREHsda/DZr
	 c3ppJO3iGp5YqqSRudVkRHcO4Mwm8Nf+GPyCvTq2/qcxZWSkSwQLH5wdVC7pyCOd42Ksi
	 fRhzH/lU09NXUKQO/73vBUdCbAPeFXgA+qkNq/PxljPd0E0f5iXjLuam3yzsUgZRV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvv5QKOW;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF2606EE84
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 22:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDF2606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvv5QKOW
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso401594eec.0
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 14:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177586; x=1794782386; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwXDua19Tz/IicJklctcGTeEqQvEHLiE8QZruqc+WN4=;
        b=cvv5QKOWsf4hEQ9G/q4ttZFG9cRIh2GFz946k74cojNAKh3tqac98gkZyIbMw6YQU1
         7RBsNVsqgaBYsZF9gr7GyWnWVJMrKQxqvFGFa6Jpm6XjO2+WKxRovh+b3embsqgW8mnO
         +hJ97L4FDmcb06RYhhx5nEOkBGsZomUdE61CUr6s4l26vdrBaW6jwD9uQbggvby+NDNj
         kCf17zh90asA3Dt4pX6cNhXgegMdqTv0+cFlOyD+JQ8HWIpxBQPzXsq3d7R8IoHAtug1
         mbymw4nsq3ozYjrWEDRurBC5t0wWpvJm6SSNbDQg/K5CVnTOmssdfj9wjgbKihdS81ry
         bTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177586; x=1794782386;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwXDua19Tz/IicJklctcGTeEqQvEHLiE8QZruqc+WN4=;
        b=TUWk8rDn7zlGnD4BcuxCfmcO4zl8gSjE068no/KI0sVHQfeKL39MXPZCnGBV4kFhEM
         s2/+4AySvi/aGo4aFWfQEe4+Cuk2NGTIKPBpREW3/8VdNiPG7RUJuIvIpdERe0KZ2De6
         M1El/PD36IrqWfPVAKsv+mK2Yy4OapYPvLNsifa29OoKM+S+/0f29BAZekAHd68smZa0
         baNiboQc5be/zum6OePc55a+zgACCPENGE68o/7ideu8gwsuc1UZuWZOdiYSZl4U9S9f
         bCtM+Hnz5KpgWvbX/P5Bvf2/2Byd6dfyjQl5YDd11DyjFbnTZ9lYW5UbbDG6Ke5eHTUo
         K5wg==
X-Forwarded-Encrypted: i=1; AL+hErHkeITBAuBQz5VH3xAAzyDImFHlGL8eJCcJos9Gyi8cB/dqSArDijM4mXcckTZI5voYvmAFbVoknaBJpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9OIAayS+IiK2oRvLD2NvkQfO75b4DmHyp5I1oqzTUmdiLKVef9
	yuI0OsYuwyqgJXDoU/jRtukany1931yxztSHA2ThyeWX5Sk7Nz3LiT1ewXISZjBnVqTxxPFpKkR
	JY5msaHHEOA==
X-Received: from dyx10.prod.google.com ([2002:a05:693c:820a:b0:36a:eec:f68c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00c:10b0:36d:dcdb:70c5
 with SMTP id 5a478bee46e88-370f7b8f918mr9710009eec.20.1794177585797; Sun, 08
 Nov 2026 14:39:45 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:07 -0800
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
Message-ID: <20261108223913.3624571-4-irogers@google.com>
Subject: [PATCH v3 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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
2.56.0.455.g6c5a503b38-goog

