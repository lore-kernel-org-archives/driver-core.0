Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC63CB8EF
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769909; cv=pass; b=S2Wau+dRdscFgWmVaauBuvifbG06VUQ5vt1pXmjFJMd3yV/uJyx4OVqi5tlxWI1NnAXHKGBHqI6WQDWS+o2V0zL6bn09mK7aVfJoF6P5m0uth+lDLjj5ovbOsxq83ilLDztW3E+HpJHd3+qTYRDPW1scD7+GXx1E/tLYphvy2ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769909; c=relaxed/simple;
	bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T1QYl/99L4v/pnL5HhsQHcMnkMgeQD3duR+wKTTWZ/GGegSCoKJKqcLlkedVcnQRKtGbu3JdmCGWrTLeM1gYc3OKzbrj3y2fiEALD/kglbwpdu+YMaUifZZ0OV3/wGVcwrVd2y6sUUupDVEag9jSfMwGFFdJzRRjbWf1MZB4XNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=cjCLenoa; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=AkUH6VO7; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="cjCLenoa";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="AkUH6VO7"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; s=arckey; t=1782769907;
	 b=US7CC9jcPaMpUOIUry4y8s7eiJN6NEAgumC41P1cIiFWvp7B9+SUJpgWe4ylOA2hPVX5i08JoQ
	  RUtFL6UKy5pb43g/jjQXei6uDpxlOOm4jmgwCNS6K1g1/19z9eBGfv1mLwH1R3EyK2GzJgVdEL
	  EGJtu7h0sN5mk9+F+jMTqrRLnu6k/Ys/k+KH7XwqthY5IQh8QpSg22BaTuStSRhIJwXmIMikg9
	  PBW+q+3tHD0nP9D0dtf2jXMnYoojEHWfVCGydZ2/nB0YLG/R2ZB0/U4rxuwwrNBCeItd8yTIiF
	  vNPEkifsgxZEOq6PsjJnnCmblMp0ErhJ2j086Wk92mBtIw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; s=arckey; t=1782769907;
	bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=hja4PwOg5Vy32QUP34Y1V4fyESZOX1oeUMPZgs2BJLMAeUFeZhWLVMSg/s8S3D4MbHh54iX1Ar
	  9mWWd34JD7l0BM6CAMWq7sn6tJmOa3Y4xInMuSpJjc0i6hQhG4eqbnAbjCj4Qez1hQq+jjuQEO
	  gTstVRJo0c6+yGS57/Wi1wBsH2GCB9cN913eObcdjiioJF5IMbWkyO/EoejftDMUK27dveNAO8
	  zxwyLx9s0oxrM3xe4SI8Cr7M7dsjhjEzWxMYayeqJBWa3HCdbNqAv67xfrWRw0MAiOBsD9LyGK
	  9GDwTg9ZoZPMVz7fU+TXmSsVeyUHyiVHKxJWk1RSR+ZYsQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=s6djsBb/23trtHIWrDZW4lrcPuWsGtUEMlycMJEVwEk=; b=cjCLenoaCWGGZky/V7/INjr7QX
	xtpcr/UOu+4X6+dxmQ/+7E7i91Ar2eyJ6G9E/5TjAKMCcVOv59yiM26fDimHBTUP9MDyQWeW/cTp6
	LQq2MQSdynNxzpDcgEItcsjaCFMlmOHJqo/mJgbFHlpxsJqIln8epruhVCWo+vybMZpI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-n44s.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1weJtC-00000006z1e-0BN8
	for driver-core@lists.linux.dev;
	Mon, 29 Jun 2026 21:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=s6djsBb/23trtHIWrDZW4lrcPuWsGtUEMlycMJEVwEk=; b=AkUH6VO78JDod/x2Mmy2JLNr9O
	SvvtlWLeQGgbyzyUhsbX1gtOKOAUQLqiQQsBhlw1M6bqH2U10tdHE5O+G2a3qx+j8KER2B6a4/fZA
	LhnlmDuYOjsa9LdIiW5IFQP3SbRyjMlUts3db/NECXFrMRemBp5+oge1MvS2zgT5LfpQ=;
Received: from [87.14.44.248] (port=60818 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1weJst-000000004eB-3wAr;
	Mon, 29 Jun 2026 21:51:19 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 29 Jun 2026 23:51:18 +0200
Subject: [PATCH] driver core: add driver name to probe debug print
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyML3YKi/KTU+JSizLLUIl3jNEOTVEsTU3PjNDMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAQ+D3mnAAAAA=
X-Change-ID: 20260628-probe_driver-3f14e94573f6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=francesco@valla.it;
 h=from:subject:message-id; bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFlOL64bxr7seZ/X9OyNj1KGwQcRizkdL2a4f2bULku9V
 /XYJp2no5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZhI4GWG/47eFm9Zg7pXGF8/
 fKM61r9ke6Ta7HMHlQ74uKXfapk69R8jw5voGFXB2A9pTlMnm1lP5Mw7rSX5bav41Nxyfd5bYpd
 38wAA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3dca610ddb2beea9f539dda747ca4ed5
X-AntiAbuse: ID - 3dca610ddb2beea9f539dda747ca4ed5
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1weJtC-00000006z1e-0BN8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The initcall_debug command line option is a useful tool while debugging
and optimizing the initialization of a new system, mainly because it
allows to see probe failures and deferrals without recompiling the
kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
with the driver it is being probed with can become difficult, since
some devices use names that are not explicit, at least at a first sight
(e.g.: '1-0:1.0' or '1-0060').

Add an additional debug print to inform the user which driver is being
used for a device, allowing for a quick match. The print is inserted in
the same really_probe_debug() wrapper that is already used to report
the result of the probe, and is thus not affecting executions not using
the initcall_debug option.

Suggested-by: Tim Bird <tim.bird@sony.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Hello,

this very small patch comes from a discussion started at the end of
2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
proposed there by Tim to the bare minimum, as this should already be
enough information for a developer to work with.

I was unsure on whether to add information to the existing print or
introduce a new one; while IMO technically worse, I opted for this
second solution, since the existing print *might* be viewed as
userspace-facing ABI. I'll be happy to do otherwise if there is
consensus.

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
---
 drivers/base/dd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..3c0930020050 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -782,6 +782,9 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
 	ktime_t calltime, rettime;
 	int ret;
 
+	/* Don't change this to pr_debug() - see comment below. */
+	printk(KERN_DEBUG "probing %s with driver %s\n", dev_name(dev), drv->name);
+
 	calltime = ktime_get();
 	ret = really_probe(dev, drv);
 	rettime = ktime_get();

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260628-probe_driver-3f14e94573f6

Best regards,
--  
Francesco Valla <francesco@valla.it>

