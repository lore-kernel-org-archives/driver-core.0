Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA402571A0
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957479; cv=none; b=CLmclc/3FW4yXg514nMos9jFHL9g/1K/46U0F0PD5vaQ+TAwK1KUbQ37DvuYf6yqzaitO2Ddox9IiUeJka82H2Li7BDdU9TvtkZbfV78YZxPxxjGhk2zczh2nxk+fs97tplK6CN78QIJE3dqHXI5gwPzQ67AIj9+cv2qFDFJbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957479; c=relaxed/simple;
	bh=KCvhB7YvJG0+GzJac32x9PTIG884sVxUPYeN79PySU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwVUq766nnVV/fS7qfqYcD4+byMxa89WtXBWc3/xCCoZU7pjecbvCPjQQ0NVvQNAG8hV6Tulrn3ml3JdlbjHJHQUQrfxA00GygJF46LT1Z86C5pACnT+zpOb0+GC3linyJzGuZwU4HXbheZ5q0upR8+0p8YnW43Ns/HAhnNMj7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEozVWlv; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEozVWlv"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so2077227a12.1
        for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957478; x=1790562278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6I/ak/O4eJcZiU5KKh1NHL3Att+jlc5ir7kUQuvbMI=;
        b=BEozVWlvfcV1CNBBlD98iY6jdX80bcVu8fnw8rop5BSRERF0zOs6/fwiU/dm4YlsFS
         9nJFCkgbfSsBnRgSHSd5pqv8hngaolUixoGdid+xoxCqwu9VPFXNs0pX1StF9rL6NpdC
         NH1oc8g9dJXvw6CBF7KfdX0xtDlgRFJaas03xAbMbOc1Nc55Tza8f7gUBifLxK+vsjIK
         JCTqs4pqJf8R5qxuOvl+UfJuDGTrinjLA14KApYknErCjC1wcSIOE4c9REjIGG4pgS+9
         RJ+jXAzHTzgDiLEahD0OzM+ZKC+CSmK8HzK1PbPrhPMUAtOtsp/FaN1FZg83NCC+OZE9
         e9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957478; x=1790562278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6I/ak/O4eJcZiU5KKh1NHL3Att+jlc5ir7kUQuvbMI=;
        b=oLMCOgnwiybLsXJYQLd2qud34Fsp0IcNhIh+uf/L1YHIyxrapG8hfNOT0goaRgz35e
         U1zNkhxOwTcIQ6M0EItqmhY6pYd3zajM2+lRCpZhdWUCXHId414PFYH8amMX9ndcxYsk
         ICHN21kazIhxckYfgdwgDlq9KRwCjLNQgFJT8zdjluvzSa/QL7yOdJve9RN0JBmz1q13
         vYQK//wrDb2UqiJJ/OXNLoGEuz2qRcsejq6qT32QA2Q3ka9002JClja7qBhD+QBd3nA9
         9Yhp+p2ulUJieI1ga2n3PCeTDWX3chOG7fxKFZV0i4KvNdA9XjvuKTAH4nYLnCV6m5H9
         UC7g==
X-Gm-Message-State: AFuF++kl1GbVBMGVVg4G55k0+tXcxef6t3OpoqVo2RLSlX8AnZaM+Iad
	Jr71AELhnQlGX3I7bailADewBscOtMG72UyUhYUXjEBOve2obL4n/bj2
X-Gm-Gg: AYBFou2HMHc7/BCds6XPdvL0qJgL/n7D3WSD+3uoG7n2/dyxja9X0fYPM//CUOE4Bt0
	koDDZRMGf+Pb0wb20En2LhlE7R/8kMKID8laoSFTv1TIvkinmP4kvL1+OlyRRNQ3fVED5M137SL
	L1/QmDrsL0AsjveNnbIKVd3kh6OtPinCjOk6M6Aa/KhY317OfxMRlW7qW6kzE0KOTa91oWtG/6Q
	AP5Os+wdxGaaziOKKtXApHnKWB1T4GbdSt0zXhbbiWpwKLXcGAClVD73kqGkMWN9Z5Y9cnYdQ8d
	iGsbsLVlnQCzjARuHnRmIx1bvbCj2CDllesmR0/d/GPunJVWVOFwS6rxDC86WvOvXnE2kDWEyne
	ysmtxSnxHkNPnOY2HOuWG9Bh8ipgCV6MUFkTNeOfjjRsYQuUhkIVxcoY//1DN95nH4omnMg/Urb
	qqQ3lb+mO1cTmfoC1+Qke6exzW8fArW0eNZNhfR1916otblV9OlEmhNkrfxQzWqQPKcMt+h5/vS
	Qmtmddu9VG2Ae+I+GU9sScZekG3khRPDivCjt0t9MfixNhFG4klbuT+FCvL6ZRDZsF5jKKb3vZK
	21GAbgxLIkA9h4o=
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr2802948a91.39.1789957477758;
        Sun, 20 Sep 2026 19:24:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5ccf8634sm6588087a91.2.2026.09.20.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:24:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] driver core: Use pm_runtime_resume_and_get() instead of open-coding it
Date: Mon, 21 Sep 2026 09:24:25 +0700
Message-ID: <20260921022425.10134-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/base/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..a54cfe48ec80 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -817,10 +817,8 @@ struct device_link *device_link_add(struct device *consumer,
 		return NULL;
 
 	if (flags & DL_FLAG_PM_RUNTIME && flags & DL_FLAG_RPM_ACTIVE) {
-		if (pm_runtime_get_sync(supplier) < 0) {
-			pm_runtime_put_noidle(supplier);
+		if (pm_runtime_resume_and_get(supplier) < 0)
 			return NULL;
-		}
 	}
 
 	if (!(flags & DL_FLAG_STATELESS))
-- 
2.43.0

