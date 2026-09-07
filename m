Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334440B0EF
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763682; cv=none; b=OA8Ab9EKq2sOXF30CxicMuUIrrieS9nBPVH6cg+xkD2lUbNVrOrVV99M41T2fL1ifhxH5FvPaQnMZUiX+HSpwCPpKk65cTcFwzOu7VftQGMDh4U3aWXNeeNcznP9SAy4D+O14hDtM9yjAdgYwhuk2UESoNVp1dOg4Et7CpmqT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763682; c=relaxed/simple;
	bh=yXnUcv5qVGtYzgWj9FiGbfPJUzxRYD9YlLEosr6E6dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ0L1ourN7WSjfzar9/ruMZL5T8gBMZ2WqInwi0Dj5C3fYqd0R3fpwqSYmgn48REnq/wNo25PXYvKUnqfQm6OweXlGDBVI0FzkHv0c4RkZe1X8V3S8VFTteCJD3JQUxAN1gPuvrILl2TUQ19sUYQK1QSzUbEO32HaH+QOAzoKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6yMdIX1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6yMdIX1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d5cad1a6baso27106055ad.3
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763678; x=1789368478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=i6yMdIX1ja3d9TAx1sxdGdhTjyKJnDL2Gx/pDRuGZP8t3cTmZC4jwUR/H/xONl38JD
         Qsto98uNY4qnNagDemzfP7aEupbCuYaDCnNFbjsJPX+pmv3zRefe4igaNzupC+9KPGZn
         crw6gebVQiBI5Zzan9R5GAvJ1hwVvUw5RqTLNAQGW8l1GbBP8Nr9I69gpgc0U9DzkL9d
         lJVti256q6otItZmbDnKtWNY9MNWyruP7TdCrIS/98aaVMxtTVci1661uNUbdOE2OzjH
         9N378IO2FOWyQ9EcqCOsNkTN4Hw84eDb8ZIRDBqU1hL/YD08VK5ULjjROuKmf9mb23Xf
         MIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763678; x=1789368478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=hy3QKFEVPIRRhvnGIGFamW5CSj5UqU/fRdIMdMibvYBbjRJNemIidL1yyU9xBez+a0
         r1nfVlTfzHpY5ojqNraXIzmbNiwt8cxALxIxYtQIewkJT4PGgOxMrfFlxP4IiOz8fyFN
         1wfASisSMmxmaz++0emagQxWXcwx5ytSoRv+ib1c22zrELhRIO4IOw+CyHubbuzgW4Jk
         aG07EJ7UpSBR63IRpJIWqod0PKZTXImRbro0BX0RAJh+hFriIJu3YsbeoW1RVh0T9zRM
         GlDFf51usBtm3pBBT8AYPvJM9eMg6rw1eyk8JbDMy1qkOiWMMLctb+dk64yBZK6Q7vCp
         YM8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8BPAvp46AqS9CiC0nrXsUJR3I9ui00bfH44wL5DOxWcYhYk1vpjojFMPHAkQQ1zYcukVsZcz29aKiyg==@lists.linux.dev
X-Gm-Message-State: AFuF++kR0YBp00jU+XZZf6bIjpdSm4ritZNFIPzAjNqZwi9ivlmVEYcf
	ZOtWkBjk/J6WPBlVUm/HuZCFxCCt7vmArzSaWsVzBUfo26zx7Mx+gCI7
X-Gm-Gg: AYBFou1mxx0pHoo2AmrF1uXLVZFvSZjMA0brrWyMwqg+iDZisUN+ZrE7oLlMhBCFl7k
	c7Jj2Qcp4XOkW1f+he7zQ66/H4OTGRDsRFrq1IQRooSHdKZQnSfe+5C0Mb1o7w9c1H4TK0ROO3E
	ENVolglh7mRN1x3/pT55S/V+GSu4olkxn3I1TA1zdob7B261mtKSFskl7XvaI1gdkPhbZ5N880s
	IgZNsn1+3zNdlgzjSdDOt/xtuQaceo/36tufqOB25yBGEJBImMN1DKKIemvZdi2isytx4Mez2QO
	TRPkAlDLCrmng617hnDma9AaY9cm6aFVZAR3D1jBdYg5St+4X/GumiH49ox3HXy/JUISwOKYnyl
	nJKIAtT7CNsSB7KwfJvPyti4NjnD77HSLxdYBltNYZnGW5oxdyw7ZePyr9bE1yqTpHTR9HcmUYY
	mzna4ToGPneKko/OTTBGtf8q/rmiLI9v1DlyN6hIV2uM1jVJYGNlGyaAFZmDL7vFl34ECmtXJYg
	YP1JdzH+oSn9g==
X-Received: by 2002:a17:90b:35cb:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39b261ae617mr36625720a91.11.1788763678086;
        Sun, 06 Sep 2026 23:47:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 4/5] cpuidle: fix repeated word 'that' in comment
Date: Mon,  7 Sep 2026 12:17:24 +0530
Message-ID: <20260907064725.10686-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'that', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index aca907a62bb5..d2fc216c38fc 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -281,7 +281,7 @@ static int tegra114_enter_s2idle(struct cpuidle_device *dev,
  * LP2 | C7	(CPU core power gating)
  * LP2 | CC6	(CPU cluster power gating)
  *
- * Note that that the older CPUIDLE driver versions didn't explicitly
+ * Note that the older CPUIDLE driver versions didn't explicitly
  * differentiate the LP2 states because these states either used the same
  * code path or because CC6 wasn't supported.
  */
-- 
2.48.1

