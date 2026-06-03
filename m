Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371C346FAE;
	Wed,  3 Jun 2026 01:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450096; cv=none; b=ANlkkyDgSF4BXD/rXw3BDQQrP2k6U7K7MzOEH8KpEWlN5UhiKDtAkmMk8kkupab4EHylX8WyE9b3Tyxw9sJF5SQeWaAIdoXuvHA+/LoMBmEeSbx5jtnDdq6ZR+eEWKWUPQn24wf9WGeX7kGoyvxSRrfpQ7erTJAv6K0qy2hbL00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450096; c=relaxed/simple;
	bh=sd/UQLjD7pIzfJougflzjbLaSZ3GmrcgpnCNnJC4QKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/BEJapMjV5ijW/OQ12cDWPhiAm61wqbbySmlV8VIBnpBmpLudlH8bBVQeb2rxQVnjx8HFnHcEONACgJUTfZCR+W5bzs4gEPuc2FBab/c868GpgPFTCXAeQn08fzvP2y5bDXvfE/Ma5Vc/F0LEeZVahzYxioHt6Rc1wsEXgn97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfpNCI45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfpNCI45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236CD1F00893;
	Wed,  3 Jun 2026 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450094;
	bh=VZ54gvz6OwwVKxHHJn+g3dMr7wXlQCIuVETm9dQ6AQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JfpNCI45aZl1VcwG2vrWYWX61zPKKcTxktlBAqEXr8wrzisf0bnuekjwIGxF/v8AP
	 ZFu3UH2+uOqvi4GIHK4pYt5j//frkixTUhBoWUIBYeWCg7scbchb9F0Rwh9hZAk0mD
	 2c5me5y3nB0TXWBMeY8NB5bMkNtK+E6EVdBOMMfM+s41Z5zDr4ZjN8GQDDdFLYxW1u
	 8Ba6mrK/DzRRVRi8xGB7PhWM7nR2y0yBbhdpBPCzrz6cZXpb7RKImyK4Ni4/Vige1G
	 abA3DCMT2TJRUiBPzgj7h0NU0FJIoUNlVOjYJto/GjqRGTpg8Bx9cvbxWb+jkolMQL
	 z/rVDu0h9tkzQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 4/7] rust: drm: Wrap ioctl dispatch in UnbindGuard
Date: Wed,  3 Jun 2026 03:15:46 +0200
Message-ID: <20260603011711.2077361-5-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603011711.2077361-1-dakr@kernel.org>
References: <20260603011711.2077361-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run every ioctl handler inside a drm_dev_enter/exit critical section via
UnbindGuard. If the device has been unplugged, the ioctl returns ENODEV
without calling the handler.

A never-called closure anchors the driver type for the compiler by tying
dev's type to the handler's first parameter, which the compiler cannot
infer through method resolution and associated-type projections alone.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/ioctl.rs | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index cf328101dde4..8ee6e8ea0ff6 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -87,7 +87,10 @@ pub mod internal {
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
 /// ```
-/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+/// where `Self` is the `drm::Driver` implementation these ioctls are being declared within.
+///
+/// The ioctl runs inside a `drm_dev_enter/exit` critical section. If the device has been
+/// unplugged, the ioctl returns `ENODEV` without calling the handler.
 ///
 /// # Examples
 ///
@@ -134,7 +137,19 @@ macro_rules! declare_drm_ioctls {
                             // FIXME: Currently there is nothing enforcing that the types of the
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
-                            let dev = $crate::drm::device::Device::from_raw(raw_dev);
+                            let dev = unsafe {
+                                $crate::drm::device::Device::from_raw(raw_dev)
+                            };
+
+                            // Type-inference anchor: the closure is never called but ties `dev`'s
+                            // type to `$func`'s first parameter, which the compiler cannot infer
+                            // through method resolution and associated-type projections alone.
+                            #[allow(unreachable_code)]
+                            let _ = || $func(dev, unreachable!(), unreachable!());
+
+                            let Some(_guard) = dev.unbind_guard() else {
+                                return $crate::error::code::ENODEV.to_errno();
+                            };
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
-- 
2.54.0

