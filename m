Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500773;
	b=jSGKeb2tXCcgCFpNakK1bfGENHtsnPuOZZTSE1PLtrj4EJ9u/q++UTCWD7ogzgQTGKj9
	 FK0DGpSkLuHGM63mbTeFt7Om7NcgRmV0lmnhZSKnsBZRyrThPUQcPz5RuRCEv70nUcqKk
	 uqRm16/hNyTPb9oMaPv//T8GVDy4IzPgwMq36WlDSfVbANVfQ66orUzxLk3hJGQsM3axV
	 qXOhQVxesp5GgwoRLzhinW/q//1IRHuR0lBO3O4QnbdK16YXq7fpjdYYNAB9Fm63xeM8s
	 zid7V9nSQUyVqiBthuj8Tn+e3BHbSEKU3iUwqkOyPo3CSpL6R7MGJjqmZOzzY2s8wCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
	b=ucx2nVbZCn1xmCH1LgcayVYak+L9QaU2nPEDUz9I/a0pjzC+cFHxZzl8UXmskXdP0uH+
	 n2nIHva1vFCm/hbBLtbWzdNCIJ5buYz3Q1LG/+N+QhaIxyDmmHYNbY7oWkxo5IkK/YbqZ
	 /YdQhtL/4rOQzuCmiY4GBGgUqnjc5poFJyByCe/X5AjIW/lJ2QsVxJPcKfNKTYVNVxb8K
	 bj4dJlr4v8Dq48Gt/uMe+a4dJsty8zsPj0bWxClbrGKQ2LV0zcMVzgKZJYwioTEW9hNCI
	 i2C4wvv+53hgBCz8jeoZef+yLqF3a87FznCwAww0bz8AemQFG7Qy6FHoUq0UDHC3BoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lP9TIPES;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07960A380C
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB07960A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lP9TIPES
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1bfd5516bso32719605e9.3
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500771; x=1793105571; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
        b=lP9TIPESqTqswTxd6j8QMt78fpVihkBKHw4f0icqFKn9yJGn5z+kl8u8+qy1AxNr37
         wDG0wHA/lNfGqdB33wCu2LWjMtNBmz1gtHGqaEsb1mD83FN1WW/jD4BD3Lrovs5kHAzf
         ovF8J1quLPaQfDTUZPzbfK8mysDA+i5sdNRAa9/gLdDywr+XTlgSemwgPEETtft78j9s
         1G1hmFOC0hP42Rhhf86uodeO459H5pe2C56rW9o3PxRI4vjdxkKpmbC6i08yYGPxSSPi
         nTQKYxykp8jkyB/jE0hGJkvYo7rypveYBqQ4HE8lfC2Z4KhnFiR9IRLkCP2vQmgJXp3D
         Weow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500771; x=1793105571;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
        b=V0rU1ir6S5EoRnUXFeBk9WLtuuxePURLCtxXQBsTEf7NWx0A651dFvKWN4+TwXQghN
         RKsjwUOKepBjf5bXlelYGe+gppnb1700xI4fZ42ZwZLsON35P/JuQq8dpQJOJeJH0nKk
         DfqkxeCWLT48A1P9JAr1Tc02gmfM/Lg42RPLFVv6XiRA4xeYCt8xT912ub6FHJlVPVx0
         9PYRmr5cye/IJCfkgvu+KRqMfgK75HHNVDmSYmSWmkJaKe+Ysslczr1d5TRj4AEiQeTs
         M9hRaPVPZFF1wgdnOr0JPgCJ2VqSkEsM65v2WLKPQLuHqjkIHNVONRrhG4wH/0vjtll4
         hw1g==
X-Forwarded-Encrypted: i=1; AKwUvBzC56O2dhdFG/I9/5c0leaQYf2N26L9QHmLbg0mCiKWBjCRqfRgzKILI1jm9PTjxeSIlZ8geAlb5+kNFg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJKTQiom0lWSpm5jwoHFtS3tF3m7qL3k1RLE6s6U8oL5hZxhG95
	yTSPFDhRia5h5y4JAR38FmANZf3oskhdLb+w1nU2UmbQMp8qfCLGbdeXfIUAksnFDctMKMBCcPJ
	OBAr9UkBxyu7LKTrtSA==
X-Received: from wmlv13.prod.google.com ([2002:a05:600c:214d:b0:4a1:a7f8:c12f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0d:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1d7616d29mr163631395e9.23.1792500770907;
 Tue, 20 Oct 2026 05:52:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:37 +0000
In-Reply-To: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+2KIbEqzmsSq/JGpQBqQvZnGnBnxGKE4SJJi8ZVY+Xs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QelatQ3caDHbS0K4QGnYDE9Nc2uBZdDomqt
 roIk+4hoguJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkHgAKCRAEWL7uWMY5
 RoKlEACXlBOu3IJ/2tsGAz1dHIIlvzSMMP9+MkkR10WjkRRFijN0vISz3eCvPWM1dQHzjMAEGxI
 xy7Bk4xWeIj/33Slc4834112a7P7vRixj6Uy/62b2TSQOwFZI1rEQ6WYLJtPiPLszjzX3ORjWez
 D+yo8yHem3SbKVbmE4TdqrTWLlKD/bsfcop04FHJYufdZB6nheBL19vrNxkNddXN2nnRnejut7n
 Le4x+35NTzjchlsxZ1BAjesOQ2QqNsaJu+WW6z2Vz+l2w8oGC1+2A67yd50AxZMDcLgJF70xH/Z
 +sG4x/zsb5fXLa+2NB9LcbicrliEADKEz5PXIb8pQxbSBElf7yvubptNGNNMg40UWcuNd15ufpY
 LYWLSGZdV3VcjNK87vvgfTNkjfOOy5g1KyIUC2kehGXqzoxToYen9inhzl935ZqCU18bvZQp0JY
 E+dxpkm2nrtQZdsOHF9o0RoIusQPOyCxth538HEvrjGI6Gh+UeCrOuGFKTjaTaEkd2qw+sAIn7e
 arPoFRx7j+r5uZFgGpcTFtkT9yFY6r+qH698FIQ3TUCibHhV2mse5cpxFT/2NFWuvEHjFXfyC+E
 JEpuNpQeOpVv8NguDR1XoNhk7dT/m20xRs8bWvhcC1NWAzRenPStH6kTyGD9xL8Bvt3SyQV0bY3 CUBUOlThGaGe+dw==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-2-ea7c74d02068@google.com>
Subject: [PATCH v3 2/4] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..685ace2e27d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29515,6 +29515,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.56.0.212.g129ede20d9-goog

