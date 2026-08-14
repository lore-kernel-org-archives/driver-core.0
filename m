Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4383E3151
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741283; cv=none; b=kO8TE+N/Vzir7npdlphYJ/fxxzybJSaa9dR+RdyLGQKFNsjcx6QDGhjWqvIk4XIhxamdpyoP4+dEMyxSM8oiLgErqTCQM21GKz5OsCNa+7iPBKNdm2xr2eIsockkyjXz334AbrJIo94xTFL2AYxy31kXxXmpluPKS1/SuGDRUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741283; c=relaxed/simple;
	bh=M9BEDwEaTA9Aidy34tdCH0UUxPsZswww+McR6MmL6kI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RTZUGgmrF0dXpgu+W4oUM2QZzN+lLgTy2aL7dbvx0b5/YsgUeOd9hzin8B1xfyPuOfhRWAuEyfrhowLvfsCAMmVPBXkCs361qaM8oX8UJ6LrX3MtDAuJF3vQTY41Vb8jUNem+xB8lCkfYVXBbSByWKzC/B/Hks75h8gsJ92nTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJvVZDr+; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJvVZDr+"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1f548718d0so154724766b.0
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741262; x=1787346062; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b9OMXuv3ZP+H19/AmnDH9qKEt9RkVpbpVuxQpQ0/a8=;
        b=RJvVZDr+rYnZTOl7d+6haLjbJ4wKHgDbG763SuNHUF3BhltVFpeqfutb3xoylGHNgH
         UCqeH50bLRhjUD50rUTc1ecml/not5LEebsvwOWMIxiFLPMW+EoV7ovhytkcuRPrpZUI
         I3VSpT60nE0yZGRt6XrckKyHCT/7hYowljlABkNRyamrMeJpANk/j2B4++Co6VU2nv3D
         xdzfRA86I/+xh/9hRBq7BA1WY4SiEdQ6avMaKygWvJm5noi13F+jR4p9tBHgpSorj4DN
         TQ1q/qaPipEYlJjP6h3QBAaJef3VHemnchZrdTtgYTKCudA3DpYTKFCfY6Nufp1mnXSG
         fM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741262; x=1787346062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b9OMXuv3ZP+H19/AmnDH9qKEt9RkVpbpVuxQpQ0/a8=;
        b=nW9x18ehYYGrqyja9pnIssnHA/Ms1QArkWFawDiuVkdf7wQq0/39OKxk2480kABVzc
         wbEyNTXepDrh4gVowKyKMfXQIJbi9YhHObbh13CnLCwLg66dwjyhKFMADyP2CujpzkUY
         7F07XyIqupvrBZwi8VoUE95njxwww2zMFv08kR2wlw91BCFA4B8FCZrYHHhkE8ecV7fR
         6RqQEH+Bujy8RfJyTq8UVzc3slTLXQfgcY1KUlL8U+puzTxzaWdIH5Vk4/jWA2lEBvsE
         dMgoB9RvMtF3C2gBag3fDu3JzZkP4+itM4PB5oPOkkkqRHit3DOVTEE74w5lQeZbuzlH
         srHw==
X-Forwarded-Encrypted: i=1; AHgh+Ro38ckQxttRt+vCnq0ryOsZ7Gm9pu1jAxx2HXZaMzHp6Crr+xJ4zoYAxC3eJlai9axjh0grZeFnW6oVfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBgUnq+Pf9wmAQZ5tnNVwmHVNpH2+jhNEba6uhBUPhmnfG/51e
	Lkhxhr1AIrXsQdysFbzN8yNAGdKYeQ0u3KwXZe4MdFP4Nyvvp1fQ0kyS8HzcaQnehQO27ZD367f
	et/q0Af5kmIlOA+IoGQ==
X-Received: from ejcfz27.prod.google.com ([2002:a17:907:959b:b0:c09:e2fc:4344])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a606:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c212a208e62mr387287766b.24.1786741261643;
 Fri, 14 Aug 2026 14:01:01 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:56 +0000
In-Reply-To: <20260814210057.4102768-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814210057.4102768-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-3-tarunsahu@google.com>
Subject: [PATCH v3 2/3] firmware/edd: use kobject_put() on edd_device_register()
 failure
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

As per koject_init_and_add() function kernel document, even if this
function returns error kobject_put must be used instead of kfree.

When edd_device_register() fails after initializing the kobject with
kobject_init_and_add(), calling kfree(edev) directly bypasses the
kobject release callback (edd_release) and leaks the allocated kobject
resources.

Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
registration failure.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 drivers/firmware/edd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index f980c5b56858..763e7b16d517 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
-- 
2.55.0.691.gc56d675ccc-goog

