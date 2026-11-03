Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668089;
	b=UPFhMWhg2QuCVOO7aBeDEY5XT3lG/y+A2odw9vjfj1bQGyaWaExh89XTsCxzEAfYdPQe
	 2no6CvYm0xp9wUA0m+O/uGjLE3z0VJwy+N0ibPZQqoYMDxi+ZN09SA2oPNNdUsDLbpAya
	 6OG3vwbaIlHeERT7B0nUE0XfDmoyY0ntkrb5LX+C0HmM5W1WMFKxOY0KsaK0f0GM1skdQ
	 TeWhWhoM6XdCil+6A8zJ88H9O1zxQTKx+a3+YjFAjglbSzXE8MQwH2V3BJ2uCmKvQrDND
	 /m6vakS6FuEDASMLHiM3SWz+docLIFi0wds8rr/tQpr37JSPZ+YvjzdTRdz+JYuzRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
	b=wrDV/hDv10Am87UztHaqX6hH9CTFygNY512B3nxNktHyjE3yiGYCb64Rb1ICybmT3Vlt
	 d5JlXJ1nXDISMm+F29vqYIaVZ8vAbqw1dS1/XSZEBxR5ubuyph+6m9uJH4iOuP+fenxVx
	 tylodrdhiF8hoH2NQtsocHMNW+MvjuVidfRgK/4EbN7cKccjCce0Ge8wHXYNLY0yndyIm
	 UxYNseNvnCfgoNFUAEKyEvmjFEFESgKd6Vqtl/h8XDAk2hpfHYJkf/FN8+r0Eef/3094i
	 oVvaQdIhIVxTyBCe3ZbR7uVyQ9ooM4+8ANXJ6BskVoQ42kBk1db/5X2mYDNIQIXQgFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEg014DJ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE55606A324
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 01:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE55606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEg014DJ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso5917101c88.0
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 17:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668087; x=1794272887; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
        b=WEg014DJ+4fvKEabmDuaQAVMLo3ki2Lh0/ChBtvCgI4p/hGNbtrwDVscBM/XRA3zos
         3IQXoA1SVUSrBrJqxI/gshdpyok2yczxa8K9gxulB4bv8hW2iV/vajoZNW1Y+solY9lK
         u6xBJqOOGvK+uEuhbPbYbHphX0J4N4d7X7J9FSJ9K66VtqydFN+wpyGlsB5Y+a9Qq128
         YYltTOlX2Gm8IEsfNFx5SZnUoxinCYrF4PCNJHwU7VbcPYk5q2y8Bf6bZontcnH5RZhq
         M/X1hqNOJVI2aU01HH+fSNa5bfYgKPfdJN57bxEMuNuCOlKG4zODTNTbULoiFt67Vd3g
         pygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668087; x=1794272887;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
        b=LSR+R7bUhHdzf1uUQ0fJ1UHEx+Cxpym59VwdH7KeabDR7vbUTPHQoGUdd2VlcE0TpM
         yuqsYQKv48Jfw/A0/jdgfe4ha9L03jJnyy2FMPPuRSU7/2fT7k43rPWBiD5ishvMnc3a
         v2p0aLtJ/lEpfuWrud4Fk6vs6nGdqzD9zTSGTtqAvM+GlOq19us9DwtRV8koU57B4Fss
         olqMR4c34BjE7AwKrr1zhS1q/Em/seGycY+F7WVCPzFoinWByVKoDR5QwSo6Rjh1UTgG
         3hGVscAJFwWoORUtWCvpjhaMSnz0h8yjWgUN69gd0vq+oFyTw/rdyZf9PHMxs1Fghw9H
         WVXQ==
X-Gm-Message-State: AFq9FYLN0r6YChGKXqq32t7uh0f766BrYzPQPnwUZ591F2cOwLwd7RPs
	QvdyIl3SLd5msBtO8DFSYfN9OD2yg6aifIR0osC79gIFlNQeHjxh29+y8WQjzw==
