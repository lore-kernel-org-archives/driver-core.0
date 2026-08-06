Received: from out-171.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C3373BF2
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036780; cv=none; b=LtR1X1tNZXqrfRO7v/FLkuPHCM2aBUtuVwGCtykEmq2ySt3m3ioKn8pVl0ssSMbPSPlgK/+1VXtICagHy1pfSmxl9p8LEgq7h1nybHjEImQtAUAFWzbAnlGM4oUNgx/G9jukrM4kXDz644EO2Xt1vCvtaXoC8reUcLBejuIAOL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036780; c=relaxed/simple;
	bh=k+B+H5i/rcz7BdDV/Y4nQb5C7sdVh7eBDn3xTtI3h3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwmyU4hsMHilmbhE4379gaRJlmRVRfKXEFs4xZWWCP75FnxWKr60l3idrSe7s8KG5Xwr/C6TlpwadZ6lN4VOji37ZU++X0iD05S7C8d+XQXDltVrZQOH0o1E1dbzE8ZkyNEDMODyvCr+5Z/atYqqi7dvaqxSlah/9gZegnEbsHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=scHdmixo; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="scHdmixo"
Date: Thu, 6 Aug 2026 11:19:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786036775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hkI2KNeeq5s7RHLSiRZyeT1fg3igDdArE8mIwdOe49k=;
	b=scHdmixoFtQ0Qa5BHA0zbyfhVWdD/XNeK+VuSilrVvlqYGgGR8TRH7ErzUqeRCxb0Jg0Bj
	LVaF+nGKSIC/CJOcqsMO1vCGLNQmKLLJpOrR/T5rvXe5QxKOIS44+4PpGXD0GK8muAWBa2
	dmvdUBBC5ir+ru2xRaoGSk+MsSepgw0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: mcgrof@kernel.org, dakr@kernel.org
Cc: driver-core@lists.linux.dev
Subject: [PATCH 1/1] MAINTAINERS: Remove Russ Weight from Firmware Loader
Message-ID: <5o4r7r76h4areyfolngggnzcd3msquwgubly6xjbz6zdvoha2i@doazljuavhgk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Russ Weight is retired and is no longer actively participating in linux
kernel development. Remove him from the list of maintainers for FIRMWARE
LOADER.

Signed-off-by: Russ Weight <russ.weight@linux.dev>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b592cf49746..a44d69cb8d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10115,7 +10115,6 @@ F:	include/linux/arm_ffa.h
 
 FIRMWARE LOADER (request_firmware)
 M:	Luis Chamberlain <mcgrof@kernel.org>
-M:	Russ Weight <russ.weight@linux.dev>
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	driver-core@lists.linux.dev
 S:	Maintained
-- 
2.43.0

