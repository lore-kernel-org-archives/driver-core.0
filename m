Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2632D061C
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082433; cv=none; b=JXoeb+3Vw2uoVXwcihC0bW/MDDNW7BfQ8mhN16R+DzwXvvPYWo+0bbHC/eMzUByMSp0lPQHTu4UIJqBaAROkMZKsqZE9ayasLQDga+Bh9wJitd7VONitxOdp02oRwr5Zb+05sfu6eXVLb/Kl6bRyqLhdVhvCEp/DKYoiF0Mf1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082433; c=relaxed/simple;
	bh=3nvawkx8dNR0Lyzwa4PSlwVfEV4+P1ivx6ryxBzQTNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aW/8RHafxg9jcYC3UCOVW+tsATCNCnf1p0a3h4JhFepeHMtCHj+soCkCWhE2h65N2ZEyUz21eXt8AhOOi0Snx2Cz2RYqzOoBD874NDeTEmcEa0ORpZlm/lTEwMQJAZenxoY2cWfM3HaCshihfDfmFpsNPAvSftfwXNJN5btjkCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rgp7O6C6; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rgp7O6C6"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3nvawkx8dNR0Lyzwa4PSlwVfEV4+P1ivx6ryxBzQTNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787082428; v=1; x=1787687228;
 b=rgp7O6C64XGD5SplvfAV8Z6E6Pt3L8weyn9ErEupgQ3vVTAvh2PHadMv4FCeQ+xTIZ66SweR
 4NSzrGCoL9s/BDnfYgSeYFXci9AZZvNhsSWz6H8A5qvNBL3+apYbM3YJMotzBpV1In7zQB4KqrG
 2Z9K7O/vjFcQwKVy7A5Lq2WI=
X-Envelope-To: driver-core@lists.linux.dev
Received: from savannah.home.local (66.113.51.199)
	by mta12.migadu.com with ESMTPS id 552bc1f1b5a2c91b;
	Tue, 18 Aug 2026 19:47:08 +0000
X-Migadu-Flow: FLOW_OUT
From: Russ Weight <russ.weight@linux.dev>
To: dakr@kernel.org,
	mcgrof@kernel.org
Cc: driver-core@lists.linux.dev,
	Russ Weight <russ.weight@linux.dev>
Subject: [PATCH v1 2/3] CREDITS: Add CREDITS entry for Firmware Upload
Date: Tue, 18 Aug 2026 13:46:47 -0600
Message-ID: <20260818194648.1014604-3-russ.weight@linux.dev>
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

Add an entry to the CREDITS file for the Firmware Upload functionality of
the Firmware Loader.

Signed-off-by: Russ Weight <russ.weight@linux.dev>
---
 CREDITS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CREDITS b/CREDITS
index 91c51c14e993..9c44f02d3618 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4277,6 +4277,10 @@ N: Juergen Weigert
 E: jnweiger@immd4.informatik.uni-erlangen.de
 D: The Linux Support Team Erlangen
 
+N: Russ Weight
+E: russ.weight@gmail.com
+D: Added support for Firmware Upload to the Firmware Loader
+
 N: David Weinehall
 E: tao@acc.umu.se
 P: 1024D/DC47CA16 7ACE 0FB0 7A74 F994 9B36  E1D1 D14E 8526 DC47 CA16
-- 
2.43.0

