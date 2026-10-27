Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140759;
	b=U1JVpS0FzeMdPWBFL6LUgm1akAWWRff4z+2u9rh80zvaq6B0Qwb++yCttpTsz0XyGKOY
	 1pMSJR8O4Gdw9Pa64u3f2109EtUQe9N6jlPUWhjB2CzNnRbnCUD/gQNW2eh68Tfs4PYsm
	 LIhPHxgB4EfiDn/NzRimWRUIsx+xuMMUpjWqmRAUwF/rGJMyQ4xd/C1Lvwn0JuOf6J8nU
	 56GQXiJd3xgdzJv9hIHgX4KNJb7ZigjTI3MxnruOI/t3k2ICp/NJO2T3wGxJUTx7sFAtR
	 sPlj3JWFty+KgBGYi4uT6OebKQukJbQSZfCzpCnMI77zuBfD4TeKc9e/d90m5NLoPig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kZ/TSWTZAJNbAAfYXfetESQgQ8bp7xksXUAoJHJHiFs=;
	b=0OsHsBYUwB2QH3pGja23ODz1hznu9xC86C6kuRzc53NrgNi3xiBu3gkvQc/s8s/9W2pC
	 zLYGudV3IxNG5Oo4ny2/flmde9JfVOaPOPk98IJHqZBNXM3xfOFDG3u3Hz6abNrdy/YtO
	 vkgHasQKF4Q654+Ghak31sCg5+uzZYZYIsSXtH9RIeITr9kFVqgNl4dxYKhR3B3gjbZLK
	 HXu5Iyi8ehLgkZmvebXzr3ucic3bicI9wDMnsHM35cBksBqUXtrkGkJlwqlFSKNZoTtdL
	 S+ijW54OwwrdOrYvV0CyfZt6PSwvFPwthFcxVauG3AbhWFKEieJtXLxfxuzc/vLX1BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mg6i1pcx;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459F606A327
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 22:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7459F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mg6i1pcx
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so341002c88.0
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140756; x=1793745556; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZ/TSWTZAJNbAAfYXfetESQgQ8bp7xksXUAoJHJHiFs=;
        b=Mg6i1pcxLVos2Lz2AQvsWhyoWlHAPD1tLMeApQyyTjo8+j5X1nx6d3efs48c0yVA9D
         1TjgzEsvQSxo3hBzmNkAUVVIvqglstrF2JWeAYFzDJ3wOOOK0UynajVQE0ZUU4C/M9xq
         KySAiFJmtpT6yCnNGZBdYdhJ+imNl0cOwYhJ+L+HAJuAabbFl17Ih9eY2sXOk0hJBlRP
         AfHFZ+sYwwVTPNoUS6/is+1mCX2JH8/PDH9pBo68NJfrL2V09w0/HQ9aOIInQlqDQ0/D
         R8tYEDPKQREvf93smv9l43QPftKFMFZoBRbpu+Kt45FS2y6MQR5En1csjlmFGIUk9ozh
         dWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140756; x=1793745556;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ/TSWTZAJNbAAfYXfetESQgQ8bp7xksXUAoJHJHiFs=;
        b=lNV2zrIkUkATNCCKzKmm3gB/xZwVxmzFQ0+ljHgJdyVgqC8t3EqIMT6k54vxkZCOkM
         kOVlnjaVkg8awyBixF+UW8H98taCPqDqFiy04rqMKtElLTaowefiSa1MPJ6PkO6NA5L7
         c1sR765VEmbv9GnWoFBhriMCk4rWMc0VjEVsNlVCPUrLYzYkVY+jWNHqm1UefUM9QcLF
         jSBHMU1xHe3dbqBVjNaLak0TUSlT7BLKmn43Kwq5/3g1fBHcFFN15eX256BhXmE8QNiX
         iSgl+hZhw7nQEq6cz+346TtkQ1/gbCevzkMYi6YRQLOvMc/QJ1xi2YQTvu77y9qs+O68
         NyWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3PigDZfPjfvt1AR2SaIljZYadSYgiXRULWaC/bw9Ykne6jzhJJbRyWa13T2rSX4iwvs7FpLS8QofPQg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIRLHnznLhtgpfOD7btEn16/0Z3PaCAZOBwUj+eK8JHGNtq2H6R
	xmH6sIMk1uS5j8eQLI1ScDcYzKSUPdfYh8qyqiymw4GpGq6uehoa/TPBGMUxth2LjoCJLDvmJV5
	DmtA7eC+Few==
X-Received: from dlbrl28.prod.google.com ([2002:a05:7022:f51c:b0:192:91:5cc4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618:b0:19f:527d:96da
 with SMTP id a92af1059eb24-1a6cdd3e006mr1194989c88.33.1793140755024; Tue, 27
 Oct 2026 15:39:15 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:37 -0700
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
Message-ID: <20261027223847.652884-3-irogers@google.com>
Subject: [PATCH v2 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
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
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Nayna Jain <nayna@linux.ibm.com>, Eric Richter <erichte@linux.ibm.com>
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
2.56.0.313.g2479322e68-goog

