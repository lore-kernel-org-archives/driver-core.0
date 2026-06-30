Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE6322C73
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854336; cv=none; b=Xw7HqoWMClRniJx1NySy3/MW6NhNNukX4kb6unkBKJivYNlxGq/7E06dYhxJX+CgtnUfBehi1C3m5m2X3qrFEwfiqrsT37IfGedvfaWW6IsolpbsIWGr+GMLGX/PAowtYlz2BPgwXL3Rx3yypEkPFnItRY56+V8eh1+TpvWdwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854336; c=relaxed/simple;
	bh=X6kC2z4Xyj+V+APtGHSXJjIu5DjDPN1Hl4dMPopeuUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1vpsp5x1lKFdsBL8B3EM4r5WbT/EnEUkwRbanzojRzIBHDVaGFUxtAsiZgHDd8ZmrCj/4cAYmB5LvBXd84xFKGGEHKLmH5sY1BGsRUKz2NeIb8SRcfutxcCEKFtCR1Jid3jEnD3cI7/QVLMKEE5vDwFUuwt9hLrU/USWZ38z+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GR35Hz0B; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GR35Hz0B"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e53581361so220451285a.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854334; x=1783459134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKwO5GGulWgyuo4GgOfyW93Razp13/peNYJDujzNXk0=;
        b=GR35Hz0BQdnv28Osf5ueMpZ/UsPjK+vI3s+mbtRabNjpX7oylo/U6fwXtxXTRdMMq2
         Dnu5R03Fy+YMWZJwc7R3Lm6O1MDPgDAzemyNZZMLXyjUt8ftEZdwoEnqdHumePGBeFws
         +CCKMzzkMi6oWvXAPID71HwzKxUB2Dwk40sPyGy8no9LxBTkvMprq2eynE61UhQhM9NG
         HCtN1/ma+UvpcagLlcq+leG9V9u623c3ABHpiTZkPwZyeuaPf0WspkYWbyVsSICn8Dkn
         gUsGYXbCJqAPYnRWschMk5YR7Pxe+MoVeE7vF/zSdu5JekD3DB98v5b1ska2cNa/5w4v
         EOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854334; x=1783459134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKwO5GGulWgyuo4GgOfyW93Razp13/peNYJDujzNXk0=;
        b=QLaLBgpgOXRahF1TUFx4+Qkeioo836FoPTWrbN3Audt/7gGvMHBNkluCmYH69ohtEE
         UadWgh1fmcksOrqSbuvvpLHXKPByA9rUNWPw8x3NbgkJUktXIWSmA/sYNFaG1PzRbaA/
         Igs4wy4DeOA4AQHSv0DVe0pOgDMOXY8Aw3qtESWbOh7EU+G72uvawVm/tJbDMD/uwQ2P
         p1BZZToTWtk1BnMa3vAkj2sxti/aHYPepD2JP+P2fFmICXIN1kQjPnB8LY6cJ+R6xx2v
         TZe4qwHCdKTUO+To54Li2X0G0r8iq1Oj4Uy0AOmXu3qOf4eQvJ/+kbXHBWbe+y0CxyQY
         K+ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/7ctMuPDypbJkPtlU/UusXvCkIMwU27ZbbL/+JVjmKsZck4K2JBBsJCqgEN9nQoGnPoOfd29Hd+FSAxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz19UioeOKvit+lNO5akt32yf6fz32kcSppWV3d6Y6VxfMnpzME
	EwEZLbo3VVQfnY49oB044FTRjPy4E8/CfLl28+q28hsL+bAhA+U0s/cAY1bLcbyxxTg=
X-Gm-Gg: AfdE7clSXHnLY4tDYgNdVLWMClEl+mPXiULETOBCuYFhTGlI5Wmf9VNZyBcDysKM1cX
	wqhNTSmAtcxTCI9oRLwuJob41CD8nKlY1z7hMTdQrFqoLvjX9R5XAya9CvFEFM0V/Afjvyv8BlP
	2y8p5rg+9T0khlbeCrkFVpxwjmI52RHBDXFZy0CpekdtroD2G0+Da/hJiA8JKfulLi41xHrwlmz
	hdovvz8qWZK+PNopDxlPVTyf+m3xpAE5bfKjqvvNLCn39/XauvKx8egBhzs5RjkTF2lZlyAIa3v
	LPKNpOV2RgNg1AYwHP8xssr43ihPXigjo1lRnYcfGtqiWgFcV2MrceD/hIUHpbM+vxfvA0I13wc
	+dTq2h7QepukIz1WNf2lgQDHWVFrTKvrEm81vmqtGdEDFIhe+0o2jJDyq5aOE8csJkXsPWekyJF
	zoyXMYDB1Ln5RMHKW1znIuPV5SQdI8ETLIzv1t7Wxehkw84X+moysFtpP8ia2RFw8Gq0dYCFL3U
	w==
X-Received: by 2002:a05:620a:8018:b0:915:8f76:8005 with SMTP id af79cd13be357-92e6d8bc859mr391991585a.47.1782854333767;
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v6 03/10] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Tue, 30 Jun 2026 17:18:35 -0400
Message-ID: <20260630211842.2252800-4-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify online_memory_block() to accept the online type through its arg
parameter rather than calling mhp_get_default_online_type() internally.

This prepares for allowing callers to specify explicit online types.

Update the caller in add_memory_resource() to pass the default online
type via a local variable.

No functional change.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7ac19fab2263..6833208cc17c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1337,7 +1337,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	enum mmop *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1494,6 +1496,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1582,7 +1585,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	/* online pages if requested */
 	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
 
 	return ret;
 error:
-- 
2.53.0-Meta

