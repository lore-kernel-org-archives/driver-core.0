Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5B3769E4
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082434; cv=none; b=f9qhqby8oeMBznzPPvtlV9NYvuaSUgTYiugRQZwk/PJF6fdR3HBou8fLMzyfusm8G7OWIhP+o1VYPDvBZq3031aUrvty8wDxD9wZNLPbpohEocuUSje9ckwHF1GoEYomng39T9hPuj92geunGEe7edjfgewMWDbFJAAtvXeUAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082434; c=relaxed/simple;
	bh=qucU7pfHXDctOD8tpuSzAhSGF3SK4IWOW5V47d71yss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqVcClXfL99cIWVkjqlvcUspBY0O2x9qqIIkLnp7sJr+AidE7nmCiMW0VSZWBR4GlbJoUBUWCTrjZQBfCK5f+PpWMHen7rPcgf7hcVhzDIE1PWINuy8wCPt9f95eca2R+faV11n+0XbE6EQe20usdIxvHfmsjTsY+EAw4tdMIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dnvIR70L; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dnvIR70L"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qucU7pfHXDctOD8tpuSzAhSGF3SK4IWOW5V47d71yss=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787082430; v=1; x=1787687230;
 b=dnvIR70Li9P7WZt3ebR4gJozhpwTlwoGsOsFmAkGR29jgiL6/pRKtKtJ8BNmRbsKOIjZ6pF1
 zwfdEfoxL0VlpxcuShX3ok3LHF+RMhFj5VV3fRagm+m2QL5hdIn8uFP2dPLyYKIJfxkxJozp2Ck
 omz3j5LAe56mcEIbhh+GvNLs=
X-Envelope-To: driver-core@lists.linux.dev
Received: from savannah.home.local (66.113.51.199)
	by mta12.migadu.com with ESMTPS id 1b3c27cc6712a480;
	Tue, 18 Aug 2026 19:47:10 +0000
X-Migadu-Flow: FLOW_OUT
From: Russ Weight <russ.weight@linux.dev>
To: dakr@kernel.org,
	mcgrof@kernel.org
Cc: driver-core@lists.linux.dev,
	Russ Weight <russ.weight@linux.dev>
Subject: [PATCH v1 3/3] MAINTAINERS: Remove Russ Weight from Firmware Loader
Date: Tue, 18 Aug 2026 13:46:48 -0600
Message-ID: <20260818194648.1014604-4-russ.weight@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818194648.1014604-1-russ.weight@linux.dev>
References: <20260818194648.1014604-1-russ.weight@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Russ Weight from the MAINTAINERS for FIRMWARE LOADER.

Signed-off-by: Russ Weight <russ.weight@linux.dev>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f4f9f117130..74e65cf9c91e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10111,7 +10111,6 @@ F:	include/linux/arm_ffa.h
 
 FIRMWARE LOADER (request_firmware)
 M:	Luis Chamberlain <mcgrof@kernel.org>
-M:	Russ Weight <russ.weight@linux.dev>
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	driver-core@lists.linux.dev
 S:	Maintained
-- 
2.43.0

