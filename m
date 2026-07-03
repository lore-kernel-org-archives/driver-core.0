Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931AA3254B8
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 04:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052074; cv=none; b=Dt6NCvP4/Q+pf5LRAL++u4R3IaN4blTe4f/jcwDRYgL4WcKXRykdEgxCJ38trZ7Kg40RHS8/BcR4qRoUQ6z1UfQ4x73c3WPdyskvQKZxC+g4gxP/nhOWCxO0uOOmwFzXm8m3+mBHhYLZt7i87yWZ9UFcjYyIrHhdH0qJRYzzkE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052074; c=relaxed/simple;
	bh=VB9PVru6+pllVrdLYYl6MVGNnxBDGHIjtQ+tYYoYbe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTznVyFPc5uUV++t5rs/bGTbC0WYsaAzk2hPTncCYCwGU7bFpWjcOgz6cJb0ojTJkhSZF6JEy8l8M5zhDwgnqgOx3ykfT37Hm+5ZbhR5Al9xFGMDiHg9MwyBkUziw7dVm4qfay0ZwZ8VxdarB5f/k08zFZtj60qhiX49UnCaGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG15LyH0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG15LyH0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a69ba83dso94949b3a.2
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 21:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783052061; x=1783656861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EZL1NKnTgoPS6ISbktoUEUb6WMEmWM4FtznnYOJW0U=;
        b=cG15LyH0hXRTC6UkRBe5FQln7Cz65ZDVQfgSuvos7WyJhVlpfJAo8YorUR5EHh2ihm
         6zTWgmux6a0+1YEG+70Cf545GCbY2R6msQT4KoXM/jcbndlOteXkwPpYvhkTSULW06ne
         Pm4S2QsNDe5woc/G4/ErhB5ltaYODiAEZFExjQOua6jmyAxjOzgTlDA5pcc67sZrf4wB
         yfTdcFxMrZgnrl6PvFtzNpKf1kQsLJXvLiumfKuMODKDYzT42K+VpirGsUM/OUjYRQ+Y
         KlxVxsqhtTlfjLAp2sxEzYug3ne5P2pyPmQVX/+BVNNeSWgliKWNDCo8nf8h/St+gD6R
         K4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783052061; x=1783656861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6EZL1NKnTgoPS6ISbktoUEUb6WMEmWM4FtznnYOJW0U=;
        b=rxG9ckDmv/ngQ2Bv7i0bD+ssp5vVH7iPyytAg70fGrTn7UGPyNJVIWSbrC4RdqylPh
         LP2L0b9EhNTS81IHfZwPA/QG2kmpQ00xE1e84Yl5WJmifSiVeSXhHHb/HDm5J+Au0oFi
         vsPacuUF023TXHogAnG74kWZliigweM3NkN1tSr5eM3Niv1GGmEQKXRYkGL7XOSbdZMr
         8U1ZCJEWxyxU2rUCT+9fYXz2GqpfpNQ1Z8m+MBAC0tUi/LZCXwDv2NcjJGhuHy17fjbI
         f9lgDJ9kAuFJerJQMwILa5om1llLvDC0xMkWH/t1dtLtlauNGjzn7laFsb2VUnZLDnKS
         2Sug==
X-Forwarded-Encrypted: i=1; AHgh+Rr0SlW2U7e8qDc+YKu+e9gfmTk65dsIydJ7OuzfZkcx8T4ERcAqoA+Fx1cBvyWELm/asnlb3dDJ8djJ5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJHxIIYXq634TwO8S4T1zoe8RxTlYINsslfaKVVQ3klguXFBuH
	Vnss7tGT7YK6haOiyJFkxEBK7cN/zy6ak/mWTn04ocaTWLfOcAx3Ltk1
X-Gm-Gg: AfdE7cnwHgRkau3I0jiisGp6cUEOkSkiNRi38js2V93nfix2rTv9mKrIOhGrFQ5zmto
	QB2DpjQsMDKXcqfd+8Ow2VGbbYnLqnJ8xfWwnJ2Fr4TqQqLEM+WThuupY3Oiu5+SKXvYM4voo4D
	6B6ujh/rtuA5j4zDWwG44Ff5mHovU5BwsO0DqVu/lZZMOKxQsu8kx03lS1lp7BHJhn9IIG3o3y5
	G6EmD3p2I3DURyRRLWFc+yveb7zjK1v448y60DhHa4a9ZXqsrSM7hlOBGQloC2527ik0ErmrldI
	9WemH88gxtjTzDd1JbDnVSUgdP+0WPykxqulWraGC0FgkBRK9BPxff64hk5f0R7dXR6l157FudO
	WeOyGENFUA73rbbcEO8EnROOOws1mXwMYMpA4NnpX0wA0xThAvdHysGHIad96ZQspqISPfNqMhB
	XQQgcdtZI=
X-Received: by 2002:a05:6a00:1302:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-847c085b20emr8662798b3a.37.1783052061259;
        Thu, 02 Jul 2026 21:14:21 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94bd7esm2207768b3a.38.2026.07.02.21.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 21:14:20 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	driver-core@lists.linux.dev,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 5/9] arch_numa: remove redundant numa_nodes_parsed node_set()
Date: Fri,  3 Jul 2026 13:13:25 +0900
Message-ID: <20260703041329.2797584-6-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703041329.2797584-1-ekffu200098@gmail.com>
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant.  Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/base/arch_numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 442ea239bba7..c7f63c4cf367 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -279,7 +279,6 @@ static int __init dummy_numa_init(void)
 		pr_err("NUMA init failed\n");
 		return ret;
 	}
-	node_set(0, numa_nodes_parsed);
 
 	numa_off = true;
 	return 0;
-- 
2.43.0

