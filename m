Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210B421A15
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788690561; cv=none; b=g1rK1cbX9mUSPT+EvnENln2kVHC1yI2QPndJfJyUrgHFpRMQlPkEXLhwa0SPPSlO4jx8KCsOzzGnWhrw96StucEGdOLrfhcWlXQpX8zKXkpBVnVTnp7GAnYvWF+GxyA+zTf0cz9A1CA2n7rW8VB1nBgvqNuSTMMruhCrOm7ZcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788690561; c=relaxed/simple;
	bh=1Ri6jWwNAKWKJpRPAfcZVQJ0GPmWeJJo7bFkWZHv8sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lsX9atTP7ISyaYf/7nochgjevt2HM14G62+Was5Xg6jzAg55RNTlP8AIjIHzIZueYPt7oTZE/duF04OIiXpSg6ZwwZKJKm9jMfaVTsOO+U5nDRLnYigQ2oZ48/Zs92BOXpqG1WXC+8HyAdplq7Kd6h5XTllVg71TUOE2pG1WYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=iWmmOaG8; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iWmmOaG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5xsldwhxyndpbioxtjqkg3w3jm.protonmail; t=1788690550; x=1788949750;
	bh=/Y/AqUbNVZkajcwTPWzScwSYtBpnkVaFtxCp5vUyZqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iWmmOaG8iMFcjILQLysmKvPr+kydjPoPIeDLLsJmCOoZJESNxmgrVKBGlirOAUmC/
	 c3DbbKkuyRKAgmDpLZnuVMEIWMybFCu/owtoCvGgB57JZAz70SpWSR64xkdwNLLSLk
	 MlnyFc7OpQUXhx/csslQipFm9JUbdh8g2ZBx5lqxVJi/dIhON36A8SczzwXswk0Lx1
	 c47pmbh5wJr29UBlZWe8whHe/U2UMDvKjkWDIln9Q6OipFd+TtXqIImsjFq5mdcKCj
	 pPfvUO1/kChaOv8lEqyN3+rMlHhHFfWmmzQWD1MAc8k8F/sBHZsYRWCy1ddkAwMUbc
	 9DbttZJRRToqQ==
Date: Sun, 06 Sep 2026 10:29:03 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH v2 2/3] rust: uaccess: migrate to zerocopy's `Frombytes/IntoBytes`
Message-ID: <20260906102826.202874-3-sagartaunk@proton.me>
In-Reply-To: <20260906102826.202874-1-sagartaunk@proton.me>
References: <20260906102826.202874-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 92510db30cc554a2ad5147f3f732f9f06e9d8cf7
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace explicit imports of `transmute::FromBytes`/`AsBytes` marker
traits with their zerocopy equivalents.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 rust/kernel/uaccess.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..d93c1a21f324 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -13,7 +13,6 @@
     fs::file,
     prelude::*,
     ptr::KnownSize,
-    transmute::{AsBytes, FromBytes},
 };
 use core::mem::{size_of, MaybeUninit};
=20
@@ -525,7 +524,7 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
     ///     writer.write_dma(alloc, 0, 256)
     /// }
     /// ```
-    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
+    pub fn write_dma<T: KnownSize + IntoBytes + ?Sized>(
         &mut self,
         alloc: &Coherent<T>,
         offset: usize,
@@ -599,7 +598,7 @@ pub fn write_slice_file(&mut self, data: &[u8], offset:=
 &mut file::Offset) -> Re
     /// Fails with [`EFAULT`] if the write happens on a bad address, or if=
 the write goes out of
     /// bounds of this [`UserSliceWriter`]. This call may modify the assoc=
iated userspace slice even
     /// if it returns an error.
-    pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
+    pub fn write<T: IntoBytes>(&mut self, value: &T) -> Result {
         let len =3D size_of::<T>();
         if len > self.length {
             return Err(EFAULT);
--=20
2.55.0


