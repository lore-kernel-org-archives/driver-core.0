Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28843E486
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614869; cv=none; b=HlWbt5GObBviJijoelYPDwK5E07Hgpri56eSuo4LeLREI7ZHq6MXiuC1C+RII5u+lIZiM6xsmBnX9HrbF9I+U3IgGqCj/HyDizAioONFy94iOItMT0NEWfaRT0VZiWHt1dWgnbSFftGWmIsrR27JYieQIvaqTOu4M/s06C1udgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614869; c=relaxed/simple;
	bh=ZrzVy4++WKAZ6CcT1q+LHfjHpB2pCNjESfLLZY0Kclo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ElVnfKJV56j9EsuPGYFvCQ4VaA0WH/FM02qnH0GVG52jLsnGrPrL/XTzcENuvKYtttJcXC1gmULQW3/M01KSP4AogNbixyFH322wlnN04nI3+DvoUydPHHupSAwLOaeSSOtiLqAVL4uE45GPFsh9N9X3tiJGEFrQH66ABwqJc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ta78h1Xf; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ta78h1Xf"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49564d4b849so8483965e9.3
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614866; x=1787219666; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9wwW7mRQHxWYHcAeYLej02klFAo7h8n1OW6fMkc7LU=;
        b=ta78h1XfAc5EVASunM1uNnimQSe6YYS9Fc+byF+fLSuhhVP26NzbwXJPCUrwKAh3sC
         WDc9GiZf+jCkeApdw4xJAvGxYzIyg0vSL4/oWhk3g3Ggn/12q+hlcfJQZlToViuaFc4s
         Wkv1kOQbPl6FbZhe8c1G8e3Z4Fph+tENlyuKU46TmYuEJn6BAHv6G1YheEIzw+SwQPUW
         4/lsTus6atNQNwQCKWnKKZmNENqPGVn1a1E030gtyKV4YmiwdfWuZYmCJC9CNL2s9CK3
         0yNa20119ts4PRebycRjqhE4fxmd1vNlDFpxPWd4FQsVIdCL6ap6kbwI0carXn0a/yD7
         CAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614866; x=1787219666;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9wwW7mRQHxWYHcAeYLej02klFAo7h8n1OW6fMkc7LU=;
        b=OOeV8DdhTfl3MaLkRNgLUTBJL8RnlW263gY7Pr6w8z6Gw9NvgtARqvNwNd+t2sAzVs
         7x9gH/M55x4SyUzU3hWWIROcmvYhOc5NBnNUns6cT/uw0ykKkYjq4wXQcRJ5nuJpEX51
         UX2mY0urfAA/XKg4VfpCp9BlLkP1a4OYKHGj4/QkNoC2e19/KMeJw43UszXHxYjEkadJ
         ZRMoUmt2/P9W9cDzTbvqJY15sEWEV8tgtIxAIobgS0CeteqJ4LUu4f6dLbxtXXFBNjvy
         jUPdseoHpHgBIL0PpDdhkNn2HwSkyhZkdzB9ngWS6NeesCXlMDuuCNhprg1AYgmfKKQZ
         jAag==
X-Forwarded-Encrypted: i=1; AHgh+Rrn6kDVyVaNHencxjDyleZQs36NEmVr2PcyqPBNSZmb/iGTsntXCIWbzV80/tw9sHWkthA3KME+kcU/tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnScQ3ImfIUuy7RpPFcE4QF2SsrgI8C72ByYH6+GSr2LmqJQVi
	fd0XoxWwfz4jmSIjKGrYugEcgfqrrh67QPeSaxUHvB1t5hPd3N94E0OVji8sub0PvAR5mhTSk2f
	IbqWBH0FH8cy1B2bkgw==
X-Received: from wmbf23.prod.google.com ([2002:a05:600c:5957:b0:495:5899:6e45])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b99:b0:499:7a5e:4c3f with SMTP id 5b1f17b1804b1-4998215a94fmr44349825e9.1.1786614865465;
 Thu, 13 Aug 2026 02:54:25 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:19 +0000
In-Reply-To: <20260813095421.1700945-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260813095421.1700945-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-2-tarunsahu@google.com>
Subject: [PATCH v2 1/3] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, djeffery@redhat.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, dmatlack@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, souravsgl@google.com, skhawaja@google.com, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, Tarun Sahu <tarunsahu@google.com>
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
2.55.0.699.gb54405d56f-goog

