Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116360;
	b=lLmbSDlJs5z1iBLJMuVCeQpVhqSVyC5HRjCH17aw7KVOclR0+93J4CO1ec7R5LIT10on
	 FdIEv3zc6rn9TGloMUX/pd3usEg/dDNFm8b2RDSzOm/1QAMcXNwDkaE2OhfwDbhC7ZXnb
	 ZKwXewCcRgAM+GbV/Er54F56IKtYKJDM7SxJdSxvg0wgO7x/im5GS29Wp7KMizxeC5dyd
	 ia5ye20DQ0ZOOj8PWcf5mez7WbcmBqZBhHKToYZnuwtM+eFQNEBTNW0BkxUseCAViPpkG
	 Gt02PkYLcwphc37Ms5zemv+511whmBXegRkF843uLm5IufC/hIJP30kYAlIiBbGaZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
	b=zwMmeOy5URRAsYQDY6asLO0qMWCUegkS/bHu5cXKWFMg866zuz5gYjlbKjM3IClrOhZA
	 LVx8zwX/BKOOsPFKaUPlJ0ScB0rm6c1PAyIaUzBtnMyguF1JI4ayB0oyfGXjji8n/zRsk
	 YzNJq7kB1aP4Lz7e++e7G3Mww80Yt84NuPimkKU/QClXPjBaEwsxT4xlxX+0rohFvU8e7
	 2e4npGziLGF+hgeTTMKt5MSv/AIjT8q67PbYQh5KJmbR/uK8W7vJ6CTGzgcK+h1LTZUJz
	 HULPGTtQQzxd0ISu7qOMV1mvGVbuIbrgOn2xu6gX11HELKBET/d2EkWtYwEK44bc7Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NliGLqR3;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6D60A260C
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 19:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B6D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NliGLqR3
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso55924a12.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116359; x=1795721159; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=NliGLqR3pByLlVP6O2fHa7Esdt5sLj4kLONzeh7NpjW4XDN8iHaY7YyiHv/iiXhcl8
         1vmjzf28LEu7sOrVmVdhAAMOdxmHIrJAniEbaK2Ge4RzC4zsmEQFP78txij4gXkjPAQC
         TzJDgSxtnYJExMaAUoxKDFnheMSLrnAktKlfwa/hook4Yvj4jy9815ZGB0hFOVlTMDk0
         pzGV32R3Udp884DOwyGinuqizr8FipPEg54oOFGKiD4UFFRw7sESp3fygaF1AsL1dihA
         mAN6DojcvDfaQlI6LwWYMwIFyHUuLaDuCecJYivnNtZtFmuBxs1Qi82HyhU8KCcnpF/p
         soTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116359; x=1795721159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=l6OE0+PfoKo9aRWK2OmosD4vUgYNVt3ci8usweSUGVwhRnyXHZV6zRyF/pPnxrfNkd
         kbqqyAb+CnTx/tHwWz2kz8ISl2LcluMC4OR+ouW4qfTa/wDGLlq7CKTmX9IK/M9gB77S
         gB0wrTuDPeEc872/V3nhWMwXBhCEFfBjQnbq2MJ92z1oRkF9mHE5clheMx6nzS4PMPt5
         jAlgfj7uvzSuH/7/6/CTmcfdO8D7BnOPwn7mG86biXC6b4qH+jnz+3wvFxXRkP04wy53
         /RFsXhbgzo3gZ1Zmr93QIzTewxlubhpSH7l7xsigKwdpbZRWssl2JhvLpM7BwEDBYIbn
         aMSA==
X-Forwarded-Encrypted: i=1; AL+hErHHw+zJ0QAWAI2gh5pszFZ0rymciaD4ixQ8nDNNl2PJ884UlPg8GTCPHyWzU4qlVSz/YZOjk0MU5XQQJg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8s/jMpE1pbz1eyd5ke5W/vxvgetx+jrhW2MbGd19ZYsmhKYqq+
	MgcRsTwLTrNR7N2+hHaACP9h9F7GkMgnrObsDkel3Pn2MKadh1bqE6mDGeXB8K0I7ReghopmeEF
	eo+27T8QmIQ==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3fb:1bfb:ff29
 with SMTP id adf61e73a8af0-4014e74d624mr589862637.69.1795116358583; Thu, 19
 Nov 2026 11:25:58 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:17 -0800
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
Message-ID: <20261119192520.1983406-7-irogers@google.com>
Subject: [PATCH v4 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Reviewed-by: Juergen Gross <jgross@suse.com>
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
2.56.1.708.g77570a6a1d-goog

