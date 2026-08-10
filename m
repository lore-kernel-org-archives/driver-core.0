Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B4427FB6
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379694; cv=none; b=j8l32P0xXbXZAIheFDfG1Ed6SWwpPqOTi8OFAr0n3l2gPKCD4AZHGqz+xkd/JzadEokwPhplPtz2XuhaQR3tkCeEc9Ey0UOXQelUyBfB9cAymy0owum7y2Vo5ItGcRu6TseNGx22nZTuGyED/aTCgCZbo/XiXD1rw2OKIjwIcJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379694; c=relaxed/simple;
	bh=ajbvcjZXnT3+iWpd7dWUGsxzHJKakpxdBrDOcC2Np+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OOrpKQyQEvSgRVyecq41+KQQDCawQaS0O7XaBa1U6lvR42f4PZH/2j5jBdeHfkgcbPliyYptfKMbnbIGDmZ0uT+Uz9YGWM2CAhD4NUzjoecPDJeSwEupGsNJIEcvDfDwOLSgCMsnPoX6lrJ0Pkgh9Iyem9lhMaiAIWSRc1Tg7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=osG9TOwl; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="osG9TOwl"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15c6a68406so144729366b.3
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379691; x=1786984491; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=osG9TOwl5HlqmhhUP7FXLkxfxLjJ5KYZh/0CnGESj5TNOj1xjBvo+00DcyRggnw+ZE
         fpFcA8Y+L0Cqtxod9vM6rpIUN2dtTnGVomwQOrxqQXAtkDcLYN3ba3PDP5hCZgHOTy4B
         tVfyy4tuQq4jzD0hJcl8pS8qUWAyaViRBuPvkVh2uSmuMoKj1CANmnLB+ka/KoPKjUzf
         TPZtgBuVSZQBdf5P+pPHuYT4ijPCZYz82u5IwOOJA96d4LdtQfHNhSmqaFD1jSbwlZk+
         9dd1KyOSOiXuJ1u7Ju/Qgybiy+JQnQHeFJMsA3gvXclR4qGjD800SPXQPPN2g/K23lBQ
         JzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379691; x=1786984491;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=QGCNbdFXswSxpulbZ6PhMy+ExlU/q27vmn4BGPM8j6vAzGC1lz30QK8MDP9ni7ljSg
         xPNllWpiDQKJS1p5M0PuktYm9HEWVZ6Spmsfq6Q0TQnhlNDaKSr5NUp+ocD9E8pR2/r+
         73e9yWAfsU8I5Ve/YG3BKE5D3WehiNa1qtPq5VsYWMPDOB1XFEVQETJnX8bPkwWz5Iyo
         EmSZPOu05YG/kf6vOIMy0yqQlWbxcmnHoEye9QpWYrrpJlY5sMwJU7ugmQ4y3Yyw1vYJ
         URPQq7+yspxuZdJUU0IrcLvDSCuxRy7Sv1P6RGmSD195G/yC9aA9jKUCebqlRBMNOoen
         TQJQ==
X-Forwarded-Encrypted: i=1; AHgh+RopWaoichgMU8YJE8Zl090WuR0UZpTp2Kt5qR24QJIBPIg6Y+XVY68NNJVKp0W4Cd51Fticvu7e3WJZ1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzocacLNpzZqvPMYcz4DgtdU5IPp40uTFv6tClwicC6C620NRe4
	zm/+4Tz9v3/myA7HkNwT18msAI+tnqvMrbSl73eDH2huTlefnuLVJ2AFTUn2EcdeicQDz4exwBg
	BGlU0i328KJMkmx76fA==
X-Received: from ejzq2.prod.google.com ([2002:a17:906:b282:b0:c1c:22c5:732])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ba5:b0:c15:f26a:342f with SMTP id a640c23a62f3a-c2073392a89mr1505099466b.23.1786379690769;
 Mon, 10 Aug 2026 09:34:50 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:10 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-1-tarunsahu@google.com>
Subject: [PATCH 0/4] Convert manual kfree(dev) to put_device()
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

Hello,

As per the guidelines, no devices that are tried to register with
device_register or to add using device_add, must use put_device on their
failure path. These series contains 4 patches that update these
instances.

Tarun Sahu (4):
  ARM: locomo: use put_device() on device_register() failure
  firmware/edd: use kobject_put() on edd_device_register() failure
  EDAC/versalnet: use put_device() on device_register() failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/edac/versalnet_edac.c            |  6 +-
 drivers/firmware/edd.c                   |  2 +-
 5 files changed, 63 insertions(+), 43 deletions(-)


base-commit: dbaafe9cc56a996931eedfe043eb34418cc9cd9b
-- 
2.55.0.679.g6767b8d81c-goog

