Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D97244667;
	Thu, 18 Jun 2026 19:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811604; cv=none; b=g0dqcBNPP8O7cCAqw0hiRFlFaRk+z1tbZN+bwR0KHOAFpyAGav6PZMcyJP9sdmhn69RgujaWSDguEGi+UlOxJJoRlz3R5prlvdMhrTrRI/PvHdTrejC9trVsE+w/Hng5nNIJcjD3pqC79Xpu4Avx/KRkEttQWSEaUfDWNIvyJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811604; c=relaxed/simple;
	bh=Wpj2nqIeVzTVXkH4IzNJMyo8tegmBeUSeXxfe5oza70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBoyMq8cADvlx6dvpb6dbhOLuAQmfwTLhICFdOqkNxDdTs8zNGca4N4YWZPfT7+ji8QnrwU0zXtntS80YKzyWqagC3oqPdFINZC8yDvQox6MBMajEZ/GUFMLhxJNkeowTQlPRig5ra3+Jy7V4xYEM/YhaDTmuKvOiHnbqOBlLz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8+lhtpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8+lhtpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3830C1F00A3A;
	Thu, 18 Jun 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781811603;
	bh=7idbIpEB8gztQj9ajgp3TlaTxLMp8mFxYzBeQK7WJIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J8+lhtpX9NzUQ2Ti/dtG9vZG6BL2HwFVOlXEuUYjvADmrIfXH2GoGO5fOhSMqgBUE
	 5sO2/1NW4doHgRy8UC+q5i10R9X+71FM/ALoRj58Ws/dO70/8O0SeJEb8cy4pf9QxA
	 rUe5VzYi2aR9qBTEt/Ya4CTEiW9dgEfd6nc4+i6HIA6oZ35rWq9Fy7dmnOvoY4hIvp
	 wYzAnTAgjwT/rrwrtGllbs1izJ0b4Ura3p+hLdRLkXFQcpKPUoDmAoQDkzGxtonV1e
	 3u8txahnsvSwBvFYYYUI8eihDxLN0kMxnlz69R7veNgIGwe3ZCaggBhAcphIU52LbA
	 TGc2xEQloQQjQ==
From: Danilo Krummrich <dakr@kernel.org>
To: lossin@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com,
	deborah.brouwer@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] pin-init: add PinInit::map_err() for error type conversion
Date: Thu, 18 Jun 2026 21:32:58 +0200
Message-ID: <20260618193951.601239-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618193951.601239-1-dakr@kernel.org>
References: <20260618193951.601239-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a map_err() method to PinInit that converts the error type of an
initializer. This is useful when combining initializers with different
error types, for example when an infallible initializer (error type
Infallible) needs to be used in a context that expects a different error
type.

The MapErr wrapper stores the original initializer and mapping function,
implementing PinInit and Init with the appropriate trait bounds on the
original initializer.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/pin-init/src/lib.rs | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index fd40c8f244a1..deaf65147e99 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -949,6 +949,18 @@ fn pin_chain<F>(self, f: F) -> ChainPinInit<Self, F, T, E>
     {
         ChainPinInit(self, f, __internal::PhantomInvariant::new())
     }
+
+    /// Convert the error type of this pin-initializer.
+    ///
+    /// This is useful when combining initializers with different error types, for example
+    /// when an infallible initializer (error type [`Infallible`]) needs to be used in a context
+    /// that expects a different error type.
+    fn map_err<E2, F>(self, f: F) -> MapErr<Self, F, T, E>
+    where
+        F: FnOnce(E) -> E2,
+    {
+        MapErr(self, f, __internal::PhantomInvariant::new())
+    }
 }
 
 /// An initializer returned by [`PinInit::pin_chain`].
@@ -975,6 +987,38 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
     }
 }
 
+/// An initializer returned by [`PinInit::map_err`].
+pub struct MapErr<I, F, T: ?Sized, E>(I, F, __internal::PhantomInvariant<(E, T)>);
+
+// SAFETY: The `__pinned_init` function is implemented such that it
+// - returns `Ok(())` on successful initialization,
+// - returns `Err(err)` on error and in this case `slot` will be dropped.
+// - considers `slot` pinned.
+unsafe impl<T: ?Sized, E, E2, I, F> PinInit<T, E2> for MapErr<I, F, T, E>
+where
+    I: PinInit<T, E>,
+    F: FnOnce(E) -> E2,
+{
+    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E2> {
+        // SAFETY: All requirements fulfilled since this function is `__pinned_init`.
+        unsafe { self.0.__pinned_init(slot).map_err(self.1) }
+    }
+}
+
+// SAFETY: The `__init` function is implemented such that it
+// - returns `Ok(())` on successful initialization,
+// - returns `Err(err)` on error and in this case `slot` will be dropped.
+unsafe impl<T: ?Sized, E, E2, I, F> Init<T, E2> for MapErr<I, F, T, E>
+where
+    I: Init<T, E>,
+    F: FnOnce(E) -> E2,
+{
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E2> {
+        // SAFETY: All requirements fulfilled since this function is `__init`.
+        unsafe { self.0.__init(slot).map_err(self.1) }
+    }
+}
+
 /// An initializer for `T`.
 ///
 /// To use this initializer, you will need a suitable memory location that can hold a `T`. This can
-- 
2.54.0

