Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D33B27F1;
	Thu, 11 Jun 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178936; cv=none; b=dLbFsoBxHKkio5c9dkT/k2UoCCgfKWVMF7yKk49ez3cWw9UISz/x6f3kneVHx+Sap3tj21gxKogoHpIfVvwyYkHZGDU9EGh96ENGhBSzk52loABnw4fLPF/+sddPV7p9QDLC6BnseGpH3ZROiG/EjJykJZ/nI2LCF7Oqtmb/YDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178936; c=relaxed/simple;
	bh=kN1U63sUfoEbxDVclw5Hs0hohEoMQurzR5TZAyoM7os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fV2TSNGp0WOnW3oyyAa60MxxeEcgo4P0RW38FN5yapnlzVtNuvT94Dxsmug7+1JAMdlbdKrGvppnLYL9Kg9L1okCknEYdBLZsMSkztchBhGYe/XMHkj5T/e96unGXFW5RF4O/MABsDs56rCSIk2mwJvFx5tPiwCg+PRf5Dd4Xkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BCF1Za1W; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BCF1Za1W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=kDGCwI/qmoVzRjgiaIHkOZXBk1iJOD0oQLhWTrgqlF8=; b=BCF1Za1WUVjPShbXhUfrgvxyL0
	Rg+Vwy23E637vEurP+mzvUBlnLmt5Tie+KSpgRRE4zxhXZnZ8b5FzZmp/KUFm6gEXaJW3gOkf5FUM
	h2dYPkDNhvkcSbxiONsk9elXSv7K6JqDULGTaNKT3QOfdl7PfU0eQEWd/nKleSUTEC2EPtNRUg22O
	QDlmocxEQ7DQda5niBJ+6sODzNQ0okZJDZ0WxqKm8cyUPo5qv4svAtwILzdyot6RzMiUVt5aGBqKT
	nIJSrZ2NcqDDsN3yJJ4O3EPL2kbWtJAMxA+3Wo8KjW//WWLT83qG5mCmbe2unR0y1Q6UfFvreTW0P
	N9PhtUwA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wXe0Q-009wMg-2y;
	Thu, 11 Jun 2026 11:55:31 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 11 Jun 2026 04:55:13 -0700
Subject: [PATCH v2] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-cacheinfo-v2-1-6069ef066cf3@debian.org>
X-B4-Tracking: v=1; b=H4sIACCiKmoC/23MsQ7CIBAA0F+53AwGUCsw+R+mA6XXcgsYMI2m4
 d+NnV3f8HZsVJkaetix0saNS0YPRgDGFPJKkmf0gEaZQQ3KyRhiIs5LkZMJdja3oF0kFIDPSgu
 /j+sxCsDE7VXq56g3/dN/y6alluerHS7RBbuoeJ9p4pBPpa449t6/zpcykaMAAAA=
X-Change-ID: 20260609-cacheinfo-b2a8d27a19ce
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Pierre Gondois <pierre.gondois@arm.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157; i=leitao@debian.org;
 h=from:subject:message-id; bh=kN1U63sUfoEbxDVclw5Hs0hohEoMQurzR5TZAyoM7os=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqKqIurL8OY0IaZXekFV+p6bhGGDq+vd/hYOgcA
 wJPzqtMSYCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiqiLgAKCRA1o5Of/Hh3
 bWKrEACQIosWwxY5Ry1DrO6WYfk61TW3fZzMppHNKjhzQeunCyLsHzLiwnhcSammk6ncHpUy/W9
 ANNB/E1r88EptW4z8/HvS8RyDansdYfAerrlFTth66fBLJKkmtz2st31HqysjPkdlwQUYTpoe0t
 b8S8ZSG1Q3t0m1EdZMxDv+lFNXnGZ3o1/C89mDDe94C2m+d91+Sq64nYRDEH5txoTuIFlG1FoQt
 xpgD/gjQXLi0ChxFfKdwJP4lQnrv4pdoV2yboUL5hQW3YQA3o1QtFKqmWXCFR3LIpbPQnOomm12
 uwdooMaknetFrszj/yv5Xw7T4o5OnVUlT+Ptm1MTBeoL9GtRc9Az3NxwOz9d0wsGMstszCCcDnw
 Am7VQ2MeJDTvjbwg3tNfal2V1gEvlfB6fLdmw6m2EOkPw8LwFgIf4ebwT5n++5/TUEwItKyEFBX
 fLCd5vrdDk/5if4u3HyNDUl6OuisgD97Ekt5o6n1WB52YDvnU6AHM2Ymmu7cfndQ84iIZJpyMMA
 c1ZM5GedUeF7hn5cN8AzbFuX5b4lPKuNlVDrId1PO/7LRHtrJGOw7DAoP/7HGeiPB+KACfu2DNa
 mrT8DJ38KWiq+a7uB4idt/0iZUNeeMARb0/MHkua69M2vqFqXGKH41XQbHef7PzTBBXYBnrGaMj
 axwBfPN0XK1ZyKw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

cache_setup_properties() sets use_arch_info = true when DT/ACPI
provide no cache nodes and the arch can derive the topology from
CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
original -ENOENT. cache_shared_cpu_map_setup() bails on that error
before the new flag can take effect, so the first CPU brought online
always trips a misleading warning:

  cacheinfo: Unable to detect cache hierarchy for CPU 0

Subsequent CPUs skip cache_setup_properties() entirely because
use_arch_info is now true, which is why only CPU0 hits it. This is
reproducible on arm64 with the QEMU 'virt' machine, whose default DT
has no cache nodes.

Clear ret after setting use_arch_info so the caller proceeds and
populates the shared cpu map via the arch-supplied leaves.

Fixes: ef9f643a9f8b ("cacheinfo: Add use_arch[|_cache]_info field/function")
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Cc; hruben@meta.com
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260609-cacheinfo-v1-1-35864c9a8f0c@debian.org
---
 drivers/base/cacheinfo.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 70701d3bc81c6..9f9c72727a059 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -401,9 +401,14 @@ static int cache_setup_properties(unsigned int cpu)
 	else if (!acpi_disabled)
 		ret = cache_setup_acpi(cpu);
 
-	// Assume there is no cache information available in DT/ACPI from now.
-	if (ret && use_arch_cache_info())
+	/*
+	 * No DT/ACPI cache nodes; fall back to arch-derived topology (e.g.
+	 * arm64 CLIDR_EL1) and clear the error to avoid a spurious warning.
+	 */
+	if (ret && use_arch_cache_info()) {
 		use_arch_info = true;
+		ret = 0;
+	}
 
 	return ret;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-cacheinfo-b2a8d27a19ce

Best regards,
-- 
Breno Leitao <leitao@debian.org>

