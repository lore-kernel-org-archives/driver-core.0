Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CBA43F0AA
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614870; cv=none; b=fOu9PnVX8A6nk5ssYlKzSLIz3euCeWot7TfERSNCWtdATLJ5U6Cns1Las8BgN9Uzw+k6mG9XbS8MbeupzbaGhVFKWcFm/5ChiY4BBta4V4X2TWYTTgwPtTWswtsIHmGziifILRkOUt2ZmYkrTzmb2+v3IuKcYQnYlfM5x+Ra69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614870; c=relaxed/simple;
	bh=11qx+PtQ2pEMxgdfrgkekO+lbmRjyJQJNdojVzW2Rb0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=htRNGia6HwNEXckdhXFMa5lnGMDIji3dYRpVJxZKBfD+c+vS1x2ancc+C7w7koOz+5To8AaFlkk1yP+PsmkwURnlwigJjreM1rCbL+7MA0TNqXIqByFkSVvt6GYd3wqDDhVal/FO0BB0LdlEsVV8TakUK78a3kQhqqk6JcvbI7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrYk+FCW; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrYk+FCW"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6983e9c028dso1396177a12.3
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614867; x=1787219667; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Ghwm16zCb3XluSdXC+OMNEFWBin0x6u6wWkTNkW+w=;
        b=nrYk+FCWRB2cpmqDH0JBKjEIE0536v6VdKzn2PZEdYBIf+1uz055e+gNJaR9cDDm74
         KKa+pl6e8YO4ZomsmbMbOhY/JvpZ9m6mhFJVeOB5BFJi86dbzbcamft3B71krTPq866h
         UAj+2J0QlkhxWSvDjXGvc2F4+7LcMoPn3Xu8RMLApkKy/EehjVRtAlxnYILhorNuA+da
         oFmj2p7kfAWOLK2gE8sL4+lvZ5WX3UWCz4zeI5P6JcFZdM6viZ5Bs1SbqCckA//M2fds
         V8WIewX/mBafJBx67ArPKuGn2kwN77k7FdRc4v5KWQgfBxamU67Y63Q16YL07hC2DSTN
         H7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614867; x=1787219667;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+Ghwm16zCb3XluSdXC+OMNEFWBin0x6u6wWkTNkW+w=;
        b=nRiFrjhHBJIRBMJWbi+NQ0XHNIbWcqCyS9yS8R1IiUy/Po5zSEPdp8vHWUY/9//N0B
         m8J9kLhYEhzAVg5PCGka1DH3rQ10YbPzIA8flcE0iCyHwHP5j+RJic/dXznE/SGDjvz9
         J5wuQS/ohhNuwnDmxU3Jj0ZZZc191P4ZlIVb6n4oq99nlturIeHhdsW300wbTOYZEMKa
         HxzdcYlNrVsu5vqmYJ+Kt+4XqTXdAVrNHpwyo/7NoHr0Y7h7Yz7uG3QMI68MaEo3iqQ1
         xdvvpsbfjj8qY9PzTHjN9lHmzj/Vr6p5a7fzmtHq5I2FV3O09I2d8YGcKln5jlqOkLbP
         aAjg==
X-Forwarded-Encrypted: i=1; AHgh+RoQBfgJbpKIHS6Y0/ZA6QQE6TvKeA7YyKY3gA7sEHI1PlwQmqAvv6zzns3ejpKI01qH0txxthipK3tT/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2OM0g3VD2D7SMbOyHZT+I39R/qdYkgZYD+cvPl4AZn3j83UUv
	po5w5ho5j4DV8oZtaPr3RMwdqNoM+HFy/mCvxdYsbFX6tLuzu/G72V/Ee6LOkVImnlsYpu9tRV9
	/Cg68S5pf6oAaWBUdrA==
X-Received: from edqz25.prod.google.com ([2002:aa7:d419:0:b0:6a0:51ba:9873])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1948:b0:6a0:a4be:6ed0 with SMTP id 4fb4d7f45d1cf-6a380618f4emr2015007a12.17.1786614866346;
 Thu, 13 Aug 2026 02:54:26 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:20 +0000
In-Reply-To: <20260813095421.1700945-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260813095421.1700945-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-3-tarunsahu@google.com>
Subject: [PATCH v2 2/3] firmware/edd: use kobject_put() on edd_device_register()
 failure
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

When edd_device_register() fails after initializing the kobject with
kobject_init_and_add(), calling kfree(edev) directly bypasses the
kobject release callback (edd_release) and leaks the allocated kobject
resources.

Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
registration failure.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
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
2.55.0.699.gb54405d56f-goog

