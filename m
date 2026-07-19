Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD83327FB18;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784449743; cv=none; b=A0XwncOwKQkIi6Y9FEvIDbQ+BtNcgw0xOlLUTum3Hb09RNl+anCKztPH/+iIYjmkii5lKiE0yQTjeWAF0wZ3VC1N44lIapOmwU9L62BTRv1/2W23jLQ4wQgXNe6PbuKPdEjK502zbFq574iriIbhNIICGGR1rTma70NA93pwKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784449743; c=relaxed/simple;
	bh=w356AKSVzw89G5KERF3v244xUcNjW+WbgWaw4EEcsDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JM3A9rF1LaElTpb8Uj+afEOwnjNzFQSDPVJw4U7zwwObp4+IxSiBA7F1fTQEhRhHz8XuyXY/9qrbs5d6o63PKb0V0x7YHC/gW8z7QGxorjEyu6kxT3UO5j1WcZPUcYO/cEAWEIbiy5G8zapzKfS/GMQpS3pNboZisPxyo20xk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4ZezUI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4ZezUI+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 609A6C2BCC7;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784449743;
	bh=w356AKSVzw89G5KERF3v244xUcNjW+WbgWaw4EEcsDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L4ZezUI+1Jk2AwsmSEZ/1CVQLC/57YrOYoVOUFQjaLsYKj6x+R2B2sL+vXOqlH0iy
	 IwwVcOb/5oEe6HG3+C/wkD1ra3CkdI2WlibJ8a1uYGbTYAcOYNqZmP+BuiyEywZQhq
	 4KqA06E/P2pkh5MjYgTpY/Fr3CZi8Loj/iBho5cZfiW/dz+Wa4yIv9Mf1ZumOm716V
	 VOjgotv1MfvPxEaw+vKBlc1bJi1TZwRxULPhcsagU9UKoc7w0hOme2pjrYaEcoE7Ex
	 pWRRdwwkO0b6UBDa8cwrAUFWlARfERPWH/YrYN8m7XtRgyKyOW0ErbfFTchrgG43Fo
	 nFrAVIez7k2mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B8BC4450A;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
From: Josef Ippisch via B4 Relay <devnull+josef.ippisch.dev.mailbox.org@kernel.org>
Date: Sun, 19 Jul 2026 10:28:49 +0200
Subject: [PATCH 2/2] rust: debugfs: remove unsafe block from BinaryWriter
 impl for Vec
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-2-27ed30512e75@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784449742; l=1292;
 i=josef.ippisch.dev@mailbox.org; s=20260719; h=from:subject:message-id;
 bh=CHLkAGmhpDB+02B5seMmVd9PeGaJl3leJ/BeMIes9uQ=;
 b=GA4y8gJ9Lp+CKm1ldrBBbzxlQtX88nZkcj90Se4zx5sK2yv0jYd21V0bTE4GWsQ/6k2TgVmCH
 LdReWw0uFd9C6be6gtbKjTyAj2IvNX1IbSRclr5V3Po/bBc9SRYJDCD
X-Developer-Key: i=josef.ippisch.dev@mailbox.org; a=ed25519;
 pk=M4DnWHhz9yT9BkhXKzsmw6wTVrK2U1WBK0QiEjHoo1U=
X-Endpoint-Received: by B4 Relay for josef.ippisch.dev@mailbox.org/20260719
 with auth_id=884
X-Original-From: Josef Ippisch <josef.ippisch.dev@mailbox.org>
Reply-To: josef.ippisch.dev@mailbox.org

From: Josef Ippisch <josef.ippisch.dev@mailbox.org>

The previous implementation used an `unsafe` block to manually cast Vec's
slice to a &[u8] using `core::slice::from_raw_parts`.

Instead, the implementation can be implemented in safe rust using
`IntoBytes::as_bytes()` and making use of deref coercion to implicitly cast
Vec to &[T] as `IntoBytes` automatically is implemented on [T] when
`IntoBytes` is implemented on T.

Signed-off-by: Josef Ippisch <josef.ippisch.dev@mailbox.org>
---
 rust/kernel/debugfs/traits.rs | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ce030ff45a4c..4a24afbb8760 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -160,14 +160,7 @@ fn write_to_slice(
         writer: &mut UserSliceWriter,
         offset: &mut file::Offset,
     ) -> Result<usize> {
-        let slice = self.as_slice();
-
-        // SAFETY: `T: Immutable + IntoBytes` allows us to treat `&[T]` as `&[u8]`.
-        let buffer = unsafe {
-            core::slice::from_raw_parts(slice.as_ptr().cast(), core::mem::size_of_val(slice))
-        };
-
-        writer.write_slice_file(buffer, offset)
+        writer.write_slice_file(self.as_bytes(), offset)
     }
 }
 

-- 
2.53.0


