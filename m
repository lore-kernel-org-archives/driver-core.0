Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F423DD51D;
	Tue, 26 May 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806382; cv=none; b=cTEraoxAJ9WYB8oyLqS7vxJwJyffp4X1n0d/319cAinXXGSIWfSFJt5zTwgwUOj56ee3TDbDuGPRijqigu0UA5eNHvT8JF1HnrRxEgpqyq3EEmlswCWubdXX892uO3AZJRe8t818ucA+jWMsYIe/wgo3uYRMUciXmD9E+6cLDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806382; c=relaxed/simple;
	bh=FtAEkUaUKgpbdEcSGG19C3UOQzIEkfHbM4RuQWECPTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liwMRDzWEFB6+ed6Axj0iFHWJ8rtfifaYM/daEq3QBd17BLZojxEYovIb3a/T8GcODFbWK30ssN+32lsB+/Q3cRq65vbCypQ1skDep6H+yhu5Y9U1WbPXIxZe+XiGzegUEOM76zniLp5T1tIW7LyauMGQcOiW1vsiG8Zwi9KElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQZo4Ay8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQZo4Ay8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DB31F00A3C;
	Tue, 26 May 2026 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806377;
	bh=/sTcFllR8dDFAzTpA0T3cKmFW0quYw/+CcgqKmyW5Nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XQZo4Ay8y8G/+q01Odi8vUTtR/X4eAuseAHoSn5XE1uDvdHS1dfJBXYrXV3QveGwU
	 iwOSMmLyseh9Vn+ii5ADpUSChcyJX6RJ1+oGdx36DDyabjNkR1UpJrb2KUEvNWfGgm
	 nAfW2PC1sFfozKTFEz3ZXQgQkzdg2VLlTBXuE0Qmv/jXI74GpadVarB28u7fMkasp6
	 BG8v7n1Wx/CLQ5r4TADfdvi9HBwAWrXOxUTIb/3IkW1gOY0y+1iSY69moAmcMoHSzR
	 AxPbf2IsDLXkm9DYuB3mjLzj5CA6h8QlSkpbnvjmXYp4PGAM2KxlXaual0q1I/kZKk
	 XZbNgXQeqNRCA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 10:39:31 -0400
Subject: [PATCH 1/2] rust: device: remove unused ref-to-ref transmute
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org>
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
In-Reply-To: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3963; i=tamird@kernel.org;
 h=from:subject:message-id; bh=FtAEkUaUKgpbdEcSGG19C3UOQzIEkfHbM4RuQWECPTE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiG5ZJXjton9r6/fwklrz/G4RKbxo4xjpm6M/k0dqbx
 /hS9YJCx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnWeMjIsEHc7Yz1NGXhAB7OvzHJBrvn7bXYcH7e9sXrb/Bbhz61r2RkuLq2jYf
 Z8HV7DMusyetWHFFVX2GycdHy51EzvUuzREwesgAA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

The Ok return value of `read_array_from_fwnode_property` requires a
reference-to-reference transmute to construct but is never read, thus
remove it.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/kernel/device/property.rs | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 5aead835fbbc..87be2784f7a7 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -136,18 +136,15 @@ pub fn property_read_array_vec<'fwnode, 'name, T: PropertyInt>(
         let mut val: KVec<T> = KVec::with_capacity(len, GFP_KERNEL)?;
 
         let res = T::read_array_from_fwnode_property(self, name, val.spare_capacity_mut());
-        let res = match res {
-            Ok(_) => {
-                // SAFETY:
-                // - `len` is equal to `val.capacity - val.len`, because
-                //   `val.capacity` is `len` and `val.len` is zero.
-                // - All elements within the interval [`0`, `len`) were initialized
-                //   by `read_array_from_fwnode_property`.
-                unsafe { val.inc_len(len) }
-                Ok(val)
-            }
-            Err(e) => Err(e),
-        };
+        let res = res.map(|()| {
+            // SAFETY:
+            // - `len` is equal to `val.capacity - val.len`, because
+            //   `val.capacity` is `len` and `val.len` is zero.
+            // - All elements within the interval [`0`, `len`) were initialized
+            //   by `read_array_from_fwnode_property`.
+            unsafe { val.inc_len(len) }
+            val
+        });
         Ok(PropertyGuard {
             inner: res,
             fwnode: self,
@@ -474,12 +471,12 @@ fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
 /// It must be public, because it appears in the signatures of other public
 /// functions, but its methods shouldn't be used outside the kernel crate.
 pub trait PropertyInt: Copy + Sealed {
-    /// Reads a property array.
-    fn read_array_from_fwnode_property<'a>(
+    /// Reads a property array into `out`.
+    fn read_array_from_fwnode_property(
         fwnode: &FwNode,
         name: &CStr,
-        out: &'a mut [MaybeUninit<Self>],
-    ) -> Result<&'a mut [Self]>;
+        out: &mut [MaybeUninit<Self>],
+    ) -> Result;
 
     /// Reads the length of a property array.
     fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<usize>;
@@ -495,11 +492,11 @@ impl Sealed for $int {}
         impl<const N: usize> Sealed for [$int; N] {}
 
         impl PropertyInt for $int {
-            fn read_array_from_fwnode_property<'a>(
+            fn read_array_from_fwnode_property(
                 fwnode: &FwNode,
                 name: &CStr,
-                out: &'a mut [MaybeUninit<Self>],
-            ) -> Result<&'a mut [Self]> {
+                out: &mut [MaybeUninit<Self>],
+            ) -> Result {
                 // SAFETY:
                 // - `fwnode`, `name` and `out` are all valid by their type
                 //   invariants.
@@ -515,12 +512,7 @@ fn read_array_from_fwnode_property<'a>(
                         out.len(),
                     )
                 };
-                to_result(ret)?;
-                // SAFETY: Transmuting from `&'a mut [MaybeUninit<Self>]` to
-                // `&'a mut [Self]` is sound, because the previous call to a
-                // `fwnode_property_read_*_array` function (which didn't fail)
-                // fully initialized the slice.
-                Ok(unsafe { core::mem::transmute::<&mut [MaybeUninit<Self>], &mut [Self]>(out) })
+                to_result(ret)
             }
 
             fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<usize> {

-- 
2.54.0

