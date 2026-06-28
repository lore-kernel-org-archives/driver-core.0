Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC43B14A7;
	Sun, 28 Jun 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658518; cv=none; b=KdjI0IThj9ReV1Qv4+EUow519Spf1E5C+KkgcOmfTgrylbBh9/aCJ9cGLw5C8tFGUVHFPwpfplRJZ6WDeAqEQO4917+SpQts+7DzVWmK5tA/OFM9IG42HWebQCjzjkMm4WMJ+gWavDLFLHHgnKX12nvKbvUgGgFOGo55gZ4ktXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658518; c=relaxed/simple;
	bh=R3RgpR2+bwxsY4+jJM/+ksLjrhbYD8/GOELEVDOKbi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WG4xt3e+wDnSev7InV5G059dfMePuovxOMGmERdBpZaG4JxUoTTSxZr3wrEz2BETILwJh1dmPKFx5EsM1uPEjE+aU91RtTGY5tTbVTGaiOVFxvzEdmKl8JYFxm0DWu2ZN7k3hfNkor7QwezowEEJBgAiBt3tFD3F88/4k7ArKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDlGv1pC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDlGv1pC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2EF1F000E9;
	Sun, 28 Jun 2026 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658517;
	bh=EuQFcJFCWZMYRlpOuk9HxAnHJvK1PSHgFF7m8oW6o0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZDlGv1pC4x3h3ixRZZqmMmOZf2qE46a+ZGSJEKXNGy4PFUoWwq65ACeeznhKfKxla
	 DYL5PdYbTRk5/Rv7oy/39XTbVuksOsQE/oZTFyrwjwEctkQdM1lcaClu94uaf49Td5
	 oVdEOR4iVhr2+4FyKxET6oclvyE/u8xdflSQA2xhXRzi4bVA6NirIM+KkEdKWeUC+5
	 RE3t/foEQpcE+CLy+ork2S/KemXKAxCI86igs4CvYWo17TDvs3L1ewk9dsiO+t3Qed
	 E/k0phUNf9BLlD/XzDAggDsXUnIBSabZLlVzx9eR3q2MGN3nhg0zI3j7yYcaHOygTJ
	 aN+TuakyMwjOA==
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
	boris.brezillon@collabora.com,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v5 15/19] rust: drm: add AsRef<ParentDevice<Bound>> for Device<Registered>
Date: Sun, 28 Jun 2026 16:53:35 +0200
Message-ID: <20260628145406.2107056-16-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement AsRef<T::ParentDevice<Bound>> for Device<T, Registered>,
providing access to the bound parent bus device for registered DRM
devices.

Since a Device<T, Registered> guarantees that the parent bus device is
bound, the conversion to T::ParentDevice<Bound> is safe.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 187c57cab736..5e8b75dab0a6 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -462,6 +462,20 @@ fn as_ref(&self) -> &T::ParentDevice<device::Normal> {
     }
 }
 
+impl<T: drm::Driver> AsRef<T::ParentDevice<device::Bound>> for Device<T, Registered> {
+    #[inline]
+    fn as_ref(&self) -> &T::ParentDevice<device::Bound> {
+        let dev = (**self).as_ref().as_ref();
+
+        // SAFETY: A `Device<T, Registered>` guarantees that the parent device is bound.
+        let dev = unsafe { dev.as_bound() };
+
+        // SAFETY: The DRM device was constructed in `UnregisteredDevice::new()` with a parent
+        // device of type `T::ParentDevice`, hence `dev` is contained in a `T::ParentDevice`.
+        unsafe { device::AsBusDevice::from_device(dev) }
+    }
+}
+
 // SAFETY: A `drm::Device` can be released from any thread.
 unsafe impl<T: drm::Driver, C: DeviceContext> Send for Device<T, C> {}
 
-- 
2.54.0

