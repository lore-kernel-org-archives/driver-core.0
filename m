Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F1429039
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379696; cv=none; b=gOdAP6DvYsBWpgdQqG63FI2G8XdQV5Iizeiqr50d9kVDv3QKlrcpuhdqrZkTrUC6pLGxRnDy/RumF+CMGv2Mwj50kE2tmgORX8jwNfdZh2NMaIMznVvyfMsQs/4ZUk47EKwSzGiRoQavcelDcBeGAFpVysmK9blZ3ne5GLimq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379696; c=relaxed/simple;
	bh=GC+CJo5FlA/SE2/QVcHL36Xcw5XC5Gyu8Y+sDTlvf54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XEhIEpZD46U6/0bTr03zRXExlU1IVksPpp++hpIkF/Y4Kkc/2oSHY33sge32n9ph2747HHPHU6xUtQdO9eUndw6b/OClhQf7x/dKvCIHz1+9hXUAJ8GQqoJAhM6VXe7CuWZr712U4tFHLvqeZ+iht1sp74PYZOyt46jyBRjg87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pjc0Rg7U; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pjc0Rg7U"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-69eae8773d6so2389817a12.2
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379693; x=1786984493; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=Pjc0Rg7U/K2PVeAr7u/dbFvbxR9KoMx9SkfyaUv8WnpxcyoCr4GAyeACBcvGtaGEsu
         FQNPII0Dgwh9qHBAVlHhmfV63z937p97WBOfXtwl65hHBTlJfipq7a4OdUBEhzlPwj/o
         aY8Tdh9tdzoxAoP0QbtTmvYAJbS4v73Htqo014LCTj48+FmPiJQZlcBEl1uzHgxPglS2
         ExwBd7jBgI6hwZsE/MDUzCP6EPrKW+0RMuflQL+pkY+qe9EATd3oSEn8LPUHL7Mhyfer
         WhrDUSbMyJViHO29nuhqedf59rYgQBc41RdCrhhR8m990cZVnggelMTsa4vuea9Fq0Mz
         16UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379693; x=1786984493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=KgDBEvf3l61UG4ND4c8phiOcrvZUGGLLd5+OWM0JjMSmGNp3959MEImfv56znJkj7J
         6qt5zEPjKziAUwDR8mS6cSIm5r71Eulv9GCwRjUNJjzKGg/zKdSpmFaFAyFD/y3/NonO
         j+PcPlu/xUrXO4gh6czvDLFVCyLiGAzfdD5oRiEV/ZyTxxIHRRFeRbNXFSbXVSpfQYla
         UT432z4smsmERzOViTs04q/brBSFtLCgGEPqwT1BQBQLsvIk5DDBw34gwBBbjWJ/6Iyb
         4U6K13zW+xGEYm5F9UeRwhootR+br9znG8xyQFr3nJiWdNwa8TWCQReSoe0xbxOKQm+j
         AyIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoihyRDvYdt6XWSq98JzXAi+ygfkrrISZdTCEdEXImdf730BSdYJboURreT/YFi5dYTTLGjtJpez/iwcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2iFWNK2MVZqKCH3KkiaSVMKJgqYOB82Hx3wjLScvcNOffwCGk
	HnG+yzPm4zxCglhEdMEBKYLYRBflP3x+wgudcahlYJOFQkoBxvS5A3Rffu1frHPuUk0/c78MXPb
	CgoWbOpPlTNckgDZ3nA==
X-Received: from edbay18.prod.google.com ([2002:a05:6402:2032:b0:6a0:a508:c896])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:454b:b0:6a1:c908:1701 with SMTP id 4fb4d7f45d1cf-6a355e2d32amr1548538a12.13.1786379692937;
 Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:12 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-3-tarunsahu@google.com>
Subject: [PATCH 2/4] firmware/edd: use kobject_put() on edd_device_register() failure
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
2.55.0.679.g6767b8d81c-goog

