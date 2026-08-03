Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729A37F33E;
	Mon,  3 Aug 2026 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787397; cv=none; b=eSzMb7xaXizPXwTpZtt26y+DacDsE9bUq3rsm8gq05Vpt5rAxTxK/w95nTGZfubCOKD/kFXmnY1Y+akumxj3Emneudd1GrIaZ8/W2zL3wHCOu1Q+Ct38RlkAA7tB7/TF9/7L3FD6LdtYpOBy+w6WPbGMepeAIWW7OkhKMf1n5eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787397; c=relaxed/simple;
	bh=hnUZid0Vr3BLORALHN8t97HYwN2VnvcYMq6ugErPJY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fe7kuQc/M/kw7XV+/q3gA68IRpKdHi+hlweFaP89ruLRJoEwCjC6aSf1SxRVLRVHypKa9jT1jo2BxpMfi+MOL6CpC2RHCensDAA0Z6kWZuVlnc29IEyH+Twv2g14m7Z1IVGyHp/TngWNgm9LdDpLckGe0QLUTP8v1JGd8oxf2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQkj8PLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQkj8PLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20F71F000E9;
	Mon,  3 Aug 2026 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785787396;
	bh=mkc4P8QSReij9BeFSaxSDrGdtSC+IpbDs0fk7mO7Awo=;
	h=From:To:Cc:Subject:Date;
	b=IQkj8PLHpazd7tZHNWbySYHLsUKsKVnde0Dv6wQkIFIXSpL6iZ11iSv2Y0+wQj9Iv
	 YuxLd4CXAVlDx+G20M1PEnO4naSIrRq3ilFcK+iiO6UK7ZR/7k9Z5sISttRN6CywGp
	 wxLurRpLBeJqYiWACLAD4WxWx9DfCyiC5FoEgHborNVTtgrbAM2iDTK/QX5UuBRHvf
	 6Lg+KGtcj9SjMoPrDIn6ZEuJEopBdaWhfan40da6uUMYV7mTI+DJU4ccdEqRjxQfm0
	 r0cgLQmgNcDtpI2RtBn+hpeqapHs722GUqRgouHBuarBBAvfwxq56nz0+57jOxiPrq
	 6KCFUZsqowtww==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
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
Subject: [PATCH 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
Date: Mon,  3 Aug 2026 22:02:36 +0200
Message-ID: <20260803200249.3494259-1-dakr@kernel.org>
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

Guard the C helpers behind #ifdef CONFIG_HAS_IOMEM and provide a
cfg-gated stub in IoMem::ioremap() that returns -EINVAL when IOMEM is
unavailable, mirroring the C pattern used by
devm_platform_ioremap_resource() and friends.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/20260803180931.97202-1-ojeda@kernel.org
Fixes: 3f70ebe63858 ("s390: Enable Rust support")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/io.c     |  2 ++
 rust/kernel/io/mem.rs | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index fc2a3e24f8d5..3f596bc4fb26 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -233,6 +233,12 @@ pub struct IoMem<'a, const SIZE: usize = 0> {
 }
 
 impl<'a, const SIZE: usize> IoMem<'a, SIZE> {
+    #[cfg(not(CONFIG_HAS_IOMEM))]
+    fn ioremap(_dev: &'a Device<Bound>, _resource: &Resource) -> Result<Self> {
+        Err(EINVAL)
+    }
+
+    #[cfg(CONFIG_HAS_IOMEM)]
     fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
         // Note: Some ioremap() implementations use types that depend on the CPU
         // word width rather than the bus address width.
@@ -286,8 +292,11 @@ pub fn into_devres(self) -> Result<Devres<IoMem<'static, SIZE>>> {
 
 impl<const SIZE: usize> Drop for IoMem<'_, SIZE> {
     fn drop(&mut self) {
+        #[cfg(CONFIG_HAS_IOMEM)]
         // SAFETY: Safe as by the invariant of `Io`.
-        unsafe { bindings::iounmap(self.io.addr() as *mut c_void) }
+        unsafe {
+            bindings::iounmap(self.io.addr() as *mut c_void)
+        }
     }
 }
 

base-commit: 667d0fb32149f023b8b34a1f6f3d384556eafb5a
-- 
2.55.0

