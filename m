Received: from outbound.ci.icloud.com (ci-2002i-snip4-4.eps.apple.com [57.103.88.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82A3955CB
	for <driver-core@lists.linux.dev>; Sat, 23 May 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539324; cv=none; b=GnTzrn6BPflWVfv6VXC6vyGPCbv+4yNvU9B0a0L1GC+sa3SVR93wEoybhGdMoKjEnHoibrE+zyPIkmJAqoG4NQR9w1SVg4JOdL5/UGY0ZomYdorlTyzuyEqS/FzDShjubGTLxi4f69XvUp4C5h9ArWQD5yhmUDPKW+YGYsEOdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539324; c=relaxed/simple;
	bh=FOUaFUiV4twQ5GOyAd/DTINScZ3h8UteMVerTi3jfCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOn7boOE3dUYItsLS/gqrH8uZNNyMcgwQ98D7H9asfZO6Ce/+B7KqBu1ZOUWEqLqDJ0MVm91ALPcUin2QzdfkeVWzTceiHGX/spKL+70tXrHwKsq4EFXbv2t0XaiXx1aqq4/dD4W4CmuOb9r44YYnVT1m3DcI42tw1EY5xYIz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=L9zziY5v; arc=none smtp.client-ip=57.103.88.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="L9zziY5v"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-5 (Postfix) with ESMTPS id C4F471800319;
	Sat, 23 May 2026 12:28:38 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhAC0MDUxxBCUgdXgBLVxQEFVwtRA9aHhcbUE1RDw8DXRBdQ1QIEgJaRQFfFwNXHFZFXBhDCV0FVxwdDl5FWxNVF0YJGQhdHRkIRx8KMANCDlYDQwdFAC0ZHFdQRA9aHhcbUE1aAlZNBUoDXwFbB0IKSQFfAF4LXgpIAFwARgNdVBdzHlMDXF5aGw1NQxJCFQQbRh5DBF8vXRdeDF4F
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1779539322; x=1782131322; bh=cKRl3jE1Dn4fHrAV0+ZFprVWqOgyUWMoSzgklKELJNg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=L9zziY5vYeUzv8rkZj5eWMeSFrEZY6yhX0/ctVrM/GxRWjFtPz487ejBPkp57J5WFYub01uX+QQXNr2dnk4Ns8iTRAIb25RDATrTrOxdHHqb7BF7eeHGX7PpUDWaHhB5Qvpq5HW/ngpZQQjJhlm9CfPYyvQhWXs7gopSiqeO1+3w3gR2MPTrAcbrZjDeNBVTWg339QWHL9dsYWHyWOy6SWZhXxeBf8xnqQDuSlQRDaeS/TdZGB1FMI/AVMfXFOkzQfaFcR9ai5tvP+86PqapMKi4EpHtVfZu0YLTzKWJraTrvuOdKUIoGlGGGXcsskAgm5457nYwMddlqGCbWV6w/w==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-5 (Postfix) with ESMTPSA id 0C5DD1800303;
	Sat, 23 May 2026 12:28:33 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Tamir Duberstein <tamird@kernel.org>
Cc: Mohamad Alsadhan <mo@sdhn.cc>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] rust: replace `build_assert!` with `const_assert!`
Date: Sat, 23 May 2026 15:27:57 +0300
Message-ID: <20260523122759.30317-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=C83kCAP+ c=1 sm=1 tr=0 ts=6a119d78
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=4d5XaGdVlrUcrhUzNUEA:9
X-Proofpoint-ORIG-GUID: uXfji24h9UY36V3UPNbsIkW8PWLF580j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDEyOCBTYWx0ZWRfX4AJVKEWhIFUU
 ObthVh7TJKvM8BuslcuhXRCRsYSqn0ySvGGHLZOaxcdPFSh0ZD/ktsbQxaORFfhHNcOvrAaB0MQ
 NenIGFZdq7vPFK0P03M9dH0XJgjzG1VbJAF+xfVaDUK3B1KK7Hdzw1mAGs1FMiYPkCcBPt6Rb8b
 XwclbN9UyC+NfV4Gwfub71IHxeaMxorvA9mM6pAxDLCYH8vXc3uJT83CFqpXyxjE4Q5/7J4mih4
 xBFc5g3MagpVLwlIGXnmIGYjVVL5pWGDgESfVgJ8sGM+ONYhFRJOATZIL59mtFQjrwEPDgz7M9r
 0LEFcl14E0HcyZj2cmatVxTl3toIn2zKW4AZII2KoZoreo3ycIupgITvO1Bc8Y=
X-Proofpoint-GUID: uXfji24h9UY36V3UPNbsIkW8PWLF580j

Several Rust assertions currently use the `build_assert!` macro
despite their conditions only depending on type parameters or const
generics, not runtime values.

Replace these with the more appropriate `const_assert!` macro which
should trigger earlier in the compilation pipeline. This is possible
since commit 560a7a9b9 ("rust: add `const_assert!` macro").

These changes were identified by my PR to klint (see link), which
added a new lint that suggests to use stronger build-time assertion
forms when possible.

No functional change intended.

Link: https://github.com/Rust-for-Linux/klint/pull/14
Acked-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 rust/kernel/dma.rs            | 4 ++--
 rust/kernel/i2c.rs            | 2 +-
 rust/kernel/list/arc.rs       | 2 +-
 rust/kernel/sync/locked_by.rs | 8 ++++----
 rust/kernel/xarray.rs         | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5..deacfc719 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
+    bindings, device,
     device::{Bound, Core},
     error::{to_result, Result},
     prelude::*,
@@ -401,7 +401,7 @@ pub fn alloc_attrs(
         gfp_flags: kernel::alloc::Flags,
         dma_attrs: Attrs,
     ) -> Result<CoherentAllocation<T>> {
-        build_assert!(
+        const_assert!(
             core::mem::size_of::<T>() > 0,
             "It doesn't make sense for the allocated type to be a ZST"
         );
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5..55b763189 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -110,7 +110,7 @@ unsafe fn register(
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
-        build_assert!(
+        const_assert!(
             T::ACPI_ID_TABLE.is_some() || T::OF_ID_TABLE.is_some() || T::I2C_ID_TABLE.is_some(),
             "At least one of ACPI/OF/Legacy tables must be present when registering an i2c driver"
         );
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index e10824239..b57cec64f 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -252,7 +252,7 @@ pub fn pair_from_pin_unique<const ID2: u64>(
     where
         T: ListArcSafe<ID2>,
     {
-        build_assert!(ID != ID2);
+        const_assert!(ID != ID2);
 
         // SAFETY: We have a `UniqueArc`, so there is no `ListArc`.
         unsafe { <T as ListArcSafe<ID>>::on_create_list_arc_from_unique(unique.as_mut()) };
diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index 61f100a45..5d043e661 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -3,7 +3,7 @@
 //! A wrapper for data protected by a lock that does not wrap it.
 
 use super::{lock::Backend, lock::Lock};
-use crate::build_assert;
+use crate::const_assert;
 use core::{cell::UnsafeCell, mem::size_of, ptr};
 
 /// Allows access to some data to be serialised by a lock that does not wrap it.
@@ -100,7 +100,7 @@ impl<T, U> LockedBy<T, U> {
     /// memory location*, the data becomes accessible again: none of this affects memory safety
     /// because in any case at most one thread (or CPU) can access the protected data at a time.
     pub fn new<B: Backend>(owner: &Lock<U, B>, data: T) -> Self {
-        build_assert!(
+        const_assert!(
             size_of::<Lock<U, B>>() > 0,
             "The lock type cannot be a ZST because it may be impossible to distinguish instances"
         );
@@ -126,7 +126,7 @@ pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
     where
         T: Sync,
     {
-        build_assert!(
+        const_assert!(
             size_of::<U>() > 0,
             "`U` cannot be a ZST because `owner` wouldn't be unique"
         );
@@ -155,7 +155,7 @@ pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
     /// Panics if `owner` is different from the data protected by the lock used in
     /// [`new`](LockedBy::new).
     pub fn access_mut<'a>(&'a self, owner: &'a mut U) -> &'a mut T {
-        build_assert!(
+        const_assert!(
             size_of::<U>() > 0,
             "`U` cannot be a ZST because `owner` wouldn't be unique"
         );
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 46e5f4322..d4b3eac34 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
 
 use crate::{
-    alloc, bindings, build_assert,
+    alloc, bindings, const_assert,
     error::{Error, Result},
     ffi::c_void,
     types::{ForeignOwnable, NotThreadSafe, Opaque},
@@ -231,7 +231,7 @@ pub fn store(
         value: T,
         gfp: alloc::Flags,
     ) -> Result<Option<T>, StoreError<T>> {
-        build_assert!(
+        const_assert!(
             T::FOREIGN_ALIGN >= 4,
             "pointers stored in XArray must be 4-byte aligned"
         );
-- 
2.54.0

