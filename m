Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CD39CCFA
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614868; cv=none; b=c23H4BnHEVRSrWjLyFsuVAfdbCCf6UoDDL+Vl+5FlPrRBYmjkQQlx1oIjbpN849luPjvDzANB9Ee+7gm+oXcnHvogDiizaEU20YgOLZM4CBpiQgJtp823wcefauZl6tLmGcKc9gurmHn1Z8qqTJu4mpAVbqOqeJNod2npv8r7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614868; c=relaxed/simple;
	bh=xR5Wua660iYSh7uDHWlC3HYp9mQUFTcrH3R4zbvltD0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=A0njx9trk+VUcTCE6DMUvAIWv/YlFHIFDYkby5TIiRiFMdmiFZpIL8MBoz/7RCedly9CpZDyQ/EB2xB9zaOul4YRIgt7Gaa8w3M1yPWPlpAlGrKuvwTh6OVWsOAAO6yqAXUc/tgFVETS0huNpSRhHL14kCAVlfe0ck2zg/QPzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rvypDIT7; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rvypDIT7"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so158876066b.1
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614864; x=1787219664; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoJE0ONwiW9+839EaZ7hWiQ9yyPS5ERFdBgspRFFZDw=;
        b=rvypDIT7YOm9px5DoNdzEwyoo5aHhui4IpYb/aZr2951jnPb+mk6+5gTXPdDrmaFsA
         Cqdws6g6JvckJHlsDflU2Of5J8zshc6txqEPm435naYt7BaEgQUk82dYuLN3XmWdMTSc
         9+xDW0MN8YVrZpx8ZHkLblt0OLvrPn7pCg2ZqB3Bffg1knlhet1wOKagQ1HhUQlf+cfZ
         kOZE/BI1kUjXe7dYygr6smtqJA+vgn6C/fqTB11HNxqUmXudk11VvCObnAo1SE9tcezi
         1epZOGIzdmdF9WvjQ+jXxVGwjmA9grdzhxzd2Xj6nHg2XMaVbuFodSBDgYc2o6fgdYpR
         gZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614864; x=1787219664;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoJE0ONwiW9+839EaZ7hWiQ9yyPS5ERFdBgspRFFZDw=;
        b=bbkNXbzKT3FM17pITuhztc8mEuGMcwbP0ehT6TBVvEhz/Pz+52Ay5mKTVhXSMu9kj2
         kDMJfmuwTdQvnutshaYtbzfQxzz10Stalt+MhX2YZxLM+PXK1IP6cF7XnrUGTQUmTRGl
         /199Xj0RiMKNIEQ4iouaypJ1mcD5F7vptZO/e4Dg4cDXNoQbOknwoQAFoLHQqtQ/TwI8
         TuXubV0TUyQS0gUnYKYRd6ae9PIK+XX2fjSb0XVAjCBUEAVFM1RGHRdRrAc5w7wYjlB5
         Y3TdP35lgIV1fnwQo8+iHto+RPSRak+JusVih2BRO6J2o2JnDkX2oSyDbVHF8Fsw8spd
         /Pjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9E6aMpyEaKXZ+UXYkU1sT9mRVtjcJrs7zgCpflQXD6XjHrGZnTpn64/7Of1S01wJIRv4W++NDFjO7/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYeMKPkstBqluJZ/u27QfftzF58aouEepvr/H8V2j8H9hPxLJt
	fQXRnp93Pf/q7a+BfRGyQPGwwVpfg920SbHkNJIKk75/pwVLOFcRvxL3ZwTbpi325uQCb0pw/YD
	dZe3T9AhkyANGBwfo/A==
X-Received: from edtl22.prod.google.com ([2002:aa7:cad6:0:b0:69f:aa9b:a336])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6b06:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c2108f06416mr245963566b.14.1786614864119;
 Thu, 13 Aug 2026 02:54:24 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:18 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-1-tarunsahu@google.com>
Subject: [PATCH v2 0/3] Convert manual kfree(dev) to put_device()
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

Hello,

As per the guidelines, Devices that are tried to register with
device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances.

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


base-commit: dbaafe9cc56a996931eedfe043eb34418cc9cd9b
-- 
2.55.0.699.gb54405d56f-goog

