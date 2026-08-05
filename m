Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D083C98BF;
	Wed,  5 Aug 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965367; cv=none; b=Zv+c1iJWrBwEXeOycSDGjwCGATiGbfkxi/PhHxM4GJ57UolIRqh8t0xq7eaTQELbLbCBo8Pn4h3haQq3TWS3c8MZyAxQ1igy++CKlf/C4edQR/BXJ/AT674elvU65FBHUos7g8bclHn0EsGLL+liXxonDuZrNIDg09rdzUwu5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965367; c=relaxed/simple;
	bh=R9WQy457uN9atZe33NUCuRCdBTNmX153WP3PsCU476o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYre2oGEZHkN6jdmE5qvSXvPqnrhj/EZUWty4kbOVbWqzC0RT/WjMdPi7xc04g7xxBOVbQlmVJB+yPPLP3a6JPCBNBFtzv1ohs3LN8aKrZn1itiohwR2zWNYOZQ3eJeKGsAb0GMiuC4Fa1KmilM1pGejMSgIXntLAGR66blssU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbS/BZwK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbS/BZwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885A81F000E9;
	Wed,  5 Aug 2026 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965366;
	bh=AoMN/cmcd6IwG1JYDsGZWVEuE9XJEOh9IHcgSwbWR/g=;
	h=From:To:Cc:Subject:Date;
	b=KbS/BZwKIYz6zPQ/LZibHR37VKjkZyjPELNR5uldUsqPAwqyXv7yelKz2YqvvpB20
	 V9aOIlcQMZ42MSw+8McFkU5toSlUNNcs+F7As6pbYfh3Mx2KjeulHh3YoO+GEaUxSf
	 DhoRRSLi8t/93wD0bk14jTga3Jgul9duEDA/o/TbtZu+AmnyeYXkKxG9s+i1GyupDJ
	 OAwnhcxVfwhE1RTr5fy+EKYInWN2QwRqKN/s8iMqyDfity046iOt3pNbFyx4zQ+i2Y
	 Gld5v6AupixosHXFSebBqqZdLibkqxQ7qJs/uRALXceZaaJgKZ/SBnNu/Men4wy5Xv
	 DxRgDQNhTlXMg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	arnd@arndb.de,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
Date: Wed,  5 Aug 2026 23:28:35 +0200
Message-ID: <20260805212920.1996937-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s390 does not provide ioremap()/iounmap() when CONFIG_HAS_IOMEM is not
set (which requires CONFIG_PCI on that architecture). This causes a
build failure with Rust enabled on e.g. s390 allnoconfig:

	In file included from rust/helpers/helpers.c:68:
	rust/helpers/io.c:8:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations
	      [-Wimplicit-function-declaration]
	    8 |         return ioremap(offset, size);
	      |                ^
	rust/helpers/io.c:19:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations
	      [-Wimplicit-function-declaration]
	   19 |         iounmap(addr);

Guard the C helpers behind #ifdef CONFIG_HAS_IOMEM and cfg-gate the Rust
io::mem module, such that IoMem, ExclusiveIoMem and IoRequest are not
available without CONFIG_HAS_IOMEM.

Note that the C API is inconsistent about this. For instance,
devm_ioremap() has no stub and produces a link failure without
CONFIG_HAS_IOMEM, whereas devm_platform_ioremap_resource() provides an
inline stub returning -EINVAL.

The approach taken here (compile-time gating) matches the former, which
is slightly more appropriate since any driver performing MMIO currently
requires CONFIG_HAS_IOMEM.

Ideally, s390 should provide ioremap()/iounmap() stubs unconditionally
(as UML already does), removing the need for any config gating as
discussed in [1]; a follow-up patch for s390 is expected.

Cc: Arnd Bergmann <arnd@arndb.de>
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/20260803180931.97202-1-ojeda@kernel.org [1]
Fixes: 3f70ebe63858 ("s390: Enable Rust support")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2:
  - Gate the entire io::mem module with #[cfg(CONFIG_HAS_IOMEM)] instead of
    providing a runtime stub returning -EINVAL.
  - Expand the commit message, and note about the existing inconsistency of
    handling CONFIG_HAS_IOMEM and a potential follow-up.
---
 rust/helpers/io.c       | 2 ++
 rust/kernel/io.rs       | 1 +
 rust/kernel/platform.rs | 9 +++++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 397810864a24..1edbc274951c 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -3,6 +3,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 
+#ifdef CONFIG_HAS_IOMEM
 __rust_helper void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 {
 	return ioremap(offset, size);
@@ -18,6 +19,7 @@ __rust_helper void rust_helper_iounmap(void __iomem *addr)
 {
 	iounmap(addr);
 }
+#endif /* CONFIG_HAS_IOMEM */
 
 __rust_helper u8 rust_helper_readb(const void __iomem *addr)
 {
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fcc7678fd9e3..d30bb5c6d4fc 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -9,6 +9,7 @@
     prelude::*, //
 };
 
+#[cfg(CONFIG_HAS_IOMEM)]
 pub mod mem;
 pub mod poll;
 pub mod register;
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 9b362e0495d3..d41555a4b31d 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -17,10 +17,7 @@
         from_result,
         to_result, //
     },
-    io::{
-        mem::IoRequest,
-        Resource, //
-    },
+    io::Resource,
     irq::{
         self,
         IrqRequest, //
@@ -31,6 +28,9 @@
     ThisModule, //
 };
 
+#[cfg(CONFIG_HAS_IOMEM)]
+use crate::io::mem::IoRequest;
+
 use core::{
     marker::PhantomData,
     mem::offset_of,
@@ -307,6 +307,7 @@ pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
     }
 }
 
+#[cfg(CONFIG_HAS_IOMEM)]
 impl Device<Bound> {
     /// Returns an `IoRequest` for the resource at `index`, if any.
     pub fn io_request_by_index(&self, index: u32) -> Option<IoRequest<'_>> {

base-commit: 667d0fb32149f023b8b34a1f6f3d384556eafb5a
-- 
2.55.0

