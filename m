Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9E368D65;
	Sat, 20 Jun 2026 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981436; cv=none; b=I8pmyD/M3N6nnnzXRLsuzgYpEgHNiHBoXgmIess9ELt0ZehKrfjViiMD6yHcn8qhMsSYPgxQIAqQ2uHSLkAZC61KvzC9ptlN5Is4OwkyAjUmp3OnaNavmdByPeRxerGULwhg60Z1+gXSA9xe6kYXFrEPNBvqtBy4/qldf8ojJz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981436; c=relaxed/simple;
	bh=ZKa3WOGm6mJELSUEHmQE/4kZ5H+XIRlABnKEkVs/frw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN8nEPvitQG4Z+izK7sQlNLXcq9dv2fAnb10+xmeP/7m0LxrPMehVkSezZkitX2aoR9Z1tMqXByZqW1jqSf9SgtpBil6tzFdcBzXD2A0ecS5gbRK5WqFmsO/MQRsDcmg9blg5WWc7gc/elm3gaaVvc9Kmv1XK4cAMUaul6eTszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByBhZ6dp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByBhZ6dp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134831F00A3A;
	Sat, 20 Jun 2026 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981435;
	bh=KFJ9mabhkd7kILJb6BTUl2kHITK1D6P5rN1TZpv75Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ByBhZ6dpqUTglBuEc9vlyV4gEiMkr5+pwsAaWM1pOitCzCmqtwSSWEQ9myXCqewLR
	 U8wlMJEBhTwN6Zd1V+L9iJ0SmWzk3k587XfFv4WgFbbtYo0lPTSDLjgiJD0Pp0m41y
	 0/IzAteYtMbCA9iepQ8+BnKVoRZSEMIxzDPBC0r8ALzu1Zi/F2UEGxSgIqbzYQjTHE
	 uS6kOn4fOQlY3xxPTS4Ww5uiECDxJX21Dp6LX/9QW0oWIx6HQwl1o7T/wxgFBvFyoG
	 Ygzue0y/322EG/pNomBGERfDuDDyjCLmMgoxuSj6FSD/AcprvoyAAGakbmxnYMllsG
	 gAppsLuRC9Rxg==
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
Subject: [PATCH v4 13/16] rust: drm: add AsRef<ParentDevice<Bound>> for Device<Registered>
Date: Sat, 20 Jun 2026 20:48:06 +0200
Message-ID: <20260620184924.2247517-14-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620184924.2247517-1-dakr@kernel.org>
References: <20260620184924.2247517-1-dakr@kernel.org>
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
index 45bacd7b227f..8f63276c9b62 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -462,6 +462,19 @@ fn as_ref(&self) -> &T::ParentDevice<device::Normal> {
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

