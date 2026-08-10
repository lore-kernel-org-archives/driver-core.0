Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DF41D625
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379695; cv=none; b=QrE7wbvOFlS0mIMVRKIUeG5icsjT9YPgvp/KeQOHJjW/2qXWJ1wUt/eqjWfkI1zQqyaRkCg2tgvM6R7sqWPYF6LFbFLW6vx8RvWY/19cXWBCLvdBuDwtYPt0BDmv/DYSYtY6alMESx0NDbVLJ05ftaDFZEe7baFZv7y92xS+Qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379695; c=relaxed/simple;
	bh=JtQlqs+VnfmqAU2g0ICeTfBNi0n5zYXAtKGUEtwOXP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGlfGiXTvBXEhHjk5uUrY1OkI5xdfxc7e0pZ/Ltf8z5X8YEcEqizNjgwORyHLMBjdGBZSIWauQu2Hr6TgHTjEq4epqsHGra0tN/3gHkWGeTsxrT3M20ObW7uYvPyk+UvOzKsnG0I5HcsQT/GrLi8h1Gv49SfcFfISh5QzNoDdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQlffUwi; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQlffUwi"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a1e3cfc8d3so1996809a12.3
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379692; x=1786984492; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=XQlffUwi7nXlB3o3CjU4ddHM3JS53r3yzudTIMKI2H5OgTaB55eNClS3U1wyCmkn6R
         lB3/fprd+qxD7bKKGUFs1Md2CNa3LAwc9z4oOZxv7gkoKaKO69yCb+Q119mpGA/xMlnz
         zjmf/Hp6G9Fu+z5Smie43WXNH5BvfO9uaarjp6djkK/Wy3W8yjdy7N1leVp3MwySL3gk
         qhjesAgP3PlaybtYge5NP6tCCxzW8Ch11+EjNvQTVhD91pcxI+/+m0F/UCMTLWxOO6xK
         hBoLBYWA2+6iapejLf4ezh7BSZxKceua9dAeY8+fbQTe1SNxGQ9Ztz014jWwwElAMCsQ
         JxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379692; x=1786984492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=Y0MW5lE6qnw8LEMFfJSyxKdAuTuBS8ussvHbo+ynUkzkIjYftSv8bQirHAEyX91eMv
         mQ3rKGPsal2QKW/o2NXm/48uoAtYZprn0Abamj4/iH8SlqFm2RntSyqAjGxmJAHURUfh
         dRMCOVYDYT6orfn6va2ur1PjnKkrzJwNyetYH+nxXxXx1hEnuzzwoEgx7a1iOXPGYmzW
         eUwBPZkbQ2/LQOcnmxrUav/IPtBWMnzo6B+ymmjD3eVkRXVmuyXqDaO6z0qPoReQVN69
         GwJfC9oK39Szdv9QImMWRRS1Od4+tq41+MLh2mEs0ma77L+hrIvY5yX//eZx9h+utmfQ
         lAeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6TO00KlUGofp+Wwes6l/Vv8vxDRTqPbWodgtlE5rNLv8rKTtwAFu4UiRgOTgC8fOZEL+H8WKvNDE+eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj3Kn7dV73Cq1qOEzVahrnIYXBEz+QJJQ7etkUt9O3FkxABn8C
	qfWhjSyjeZVE8FAM7NgsXuaIG04VKPwfiNBk7+/nEsEKk67dqxhZeq5PSmdHQqG05lYRDNWLiZw
	IR832XJGEWs9VDkU3Qw==
X-Received: from edzh5.prod.google.com ([2002:a05:6402:945:b0:6a1:c0a:e022])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2110:b0:698:6620:d988 with SMTP id 4fb4d7f45d1cf-6a355e1332amr1811578a12.15.1786379691640;
 Mon, 10 Aug 2026 09:34:51 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:11 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-2-tarunsahu@google.com>
Subject: [PATCH 1/4] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (locomo_dev_release) and leaks internal driver
core structures allocated during device initialization.

Fix this by replacing direct kfree(dev) with put_device(&dev->dev) when
device_register() returns an error, ensuring proper refcount decrement
and cleanup via locomo_dev_release().

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
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
2.55.0.679.g6767b8d81c-goog

