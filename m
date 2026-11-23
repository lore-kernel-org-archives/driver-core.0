Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396018;
	b=TXzfBmpxueQQlqrjvmBRQoZy7R9Kwx6ghZ4ygIUID0I0Adwc6Vq2wvFIEgqMVg8AxlXR
	 2PVynpVsgbaEFmI79fSQw4F5qIQnPVyCa5dPoP360d0FkPVyRr6fAuxdqu2liGVrZjAyc
	 BXgiifYv0okc6Q3DJaU1MZY6GDNXQF4OvYKYTLKL29rInniiqZy33hGw6vK3KrRglBhCX
	 wqhsp0NSEofGEhK/zVrYG4Ejnot0AIBjs8vfDW/QVLxxSnjOWXLGq18cdIPe67M00Ypdr
	 2g57R2s9pggBxn3+gU6Cm8j1eZrYj5/e+AhFyr66fq2rBTUe+ooUwww0CCqXmyvgKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
	b=Co6UNmnKTtmcrVSwCVIqPUBAsifzG1vedp3mVOBSj6O8Ovd/ebiQSw37d6PMO/PEvb19
	 hGTR4cAxCirOzWagSAlUFMbkX9v0XP/3dN3k/MKxDdffhrnqFZhS295QNoQZAA3Pw9FqE
	 Tw5Azwo8zIO9oJxrS2Gzw6vASXFrGToS6RQnI0HBUKaXQ1Zv7Q9kgu4zk2g64DfwKYq4w
	 rTn0jq2FB5lSbuw52ErpK6+h+ubTySwm4/ZmEKwKXtyvNp+tlgGISWREopS3QpO+jAU3E
	 df11Ax/zfmg6GXUrnxWMK47O93SKC0+5GpmB8o+zZUFfVLfE6VhDo/0k1TaMitK0ing==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ThwpEhCl;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870B8606A31D
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 01:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ThwpEhCl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso17355891fa.0
        for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 17:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396016; x=1796000816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=ThwpEhClyJf/q6ccjeRVtsKJ6V1jwwpzThLDiCBW5O63qQ84tiaVMxx+6ATPMCmGN0
         FbJMkNXQuavbyO7LNJhWJUETp4JgELyL3aZK0Egn2I4Nfun6WHsd3ZoaDjw/oK1490EB
         OusEZjwqI7p8tOoaVDUe54OX5XpaxUql6y/LobtciqsI7o3MUdwE8gUK8mdG68rmse54
         sZcK6F0snbH2WbhHE158x0ATdC4jyigG8fqMicblRuE1bVRFxyapl7RMyR09jfp8pTf5
         6kHrjDZ2Bl8mrCasgy+5+o64STg26SoCgFkwLmnumwa9eBAmX/LOoET/X1sj2/ajVILl
         G2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396016; x=1796000816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=tittzYZ7BzB8HN1Ww2zVwy703znTUUH/h0I0xQS1+rwLNLnwVX08PsatC9IX8Vs3TS
         UAlD8yLPdXThHNKwlCXtap3zFwr/cg9/e0Aq8Ct6T4QFMHVSwUB3UylsU+iDjjzCqcIo
         7tCzUfpztz/+CC97MtuYwNpJ8ZDUv16m7uNsQ8K3P9Xf3BLCMcXvDBaEl58z2X2NpDmY
         tNzUqNX9eT/lPQCbS7JzRwsnJSHhOjc1k7tjPNi3S07a36X6AN3UJlm9+6y67JFDgA8H
         Lv+tqL8vdpVstkHOp3EHU4oj03XvDqisjblolVrPZ1j4LhvQ4Yq5KRGPpUka7ygDd5nj
         4c4w==
X-Forwarded-Encrypted: i=1; AL+hErG01OHU4Rd2STfbAVSd4dVmfL3UmRhY8WZ5QfPvMM1zjGUxIE22U/o4cKloamMCyqEIQU+dDJlaFWynYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8UacBjsBeFGGh0DdMWzp4zHKtz+NkeCcj+0eLpQMMXBrcxmJ+e
	Cm12VIsjwhCu5/EgPnVkJJVxwUVb4d3lx/y2IWAynmBvRbyaJsxrPLKo
X-Gm-Gg: AZFdTZdWtGsmtVWuHnndcA+9aKFtMAZ9pAkbpLzDPWmrprEm4IAYdXmu7cPTx7lMbH9
	KVhni3CZl/yAvc+4iCHp5Y/kn4gNOhD42TMx0lcuPaZzXRK9xcm4pidpg+6V4V+kRV3RPDsRVzr
	KJeZdhf7rLxaniCgHbyLeVUEzIb7S1MCpP8E24BGVA+c/RdIxAN6B3L7vWfK04nEfdvnksl1xeo
	w6zZRyQiqDf2XbCzpUt1QUglObclG4TMD4Dri2BHS5RhtHT6OrISqNkjCPT/GLHOaKWp/aElAbL
	KA0w3z59/GLi716M8+wEY4/6uLFWY7CV9CXHBulWxJ/Tu6+psljNjdJ+HalthZWlg2VJ4xhly0+
	Dq9gPGnXKQIU3Qyh6o9/aCVy8ytIFO1T8ExiUqEFlF/wITBI0hh47JUwU/flskG+Khwxfi9AeJQ
	3wLfXOwZ6/06eHeVYJMRD6dq3Gv7OOOIn3SNnDhwDdh+c/f9zivMpfmsFxI6WyF7/goJMm38bbg
	VCQfYqBD0Y7NtPZyZIl1kgMzm+noBseiD050aCEXb6F2kfjoj9zMY053ru/w9TEQ26ITwlKkGrL
	PfIkrvbbZMoXQZXOzAQZNESO3ApEYnXG
X-Received: by 2002:a05:651c:a144:b0:3a9:a1ed:634a with SMTP id 38308e7fff4ca-3ae7fa3d16emr24469201fa.21.1795396015482;
        Sun, 22 Nov 2026 17:06:55 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm29257771fa.40.2026.11.22.17.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:06:53 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH] samples: rust_dma: add missing newline in dev_info! call
Date: Mon, 23 Nov 2026 03:04:30 +0200
Message-ID: <20261123010430.365536-1-saref012@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_info! call in the probe function lacks a trailing newline in
its format string, which makes the message run together with the next
line in the kernel log. Add the missing newline.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

