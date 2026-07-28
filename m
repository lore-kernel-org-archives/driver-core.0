Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8B3A7F51;
	Tue, 28 Jul 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259882; cv=none; b=ZqnYbCidsN4pIeQB6Gyre15rGJWu0URrlOwtfGxwA21dXuURXt4Up8VUALb/6qqKmlhnB50beQqaUAHGEVBJq6CIxM4FW+L6QZe/z6Li9POTcyB9F+HX0ZUuSb6ugLz1Uuhy7ugA4ePRGpk9ksOsRlcOA1rVqaKJQjsMkV5PirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259882; c=relaxed/simple;
	bh=9LGqbq7sh8ih/wSY8wPW0rsrrOT4pSqHt9qMWeX4J5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4xJtpMmgp3mzo1ruPgwRkDXGn+4SDX3DWlfCxpioGum1k0F1G7uLJ7J8aU5eZzrvxPFYzYnEkz8qViN9CapWUw7pzEKHIclwPqH382/JFAnG9SDFN0PS+Z7x+it4Gzx/sNpFLXttb8AmFk9uTyhqDd5qVkEXKeg9+KnopYSkc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5CeSgBv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5CeSgBv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 689B9C2BCF6;
	Tue, 28 Jul 2026 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785259882;
	bh=9LGqbq7sh8ih/wSY8wPW0rsrrOT4pSqHt9qMWeX4J5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e5CeSgBvDqQ+G4UGT2wSCXTnQNalN9WF2On/knDqtnak5oUp1Vyum3X5RPOfzt34/
	 K+6SbsQ31MDh9v7iptAJwuB0lPNzoMvhUaY4N+op/7QxExtY4nAzRD5LBBMU1W+J5C
	 sI0pYBmgWKxzrCnBWjQU6yqrjQc983LFMTQiISX/W3HFofmaZa8pWwGjoR1Mq+bQZY
	 F39vrTxy2huENwL79C9Y7TjD9e5HfEJEU2KNtK5YVxqLptOMcEAIeGfVc1hdQHJEwP
	 33L9pcJ3LAFJxJSG0YVzwO2CP1O3HXyDk6DYPnFhVIDe7wsre6yHwPT9XR5knx/Sws
	 4cH4FucJztzxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564A5C54F55;
	Tue, 28 Jul 2026 17:31:22 +0000 (UTC)
From: Josef Ippisch via B4 Relay <devnull+josef.ippisch.dev.mailbox.org@kernel.org>
Date: Tue, 28 Jul 2026 19:31:20 +0200
Subject: [PATCH v2 2/2] rust: debugfs: remove unsafe blocks from traits
 impl for Vec
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-migrate-binarywriter-to-zerocopy-intobytes-v2-2-0a4ec1d3ead4@mailbox.org>
References: <20260728-migrate-binarywriter-to-zerocopy-intobytes-v2-0-0a4ec1d3ead4@mailbox.org>
In-Reply-To: <20260728-migrate-binarywriter-to-zerocopy-intobytes-v2-0-0a4ec1d3ead4@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785259881; l=1990;
 i=josef.ippisch.dev@mailbox.org; s=20260719; h=from:subject:message-id;
 bh=bcAB+rSJxo9ZroXVfXApmlpdpJQVs1F1L0YRpjVbQJo=;
 b=cIaBDwtw9P9BlrpZZMIhZPxeVrxUAQrsh3v/wXuylsp42yoimMv9UCHwzftLYgybgje1LCjp8
 InD76OyzfrMCU4XDG3FVgCHeP/35GRzdMIcxhADEikC5S45vChJQtTi
X-Developer-Key: i=josef.ippisch.dev@mailbox.org; a=ed25519;
 pk=M4DnWHhz9yT9BkhXKzsmw6wTVrK2U1WBK0QiEjHoo1U=
X-Endpoint-Received: by B4 Relay for josef.ippisch.dev@mailbox.org/20260719
 with auth_id=884
X-Original-From: Josef Ippisch <josef.ippisch.dev@mailbox.org>
Reply-To: josef.ippisch.dev@mailbox.org

From: Josef Ippisch <josef.ippisch.dev@mailbox.org>

The previous implementation used an `unsafe` block to manually cast Vec's
slice to a &[u8] using `core::slice::from_raw_parts`.  Instead, the
implementation can be implemented in safe rust using zerocopy's trait
functions `as_bytes()` and `as_mut_bytes()`, respectively, and making use
of deref coercion to implicitly cast Vec to &[T] as `FromBytes` and
`IntoBytes` automatically are implemented on [T] when they are implemented
on T.

Signed-off-by: Josef Ippisch <josef.ippisch.dev@mailbox.org>
---
 rust/kernel/debugfs/traits.rs | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index b794f7dd7e14..b295f8420abd 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -153,14 +153,7 @@ fn write_to_slice(
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
 
@@ -261,17 +254,7 @@ fn read_from_slice_mut(
         reader: &mut UserSliceReader,
         offset: &mut file::Offset,
     ) -> Result<usize> {
-        let slice = self.as_mut_slice();
-
-        // SAFETY: `T: FromBytes + IntoBytes` allow us to treat `&mut [T]` as `&mut [u8]`.
-        let buffer = unsafe {
-            core::slice::from_raw_parts_mut(
-                slice.as_mut_ptr().cast(),
-                core::mem::size_of_val(slice),
-            )
-        };
-
-        reader.read_slice_file(buffer, offset)
+        reader.read_slice_file(self.as_mut_bytes(), offset)
     }
 }
 

-- 
2.53.0


