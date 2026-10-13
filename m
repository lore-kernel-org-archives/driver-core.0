Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E777566C75
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931237; cv=none; b=M5gZHrfdpqWLGZlycJXIdubjn4YwW6HlBO5KHt0Bu0TrqcPXc2mK5CePe8JE5v51Uv5jox4W9a7TLP3mJ+BokU1FUfDC8DQL71N6oHyIwp++LIBVq1Ud4JAVtMN6jprg9ZbkU6ds0d7YMDVCUdeTsFA8bRwNWREMQdiCsNxJUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931237; c=relaxed/simple;
	bh=yGWlUBd3WHI6EIBVLEUjSDo5J54V9OXwWHfKf5QXzl4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MYTgblnad3zNVijVTZhCS6ELwwX5avwntiHC4MjAI6Xbp+88QDM+cG5lzBdYyOvRsriZXnWQ0ldhDVG3NzLQm6zw3x/3093O1rWs8ey2vSvpltviiT888tXRcajJIqisCtMoPk0g5d2Ymi3ir/FE+wTp9med0hUQb5RA7NO6WFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QebnRZVu; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QebnRZVu"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so1601253eec.1
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931229; x=1792536029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=QebnRZVuzKdIay7dIwNgRxo0VEsJu+Hd3CYIQ7/WX0YFr8YV9LrP8FGWvdK/GbRnk2
         PKSuGNeQ/HYqQtgc0BDPLhDyK9ho5aXnoGo/rS0k0G0vHkZVUDBvx0Zd/BITyhOVzrMY
         j4OJJpqIX9N2knRhjNJB5PaW+Jdhh/kRzmfcPzw4Rcsd0BVnRUlxw5PzdqUUyXFkacRD
         FeD9IlQeoXSJ5rtuUT8o29LcCpT+BjxiSpPvsPbWSe0TtH8rxEzpXiv3VnAtS0aT1XTz
         NKmCNi2rYqotjC5Jow8lpblcndsS7H6QMZ6n6rTciQ8CF400+GYG9pEgg6a7Q1ZfuXWo
         H5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931229; x=1792536029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=kWkWHKZ6luFHPTO58Uu5vzEyszEc7OayuR66rK9Zn//6jY03xXvEAJfCH5L1yVkz9A
         xT91Cj3ARRMbmPV2WGUaTWGsx8dLuSi1MILZrz2sj5sPk2CVDzJeyVvP+gn1zIlXH/Q9
         hWhGWksEAhOG4K+oSkjUUMZaRpJlXHkOdYYIlikOlsO4wLBB14RpT1iG7EvJ+46IWHQ+
         DbT1v2GNZsJukiU7M0CTef3GKwxOEEuNDl4WqvLT72rCjnw7dYxgW8KuifuL3Wpu+s5q
         uV9xX3NPoJkOL4Az2JAY1a+Z5LcFgCcrEmSqrYVMD7OJ2yBQVn6aDlLmL5udUweXg6Ci
         1PjA==
X-Forwarded-Encrypted: i=1; AKwUvBzsfPS5wDnIH2G229li1p+7Ykhppzxj5Dyh/NBc/3uvwdu468v3MkDTeKlAIWICh6UVu9d86T6kC9YfFw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJMMlPq6SndUaVzH122TpJP7hwzGFJ4Uyg4Xetq87eMyUmQuVpK
	qBVEwy3R+odCuK2drnFzY9hxOIU4vS4eDLpXFTYvAHKvMZJLfL5ANIoulOAOYyDpcdW4hynCePA
	5e4OLVJrqGw==
X-Received: from dybmf44.prod.google.com ([2002:a05:7301:92c:b0:358:41fa:f46f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8c2:b0:35a:8dad:6724
 with SMTP id 5a478bee46e88-35a8dad7ec8mr9213311eec.22.1791931228757; Tue, 13
 Oct 2026 15:40:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:42 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-8-irogers@google.com>
Subject: [PATCH 07/11] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.0.385.gd3acb90ef8-goog

