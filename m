Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EF481672;
	Tue,  5 May 2026 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994651; cv=none; b=JeZdIZ34zKrUOMQshjEX0i1FWP8OrSkjdN3n9RQPssEcDuJVN45U3rHx1949Fq6IAauWBh2WxygQG285hEBfuDil0YNaWB0UY9v15eNPDCABhkOZcO9z+niW2iUdAUC1K4S2GJacQw8+sQOiIVn2aL2KbKEJe/wTIi3udJRc8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994651; c=relaxed/simple;
	bh=/fRYQ5zjyOWJ/pjwZIQGbTj2eLYzfvrx5wG1aPkJ0yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSLx5/OeNMSGojeiPn/jPpzAt05Gnu8/NsC0ketm6iX0WHlMBzXDcGDpSr6CBObBKfef/aNgOgZno5WhojDqt3eG50RoC4/B97lKwKfZymznnaVHXR9CKj4UTeVUJt+0+pEy7l7p1gn1Gn2oKAhvCfGY/JRgQKIR0mldytD4o/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXJ30qcv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXJ30qcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3752DC2BCF5;
	Tue,  5 May 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777994651;
	bh=/fRYQ5zjyOWJ/pjwZIQGbTj2eLYzfvrx5wG1aPkJ0yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXJ30qcvZyrwl+5xqeEEOkQOYPEOuJoahNOTRVpjZWEZtRGtD+oA+gZn8TpWHKWBm
	 GYYhJ13x8GubFYRcnUxl501mOCZHvRaMTcJV3u8hp0M4dIEHS/I8g60qqKfZwFQSzl
	 9A4jDC4V+x/sNS4OaC0oukadQ4UaMe9OcIvKgc3IGE7AGdt992KemwXAzEHHe2Xglc
	 ad4wFuVYf/0nD1S/hmJgyQlcmf3IleEqNeFYMJIl012IlPjFoAdpH0uU76mpTtnFWS
	 oemGjtz7Gh4M9NeBE46mWuutnWcefecejUYSwb3awnNqkNOH5rPEtVYSaE21VBfs8O
	 nRHOS0RJ7fBhA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/3] rust: alloc: add Box::zeroed()
Date: Tue,  5 May 2026 17:23:07 +0200
Message-ID: <20260505152400.3905096-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505152400.3905096-1-dakr@kernel.org>
References: <20260505152400.3905096-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Box::zeroed() for T: Zeroable types.

This allocates with __GFP_ZERO directly, letting the underlying
allocator deal with zeroing out the memory compared to
Box::new(T::zeroed(), flags).

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index bd6da02c7ab8..c824ed6e1523 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -19,6 +19,7 @@
 use crate::fmt;
 use crate::init::InPlaceInit;
 use crate::page::AsPageIter;
+use crate::prelude::*;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
 
@@ -256,6 +257,27 @@ pub fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>, A>, AllocError> {
         Ok(Box(ptr.cast(), PhantomData))
     }
 
+    /// Creates a new zero-initialized `Box<T, A>`.
+    ///
+    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag. The allocation may fail, in
+    /// which case an error is returned. For ZSTs no memory is allocated.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let b = KBox::<[u8; 128]>::zeroed(GFP_KERNEL)?;
+    /// assert_eq!(*b, [0; 128]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn zeroed(flags: Flags) -> Result<Self, AllocError>
+    where
+        T: Zeroable,
+    {
+        // SAFETY: `__GFP_ZERO` guarantees the memory is zeroed; `T: Zeroable` guarantees that
+        // all-zeroes is a valid bit pattern for `T`.
+        Ok(unsafe { Self::new_uninit(flags | __GFP_ZERO)?.assume_init() })
+    }
+
     /// Constructs a new `Pin<Box<T, A>>`. If `T` does not implement [`Unpin`], then `x` will be
     /// pinned in memory and can't be moved.
     #[inline]
-- 
2.54.0

