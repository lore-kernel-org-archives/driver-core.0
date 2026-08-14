Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD9C3E022B
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741269; cv=none; b=Rb2unZLyrBCntmDQoqwg9RJ2BugOBHD6qi1yuXi8nhKhfau1Vnu3zBcG2CIgRZ5zc0dybLzdPbhXimc9kH8QLz44peTHk4UbkKJA12UOXcvf1Awfmwm5FXeAZyNJ6lyNU63vVaBNX1vDRtHlUgULRSJPzzFNJMGLTZMORiXPr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741269; c=relaxed/simple;
	bh=V/hULih2EckfZRoUvl+6d5z3CCjHaGcqYA0HdEmXY2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kbTGmsAZ73m3lhutl1k3iGjWhbN1vBaP9ZNprqPB6o4adme+1kxOBPHrD3b0mhuU+gm+UR+ULWNJPsH9AkI04BMKFAKohBynyfJCFXmuRLY1VSldugtdgNdrHRBOrOWr6F5cSyWEgdPqifc/k7D+08Vosf/QquaQuz5aOrozX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+Sc5pL9; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+Sc5pL9"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c1c232fa136so138294266b.0
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741261; x=1787346061; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYuMpnr3KSC7nQvSYxrDe2V0WmDtuzggqBjS2om2eUA=;
        b=O+Sc5pL9YtA3PG+Ig1XYp/8cCipIyj+FltbiX55HlLPsDS5rd+Vj/SP/LORJ7mf8Pn
         WFYrbzfn61S59UI0kcUmCxYd7yyRNkKeYJ3wYDsnRTk//CGepQa0NmHYF+oxeTsfXlK5
         zjcYYPOk4+Pk5H76U35nv4PyPSKi4s96tgku9UBrddW3o94Cx2OQOjPNEFoIERX/5IIo
         se8hPiqMot1pkigw8jjhToJtc9e04BniPwvDU71nMRGVqzUZ9r386neI32875uT82CZJ
         XSl/fTexf9zGYTs4hHtvhfq7zM72JEYEjQPwd9C0MZwtQhixX5Qjfn4ToNz08Iod+lgB
         InQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741261; x=1787346061;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYuMpnr3KSC7nQvSYxrDe2V0WmDtuzggqBjS2om2eUA=;
        b=CLv05cDiCk5kYnwskmov2IHD7Z6uUZtrcrlwVxEaz1j5+4eCkxT1n8Fl0Nj6zVYlor
         tCgTWD2NEg7EfyZiYftgDSnr+5GFUY9nLjHU1H5ayxPVJnALJ2ORk4dipjgCLAqycEut
         8NF24tOPTgB7FsW0gbVEGLhwT48+mE4J+gIm4t55E8nmkT2YbgawYX/973NIvR/HBLVu
         w21MA+GF1G//Olt5JIJGjHM2UqpO6T3u8k+EM5oUH7B7EWO0kQvswifvxe0P+4HFYc6r
         RUHiuboacckoaGDiXHfMkEQ6G4d0onnkBem1yNDcpN/ZXO+RrRqv9lkUHEBEcfx0BFjI
         qPZw==
X-Forwarded-Encrypted: i=1; AHgh+RoByr33bC2bmJSiGGPrGdJBaWZ8Mp5MmTizLmmJuMHM2d+VqsSSHq4mF/Uoyh4C4OMV9fz6l0x49w1A6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3lsDzyfR5xyKcWHHmo6hnJrBaM2FqSn6Nt/FwSpdWWe/d54ax
	gNQo1iknCNQOB9tAdBQaTpVS35jUiGZ+T75IqnUdU6q/FD2G+oz7BjRef3fjB4DnUUAkVXIue1d
	G4HlHv06XiqzsEyGF8A==
X-Received: from edgd22-n1.prod.google.com ([2002:a05:6402:a516:10b0:6a0:d334:54e7])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e15b:20b0:c21:3c4e:cb9d with SMTP id a640c23a62f3a-c213c4ecd42mr205334666b.14.1786741260571;
 Fri, 14 Aug 2026 14:01:00 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:55 +0000
In-Reply-To: <20260814210057.4102768-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814210057.4102768-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-2-tarunsahu@google.com>
Subject: [PATCH v3 1/3] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: helgaas@kernel.org, dmatlack@google.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	sourabhjain@linux.ibm.com, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Russell King <linux@armlinux.org.uk>, radheys@amd.com, 
	skhawaja@google.com, djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

As per device_register() function kernel documentation says "even
when device_register return error always use put_device() instead
of kfree()"

Fix such instance in locomo driver by replacing direct kfree(dev)
with put_device(&dev->dev) when device_register() returns an error.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.691.gc56d675ccc-goog

