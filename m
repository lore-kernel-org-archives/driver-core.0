Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D517A2FB
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783301156; cv=none; b=UNaXJBMiPAsAFIvzfd7vNHV9RBU3wXyRHXNzzbdtQD2sKIKqRN7LCFBpVIk5NBDRvoVJbZgcY+tYnGHOxK2cf+grWIZ6PB3NAFH+6n9YwhKu4Dn1D5CsbjIgtnIqp044o2wHScz7nNbDGZ6wLQZzMN/UqpsABROus8hSO6YrLd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783301156; c=relaxed/simple;
	bh=byjP1ECkgsTHaBq/SGvz+xypqz5VrM0XRf7KdrTwBVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K5Py+d01HJol13rIPVSqD/hR6ZjbuL1R7kaCjDXgp7HV8MnJIkH0UX4A72gfaCAbzCKjHrZ+L5SCZAQMrAjzFB+D915iVihLca3OmscC2jxmFJ1s3od4WasIFOQJkzxU0SkSXQvnY0fMfl3k3rE6rD0ihbcC6bZWk0fHcUPF6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=UEz68dW4; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="UEz68dW4"
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gtmrq3v97z2x9B;
	Mon, 06 Jul 2026 01:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783301148;
	bh=qHxTFCPcZD3eDJX8w7F8Wd+Qxj+fKIIB06fUmyAo3kU=;
	h=From:Date:Subject:To:Cc:From;
	b=UEz68dW4g8c7LususVZEfMTBddws73viJnxZw8ZMN4yatSWCxmNh5ncKaak6+wKha
	 YreH4Q52tewRg3jPslpqLS6ptuvopa4vAQnbIQ1gUfZguCJ0FZ0aO8/dM3fqr8rXh5
	 vGo5v2HrS82Gghgs2s2hxB1YmyJdUbSEZHwPGk8++923R79PEFzlzFYnwrCvuJpGcC
	 Ls5IKPx1+YaTrYPuEBam0FG0p+GkYOXA6sil8sS+MDhH6ttvmtUdXjBythy55YkqT0
	 bqZHi3rq3SA7FAHlVUJ3COfJLCx/uC6bted2PjpbLHRQFdMHpQgjpagWtPjUl4hMc6
	 QNTElqmy6qtDw==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 05 Jul 2026 18:25:37 -0700
Subject: [PATCH] samples: rust_dma: use vertical import style
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNT3aK0HN2y1KIS3czcAt0UQ6OklKRUY0vzZHMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAmMxUkHAAAAA=
X-Change-ID: 20260705-rfl-vert-imp-d12bdbe397c7
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Separating out patches per-subsystem as per the review feedback in [0].

Tested via:

	$ make LLVM=1 rustfmtcheck || echo "fail"
	$

[0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
---
 samples/rust/rust_dma.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 5046b4628d0e..c46af109f4aa 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -12,9 +12,13 @@
         Device,
         DmaMask, //
     },
-    page, pci,
+    page,
+    pci, //
     prelude::*,
-    scatterlist::{Owned, SGTable},
+    scatterlist::{
+        Owned,
+        SGTable, //
+    },
     sync::aref::ARef,
 };
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260705-rfl-vert-imp-d12bdbe397c7

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

