Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB8348C74
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 04:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052089; cv=none; b=ipnA87FOLnjYxHzjquWRbEwr+uyq+CYFc2N9oqhDHQThPx0RD5IiilKq70Razld8MWIbA4Nb0iFKDCz8ZASViS4ck3mTjAupTDddCRxvFpZud9ruWUuWK4cjAokA48UdzqoKYhGe39INmeayuF94g7DOxc+sNd8RBa42sERWSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052089; c=relaxed/simple;
	bh=OGdpHTKx0u1e3uGMTEuTJ4+GIEkDhcqp0F1fl6L/HKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Byt2W+57UdVK+VEtdY7jPHBKLIVNTwBhtmKfXjiqeG//6exo1gW5n7b4kuSZPHNIuEXLMDV4VBn1BKAKloqe/ckPrqNYLoNRtoZYiCi+m2BmBoJqQStSD5A5HJLda0snD9bD5w2EkJPs8uwY6ceqvetFIITB8MJHBcbD9NfOzLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAV74UDi; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAV74UDi"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845eb7b96feso125499b3a.0
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 21:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783052077; x=1783656877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkw49/Ci1tH2YETEaxaeFCz8QbSFkKdO+S6ON/GBGTM=;
        b=CAV74UDiTrE4QYEVDnLltiydTp8btGOYgAFQUC3QGBy4+gPUa2DR7izAhJ1sHqCnyF
         OwikYCEsqfxI9lahGf9NDaicMtPaMTGm3Gc2XPT7Z8Htic+YD2MQSXACsLNa6N+lBS1n
         pSHglzD9KFx8tQcoCM1BI+3wUuOmXIQc86FxJv8Zhdr/whrGZnA51zGrYiTDMoGRLyB2
         w+KTiy+5j9c7/c1CUBMQFwKpuT96nj80/sZvp6dIOeqKfpHMpgakjZF3eWmU27jkaisG
         jQZ8uFLiP7wCuk5Y9C534Vyfey86h7PjC8Jtojj+/rKAPvCJILc3q9+JwV+xHHY68DWR
         ICFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783052077; x=1783656877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkw49/Ci1tH2YETEaxaeFCz8QbSFkKdO+S6ON/GBGTM=;
        b=L0Scyt8qDTPcs953JpmzM6Vuy/a+7kSK6GnrX4467sjss4/QZ3C3RIwruXtHkcCQEP
         N2GK8P28dMY8G376O1VhLtvrKdUTZjCdWw8k77/7Z4co4SJgVvoHyC/dY3VygUXeC4Kg
         6UfzZ2a0gzZL6rxyQi51v1HS55oVIkCLUIwZlPQkW+5QYAN+m7ZHVyijbwZdSkzYW6kO
         iibXRT3Me76kRrH+clrVCb4XswcgW0XWyX0aBarYDXkdcQtUq9UYs65FkDHzJ0Iv5qXi
         4VnbftMMovTTv0Hpyvmy+fgFuR29tdR/id1VCipgRMcSEcuSxpRbXyUydApmegH+AeMf
         ll3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+GVimR5EmBSuUj8A9e0InagVnnRubh83MKvLlgAb3uhPq6VnfX7yhXylX+qiwtCETznfWXO4DD98OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV+K561BGarJJUxdNn0BMsZt7K0ByVJ0a4tGm9drVEgLUquUx3
	H9apAXTsSOx/vzjEl/ueGQ6I2xTVtJMZNuj2wNNBMk2uzF/EQYH1z22e
X-Gm-Gg: AfdE7cm8RpKbQgBi8TKLlLJJJtAe3a6GTPFibxaVruU592/GGOCB7Mi7ynL5nlr/5n6
	+OWsRzwUI9Z5q4w3awACF1PHGZ1d9zUvJdKl3TatW3uXpu03ZuyEKUF/hSO05Wi+ngF5fwr4zsQ
	uDxe+cY+Qon/sl+6TUIkyUhoCAL9QF+HBvV/SYMotvwng5e3gXjhgcDdxP4wmHnNT8jlaJzdUiM
	Sc6UxikFW65ofgyYCZ0g1dmZn1qu7zdnaRvBHUCcAPBPEMpB/ONKzgfW7ULtgaSEx+paI0qiDMP
	QLr/WcNMM/mOVR9xhHb5W+Y3p2IPKan2ITtx+L9c4+RUVhI5Cm72IzGUFNuNPV9yWLBSJSdEMsu
	UpxxkrkxxbZIyCzGzDFBFavEcjGCpzgmJiXD9XfjNvFvt7BvTAPvWMvuV9JIqhOJSQq+rUBTGTs
	x3TO5TNXo=
X-Received: by 2002:a05:6a00:aa0a:b0:847:8971:87de with SMTP id d2e1a72fcca58-847c09885f4mr9521873b3a.28.1783052076920;
        Thu, 02 Jul 2026 21:14:36 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94bd7esm2207768b3a.38.2026.07.02.21.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 21:14:36 -0700 (PDT)
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
Subject: [PATCH v2 8/9] arch_numa: remove redundant node_possible_map assignment
Date: Fri,  3 Jul 2026 13:13:28 +0900
Message-ID: <20260703041329.2797584-9-ekffu200098@gmail.com>
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

numa_register_meminfo() sets node_possible_map to numa_nodes_parsed.  The
later assignment in numa_register_nodes() is therefore redundant, so remove
it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/base/arch_numa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index c7f63c4cf367..6476227b772c 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -221,9 +221,6 @@ static int __init numa_register_nodes(void)
 		node_set_online(nid);
 	}
 
-	/* Setup online nodes to actual nodes*/
-	node_possible_map = numa_nodes_parsed;
-
 	return 0;
 }
 
-- 
2.43.0

