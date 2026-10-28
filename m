Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152885;
	b=2JgqwjKBiwRMMEYE+IECxcMhn2d1/DmANWjI7VnxplpW89q20/8RSOO/oWgWYsQFu4iL
	 QGVVNhuPHdatBoILX6WpbODAwFG6NR8r6mGnVq82DGVzI3Q5uUnpF4Dazs+OFMbe8pnT4
	 EmeIkLO+IKpxte8lRnPuAXT9pH2Xb2UaOnP4KdLgUHv3yxlw/OQBawHR6XeVCJsHTJ+S9
	 3EANm6oifUVJ9eSbk6i8qWz1Cn72VBq8SGPbL2yI7ph9fd2zs5Dfq1ppCalreyzA2HYOz
	 dXuHH60C/j3BDbGsuZ4wDnPyOiWYt5MpMhCQKMHv8AA4dO0iZSf+LI43CgRlWP5UYkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
	b=utnMUaboIwFrYUgcVH2WQenSDBFjgroxTdEZNFFi0egjtzDkaSET2xwoI76o0bM8bkhY
	 /BJ38eP08V+TSyCuecTsSFo4JrBjY9x7dmfd2MWOlcJFqsLE3OfCAgWNI4hIl5RHVt+HY
	 ZqRganMbeZ0RRJR9eSuoDelRzYfTTgRQ+41rEXiPrIt7i5Ls1O0zzmG2RwkYk0fudCXu2
	 WZLpr3+ftxWEqEauHueBK+0Ww/Be/IepQnuBJs+axlI9Pk3Em8/UEUYVL4BWk9XF2Mtdf
	 yqICRAhQT5d9RyiLUQz+6d1zJ5MBJ4m1bF6RVZwZT+b4V+ZvhG3iUGzJooM+5Vm2heg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT5oBP4F;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE62606A31D
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 02:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT5oBP4F
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so282783a12.3
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 19:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152884; x=1793757684; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=jT5oBP4FAdvMbdZorF5jHrFCZekLOrXLmYmlP6Z4CKQ8ncU7zRJjmedXjz6agXdJGj
         rp2NMUYSMkypRgYAuSh1+xIJEF4M9z1b37F1Hjn6NEy0E+m2dR5yIW7ZN9IQpAajCMWJ
         xy9Bv2dR1j+Ls3jZWE2T1fLqEj+Az0PTr9BeBSdWnd97qoNtvHpe/yy04Mp/REiW8w1L
         DPGt/PJOShPNKc+1eUGRAQlyPWujkJgKhJAs0pOtHvjdAoEiK9BuLkXi+mTYAn9nEnsN
         VCxUAgJ3GXsTonE5i3YABUicCOobS8DTrFRn9wI/PYCNhOarVLgUAva4NbL6DjtjujnN
         GaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152884; x=1793757684;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=wi2Pc+2dbVGcI2mhgz+Mh5jjW9DHFc2gBVwIEkzEN9gjnJrQJdM/SgEMdpSOULFAyb
         sUdd7yhJgSL30SEuEhazaHXA6xSjyxkD2CD9T4JaiAZvJrSWsPekvttqf9XZnLpgMI4d
         +IpTSiijlbME9fcP8a4P166ylt5tgNl3gbI7CQ+t5qqgotzF64wIcT9xvNT+lP8B8urz
         4VAgSmmCDmuWl6sLZkHY4mhOjrd7IJcCrq1b53TuqmWMVMnKjVxDwWots03sjaLs0ocD
         F0YdV3zS70woe19dWRj38ZjmHkaxHboCdjh6tFu1Vgg/AaW2Ck1lbmb1NMp7Sdlfr0IT
         3tbw==
X-Gm-Message-State: AFq9FYJWeL8bYcYDNX5MIUnnSF6manb+F1T9jAdrCVXc6h8kYgrH4AOG
	l1xLLRBkAgXZZOLrogNoM3UW+hFj3x4InKsF4m/Lo3LMsoQ4iB35kk8+
X-Gm-Gg: AYBFou1HOEtFgFEesGWL3VHXZXx9S+qJVjNQ+VATxMRK30N8bcZgrH/Nw6TDw0y1uwc
	ipTiRRptofLwuYLG/4NgP+GljWlycUwXnpmBik7NsL+0HqG72xsHSslqymcu+7n5cp142numSgk
	ngTC2usaU2Y2d+poBaEl4z8LeBxn+DJKgTVIX7KHdxCOW+RuB4QzGnojSOjsBTc2UMinROy4XSF
	rhecta8eOsI6EpSXlKYYC809623zjdN3Jp9K5IFEOzDo9qF6XqmGSW3GU36TkEISdYPl8wCPcSu
	XSjTTogPz1DBCeJ4m/dnDrnk7CubdUwYjAfBrSXu21OPpkjGtedEDBzqhWYXILWrVpcDdemqekO
	7Ql9cD2EnUgt7dFTi7i0VhZOLK4k6mqM0iYarEvS7OvH062yCqBfL3qdZ9zfrxEnsAzBdBOhcit
	ITSoA8CMWW9SWT/diU8loCWA1Z43cIYZWGGRQiXwZ8OG3b+hSCOnnPeX2eu3OB0rUNOEGq09y1u
	lKUZCsrqk+CaI8fCbzwl5rS0nOJOhgm8zN5GggAEdHDxTyKUIDupXw=
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr499438a91.63.1793152883883;
        Tue, 27 Oct 2026 19:01:23 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d5efe2sm659155a91.1.2026.10.27.19.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:01:22 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Tue, 27 Oct 2026 22:00:48 -0400
Subject: [PATCH] rust: io: mem: Fix exclusive MMIO region requests
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
Message-Id: <20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE9X4WoC/x2NuwrDMAwAfyVorsA2zoP8SungpLKjwXaR0hII+
 feYjnfD3QlKwqQwdycI/Vi5lgb20cG6hZII+d0YnHGDNW7ExaN8dUeumTJW4cQFc9CdBCMfOE1
 9tBSc93GBVvkINf0/PF/XdQNf69Q/cQAAAA==
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
and bind fails with EBUSY. With the fix, 100 cycles pass. This was
repeated in three fresh guests for each kernel.
---
 rust/kernel/io/mem.rs      | 2 +-
 rust/kernel/io/resource.rs | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 758ce62b3cce33c14e1e4c56a793af0e00657aa6..c99a2530186fc56bdc3405adc15d0801b98eae08 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -79,6 +79,12 @@ unsafe impl Sync for Region {}
 pub struct Resource(Opaque<bindings::resource>);
 
 impl Resource {
+    /// Returns the global I/O memory resource root.
+    pub(crate) fn iomem() -> &'static Self {
+        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
+        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
+    }
+
     /// Creates a reference to a [`Resource`] from a valid pointer.
     ///
     /// # Safety

---
base-commit: 8a36f53fd5ec3eff01f1b637d42cbdc3821d0493
change-id: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

