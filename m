Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63B322C73
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854340; cv=none; b=NmWX+5/iYgQvjaubnrVuyIOG59oN6M3jQLBeksH/9jtYR51krpmZAmZSCAz0J6n84pknQile9Nd/8ntUHGHMuhAoBW4IH8x2s19EdUGKLcRLgKXTyMyK5JFGm5vZomWxSANWhlilNZ4w+FITa6cXJbXm/x5f9Frcf77gRJu/IC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854340; c=relaxed/simple;
	bh=EGGGAMPdoaoIYEzc8d+Nft+EyBoE2MoOmk6lJpb1nqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rR8owihwKY2LK0KXdHtqvSE82iah7rTw0a3eDtpFRO5KIIf44kuDWioExvv6GTdmthtLp1bsWZfm71KSj0PhxIXWuRu2tfMDSR5rYiHMfpK07ZCZuvTnmwMJ6E9Awd9DpXRNubaBXqN6DzvxxCEmVBnP5GRGwzp3Q7cn2IP4cdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ofom9ZEb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ofom9ZEb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e5d50b0dbso196268585a.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854335; x=1783459135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XGoZmURbYPyoE28BDme2QX7BFop+44e7z5jxOHqkV4=;
        b=Ofom9ZEbj+gcSF5Qnp7UhPJFFU3NPzszvPWT6fvTQ3om3tO2KuXTfZgVDlH6VsiwuZ
         uqWPN8EmEaYA4lYNJ7Df0JQCISLGq9zsAVcXelB9nK0q6tGRnPhnIsKrNzjFJ8d3xK/W
         W+ElQVnYHK53h58Cws31GLfjJytviCwo7t7OKZrjC51YRV1jOhkkY0Nj6QZIIhEOBb3G
         ml03TrGDkXfOT1T7nB7oqRZZYiNRVxhoIeuO3p4oyTJHu/CYwe89UfRZypY3TT01sVy0
         j/edTESwQalPLuDq1egzb/7x2wgjibYyXS+A7uCOygRoAdXHQGSnjo99gLeZ7CrMyp5q
         ZwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854335; x=1783459135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XGoZmURbYPyoE28BDme2QX7BFop+44e7z5jxOHqkV4=;
        b=rQHRaCCsstHwO4EZky5UNNcoTqLp4qGnaElLhTpSqkZe30q0BqmqZO5pQdEVt7wRsj
         QzGG9iOOmMr30iAvlcMG2LxrmlAR5sD+zthcY/My8pnupBXEOohMMoUZliBGkYldMw0p
         yZjkQ1UUFoBxmmCz5XbvfytJ6fBPE8dfre9vxMd5OFSBVX8fli/BswjxutimlCRKcIiY
         jpwZ2+6HQjz3p+6AkNc7oX+taW0yB40Sf7QNe/Q3QcuFC7HHBa1WsyIg7gbgdtMDS9nc
         1C5F6mBrFtUYzNs8bwME9zPGPoKou2COUCRrqa5zdXBqdeoZvOkijy+hbj4XFgJaGzSO
         fTFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ztyRWszOnvUyD0ewVLpvB2YFZr8QkzHbxkNFUleV3JLr2XGR/r6EwQvquXRUJvVpEW1/bjuvvgeJVaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrvZTCzKF66cfLI3KxLppuOLrmAMgDT2GdIypBHwVtb+bbVSqI
	gY85swYTGNGJX+sR4+1vjpO/fB4mpWBRVD460Bv3UMH7M6gmsvfXUkk57CwexEIuZGM=
X-Gm-Gg: AfdE7cl2vBWaaLg1MTAeU3UqNo4ig8Iuxaqyq51P5dm7RkoZlx0sA0bWfOixydjfgCu
	GbMhRL69zydK4UcSWALfdhwngmV13uXRs3szOOGRbcHJ3eaM56ICbUZt9wZFe6yKdpeSIkKX6cI
	YqVBEwhBdQ1UJdVLvz3Qypd6h47zFJ6xItvCBDbodJm2DEcOYBJ8ru7C5RJtnDUI/nKnvEPd6em
	rYlGeukozocnb6uUJEkaXVk1UHgYsDSv6PFduuleU/KYsVKHFN2DUQSs6kQKRH8fFdXY7QcgH7/
	TN3CMxMp44xTcDt5QwzVm2yemdFi+br+03c319cc3h7xCxS0TsKGRt8IefTIQCPNm20z62I3nuv
	wZpWmG3uohGCgqD7kI2f4br55YnDy9Y31SN/GXO0q88tu4PdEJxKCO+6Peqt+nu/pcl7LgrL56Z
	ENRBQem/VeHDKJj8QF94P9M0T0qcd9aWzE/E80gaYeBk8NfUenIOQjqoHzRI1aX6JPoRi7CwVob
	g==
X-Received: by 2002:a05:620a:4721:b0:915:79c8:ec92 with SMTP id af79cd13be357-92e627931e6mr816969285a.37.1782854335567;
        Tue, 30 Jun 2026 14:18:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:55 -0700 (PDT)
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
	apopple@nvidia.com
Subject: [PATCH v6 04/10] mm/memory_hotplug: export mhp_get_default_online_type
Date: Tue, 30 Jun 2026 17:18:36 -0400
Message-ID: <20260630211842.2252800-5-gourry@gourry.net>
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

Drivers which may pass hotplug policy down to DAX need MMOP_ symbols
and the mhp_get_default_online_type function for hotplug use cases.

Some drivers (cxl) co-mingle their hotplug and devdax use-cases into
the same driver code, and chose the dax_kmem path as the default driver
path - making it difficult to require hotplug as a predicate to building
the overall driver (it may break other non-hotplug use-cases).

Export mhp_get_default_online_type function to allow these drivers to
build when hotplug is disabled and still use the DAX use case.

In the built-out case we simply return MMOP_OFFLINE as it's
non-destructive.  The internal function can never return -1 either,
so we choose this to allow for defining the function with 'enum mmop'.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/memory_hotplug.h | 2 ++
 mm/memory_hotplug.c            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 5d4b628c4a1f..4d51fcb93a37 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -317,6 +317,8 @@ extern struct zone *zone_for_pfn_range(enum mmop online_type,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
+#else
+static inline enum mmop mhp_get_default_online_type(void) { return MMOP_OFFLINE; }
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6833208cc17c..494257054095 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -239,6 +239,7 @@ enum mmop mhp_get_default_online_type(void)
 
 	return mhp_default_online_type;
 }
+EXPORT_SYMBOL_GPL(mhp_get_default_online_type);
 
 void mhp_set_default_online_type(enum mmop online_type)
 {
-- 
2.53.0-Meta

