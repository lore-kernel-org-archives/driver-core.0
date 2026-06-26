Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565FB3FCB33
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491610; cv=none; b=B0AiZCq5DE9sn4D5ttb/f7rDwOolnIgCUFlTO+NlTFVRuiBSmim21Kgu7bxUhKTHVV20MTLKmir5qFa9QgJrrFU/abNnEdI2rMyebUmztylo8mP5FFhovxk1bFJ9GK+q5TwaaXzDceGNesfuIrhaeBc3ehGYJsc7MSKk6X7PMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491610; c=relaxed/simple;
	bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=T+MGbE1AYDL0Jk1oSwt425PqNND9w4spa9seL+xrAibsSuripiuei5d7eirgS69uSMiPm8uccHopZfbj+JsS7gjRaSo11D7pJkOPQXVq2MYEgiUPF9I558DE9+bCrevMafvE9OQh5Rxuk39TzY2Q2j+Uraj9OxuTJLicNdFUB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNb7kZuV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNb7kZuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
	b=QNb7kZuV1QjTTAlpPVW0N/btAyYVTPZIPG4csg0gu0HsbI6Bj9ZCPz+kI90XrdT26zvcFN
	1R48EUlJW4vh9+ER4/uAydLGly1xee0rlBdGo1qh2x87xA2QPBI7epjdVbB07gGl/LyfKL
	Zpjxd2VHJK8L/fGmf99+7dQK1nUtb50=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-xXhJrf5gPq2Kk4o_gpDr1w-1; Fri, 26 Jun 2026 12:33:27 -0400
X-MC-Unique: xXhJrf5gPq2Kk4o_gpDr1w-1
X-Mimecast-MFC-AGG-ID: xXhJrf5gPq2Kk4o_gpDr1w_1782491606
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9489f62bfso9571566d6.2
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 09:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491606; x=1783096406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
        b=O+EoZkeC38/KWeOsiygVJCVU5Xk73RcfFj8BsPZyukyqZr2yT9QlnvpgfyUCNtKGze
         LLblAUVQzqyQa+u5RNyThEZo9Va5ev1xDgpkrNYuY+JZ/nRuyEpP4/pYMeEA8I4beq7o
         VHc7wKEVmnKniZrr/dqwITZx9wEMp6ZEIeuoTmJ1OiL3tKi9rHpP74M+kn7a5Xp+eWso
         NQvWw7WKQAflqJtCbK/SaepBLFU/3wMlSBpmdPnLVEtTpdfukjqLA0PvB1NmqPDYOqkd
         uaK4GUOGpoWqk+GpRpsHXzrZZzaxXO4RIbBC7WX5I7fMeV51xYbQPYCa9ycX0X28AKYN
         P0oQ==
X-Gm-Message-State: AOJu0Ywtin2zkFGITa0QLK9tvxYe6U5ilvPgjoOpcXIsoXvGmhtprJua
	4IjRLnqte8JGeW5ygltGm3HjtAyaBj1WsH2/k69QxRFTO/GeXYfXRXOSJtCjzjcuI1WyoJDZcdR
	6/cIOemjni0nR1m68tBKgbxTtlldnGyhqHkuguEtJASheTa+nkTPJCBG019WsCIhbnHEOg8jhkc
	gwSGutEbfp/p5JM3koyjvrZKY3t/H6DMjGkMGBfBRSpCEzgK8=
X-Gm-Gg: AfdE7cnzMbiXxGGpDv1HJhO1T7Jbw/1sWaze/nfpSicGOh08NPKG3Rw9xDRHV+6pBTX
	2Bky+Itl4LShxcWQouVnesrDR2ziaeWPCWm3BePDxjzJITy95M69YrU0DoTdSYMReaoGKTQg6iq
	PFbMarXcNO+EwRYkk6JUyekazaKyT9eH4kUBN7HEXD4MFd8uST5RTQ8FPxgks20CjePZs3C+k+G
	CG2RZ+MJCUCazsmmxXS6/KdJuyhudFzcfIXhepTsL0H8/tVMDQ0iwBut4z7fdwaCJCI+d5Fv6Hv
	10wxNau7N2rgdw39s5g/XfGVOcXafQNYS6NQIO3kifcNMxcW2b1J/T57OepTtrKMGKLVxE+CNLP
	cf96ZIIbTeC/sf0BSWzlPLeBm6UYgjMItGOHOcfvmyKsL1oim7A==
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22139616d6.6.1782491603978;
        Fri, 26 Jun 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22129556d6.6.1782491593301;
        Fri, 26 Jun 2026 09:33:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:43 -0400
Subject: [PATCH 2/4] pmdomain: core: migrate to dev_add_sync_state()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260626-clk-sync-state-v1-2-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh7yYNlUc+TIRZ0G1oVmcwt2ZrWt1NHLOxWge5JT1
 qG0wX5TRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJ02f4p+C9WPnitnMB29Yo
 i7lum79r8RQDrdfx2yaJpEntXJe5rJyRYcK19uscWg+CuEJXNv13LBWZMbfX9+3CppYlEps+7Qr
 mYwYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 98dp-TO8Mag3JxkH06OlCeumEVNqsfz5cbE0FSujbIs_1782491606
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains, resets, etc. Having just
a single sync_state on the device is not sufficient since other
frameworks will want to add their own sync_state callback.

Migrate the pmdomain core code from dev_set_drv_sync_state() to
dev_add_sync_state() so that this works nicely with other frameworks
that want to add their own sync_state callback.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..22791353249c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2697,7 +2697,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
 	} else {
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2771,7 +2771,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!dev)
 		sync_state = true;
 	else
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 

-- 
2.54.0

