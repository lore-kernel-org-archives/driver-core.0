Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10431AAAA
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881951; cv=none; b=ga4NpJWcBf82dXP4hl/hz3qDQLnPNMQsgY4LTQOZcgUMZ/I6QX96XmhLOtt8t6s6VmazI/zoAlW5r7NMf6eKVKkkP9yTK31wRvZbmGUpsTPwhm7HQjzhOszf3Mzhmf0bWqwRz9Vb9TePd8GFnFgyFXyq6BAZiGGnBttoV6273sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881951; c=relaxed/simple;
	bh=cDXl9u4CuY/1+XKa+zRWdOwNjQ9DIY+bFbQam7r/xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdMTABZrV4YkzwIgv8Ou3wnT5DlxFmxnx+pg+EoCU3TI/5n5WKL0RGss5GPaI35J7txJwELPKiJOPfDoGDMHaDjB3bbAhwBn6WJgbQ2NzvCgxCZk5UdFq9BdXbHtt6DPQ4bJURzvRyYHyOq2D/PkxKd/H+/OH+plzXT7h6XVtSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfogPrwm; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfogPrwm"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso886229a91.2
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881946; x=1788486746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=EfogPrwmfWF0s86FLOaARrhVwENUjMVUJiZZ9TKhT/Uad+N3A4SyQFtSCzOnrb4cT2
         2rh1lvxplaB0PDrs/R7L0yOLqcQYZy2y6hWtWIc5mM6595OcHODVDYOtof23/DlFNzZ7
         Ge61C4PtoWLKvQyo9gplil61boYchKhSaZ+kg1Ky0dUwVeG99Q4RsreQUi1bj2A1gCyS
         InFYgc5nWJs+EnLFwjIkiLE0HfkhLViI52NltTGKnN335t/b+IhSnzecU/n3eONV3AXK
         3oF25N3dj5LtDtOLddHpgqgeRyROFTczTCqdlgrM7ssdXEIJRzWK+ri4RA0VSY6ZcJ44
         Rqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881946; x=1788486746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=Ick4c9lmgyj3FOtevWzvvnpXe8hg34mrZ45vVTmzHfFKg1dIB9dQNmK+AmkxnXP7ia
         OPiiPWqRLraDVOjNiblJd8fYqD2gVfI+IBpvUxxVSh0q8iE/+70xB/AD1QiNDtmIznZW
         wC3C18ZjBvVuO8Ei1h0G2TSq1XpYFwYyCeRfwovOhc9qTFb3TwLISJkg0eqo1DlFHWYB
         c4iLQ91Vm18WWcOzltrjdPyl6f6wZ9Gt0FhOAzJZotoBT7Einh2Tvzih6rNmq1+GiEym
         tewypxNRrp9YhjT4itplOr+S9Ai4p4ZKdhN/+MMhCqcSlCV9mpB+htx+cn74Q8j1DFoA
         bYow==
X-Forwarded-Encrypted: i=1; AHgh+Rqly5o5I4awa2KDiCp628YuwN7mO1S7rM01PNWIL7MUgyui4IvagGwHDGee8mN7HoSejfNVrFBPbjehtg==@lists.linux.dev
X-Gm-Message-State: AFuF++lX42z9Avx2ChA4O1oxii/EDsSxpVbEjlwbsmQTZO97kOKvsSzn
	G6rOIqBsF5n09n0aIdQhVqOPBB+eIgq+FZsjjK2rOtMEV8iJTSRvY92Q
X-Gm-Gg: AR+sD11PJ+8EFML0LGHxzcfVSN8vpgoGztqAkPRuJ8iY2rDSWOua66a2hZHjbLL2wAQ
	mpCM16RD4EUxjiFr3AGkGKbcKSfH7fzitQ1ok4S/+2IgtB6U5FgECXysiVJn6S+/+xfBbFk9nrd
	xpFY8MXzpVF5nJtRW98w/Hbfuo8q9dhVf2fcISxlHu5hVR20TPlJAvHFAKbfl3FFS7VL+18eYOQ
	3uTVHAJKgRytpbClK/+WkU2SJ0xsvS1Yi5JC3/ok4B5BRgmRAOezwhvgytoLkpEzPJIbDQd1l8T
	vIyjWX0rNnstrXouKK4DTpN1B71yhUy3beHZKFrYiCUAt+VUbALFDKoIOCzpLWHOhiImczyT7or
	A9+GAGbFinr2wA5scBNSabVwcLuR5R9qblZD8rCcQD/INneOpw91rk3HLvlBEZpbL3yvXUdglWW
	9rRBgGqLYdeumLjEIkwfstZrao1ZdZNav+B3UtXcGaJkNAy/TTP7e33Cmzhvn3thJqI+o=
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr7100016a91.1.1787881945898;
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 2/3] dma-mapping: rust: samples: add missing newline in rust_dma
Date: Fri, 28 Aug 2026 04:50:21 +0300
Message-ID: <20260828015148.221737-3-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dev_info!` call iterating over scatter-gather table entries in
`DmaSampleDriver::drop` is missing a trailing newline, causing the
printed message to not be properly line-terminated.

Add the missing `\n` to the format string.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index bd60034ded23..aa454e4841a7 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -125,7 +125,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.55.0

