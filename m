Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B93264E4
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871127; cv=none; b=tgeBDXc1lS/u9g+6v/SRWQprJn3BYw9uqgW2vKgRQoTPyCdiOZn7adEPB+z+himbvBmvVT09f3DRXjmzqxMXNvVhM8BPB5flFAlsvwlJmYgH0MB+a0K4KwnTUB45JaXvj/SOm/kia2hOgaVnUfrmG1gmCiSQbZI9Uxf3PeLV5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871127; c=relaxed/simple;
	bh=uhoFb1AdQ1YY63K+zjDeKis0/pyRtDsZVbRXxtXWIEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIl6n0b4e6gqSGIai+Gnap0KUnp17LBKaJiUOF9yvXLB3jsOXqywrqehDvDgrN0XDxTWww+5LIJCFkth39LcCl93Yv66Ah6AuA60Y1HqpMG1c8LWMHKGWliXexLEBBVgLLxEXRsYcj+H/1qst6R046vx9iz62+k4RWK5zm3KKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HGl1MTrq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HGl1MTrq"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e55b62640so125994385a.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871123; x=1784475923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjJw3wlBuqXvLpxi0GmvsmDJYE5o3ZwGQsOl9zW5rZ8=;
        b=HGl1MTrqcT63HSYzXPoppdJ7VkFczmfjAB8yIkyvgbLLQPr16GLlDBYYDlMuVkf6Y5
         Y0hOgWkHLOyMj9IPNAPfcGEYpcx20L87F1ILgJ5y9D4qYSPI8wVdjFbQ5asMP9OiGuuG
         ohPTx/RDeLZaaGhifvp59oQ4nJ2wolTuSazyZ1pvLwcNcWlh/WPRkSrmuySX/uXHeVum
         HEZnfbLI8vlLq3QdQAgTh4oHP3CPXk+TV/VLLxOPY/2ZAb4rGoJ1rWIOPKirlDofXECG
         42yTqb7w3JVxAbNHGvw85xKDJYhkkEy5shZMJOE8KMjJRQjdrarXSnPZ1xM/8I94P9Iw
         iRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871123; x=1784475923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjJw3wlBuqXvLpxi0GmvsmDJYE5o3ZwGQsOl9zW5rZ8=;
        b=kzeyxRQi+FtZaqHQRjCfzm0c5AFps27No7ZIj7lSPvx1wqeE3WrNC80VfgrNLQymEV
         AVhBo4DZ4BkdmtxMLTbGacOZ1VZbfo+tG718UhFqsXxLafbYEBs7RsotjxsH/+P+ECys
         1cGwOfdLSOCVWgmX9+fpW+s3RMT4gV5SsAyNotYg3hdydbQ0aBqn1/UlL4Ui2cA2Y9Qe
         FypNCB4p7hTEDUOl/QFnVGFSHF73FWwYAOBekTkYE6MRIDNngPx4ohkqDKo/V//BxIMJ
         FMXDakKqDHMw3I0K0orAmLMkUJ51mNIiI+dRdkafg9aEGM66eaZqLj1ucM5jBHpSIcEc
         ahNw==
X-Forwarded-Encrypted: i=1; AHgh+RoGix91DUcpAh1g+NK0E7zOTonNewYRlPPieah8IODYqUe/nnAqceVJT8g/1olnG5JHd/vJhVeIEknYIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgYzPzYR7HAZ1OUlUqAgRlYxHRDx8mLBTGqDt/WkKNd4LY0ZlM
	N+9qY550T7PgdoVmIrddQkpCjj0t4/H1h3LZz3aVjqPyivHW9fZ42zKuerrA9oEuF6Q=
X-Gm-Gg: AfdE7clNYZyTR6fJrXKvOE+XioHkIKtZY/lEpCprLIbLyqb83MBaG89Nx6CObt+mu/t
	8CUK6/TBvhtVnLD1pYAp3TgttQJ+tjItdkYtXs8IGDN4alSc5KBoYVuu3ikz5R1dxsqqL3uLTVg
	1y64mgmrT8xdl/n4q49cep/bfy4wtOo1SaB2qxpr7iRvfZPM1XjspV3nsjsKRCGvjyjmxL8Q8gD
	VSNhs4WkTYCZ+y2NqkKH53w13pkSzGP0mM3jrTtgj8OT/R1HuZuN/3nAFSvIEgv++peSIZS8oBE
	w3sE+26Ezg5hOJtlDXxR7c2a+QeaY3jde61jzgAkoPSp443gV6DviDUYAdBQkcdMapoowdjD3yf
	IYbmUboPgKm4SueGi1BOf0Y2wxLze+n+vWC5U1yp3TlaNhAQJH1cO7nzbhApYyO0W0p/VI/PLsx
	bqm95BEBuqy6O38wdkFu6yLTux8mjxY88O5lhqpZbeYlt6b60sJw/nVT1E0ugBmYMiK4HDAUaV/
	g==
X-Received: by 2002:a05:620a:4711:b0:92e:5610:e479 with SMTP id af79cd13be357-92ef2bfd741mr601996885a.52.1783871122600;
        Sun, 12 Jul 2026 08:45:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:22 -0700 (PDT)
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
	gourry@gourry.net
Subject: [PATCH v7 04/10] mm/memory_hotplug: export mhp_get_default_online_type
Date: Sun, 12 Jul 2026 11:44:58 -0400
Message-ID: <20260712154505.3564379-5-gourry@gourry.net>
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

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/memory_hotplug.h | 2 ++
 mm/memory_hotplug.c            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 8f6da2656f4e2..f19893f5fa948 100644
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
index e625529baf996..be8e8e2cd1535 100644
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

