Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F91C5F13;
	Sat, 20 Jun 2026 00:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917177; cv=none; b=CpDypbTWPEDvW7g/5qk2wdx12FHt+HgISLaIVTz/D9lreUMinuW9UhI2h1eFyGB5+5GsNVZhjYd6jiOGSG8PyM7XG83sjbRB5EX9ws1I9EPQUIpCRReyi2/5RffZjT3YsSXRCtr89ZUsVBybvSO0uKZT1DFpAr0wigEW/QNL7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917177; c=relaxed/simple;
	bh=dnW6VQ4an8pd67b9qv878swigQo5w4BVr3DV+XQh0wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S696tkBfiyhRs+2vZhkUKeNBkCZEESOpKIVS94iKGWAOiY3UeVDy0zv0jl4xi0cAZdGHzyzcufjp44/B/7VydRRTfUvV7yx68QWFHy/ST+UTlSIb5h4U2h1mV3QvhcUXhIrs6oxEY1j+7pU71utiVuDm2SuhkmC+sDnWKen3+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqJEeNUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqJEeNUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62D61F000E9;
	Sat, 20 Jun 2026 00:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917176;
	bh=AqEc8Skog6vIUTw0jxfNwWfNAkCPrlqbkNpROZYy0V0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iqJEeNUq03PKUkUUgju2SBLSTmijw1AyLdRY/vRBxOxLlZfO00WazbyS3X2hIBqGn
	 hlkJ7g9c71axynHBMIIO20F0S8YYn6Lrno4CHqi9bfcwey98M0TGmxOMfyyTolDjbk
	 J7V4C8xhZrNciHmWfEUGHKD4r8Ssb1gv0fP3BX7wVzUrDTPtWW9EEElFaaXClChfdA
	 RqLVTOrxhXYJgSPvcehZdLiBtYcjZgTOn/vPcQx9nFFCvbabbOKIN4DEYPfxp0jt7V
	 fP8sMNL+No78sOpHMr9TEIbuwiA1R3gJgPHJh/MTiUZDac8bQWNit+6vvhloC7QCJr
	 fwlw4zVVjhWfg==
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
Subject: [PATCH v3 08/13] rust: drm: add AsRef<ParentDevice<Bound>> for Device<Registered>
Date: Sat, 20 Jun 2026 02:51:20 +0200
Message-ID: <20260620005431.1562115-9-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620005431.1562115-1-dakr@kernel.org>
References: <20260620005431.1562115-1-dakr@kernel.org>
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

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6fdd9fb1ae7f..885077e270eb 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -371,6 +371,19 @@ fn as_ref(&self) -> &T::ParentDevice<device::Normal> {
     }
 }
 
+impl<T: drm::Driver> AsRef<T::ParentDevice<device::Bound>> for Device<T, Registered> {
+    fn as_ref(&self) -> &T::ParentDevice<device::Bound> {
+        let dev = (**self).as_ref().as_ref();
+
+        // SAFETY: A `Device<T, Registered>` guarantees that the parent device is bound.
+        let dev = unsafe { dev.as_bound() };
+
+        // SAFETY: By the type invariant of `Device`, the parent device is embedded in
+        // `T::ParentDevice`.
+        unsafe { device::AsBusDevice::from_device(dev) }
+    }
+}
+
 // SAFETY: A `drm::Device` can be released from any thread.
 unsafe impl<T: drm::Driver, C: DeviceContext> Send for Device<T, C> {}
 
-- 
2.54.0

