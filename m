Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300F3E3164
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741273; cv=none; b=dxvcrEnoFzzTLW/nnhRhBvNIgMK0xAF8KGgJSPsRbKxuVJRRxB9twAwhPWqCaoSFgcURToJrUsep6Z6+I6Ys9Ky1B+7fzOC/9hjJu/bKTrDPnkBm8UFn4HbR5B9GMVEW4TxDa/FKCeIt+DMPNn91xyBsZTwXRXGZ6g3F08Qpuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741273; c=relaxed/simple;
	bh=yV6g7NupZHoxaf7e2SbUe0CzGThymYJ+E//K4HfymY0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gOpax9sb0ntiQCobiK88coPyPCpY82byqrFhnYHpEzwm188K6ZJF+FIXJHJ/7lMZFbiTsOzbm7sGI3H1HlWOPmrhsTaXQVLe2EqF4E5BdCM6/YdQ/OKv8YcQRuOKCHTD4N9aaUmjJhBkV1ZBmMhQTgXVuGF88G3qUbkSPJ3nQak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AZDKyxGW; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AZDKyxGW"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so98952366b.1
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741260; x=1787346060; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpRLa2s9CCSXq/nY6RLLua2/DfHcY8vtQRcWiuG8yfo=;
        b=AZDKyxGWDbcn8iUZF/F1x9l2ZAnkppeRykLG9vJNVEKWNHGfUo9ne1AOUCKqZcFTqo
         OCgkfuxKLWjoA15XeJdAjUO26pSh2FgSE7s/3aIpKdC3DDt1WrsmWzRUurr96Jsv/qTy
         RNK0tLH2KnSlbXttJOBX+bfnZPFl/5jguTDOPOmIHsso/HK6W1qig/4O08gZwhxG7T0A
         Oh+7TDH6wiCjVtvcl/QXgsU+jcDScMikTVC4Nl+tzojoKZtNqnZGWaVaZ/D+yAFLzm9C
         joCrG8wkSvHWsonx7A2kWPFdAwdXYW7c4hDcpwZCPk/7D90jCQjhh3hHhgia50Mv+ubc
         P7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741260; x=1787346060;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpRLa2s9CCSXq/nY6RLLua2/DfHcY8vtQRcWiuG8yfo=;
        b=XC5mgPaYGtDkoSPcPznUgr9VAkxnYt6J7dhsm4W4Ym9k7q4p9S76addlqTLYnugY6q
         XJs0bEn8o/FRqWx/9yA+BV/Mj8N0Ya08dsxTBEFA2zOsV5L6wSiCzc9Y2jZJMBLJMzQe
         KRu2Zt1nMEWZq4KGmdSWFD/CdSiJ1sbD4Bs04aNCUpBuFLPouY48HmE7jslVqNlgYEVK
         F3V4I4pMCdlXsuiC+llVBHN8ThRQoXDoYB23UevYTPyosEnZThzbL8P2r636cWOBkDXy
         xWp6uepm79qSKAv/8d905BpzVzNi7GFZZYoKOMaRTwKw8V0TL/yGFJZMZZFzOmmKCJE/
         BR0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9rmdlCASHL8lwVnCwNvgWVk2NNrxaE06gaVF+vQMd/QPPEX5W9zI0q8VAH2OQwXBpw0k6ggBthX84uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJN4431vQfHijGe5nBGToJB9HHb0m51koqEp/QsjP+N13QvSWL
	ZdtgxQqRXPH640USt2VSErYeA69OeXwl0oQTF0ii7ZVjHH4uHsTorYYBb8YKd/EQ+2Fp357fjpF
	JUJXIfJmDIvlEJQsB2g==
X-Received: from ejzu7.prod.google.com ([2002:a17:906:c407:b0:c1f:4de4:c4c7])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:960b:b0:c1c:28e5:652e with SMTP id a640c23a62f3a-c212a228bbfmr401758866b.25.1786741259490;
 Fri, 14 Aug 2026 14:00:59 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:54 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-1-tarunsahu@google.com>
Subject: [PATCH v3 0/3] Convert manual kfree(dev) to put_device()
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

Hello,

As per the kernel-doc guidelines, Devices that are tried to register
with device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances. Same for kobject_init_and_add or
kobject_add, call kobject_put instead of kfree in case of error.

V3<-V1
1. Updated the commit msg of each patch to mention about the kernel-doc
   guidelines.

V2 <- V1
1. Removed patch [1] as it is part of another series [2] already.

[1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
[2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/

Tarun Sahu (3):
  ARM: locomo: use put_device() on device_register() failure
  firmware/edd: use kobject_put() on edd_device_register() failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/firmware/edd.c                   |  2 +-
 4 files changed, 59 insertions(+), 41 deletions(-)


base-commit: ddca0cd800962b4121e5f2633005167bb6216175
-- 
2.55.0.691.gc56d675ccc-goog

