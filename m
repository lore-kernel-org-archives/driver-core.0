Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AA2E62C4;
	Sat, 30 May 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147664; cv=none; b=VgXDCN4UKanwpLbbzP+8Tbq1OzZmSSxq92QgQjBREm2PdVUsYjvkE1mZCWH/1u/m+X1GuANoW4kc6VzUpMThaZRczpfdODgo6axxowI4e92+JY0IaRtfKOnRtX0s88+htt3pB+KFUOoM3pt/ESiusy/QlDwFZb0fkJTCDR/fO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147664; c=relaxed/simple;
	bh=U4clEkfrzwejubHh9l5dQ3xubuuE5brbB/R3EWIWReE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/RYx4wfuMrEbNanEe0NR1fcn830y4Id8+3pFIiKLmCIp7B83oIGclj7b018yu2XqkQZcpY+zbL7uhL06Tl8Zb0sbAMzx1HjYQ2MrBMeWbnssOjHEa+I+Vz+FcoyScczK2ccacsWF/840UWKZZnx1hYK1cBLHiWzM6yY+OlxaTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYJryaJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYJryaJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80CC1F00893;
	Sat, 30 May 2026 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780147663;
	bh=ZwVqjgcjh5tGVzfBWAfstn5m1kwmVYqQz7/wdSdDkSo=;
	h=From:To:Cc:Subject:Date;
	b=fYJryaJp5hli1a1HYiKG++o9zXXSQh7KdUZFyh+3nIEnfAXMP5Un5MjBas7TIgxGs
	 RclYqiTH48xf+lpiXXG+F8yKmkfqAch5Xn7XrznAkPh7t8WlRB9UQRgh3VOZDhQPcw
	 F2nZYa0lQun4sJbOJ66R+4L2wAjiNIxX2jw+/y1w/IBkeTvcCaUVUFdkCfkib/NV1O
	 KrYWtfuiSEyi4wX7XjTbEmU/55C4niYU+W2ZEhBNKG49lIBbskZuHFPk/D6SVJGbps
	 qnIXucqfD5XijQcBnUlpnI6ckbe3Eh6WCqvV3SyXf0sTKkcfuriIgqp21Gyx+5Oj5s
	 8uYIqZncXmwsQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	beata.michalska@arm.com,
	markus.probst@posteo.de
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: device: add BoundInternal device context and InternalBoundContext trait
Date: Sat, 30 May 2026 15:27:31 +0200
Message-ID: <20260530132736.3298549-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new BoundInternal device context type for cases where bus
abstractions need access to internal device infrastructure, where
CoreInternal would not be justified.

Introduce the InternalBoundContext marker trait, implemented by both
CoreInternal and BoundInternal, to allow methods that require internal
bus abstraction access to a bound device to be generic over both
contexts.

The deref hierarchy now has two branches:
  - CoreInternal<'a> => Core<'a> => Bound => Normal
  - BoundInternal => Bound => Normal

Update impl_device_context_deref! and impl_device_context_into_aref!
macros to emit the BoundInternal => Bound deref and the corresponding
ARef conversion.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
This is needed by both the serdev bus code [1] and the runtime PM series [2].

[1] https://lore.kernel.org/driver-core/DIW1B4FUIXO7.28GSUA0CEA4EV@kernel.org/
[2] https://lore.kernel.org/driver-core/DIKIJ81CV55B.3TA7PV8N4BN0E@kernel.org/
---
 rust/kernel/device.rs | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 645afc49a27d..354c4045f404 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -54,7 +54,8 @@
 /// reference is valid in. For instance, the [`Bound`] context guarantees that the [`Device`] is
 /// bound to a driver for the entire duration of the existence of a [`Device<Bound>`] reference.
 ///
-/// Other [`DeviceContext`] types besides [`Bound`] are [`Normal`], [`Core`] and [`CoreInternal`].
+/// Other [`DeviceContext`] types besides [`Bound`] are [`Normal`], [`Core`], [`CoreInternal`] and
+/// [`BoundInternal`].
 ///
 /// Unless selected otherwise [`Device`] defaults to the [`Normal`] [`DeviceContext`], which by
 /// itself has no additional requirements.
@@ -476,7 +477,8 @@ unsafe impl Sync for Device<Bound> {}
 /// [`DeviceContext`] is a marker trait for types representing the context of a bus specific
 /// [`Device`].
 ///
