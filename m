Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E8417340
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092608; cv=pass; b=ber2IXu+nNROIg4GfYJ0YseoHm6ULvJWcSCK912a5/tPeVHlRbkItS9mFRzkOlUiBqsExDs2jHnMJwnZgEUNFoWp2yuEQHd96Tf1acsGrwwg67Tyy7leS54AhjU/uiGdkKg0hJwxOivFi1lVrwM5Pkq/TM6KSg/MOi0tGVzzjqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092608; c=relaxed/simple;
	bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kN2a4FhB2ir6qyTRWv0/CGF3Wqh2sXFHKJuXimftjpY/7peS8VEsbm3ZZjnmSSWpNu4mshg4GTqq1dibrihtbfjVRbkOEMKwVtmj+NMSTtEt1URXwaEIkwL708/yfIh/8TPZHrDD5RAZX3Tak4c3yUp+WuRpWAFU2x3g/7N4snc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=Hk+VzGOC; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=JgvG2Ci6; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Hk+VzGOC";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="JgvG2Ci6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ztlv.prod.antispam.mailspamprotection.com; s=arckey; t=1783092606;
	 b=DOsQXAWJOoQgUzxrzjrb30QiUJ2Ckqb/ku+El2x6xlXmo+62dqqfonXv+FV6Ndj1whN5bsF1eI
	  g9x2fngpaa6oOSg/R7FKTiEW47NGeMm1e2hdUeHnR+dad3Yhql/MQ47dEBYUbUO/spbZ8WWfv8
	  esDv9NxEqHRzUVc56DskbAAHi8mOfYSXNeR/hN2+1QAOLa9t43rRcxyGcGsCn/f9KEpXqHawcS
	  c6f6qMd9IHVhM3cu3J1Ga0bX7lJlOlArhONeeLCQBuUvOQvrf5DKgv9jIv1FBklUJlV1bOQzYU
	  WJoKNM7p51NsoJdALGZM+wBPKrhyhha7C9yUN/9uDQvK5Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ztlv.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ztlv.prod.antispam.mailspamprotection.com; s=arckey; t=1783092606;
	bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=sci23b2QIjq2gCv8w2ytWqH+9zB/izAzJI1ZjnrD2RZMR4JAxpKHHsq9EXurZT5HAskwK7anuu
	  8QqGvvlBwq2j7BjReMGjUrfFJikBsUvd1reH1u46YFgjMNXwKl3DN97aocxNsq3rTbZvIyx6Tc
	  g3+JnrzmRAzjw0UfrYo62E2+KCFzieIbmy/yXdgGMv6V4GEDt6y5FiKZIxxvLYVOgyPuXXezid
	  btGHGyu84y6tM4do0Q0tfhXtAuGm+hRUZf/eeJ7veYFCLfDPaqwAmWW0gLt5u9lTO4wjaDt62r
	  EzCVmFuAigQq1e5JZz5A2rkxwca8QCgYL4BkqgJz1A/woA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=UlTfmGa9qEJ6fhD2naLl7A0zdxE+fu1XrClUZXCpJqY=; b=Hk+VzGOCLFPHyT7nlmxq0Ll6mR
	3Relios1tr6Sy66tpV1VlE7TYgQAgXjTjIdyrAmlKcg5Sxpjm2ovucfuMjyNAP5Gou4MdEQtPlrDX
	LP1TuPppOP0huv2DP1FGkbd/C5hza0zOqkfkZk9DPmls3FuQE6coSyVlKwWdc1oSftf4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ztlv.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wffq1-00000004jJW-2iua
	for driver-core@lists.linux.dev;
	Fri, 03 Jul 2026 15:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=UlTfmGa9qEJ6fhD2naLl7A0zdxE+fu1XrClUZXCpJqY=; b=JgvG2Ci6ii73IGkkkMTBizzI4N
	lOvOPyMKmNLeRqP7jlWSdIa99L6iy2HYMqNrLsfq/YUv7X3ntDuKP1cX2ie1uyqrCvz9VxFq1kTag
	6Udvtp6wHuPeM9hZOb2dedDNXaQuqf+4YBG7ZmknHHpmQlvDjhYekfrwtaRl1op8wp0k=;
Received: from [87.18.41.29] (port=59642 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wffXA-00000000Bfh-0tG4;
	Fri, 03 Jul 2026 15:10:28 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 03 Jul 2026 17:10:21 +0200
Subject: [PATCH v2] driver core: add driver name to probe debug print
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-probe_driver-v2-1-b6060559f33b@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNzQqDMBCEX0X23BQTjX+nvkeRYnRTt4jKxoYW8
 d0bLT30MvDBzDcrOGRCB1W0AqMnR9MYQJ0iaPtmvKOgLjCoWGVxpgox82Tw1jF5ZJFYmWKZ6jy
 xGYTJzGjpdeiu9Zfd0zywXXbH3ujJLRO/jz8v995PXf6rvRRS2FYXUuYhjL74ZhiaMy1Qb9v2A
 fyDvB65AAAA
X-Change-ID: 20260628-probe_driver-3f14e94573f6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=francesco@valla.it;
 h=from:subject:message-id; bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnuF+7PNp88US/++acdckyLbXZNWSkTveH2e4M7a1rOu
 iywMxXj7ihlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmIn6N4X+9S0Rz9sUZQb/2
 31xy6lHIDmPPyXsKPH8o9fN9jhBIXsvIyHBnxlSd+rmf2W9yFbrsKjl+Ktvq6+MTPlf61RYsUTJ
 +/4cNAA==
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
X-SGantispam-id: 88a9a39a621de47f2ccee2e02ffdfc3b
X-AntiAbuse: ID - 88a9a39a621de47f2ccee2e02ffdfc3b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wffq1-00000004jJW-2iua-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ztlv.prod.antispam.mailspamprotection.com;
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

Add the driver name alongside the device name, to allow for an immediate
match between the two.

Suggested-by: Tim Bird <tim.bird@sony.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Hello,

this very small patch comes from a discussion started at the end of
2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
proposed there by Tim to the bare minimum, as this should already be
enough information for a developer to work with.

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
---
Changes in v2:
- Moved driver name in the existent print instead of introducing a new
  one.
- Link to v1: https://patch.msgid.link/20260629-probe_driver-v1-1-fc58117581b5@valla.it

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/base/dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..f6525a7ee8c5 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -790,8 +790,8 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
 	 * CONFIG_DYNAMIC_DEBUG and we want a simple 'initcall_debug' on the
 	 * kernel commandline to print this all the time at the debug level.
 	 */
-	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
-		 dev_name(dev), ret, ktime_us_delta(rettime, calltime));
+	printk(KERN_DEBUG "probe of %s with driver %s returned %d after %lld usecs\n",
+	       dev_name(dev), drv->name, ret, ktime_us_delta(rettime, calltime));
 	return ret;
 }
 

---
base-commit: d2c9a99135da931377240942d44f3dea104cedb8
change-id: 20260628-probe_driver-3f14e94573f6

Best regards,
--  
Francesco Valla <francesco@valla.it>

