Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80043BD241
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763688; cv=none; b=o/DqIhrPFamGmQDWFbG7KVMGROORhVmJChhfbDOMyUB3gLXZfDuDffToIZY25ua9UXfreoOmigmlJfWj7uCEkKeyOXJqVuHQnk/ZbNG/THcvd2fhx9glpWcn7cePGTu1LzsdJfITkpbtznjPIoJtLu1a7qdWJKrCnOZP71LaubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763688; c=relaxed/simple;
	bh=NySkzWKGvAVQrs22Wj3YGugY/Vl4ZuUmyHXC/e0Qdz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4pSKpGxEG/J3K+ATjSST2y3KfV317j7lwgf4TGh+sS1quOSnGlF1xZy71xOnSLHwAXGGgjYzY9KUyzMwA3qucDUnqtZKjj/JR9CsjBJr0Y2mgjcl0/SjCqR04iHl/oJxjXlM3q00jCBZUwI3LwqS6pGV8eo+D8EJJNURg22glE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciU+8moB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciU+8moB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2177762a12.0
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763684; x=1789368484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp3Y74c4rqp4LQw7mbFodFzkhcskiP8CvJ8q4Odm34Y=;
        b=ciU+8moBnTdEtkLQfwc0dhI2G/PiqomUeCNYug1aHHTqzIjn5rCDMlhzgJGIXz1e1J
         gL1RbIRDmLV9rBAeTcFhXMOP8JmWCC9AMNbRaFDQVWh+UJuQrLRVB8wbKjWOLckghgim
         ivBwDFt0eB+OYkvuhA0y8BKrkAKKl2cc2w7QzmbSVKmXrI9u3DUAjSMvV024/6CxxJrg
         YmuqPw4Mlvw0WTM1K+9Zhl/DbWVdjGqyX+7tjVS0HaZV7Y55d4PQKJ25dI0+8Z1DQqIw
         9JWRqjBtIWmuU0BHTjcUNQSL8r29lXDbKDRYmRjbAJhnja06N7gRe/OmkBLWDxNO9Gdp
         deFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763684; x=1789368484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp3Y74c4rqp4LQw7mbFodFzkhcskiP8CvJ8q4Odm34Y=;
        b=gOtl4NIw5q7g06CNVEoYwUU6yOAqohIqDZ4FfDIc+oWoihzUnnl2zYotRToZPztFtm
         CgsV5eFVlqINd4GdazmK74h5z4PW8suv1unYlUXMx5dg/vVcZ53GKXNG/qaGsBJH9Q/5
         m+xPnIuu7w/UA5hoCLkNKI13unp0idw+7s4rSMb6HmrJsGGAPtD5TF+xqQdSol9vtTyN
         xSASSGt8SVrUW4kOiLsxIU+pU5DpEB8Pk/s449T2DPJB2pYrZVrrCPDcSI5Bk1kLRFim
         IJy78aY9FkxOPd7oqvjXzdnySHxlOHBLnDyFvCzOPMZK9sMtnBU4SOCuA5N4bXtS+/wa
         OJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM3719wRW6PK2WlvoQljtpk294tY8vSiAYHuYVQnmA8p6ioawGj45j2Qqy0FeqK49BhIVtJBnN1R+ZrA==@lists.linux.dev
X-Gm-Message-State: AFuF++l7+OGmVAiT0JWg9J6Z6mmvu3CT/cn0bitHbVni3138KIA8efNn
	GCZCtsooY/guOFzCV9e4hpcTTE6KPkhKTZ/eLw8aDJ6ZMeOlCBVlDZh7
X-Gm-Gg: AYBFou3eAfE7SIpeBu+nsaU+EZl0sLhT6ZTXyP+UPEkn8egRDDXr4O+w5ZDp5LAC1UQ
	xc/OAmuCsZkR3Wo+XmyVqqc2x5h0X7mE7ce2CJuEeg413iEhgnNjb9w/S7RAhDepur4UL2TAk1s
	ZbsuvBwDObHcFbSWLcbu3B9xqrf4lIj/VwsHBDtN0Lz0Fg1w6hDgu5xKOdcEy70aOyJZoIgzVNQ
	+1nSRBrLzBOvvVm2UBmQq+2N0hmAp/DyVKPq9uuZ+uof3QfIA/C164zSCHYbWEEqQZM+fDYSVoH
	WEHNPq6jGo7cIvJIO3JADxtcPAY8R/tYFpsLRn7NIBf2uY+/1j3DDSOXH6ziQp+HUT8CFSiSgNn
	0lnWjvpd1x6PqoVipwJRlFpwnfQASNZjYILnOZCQDAekFFUV+LNbvuTe5Mj2TXP5WU8l/ed/oYv
	FfmAhf0mcPAN+k+1ORWTjTgX1J13qtbdtmMpRbi++XU2Ok3exRIJhXNVqR1GeI4IHlXc6ZDN9Bv
	eIb0IAZ2jV42MKnuLFFsMqS
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32259222a91.0.1788763684190;
        Sun, 06 Sep 2026 23:48:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:48:03 -0700 (PDT)
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
Subject: [PATCH 5/5] ACPI: NUMA: fix typo in log message
Date: Mon,  7 Sep 2026 12:17:25 +0530
Message-ID: <20260907064725.10686-6-hemanth.selam@gmail.com>
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

Correct the misspelling in a message the user sees, reported by
scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/acpi/numa/srat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 5c407dc6401e..f5616830f5a9 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -111,7 +111,7 @@ int __init fix_pxm_node_maps(int max_nid)
 			for (j = 0; j <= max_nid; j++) {
 				if ((emu_nid_to_phys[j] == i) &&
 				    WARN(node_to_pxm_map_copy[j] != PXM_INVAL,
-					 "Node %d is already binded to PXM %d\n",
+					 "Node %d is already bound to PXM %d\n",
 					 j, node_to_pxm_map_copy[j]))
 					return -1;
 				if (emu_nid_to_phys[j] == i) {
-- 
2.48.1

