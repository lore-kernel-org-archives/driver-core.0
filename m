Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA811BBBE5;
	Sat, 20 Jun 2026 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917173; cv=none; b=Fenj2ytI9b7rCm0qxS4m7UX6ox9bfSKXrnE6GBhsf6znc8JVIKjrttxyBiBt3mMGG9rcvHWK7TOjRxz/KVhkSVtIQDxNyCO1sr3nKzSMyplP18CeoockMxplio5qk3UGvn7Vd60P4A6N8W7JoWvcp2vsSwK9r50s31EtqVXeLME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917173; c=relaxed/simple;
	bh=RKqR98xWFc4ytBCUdb8B6e/B9CQmF1OYv6HSgkV8R+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/BGgExbeiT09OxG30e/IlKIO2gVmRLSYPUrzb/AcfIqgXnA+0fMQowyqrwEfPqXgbZo7oHK03elNbZWKMiNngdAiHMV+jDLVSAN4ASLY3/2HAHJWa8ISRffePdVE/ssQ+84U+9YgxQgxPU492hd9lvA9Zzh5pm2i+nNebYpfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2sRRcpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2sRRcpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E971F00A3A;
	Sat, 20 Jun 2026 00:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917172;
	bh=+qBowXS5Rd+9eAOyYfhc7TZnWiUGUXYMeAN8Z34y/WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V2sRRcpMRaepVPI10Hl3anm1/n54Dwuurv2nh8ccnPMQ0HKOJYR/BUph5t7HsAJTG
	 vLpkieLoUsgMh3LI/In/X/OZ6OSWl0hP2/ogv+rDmptp8/wZSR4yvUuCY1yVsaNIlR
	 BdnyhUjmO7TFjchZSNRHncNMvTFCUZTLiTsrqJCHzw/MrHE1lXxSAt9fp9yE3fWk3C
	 5EOsOimtbeWm1nd3VCpU70cirKDV4znWdJMMVy6n+X2cAzObQEYyJr94ZFNYiEHMcA
	 UFMRKzbXTdzYESy8aV325Ebyq6rWrOWq5DCdve5XlWO3g6EDDLdZVvDGSDHN/3BAWm
	 plZOUHJDbi4mQ==
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
Subject: [PATCH v3 07/13] rust: drm: return ParentDevice from Device AsRef
Date: Sat, 20 Jun 2026 02:51:19 +0200
Message-ID: <20260620005431.1562115-8-dakr@kernel.org>
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
index 86a7fca1d33f..6fdd9fb1ae7f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -359,11 +359,15 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
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
index 5152a18a8312..9ba7dc3a7a97 100644
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

