Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C0269CE6;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784449743; cv=none; b=qB5nBazH1EY2QIgzA/ovN/GxbZSbjR9PcHhQ/Jn712f0EpbOehyIbufWZw8W9kVVCh9ug6uNJYa8C2Y1DCwqGejOtkn3ybA/R6hCpZRUUeDuoQOcDFBkDDHG1UVRbOMDOyBkrFvBMVKOpK4kT9Xbf0jtKFYhBnh4xbBGLtEpdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784449743; c=relaxed/simple;
	bh=Weh74W016vGVildk1wROoVOYXHCCS9Ocwken4skwCQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PC3v3/FO4v0S/mG60Pzl8t+JckslIyibDrepRuv11Mpzb35k3/8qCO87CRsT6IhliJMRp8r7a1UVJBZa0GhCeLodCXM6RsTsXYMBCk+nec+f+SlrjCovoCsXcV4akGDrwT22+XMGOqP2S7x4xDaf44sgagk8YMY+FZm2kZVWYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVGJYQpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVGJYQpm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54ED9C2BCC9;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784449743;
	bh=Weh74W016vGVildk1wROoVOYXHCCS9Ocwken4skwCQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JVGJYQpmBDKsomkSs5gDJZvNM1yVQVBS/eiduM/dflsuLCY2eYtQpZfl6UFiN2QVb
	 PBxxK7tSggpd45JyzW2fmvt0e2iSZm8mxO74vkwpQL+8oLMZu98RwnDU3/ianF4/lm
	 ZOhVzTD6t0y6MU5APLQxsonstml9LhRDGcDGgWCxleym4WXqisyMj8BgpKf1WKmxiQ
	 61HKZ2aFn+OfcyFyH1sy2FPMjHmOX4NcDI5x4u/ErTZeXUcuZ0+5sRc0LuLIjauIwY
	 c3AHvSSXvvD+QYUqcdz7aV7quCV1/9vCWNg2pOZkZkt3Z9V6A0u6tBrinefbF80Bcb
	 DUlOKBODPKiRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3527AC44512;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
From: Josef Ippisch via B4 Relay <devnull+josef.ippisch.dev.mailbox.org@kernel.org>
Date: Sun, 19 Jul 2026 10:28:48 +0200
Subject: [PATCH 1/2] rust: debugfs: migrate BinaryWriter requirements to
 zerocopy
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-1-27ed30512e75@mailbox.org>
References: <20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-0-27ed30512e75@mailbox.org>
In-Reply-To: <20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-0-27ed30512e75@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 Josef Ippisch <josef.ippisch.dev@mailbox.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784449742; l=2196;
 i=josef.ippisch.dev@mailbox.org; s=20260719; h=from:subject:message-id;
 bh=3xs3RLvMTt7NafjwAYtmrBE3g0qMtkMK7/mKI3G75YU=;
 b=ZC1irnZUYtEuNu0m6ktHGg6njRoFjxiH09nAzVc5EeKGl8TGi8WCqqcPrFMHI5B99nVQlDkmB
 726x5TuFNjMBIvurU7yF+HcT489WTSPLBz4lotGexz7EQVaDSyN6nEh
X-Developer-Key: i=josef.ippisch.dev@mailbox.org; a=ed25519;
 pk=M4DnWHhz9yT9BkhXKzsmw6wTVrK2U1WBK0QiEjHoo1U=
X-Endpoint-Received: by B4 Relay for josef.ippisch.dev@mailbox.org/20260719
 with auth_id=884
X-Original-From: Josef Ippisch <josef.ippisch.dev@mailbox.org>
Reply-To: josef.ippisch.dev@mailbox.org

From: Josef Ippisch <josef.ippisch.dev@mailbox.org>

Migrate `BinaryWriter`'s default implementation's requirements on T from
`kernel::transmute::AsBytes` to `zerocopy::Immutable` +
`zerocopy::IntoBytes`.

The additional `zerocopy::Immutable` requirement does not further
restrict the types in practice but is rather a more explicit requirement
(that the type does not have interior mutability) and is required by
zerocopy for the `as_bytes()` function.

Suggested-by: Joshua Liebow-Feeser <joshlf@google.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/975
Signed-off-by: Josef Ippisch <josef.ippisch.dev@mailbox.org>
---
 rust/kernel/debugfs/traits.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index 8c39524b6a99..ce030ff45a4c 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -36,6 +36,11 @@
     str::FromStr,
 };
 
+use zerocopy::{
+    Immutable,
+    IntoBytes, //
+};
+
 /// A trait for types that can be written into a string.
 ///
 /// This works very similarly to `Debug`, and is automatically implemented if `Debug` is
@@ -76,8 +81,8 @@ fn write_to_slice(
     ) -> Result<usize>;
 }
 
-// Base implementation for any `T: AsBytes`.
-impl<T: AsBytes> BinaryWriter for T {
+// Base implementation for any `T: Immutable + IntoBytes`.
+impl<T: Immutable + IntoBytes> BinaryWriter for T {
     fn write_to_slice(
         &self,
         writer: &mut UserSliceWriter,
@@ -147,7 +152,7 @@ fn write_to_slice(
 // Delegate for `Vec<T, A>`.
 impl<T, A> BinaryWriter for Vec<T, A>
 where
-    T: AsBytes,
+    T: Immutable + IntoBytes,
     A: Allocator,
 {
     fn write_to_slice(
@@ -157,7 +162,7 @@ fn write_to_slice(
     ) -> Result<usize> {
         let slice = self.as_slice();
 
-        // SAFETY: `T: AsBytes` allows us to treat `&[T]` as `&[u8]`.
+        // SAFETY: `T: Immutable + IntoBytes` allows us to treat `&[T]` as `&[u8]`.
         let buffer = unsafe {
             core::slice::from_raw_parts(slice.as_ptr().cast(), core::mem::size_of_val(slice))
         };

-- 
2.53.0