X-Gm-Gg: AYBFou3FquURHBduNX0ax15SpZvtvJAcqVhlnSBBXAanh7DBvfWpc84ItQAQ550K2CJ
	u/QTLd7sjXubyyePj1GPuH20QPLDJ2kIjhDlRBOItv9F0XGG3OVxz0qUQ1iRv+6eXg9l+Kecso2
	91Bsu8ul7gEWKFIDJjovOOgFudap4Pk+KzzcDLJTRnvhYEXDpkf4EhwHAM1Em/C09hlA73rnpYZ
	AHdrerzhlija0OMU/Q2WNNiki4MNcl6BeN/N8BJZidQ1LdMawKakiZ5AZzGHo6EdrIvVaWxgJpT
	viHiUUfpEjQ8TgJDCGoJHa0Jj8VaDY0JtpyWdTNFiEJhvJ7WL6Usbe1cT09+/mILy+25mF24LcB
	W9eRX+BVXENsIdW6KRj7oL6vR6GlFEtDT2kpwHpxab0RTYcUOGw4tGoTLmLDl54PBu6Y/vIHErX
	qC78htHiLNvde7vBGnKxaB69lx2gMlGX8+TKHCdJKFpFq3aCL00sDmURIoagAg/rHLi/aMjO0mQ
	vR0z23l6cjaFWIfEeCxLnqSGyk5duBiWDuSbwF2ubic13r1yn+PaUlbnXO4E/8L5LHazSeASnZL
	cmB6ZTgLk0sSeRsEzMzhmVKa8ML0
X-Received: by 2002:a05:7022:f116:b0:187:7514:47f4 with SMTP id a92af1059eb24-1ac5d1cec2amr15160722c88.46.1793668087325;
        Mon, 02 Nov 2026 17:08:07 -0800 (PST)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm36500389c88.20.2026.11.02.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:08:06 -0800 (PST)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Mon, 02 Nov 2026 20:07:43 -0500
Subject: [PATCH v2] rust: io: mem: Fix exclusive MMIO region requests
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-b4-rust-iomem-origin-master-fix-v2-1-1428247a94d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN4z6WoC/42NTQ6CMBBGr0Jm7Rja8Kcr72FYFJyWSSwlUyQa0
 rtbOYH5Vu9bvLdDJGGKcC12ENo4cpgz6FMB42RmR8iPzKBL3ahStzhUKK+4IgdPHoOw4xm9iSs
 JWn5j19VWkdFVZQfIlkUo30fh3meeOK5BPkdwU7/3f/emMK/RqjakLq2xN+cNP89j8NCnlL6JN
 g7wzgAAAA==
X-Change-ID: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kwanghoon Son <asdfkwang@gmail.com>
X-Mailer: b4 0.14.2

C's request_mem_region() reserves MMIO in the global resource tree.
Rust's ExclusiveIoMem reserves it under the device's resource instead,
so the global tree may not see the reservation.

Request the region from iomem_resource, matching request_mem_region()
and the existing release_mem_region() call.

Fixes: 1d0d4b28513b ("rust: io: mem: add a generic iomem abstraction")

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
The bug can be reproduced with QEMU arm64 virt's existing DT node
(CONFIG_FW_CFG_SYSFS=n):

    fw-cfg@9020000 {
        compatible = "qemu,fw-cfg-mmio";
        reg = <0 0x09020000 0 0x18>;
    };

A small Rust platform driver matches this node. Its probe maps the
resource and returns the mapping as driver data (excerpt):

    let io = pdev.io_request_by_index(0).ok_or(ENODEV)?
        .iomap_exclusive()?
        .into_devres()?;

Unbind and bind that driver again:

    cd /sys/bus/platform/drivers/mmio_repro
    echo 9020000.fw-cfg > unbind
    echo 9020000.fw-cfg > bind

Before the fix, unbind prints "Trying to free nonexistent resource"
and bind fails with EBUSY.
---
Changes in v2:
- Guard Resource::iomem() with CONFIG_HAS_IOMEM to match its only
  caller and avoid a dead_code warning when I/O memory support is
  disabled.
- Rebase onto 6628e7d4c6b2.
- Link to v1: https://lore.kernel.org/r/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com
---
 rust/kernel/io/mem.rs      | 2 +-
 rust/kernel/io/resource.rs | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcda79bc4b795a8a1c5f553c989b9b7..80da665821c036257900c6ea45b9419cb573c187 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -196,7 +196,7 @@ fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
 
-        let region = resource
+        let region = Resource::iomem()
             .request_region(
                 start,
                 size,
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 758ce62b3cce33c14e1e4c56a793af0e00657aa6..d61ad63428679a87b26a79c5ce822c5976a8b82f 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -79,6 +79,13 @@ unsafe impl Sync for Region {}
 pub struct Resource(Opaque<bindings::resource>);
 
 impl Resource {
+    /// Returns the global I/O memory resource root.
+    #[cfg(CONFIG_HAS_IOMEM)]
+    pub(crate) fn iomem() -> &'static Self {
+        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
+        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
+    }
+
     /// Creates a reference to a [`Resource`] from a valid pointer.
     ///
     /// # Safety

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

