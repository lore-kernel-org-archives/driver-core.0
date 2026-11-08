Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177597;
	b=Kfo2sX+3wXsVGUEr4bZWStj2VUZAW/6ngPKsmrAa+bY7EIcl+R9KUxFl9HrukWqotjRj
	 IlS3oo/WL//Sr/1uZs3z5o3zRMY5PChu0FDrjYKcm1MfH9Oj0DzFWH6Lj+zrIOdTSbABc
	 zf3H2bKSmi0cs/bR0UwXBkDUUSCzoxbiXHRc6W4E1cpPqIk8naHyX3ysNsBQaX4GXDtc1
	 hMUPSxpKH3kv6qobdQ33Vd8V3g8kFJg9vmlYAkZTko5M6ZI5J2DKwVT9rNKmtxrewg370
	 qJL6M5uRN86c8PWytosTkhFFkWib8VkEtZWixZzjO8sZgwcpJ7HSIw/cBVcM+UA1CPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SmJ3SdTe6uZnhzgZJuKjeaRKDfWwuPiS9sl/mhr3vm4=;
	b=Bhv3rMNyLIBsmjYFG/QWoiJ0u9/ochfW4y29nJtE2KnVkTiQo+BSpPAhpB0jCQlMp4kO
	 uyAoC3TG0kakI2X/gFxZJlxyw0UrodiaTTGPOcLgBx3JCwxj3WcldEr6u01AFzpNheuwc
	 koAlBmzP+z0TxWLT5U3Vbss8BQE0EmHVRSV9oOLznySV6sgs+1oSkvG0s0qHnQQJktnkf
	 yLmIbh4viuRzhqKwthP9I4KVvZY0TnS/KjeLQzPQNvY2oe4WjyeEti/8FItMPk5uib5wv
	 W8AC61tk05GsG/9M30/cpFK8FznYmiR5YAEVwSO+UxoNQYfSxP0bIZwwxivNdlrhhTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GME5hCgn;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDBB6083610
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 22:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDBB6083610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GME5hCgn
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso401712eec.0
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 14:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177597; x=1794782397; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmJ3SdTe6uZnhzgZJuKjeaRKDfWwuPiS9sl/mhr3vm4=;
        b=GME5hCgngZaUIC5WqpB5G1DK+JtpQ8l8YtzonbtKHcLu7Sr08kWU55B9nEtTev23in
         LyV/tFnoAiLlJEyxAaEh8iNjT7pI7IpWObnrs+wNkUbB2OQ+mWj5VClx+A7rjm3iJIQ0
         9+UaB5ITwd8tGWnZ/r89hmizslBw+0ri43Ytzd5bSZzgzs+YCeMR8I/eXXktijJm5Za2
         FNfs5em/rvYTR89dYlymmQoNhtIZlipxA+44LoyLGjxgElfXTJ3VyuobR9isiaoJ5cv9
         AIclssznq1QPFvDTP6dON8angc97dRfWpSnCkXjzbrHxpqqqixYa8dM1l/frCJRvCYYM
         2YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177597; x=1794782397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmJ3SdTe6uZnhzgZJuKjeaRKDfWwuPiS9sl/mhr3vm4=;
        b=r39r61TinYVz42kmEadV71lYVGsvyg7fMYl1d9kxW+K2HKD2dh+fdZ/rqf7cyh3+1e
         Bhdw74zr2TKbO07u1SkfLv+EEVH1zSP2lDnw/Ws3lRGy5hGpH4FcplyR9/Ijwtcrr5xv
         DNXeOcrPLzbr+rNHtfqbnxChwVFFSgRLPQtELEJsuqlYjwiZak5Fun9tjNgwY2zC31Br
         CyD3eEbInaVzHhh0TE5ID329KCHW7ACQd+E1vwX0KuxlsQemAwFl+uyUmhIHSAzc3THu
         iugJNld1w2cx5I8dzbVp6gywQ1H8p0Un6QAHs0c+9q1JEJeY9na+NMyB8bNXdjt8udp5
         dmAw==
X-Forwarded-Encrypted: i=1; AL+hErEUxFXc8RyIA1pl8kl70cRKwC8SfnwfCE3LiHgYNF1kiZLpW3AWgZggtLSIT9RvYQYYbQtHWbpx5qAWfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/mqoZrxUd+EZaVJ2WYTd6zmWvY4P4mrgiKrUuZ1iAtWtgM1zCd
	oWYvuU0ud070HxOGU4/EUJJNkr5hCCMyV7bFQhJoVopKmukJSlpoqT2yNHMUjWmcB3krJtXG9ls
	nvHha6llJHw==
X-Received: from dyz23.prod.google.com ([2002:a05:693c:4097:b0:369:7ef0:57b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9a90:b0:36d:38e0:79f3
 with SMTP id 5a478bee46e88-370f8170ddamr8689075eec.25.1794177596308; Sun, 08
 Nov 2026 14:39:56 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:12 -0800
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
Message-ID: <20261108223913.3624571-9-irogers@google.com>
Subject: [PATCH v3 8/9] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
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

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put(). Check q->kobj.state_in_sysfs before
calling kobject_del() in kfd_procfs_del_queue() to avoid warnings if
sysfs creation previously failed.

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 6663718fb83c..b349e0d8d47b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -512,7 +512,15 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
+static void kfd_procfs_queue_release(struct kobject *kobj)
+{
+	struct queue *q = container_of(kobj, struct queue, kobj);
+
+	kfree(q);
+}
+
 static const struct kobj_type procfs_queue_type = {
+	.release = kfd_procfs_queue_release,
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -552,7 +560,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -697,11 +704,10 @@ static void kfd_procfs_add_sysfs_files(struct kfd_process *p)
 
 void kfd_procfs_del_queue(struct queue *q)
 {
-	if (!q || !q->process->kobj)
+	if (!q || !q->process || !q->process->kobj || !q->kobj.state_in_sysfs)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index 6010a5d7a7eb..f7413d651620 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -83,7 +83,10 @@ int init_queue(struct queue **q, const struct queue_properties *properties)
 
 void uninit_queue(struct queue *q)
 {
-	kfree(q);
+	if (q && q->kobj.state_initialized)
+		kobject_put(&q->kobj);
+	else
+		kfree(q);
 }
 
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
-- 
2.56.0.455.g6c5a503b38-goog

