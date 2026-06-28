Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0863B3C08;
	Sun, 28 Jun 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658514; cv=none; b=XWB0hIY5OVMOgNZ3C4ort2kQU48E5M0bovLVHGPYP1Gqan9EEncXyDLGSygmLEtmA1UwU1wAJlxFGXzyRwYXvxBdsiqM+7Bu4pCEiMPcPFCl1DhFtKfyGmwO2tolqocmAFex2X79Nc0M9f8kTkTXvGziVyKUPDl7XOSxkIgyVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658514; c=relaxed/simple;
	bh=630k8nH3IRoB18xbfC400bpMtXmO/Ue2GgOpV7PZ654=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i02XS4aez/odYbbQZoCI0JuICBPDQ8SwbhX8f5VqHaCJcr89AuFDWtShAp/750jGgRwfIY4mC6wfh5Nxecplg6BfN9mlJL6rHv2QOhFo9jKEeaHRzpqu9jAAdl5Esmiq791hynxJk9Hx7lUOXFtjMleGUv/N1LidzBeSQXjSlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2HMf0PL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2HMf0PL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0701F00A3A;
	Sun, 28 Jun 2026 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658513;
	bh=nPOVaIzSWIynmaD8HD/iLpR5ySkY49Gf5DJPa2hASVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y2HMf0PLXig4iiA/36LTKI8tAhORf1IBx4npErpxwEvZ2O4yz8EdgS2lffCc9mggb
	 IKnCxbf0zoPEz3Fv4uFLvk6HRocTZDj5GlbeXc9Imi2LvPcAgcce7aZqR1rdDwNcLg
	 sQKG+g0HxtFPjCr/bs7Quyumdcoa7DC2aXuPVLEF4nnL1TwsnfWqyZv8nvcQcxdSB2
	 0FY02Wx3vnkM9nIO/WLeBkXHiGPrfKziN/fw4bQbIaYMokpAWF4WNkYwCnQru7DsOH
	 s+ZVFy3BSGuJ35TyeBZF91G/syXNQOZ0oJj4CNFyUFVYPe9rRJ4bIelcxzdUfBYG/4
	 uTlCYTfZCoK8g==
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
Subject: [PATCH v5 14/19] rust: drm: return ParentDevice from Device AsRef
Date: Sun, 28 Jun 2026 16:53:34 +0200
Message-ID: <20260628145406.2107056-15-dakr@kernel.org>
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

Change AsRef for drm::Device to return &T::ParentDevice<device::Normal>
instead of &device::Device, and restrict it to the Normal context.
Device<T, Registered> still gets this through Deref coercion.

This provides access to the typed parent bus device rather than the raw
base device.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs    | 10 +++++++---
 rust/kernel/drm/driver.rs    |  3 ++-
 rust/kernel/drm/gem/shmem.rs |  3 ++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c32cc0f0eba0..187c57cab736 100644
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
+        // SAFETY: The DRM device was constructed in `UnregisteredDevice::new()` with a parent
+        // device of type `T::ParentDevice`, hence `dev` is contained in a `T::ParentDevice`.
+        unsafe { device::AsBusDevice::from_device(dev) }
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 3cda8dceb498..9ba2eba84191 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -170,7 +170,8 @@ pub fn new_foreign_owned<'a>(
     where
         T: 'static,
     {
-        if drm.as_ref().as_raw() != dev.as_raw() {
+        let parent = drm.as_ref();
+        if parent.as_ref().as_raw() != dev.as_raw() {
             return Err(EINVAL);
         }
 
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e0ef47352e88..c1d82a04878b 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -264,7 +264,8 @@ pub fn sg_table<'a>(
         &'a self,
         dev: &'a device::Device<Bound>,
     ) -> Result<&'a scatterlist::SGTable> {
-        if dev.as_raw() != self.dev().as_ref().as_raw() {
+        let parent = self.dev().as_ref();
+        if dev.as_raw() != parent.as_ref().as_raw() {
             return Err(EINVAL);
         }
 
-- 
2.54.0

