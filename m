Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37BB340A51
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871127; cv=none; b=XodMvFk7kZixJPKXZB7rOowz7nO5tLYC8lrNu1vnbl4Juv8Noq5QRbZamaN1WzhRSaMVfSjwxaml37X+STOUPyKKoXe8G6WifwIIAIZlHndUptjWLLdUY6ojU9X/0S5ZteLc9isH44Mt1quiBvd/BNHXlvhdFj62RBnsZkVOGio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871127; c=relaxed/simple;
	bh=PA4Bqt4ZM/5eU9t/Xv2IagzZnnLp2iO/pQZpXfi9d2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1XAdiJ+p/fXb8o2teHJD3LBGdXgcy5VCFvjiPJHeF0CF6MvtGaLGRbOgc4hOykgN9BLjfa22rqXU6NywoiXEM3G49gxY1q9dzgtx1AMMcBStUv9KgnkIyUpg/UCD8FqQPDP8Ih0l5NwexwRfFB5ieXEeaAg/t2XUYI9SnbIJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Nl3hvZlF; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Nl3hvZlF"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e7632b193so162134985a.2
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871121; x=1784475921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpaKnc1e95Tg7VSs2UGrLw6c/qizit0d3ArQLheYoTo=;
        b=Nl3hvZlFIAK7zFjufg9IY8vMHRfOIKaQnMADQeJNUNu3EN21Nqpz0t5KHVLhwSWN3L
         7RcvhPV1QuzkHccEZh1X+lkud2OAQJTDy/X8qg6b2Yyka5DixI8U3xrCN8SiApabg12y
         gOnPw3q2aWDIKi96TuQRgqNeyUrYZ0EtCKNtVKpCiZ6v8G9Hok13M++y4kXQUZR73kRM
         E8T+ilGTMma/99mn/kMHAM45dgK4VeEAoieSugn5hYHL7ADTc+TTCZz9Nk/lxH0XZywB
         YZmBcj4pSAQEp5fJQtLX+rHPMdcMaK0nQZWuKPWykmBdIS7lp8rLhx+BBQCQ9s5MZx1V
         e3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871121; x=1784475921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpaKnc1e95Tg7VSs2UGrLw6c/qizit0d3ArQLheYoTo=;
        b=DrxMSNRRHjM2CffB5BkR+nEXauxoGfWBo8ti9hA3Axhn3p4YNPvDby5t+l34Kg7HWe
         9KXFEv5WKCdqPuutYkSE5nPMoMwGXU3gKLsVIjT1sSUEHeilzJb2jWsIBR5mzCdPSRPL
         bqZyZJihoTLmGtftsGU2yKgaUSsoZaz7UNtjA4Wih7h2QCHcgFSoezE3xViI9pnm5a4W
         VMdcM+1mRGbajtjRo3mJJYV1my0MmJAreteX5ky3xPacagcAGncD45itAoKoxB0Ihl/E
         DjBqZ6OKu9GECY/BL2hCGUZYzg+RaLCnQ1mo9T3QN576CRqwZ/IrtXN9mN4NKziKMFlW
         juEw==
X-Forwarded-Encrypted: i=1; AHgh+RqgPxOexE/UNzQ0+R+i4JecG7JmLUuOlbG44/fVStCu1+1DT8LyTLEdCTk6Z6hRP5LYTwTU762JPS1C2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY99VMwS2DFdo0KSIBw03JVWVB59zCduni4+2dxHpFF7VExIiC
	vYnZ6g+5w1sJkfJP9xX/JjiRsfG1cacpNrHezZxAEDiXteJvB8LevqcNliZt7BxmXdE=
X-Gm-Gg: AfdE7ckQHlBMkiAmD5+fE7cCj9bgNe8vUIv4kgEamGctR8gRTFNk+U3G1f3UBt2RAxh
	65eYlEOrpexJ9afK3UXp5L+lKGImPqOUFJN0QPH+hhh08HlAag8qoioVR6isCihfsLhdF9OrUG0
	iudzeNVWcoF+Am/o9X18oZr1xVGCZxWs5rmBg5degWtiOn2rw68jYgWRLjvLfAP4hmD6TxwNpZe
	C+9ZjNJll9bZdpxWS2KZv5wfQ6S2eI4wQqzmlFZGSJCWOI9l68rhShXEYtY4gF8psU4ZhOih3gj
	I/RrkrF0pD5+Kc99yo71t65QOdmQlr1Czx65mFqUpJEFexLIoS1/2yCMWJqPb+gF+Q6PhZ7lU2J
	/kg1QSKTgNde2enwlq601kkeseTTmWRMNK+0H0iKdpnR6zX/7/2XIU8Q3nm02nCD3Nq50vVoBRd
	6CzfJ1I5O5mrA0ZmjbItfhEY+pVd9BLBeEarptp7F+GxAMcUgHw9SNIa95tlUyqOqW6yIsWp4vn
	A==
X-Received: by 2002:a05:620a:2913:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-92ef2b35bfemr677144185a.12.1783871120928;
        Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
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
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v7 03/10] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Sun, 12 Jul 2026 11:44:57 -0400
Message-ID: <20260712154505.3564379-4-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
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
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8b137328dcf01..e625529baf996 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1338,7 +1338,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	enum mmop *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1495,6 +1497,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1583,7 +1586,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	/* online pages if requested */
 	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
 
 	return ret;
 error:
-- 
2.53.0-Meta

