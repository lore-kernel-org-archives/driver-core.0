Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C586552955
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931227; cv=none; b=C8fBXI50v8iZVhPw/vsO5nw2ylV9LX3CsQorOOxl+VLtmu0FN0jcp5FgkDL5RM3rt+fihD+eKn2CamxCxzZu/1W6mBfc57g/pRo1vMSlNMyTJgnM1075p+c6oqYZWHRleIDcCS1jj+J9S1mIfgG9lX5O5aM6iC1Ricezrhhijg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931227; c=relaxed/simple;
	bh=uNMrTEMgpiVDbGIrdW7hNuAL0UJnSkmxUybVeT9BNfA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uAhlhxDIcVkGEGG5gfjZ2b8ISMN9XziWxlMX1z041QaugjotuJTb90Bsxy4j0/S9guWCLr8t8aPVfPdpPsDZt+ECDshykSDHgGEB/j7Z0IVqNObx6d9OVQQBtUVkkQdNBKHprZoTy4MiM8EgB+Fp+ZGCra5nQarmzIJ68YpISNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMf3jnEy; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMf3jnEy"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso1187099eec.1
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931220; x=1792536020; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=SMf3jnEy2DRKyi6y2QqLOlPij9KNgPecJW1Nyf0nCkWp0Z6Yx7wlVuEtv0JWEyiR7q
         ZS0PFm7sOBHr1iNgEdZyOe3sv550T5nICUkAOEqD0RUbjFs5qB7XhdV7MZuy5QWD5YUN
         xRSaz6INgVnVLhvKeXkPyIEXESHPpfFVgQp1E2xRph+R+Do6NO8GutOJXNfuchCi/nDM
         1v2QIUwlTHOox1uMHdogUVmHmYYBc/G3w8RokrTCsptNG+lKWMzRie+wTlElATsTjEPV
         1v1/Y1Lbm3sG8zp59/DkALQ1Z/1oGXMiQfxHYoTjFL106GVX2pD459tjYsj0fYObZyIm
         RB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931220; x=1792536020;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=LKSfqX1zYFudOhuxkE4aOaZWGZ8hjewoqmGB7Iun6W0LNOQVzPD2s12o6y9NSXilKp
         SkKCpZ8oMvFCelSVosaC3pH8McaErSDpv50mhi0XGCK1w99BmF8q68dwtegoqXYb+D8q
         CBMoOjXuMJ6l8+4GiLMkA60JBHt4xfd2kWyQ599v8RqWUpQPM2vBWp1dsf6G8LPFy0AE
         FXWdEC3/fP4YjT/gncsKiuSwtLSRxlJBOSvPAcmixOa66lOOTqLVq0wYZB9uYyEdKEXt
         x/1+t9fibB5X8AwFdEdziKHdHDN4r/v5/oMSJRn4wptWCIqNMLV1KjW9k9mv34t8dyKa
         iKsA==
X-Forwarded-Encrypted: i=1; AKwUvBxjNTKwU6EVWtz6SleS0FGomcSniO/NoQcSA3/XznU0f8esUxG1qNl1kZblOqIlEEjEDo5cvzqlESk2nw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI19Z0erOuRNecmuUvcLnI2WxEnsajetjKwX7kjIu7NhdUdW9ME
	EmJPZQZzQiSXCtCQNrtcWmJC7WS71EPJgbyh2aomdH33Pa9JDUYpZhsHfmRmYXKpZOgfRUeZ/3S
	8ixKk2tZx0w==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:352:94e:a8c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:71a8:b0:358:f717:ff61
 with SMTP id 5a478bee46e88-358f717ff90mr13337962eec.6.1791931219210; Tue, 13
 Oct 2026 15:40:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:38 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-4-irogers@google.com>
Subject: [PATCH 03/11] sh: sq: Add missing kobject release callback to ktype_percpu_entry
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog

