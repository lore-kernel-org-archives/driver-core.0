Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884B1A4F3C;
	Mon, 20 Jul 2026 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575334; cv=none; b=WePM/9F3uOvWFU3/dBwc1nObZfJQpzHbr4cbGcV/PboMqqA4UdeMdt6czEk+G/56HxLDrppauhGc2KgQJA/KlYfr1Ub3jRJVJXpS15oFhCUFCPnqQPcFLazuPwh9cS9i2LeVxifO586XQpDaquwJ9ljaDnCeZvaxayH9k5cDJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575334; c=relaxed/simple;
	bh=RLKLNwfo7o3vXrN/SD5EFpIDimBZI9C9UYFzRN+Ka6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ajH9i98qs7jXRZR4lR1qVPHM+GcaP9dnphtP5kM42SBG6baKt+aEXWioFceBkhCfB0oLh96C/txY6VJ3CYvkeUUIvzu7iI0UAEjflJu0sYWAVUL2e0tLGkwFy0guKwkYRID3/1hIBw5iGLPQTlcCv8v/jNOIJZuL3ZqRuxsMfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoWI7BG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoWI7BG5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07130C2BCB8;
	Mon, 20 Jul 2026 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784575334;
	bh=RLKLNwfo7o3vXrN/SD5EFpIDimBZI9C9UYFzRN+Ka6U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OoWI7BG5DyAxua4zKfNQAZQA+fzD+5bGlDglwZxjNy0Pu5MYTAeEQrcGvG9rRfefF
	 vsa2I8qAkVjfoYfhAC/7bzHPn7YN7WdXBRKfcWlheYx6kpqypFl44zr/UlJd0DgWu+
	 o6WwRTXq2P28W5fbb8QrM+AtTmCRBVnCY/tN2ONQUmvLYnP4xVICDmX0Urv3fbexwJ
	 Q+ZDLQQl0tOvOat4ErgyeEsayE7KIQFzKopG2bXURPVdiDTNFoVHNt1zu1PBBJl5pD
	 lG769TtL+CgWbJCjr5yQ6diU5o2QsDGRpY9hSxNfrUxq0axGtX2bac9qh56gpjkaU5
	 hTX/7pgV3n6kQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D395DC44529;
	Mon, 20 Jul 2026 19:22:13 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Mon, 20 Jul 2026 21:21:39 +0200
Subject: [PATCH] rust: dma: return zero for Coherent reads past EOF
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCMBBFf6XM2sEkgq9fkS7ymDYjmMgkFaH03
 03s8lzuOSsUEqYC92EFoQ8XzqmBPgzgo00zIYfGYJQ5q4tROPEXw8uiz5GEUkXKEwYV1NXfNCl
 9gqa+hdrvn32MO5fFPcnX3uoPZwuhE5t87FMWnjkdZSkVd3Pbfi0LylOcAAAA
X-Change-ID: 20260720-fix-dma-coherent-eof-d0d08c91e013
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Timur Tabi <ttabi@nvidia.com>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784575333; l=1249;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=ePXYrWvX1ZJHBuWoCGi8RZ5TS9lrAyqgkzIq9B/HEy0=;
 b=NfHD8xfI5i55YLfCBe7tqm0G8oZ4a4geTGO9kWWsJ9qBfmySQKlGogGfmzkXta8XZv+0kbUQ1
 ub/u/f6nzNoCPyTyLbgzeweY6Nz3e34MrFIC8SUBDaSWDuYPTNto0yq
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Coherent<T>::write_to_slice() calculates a zero-byte copy when the file
offset is beyond the allocation, but still calls
UserSliceWriter::write_dma(). The latter rejects offsets beyond the
allocation even when the copy length is zero, so a debugfs read past EOF
returns -ERANGE.

Return before calling write_dma() when the offset is at or beyond the
allocation, matching simple_read_from_buffer() EOF semantics.

Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u8]>")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/dma.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 200def84fb69..36b72fb9ab46 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -1005,6 +1005,10 @@ fn write_to_slice(
             return Ok(0);
         };
 
+        if offset_val >= self.size() {
+            return Ok(0);
+        }
+
         let count = self.size().saturating_sub(offset_val).min(writer.len());
 
         writer.write_dma(self, offset_val, count)?;

---
base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
change-id: 20260720-fix-dma-coherent-eof-d0d08c91e013

Best regards,
--  
Younes Akhouayri <git@younes.io>