-/// The specific device context types are: [`CoreInternal`], [`Core`], [`Bound`] and [`Normal`].
+/// The specific device context types are: [`CoreInternal`], [`Core`], [`BoundInternal`], [`Bound`]
+/// and [`Normal`].
 ///
 /// [`DeviceContext`] types are hierarchical, which means that there is a strict hierarchy that
 /// defines which [`DeviceContext`] type can be derived from another. For instance, any
@@ -485,6 +487,11 @@ unsafe impl Sync for Device<Bound> {}
 /// The following enumeration illustrates the dereference hierarchy of [`DeviceContext`] types.
 ///
 /// - [`CoreInternal`] => [`Core`] => [`Bound`] => [`Normal`]
+/// - [`BoundInternal`] => [`Bound`] => [`Normal`]
+///
+/// Both [`CoreInternal`] and [`BoundInternal`] implement the [`InternalBoundContext`] trait,
+/// which provides access to internal bus abstraction methods on [`Device`] that are not available
+/// to drivers.
 ///
 /// Bus devices can automatically implement the dereference hierarchy by using
 /// [`impl_device_context_deref`].
@@ -524,6 +531,18 @@ pub trait DeviceContext: private::Sealed {}
 /// from bus callbacks with bus abstractions, but without making them accessible for drivers.
 pub struct CoreInternal<'a>(PhantomData<&'a ()>);
 
+/// Semantically the same as [`Bound`], but reserved for internal usage of the corresponding bus
+/// abstraction.
+///
+/// The internal bound context is intended to be used in exactly the same way as the [`Bound`]
+/// context, with the difference that this [`DeviceContext`] is internal to the corresponding bus
+/// abstraction.
+///
+/// This context exists for cases where the bus abstraction needs access to internal device
+/// infrastructure (such as [`Device::drvdata_borrow`]), where [`CoreInternal`] would not be
+/// justified.
+pub struct BoundInternal;
+
 /// The [`Bound`] context is the [`DeviceContext`] of a bus specific device when it is guaranteed to
 /// be bound to a driver.
 ///
@@ -546,16 +565,28 @@ mod private {
     pub trait Sealed {}
 
     impl Sealed for super::Bound {}
+    impl Sealed for super::BoundInternal {}
     impl<'a> Sealed for super::Core<'a> {}
     impl<'a> Sealed for super::CoreInternal<'a> {}
     impl Sealed for super::Normal {}
 }
 
 impl DeviceContext for Bound {}
+impl DeviceContext for BoundInternal {}
 impl<'a> DeviceContext for Core<'a> {}
 impl<'a> DeviceContext for CoreInternal<'a> {}
 impl DeviceContext for Normal {}
 
+/// Marker trait for [`DeviceContext`] types that have internal bound-level access.
+///
+/// This trait is implemented by [`CoreInternal`] and [`BoundInternal`], allowing methods that
+/// require internal bus abstraction access to a bound device to be generic over both contexts.
+///
+/// Methods bounded by this trait are available to bus abstractions but not to drivers.
+pub trait InternalBoundContext: DeviceContext {}
+impl<'a> InternalBoundContext for CoreInternal<'a> {}
+impl InternalBoundContext for BoundInternal {}
+
 impl<Ctx: DeviceContext> AsRef<Device<Ctx>> for Device<Ctx> {
     #[inline]
     fn as_ref(&self) -> &Device<Ctx> {
@@ -661,6 +692,13 @@ macro_rules! impl_device_context_deref {
             <'a> $crate::device::Core<'a> => $crate::device::Bound
         });
 
+        // SAFETY: This macro has the exact same safety requirement as
+        // `__impl_device_context_deref!`.
+        ::kernel::__impl_device_context_deref!(unsafe {
+            $device,
+            $crate::device::BoundInternal => $crate::device::Bound
+        });
+
         // SAFETY: This macro has the exact same safety requirement as
         // `__impl_device_context_deref!`.
         ::kernel::__impl_device_context_deref!(unsafe {
@@ -700,6 +738,7 @@ macro_rules! impl_device_context_into_aref {
         ::kernel::__impl_device_context_into_aref!(
             <'a> $crate::device::Core<'a>, $device
         );
+        ::kernel::__impl_device_context_into_aref!($crate::device::BoundInternal, $device);
         ::kernel::__impl_device_context_into_aref!($crate::device::Bound, $device);
     };
 }

base-commit: 016267b521b18529c977c9eca9597a1669c3d73c
-- 
2.54.0

