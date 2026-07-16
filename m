Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C642B33D;
	Thu, 16 Jul 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211972; cv=none; b=H+1NQ/ZQ8es24gmvy818kuQ08logC9SWwTj1rLpjFldieAKBMXfxt2VnU98kHLSR22ywtCaap7PJDMUjH7l4TOniEl58linLdAugmLjMB9FO1iEOPvx2efxxd62C3v7xVlvT8Z0vdpsY1sjH7uyusgBVRr0EfMDe9iWUmjSoIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211972; c=relaxed/simple;
	bh=ulMVGsovmVAPFN91/GyZSCGLGQkRJjtYHQ1bNxtS51g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kbmv5ZhXIqjfsRCpT5CDkgNhP4rLbK29JBKfGOt7ky5b/fmeJY6SC2/j7gJYigFHl0d200gVdOs/16FxXK/scL11nWxpFQXe/j2LwG1+bJGuoDNnKv7r0lrWzX0Fl5Q6z+I6Zr9HCQsADT3YHeMewcVU8C1ji9xN+PR6P2Mk7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCJhQFE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCJhQFE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE3A1F00A3D;
	Thu, 16 Jul 2026 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211971;
	bh=dmMpkIr0sbIJVy9wvQ7Wf9oRTb2hJTI9MXcBUx5k8Tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=PCJhQFE/DV7ADE1bcScyLgjJwZxfJG3ka0INRryAWNnkVsuTxNuAqvNB+AUxUUKJv
	 S05XNoZuc0j6suam3Jb/vU6WKPIZMXZNbYdDXpSe/ZDezpsep6QU5WFyMDc5YMdU9+
	 UpJA8+JxSXjt7tJ9lyq5Lq+4Vi3CqvB64fXXyj/p0cKcQFAuBqRibIOKOEi9hDk9zY
	 VZTKCZChX7Ntu+KyPdrXeLrYBolKQQ16iHKLeINr9cwa7C6ZS6tzM6J3/HHSl/Vy6L
	 zefNWDxZ3M6o38J3NYqqfU2Bt7ZXlogNvdW+ujb4Xu2Ay5CmXZTJOhNs2VgbIzKQKe
	 kUdwkLv1PZ2kg==
From: Gary Guo <gary@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] rust: drm: fix non-const `read8` in unit test
Date: Thu, 16 Jul 2026 15:25:44 +0100
Message-ID: <20260716142545.3622278-2-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716142545.3622278-1-gary@kernel.org>
References: <20260716142545.3622278-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

With CONFIG_CC_OPTIMIZE_FOR_SIZE, the address validity check in non-const
`read8` invocaction is not optimized away, leading to build failure.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/drm/gem/shmem.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 580e0808d6c0..a687d46d170d 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -688,7 +688,7 @@ fn vmap_io() -> Result {
         // Ensure the ordering in memory is correct
         let expected = 0xFEDCBA98_u32.to_ne_bytes().into_iter();
         for (offset, expected) in (0x20..=0x23).zip(expected) {
-            assert_eq!(vmap.read8(offset), expected);
+            assert_eq!(vmap.try_read8(offset).unwrap(), expected);
         }
 
         Ok(())
-- 
2.54.0

