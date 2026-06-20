Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE637368D63;
	Sat, 20 Jun 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981431; cv=none; b=pYmDOlh/yHYAfm0zww4QRhrzQBRK6BjM6pNVBG9/HuOa9uePwnyf2B+sGy8dA3a7uZp4uWwt8OnXhZO03Q/3Xwwl2vcVNGN3hbTwqiz0HUkqULZ/DZsjy7HwH5SqMoJeAQKtU4K9vfwWiQiGA23fRQvF9b7A8cVDPsdLjLBwZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981431; c=relaxed/simple;
	bh=A9vqCJKpTLT52/MqIzBAbVKwhNe/8oABCvxB2y5SySM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3j67DjeinH5IfEe7nVT1dEy226Uq2KA3BqNW9mwJLtZT3T0GwH+2KKB3ikO3tyAzA4LJ/zGCMMUCpK0PK4EHNMByU1zSOSBJkiRprOZDXdEJG7DVyIZpIQjZWD53rX+aOjeE/6+CGPwtV34P158oBvQjb/BB0AhamyZz9SkEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efg3RXbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efg3RXbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ED11F000E9;
	Sat, 20 Jun 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981430;
	bh=RI7C8lOclKTJQ22iLDXfYwPAI8+fvVSqWisDXVjNpfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=efg3RXbTCHJotK5J7J9h2/EJ1+B+WFVayYWaizldQwWKt0M6dxyp1GpgFgkeiN73d
	 yzoFW4JM8zRZCfxwgyjmKGJ5nTvre/qxbj3V9BdyMWYm7rtQJ0y5+PNvw1j99vmRFu
	 dQzx5c6E+e1IFq+tjhSZZ0qwxUjik9Vc2EbUvRZaytWU+11VWs8up+KyeXRaJ+Waai
	 cQ1AvLwMGX0feJl4jvzQ2vd4z43NmxLnAvf/s6f2zHYZx2YUJOMcknT+iErixE+y8p
	 IdSXsVGTOG70J3f7CHkEjprTKiscnc0GKYls44y6ZYjrwZnEMiGVb8oe2hJujni964
	 HZ3aBjkmjMOLA==
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
Subject: [PATCH v4 12/16] rust: drm: return ParentDevice from Device AsRef
Date: Sat, 20 Jun 2026 20:48:05 +0200
Message-ID: <20260620184924.2247517-13-dakr@kernel.org>
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

Change AsRef for drm::Device to return &T::ParentDevice<device::Normal>
instead of &device::Device, and restrict it to the Normal context.
Device<T, Registered> still gets this through Deref coercion.

This provides access to the typed parent bus device rather than the raw
base device.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 10 +++++++---
 rust/kernel/drm/driver.rs |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c32cc0f0eba0..45bacd7b227f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -450,11 +450,15 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-impl<T: drm::Driver, C: DeviceContext> AsRef<device::Device> for Device<T, C> {
-    fn as_ref(&self) -> &device::Device {
+impl<T: drm::Driver> AsRef<T::ParentDevice<device::Normal>> for Device<T> {
+    fn as_ref(&self) -> &T::ParentDevice<device::Normal> {
         // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
         // which is guaranteed by the type invariant.
-        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
+        let dev = unsafe { device::Device::from_raw((*self.as_raw()).dev) };
+
+        // SAFETY: By the type invariant of `Device`, the parent device is embedded in
+        // `T::ParentDevice`.
+        unsafe { device::AsBusDevice::from_device(dev) }
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 3cda8dceb498..ceb2829985c7 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -170,7 +170,7 @@ pub fn new_foreign_owned<'a>(
     where
         T: 'static,
     {
-        if drm.as_ref().as_raw() != dev.as_raw() {
+        if drm.as_ref().as_ref().as_raw() != dev.as_raw() {
             return Err(EINVAL);
         }
 
-- 
2.54.0

