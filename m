Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8911F7569;
	Wed, 25 Mar 2026 00:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399173; cv=none; b=gOupWrXdcG19+E2XI+BUVmFMiIN/ysCcu4FGD7yKjM7FRneFU3yYnS8kc0U4AnwQtOYrGUSJQHWES6NCwKWN0P/HIBCmCiN9f89KTVhysTjn3uMeLOFRy8JbppCmNkKUfDcLY8KCHNZ2Ym7dW+N/dxi45I82S8mf+bnA8sTKbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399173; c=relaxed/simple;
	bh=+mTb7igADfQv5dHN/X3TmqsYTOT3vg9UdFFcQL8Vmco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4UELMsXBYOLh7g9LkfI3LwO0iw5He/sZubGG3oCwJxRtAzuwHfttxWPGRIAGVsG8MWLVXpbld5UBpTnfIji+5MyeQCTf7h02bs1oZTpuppsqYtk5sFoSDIL8u4kfgkv+Qm7vB0tKo2aEAthu4+Q6Wz+0m7JV3HagSQt2WbUtoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I36ewqRd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I36ewqRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FB8C19424;
	Wed, 25 Mar 2026 00:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774399172;
	bh=+mTb7igADfQv5dHN/X3TmqsYTOT3vg9UdFFcQL8Vmco=;
	h=From:To:Cc:Subject:Date:From;
	b=I36ewqRdAS4Qczc8+Xl1aqOZOcf+kdLzZrIocpHb4SHux8H+QeqLgwbQbLYHFpdtN
	 o5WobSL9tQO9tAbob0GBp3UHo7Wa53spMTxbA1NMZMLqjamQuTTovBuGIqzZNkJDCj
	 zfW7CIhX+EkmIWzneiYSlzuFyaUXeBsS0KJZEUvLVjea+YpE4w61CwIRqde84GNUkk
	 tAZYa9M2t3pZxqgC0wzDpNljxD8eyul8hStBkSjtP5ZVUSkZZGCSywuvERPIWqawl8
	 OUjuuc8XdlmTh+tFru/pISEj9pMOpUhN9leDTnag5i/umemdIrggXhN8vy1MjMbkP4
	 cOzHDkV7EWtoQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	aliceryhl@google.com,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	ttabi@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any Coherent<T>
Date: Wed, 25 Mar 2026 01:39:15 +0100
Message-ID: <20260325003921.3420-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
and size(), which work for any such T, so there is no reason to
restrict it to byte slices.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/uaccess.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index e26ef90ba8ad..6c9c1cce3c63 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -12,6 +12,7 @@
     ffi::{c_char, c_void},
     fs::file,
     prelude::*,
+    ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
 };
 use core::mem::{size_of, MaybeUninit};
@@ -524,7 +525,12 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
     ///     writer.write_dma(alloc, 0, 256)
     /// }
     /// ```
-    pub fn write_dma(&mut self, alloc: &Coherent<[u8]>, offset: usize, count: usize) -> Result {
+    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
+        &mut self,
+        alloc: &Coherent<T>,
+        offset: usize,
+        count: usize,
+    ) -> Result {
         let len = alloc.size();
         if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
             return Err(ERANGE);

base-commit: dff8302ca1d0e773c90dbeeb05e759f995c95482
-- 
2.53.0

