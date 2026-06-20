Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA0175A9C;
	Sat, 20 Jun 2026 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981399; cv=none; b=qhWZYkeVSxO0C7LXk4om1R/MwYpE/OqaX65fNrru+ssra1NLMNfgSh+RcAPqiv3VgCg3d/Cgst6u5EYl/DFKEiFPlSQtnHdAEPkVLYXb4tqGGIlDpzRx/D50t91MGJfnYFseq/jMAKgjedmEiRsEpAoiG0k7IZbaGt/qarEGdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981399; c=relaxed/simple;
	bh=o1ch5hRNRyiymotD8WT25AFIPoaFbvyEk39bbC6BZyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWA6wYM7rOgtXPxykSpoJyw3FNyOFNKqQqU4Aylv79rqkWgOPMzOy5B8iaBfGvw8fYqsW6JgKjiWthTi/MQMfwHOXJcpGsJQHJOO1hLuOqFZPNui1xjivC3X16BFo+8IEsYfSKqIJ28jg2YsxQST/5lwlw16l0LDuvm1raMXBC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDkdCwkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDkdCwkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957A11F00A3A;
	Sat, 20 Jun 2026 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981398;
	bh=ovlLpIFcIqJIS4zpHh69eliJrNZqKzaspRBt9Riw0zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oDkdCwkrAR8Wu4GOMtt9lmgnWnTSowztfMEem/YW5aG2PkBrxxHHMryQOF1zMcRPb
	 qA1dDuxK+MaGHwjBLtAH2w1atFhU0F/qxkvvRxMi5aFcQmxDU+EbEJpgweBirPSK+w
	 Pl54JppcjpriFcl9BJn0hWsxWE7cNIZGWg3T2J0vodSIPZjmn50/vODltqhUlGeMn/
	 meDkyYuli5ux3srz2IYK8iDPsxerEY/m8eUHuTrpe71i/5Lj6TRLT4DFT8Vp0r8ycO
	 PFDdn1zOBexi7ijRyLwUsoFMMmbJCHogpCd2Ot+BsYe7saRrw2e6h9AxPXELvISOdP
	 COPY2E4RIfpDA==
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
Subject: [PATCH v4 05/16] rust: drm: restrict AlwaysRefCounted to Normal Device context
Date: Sat, 20 Jun 2026 20:47:58 +0200
Message-ID: <20260620184924.2247517-6-dakr@kernel.org>
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

Restrict the AlwaysRefCounted implementation for drm::Device to the
Normal context. Registered devices represent a non-owning view of a
device within a RegistrationGuard scope and must not be independently
reference-counted.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index d712387707d2..9825d52832af 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -85,6 +85,9 @@ pub trait DeviceContext: Sealed + Send + Sync {}
 ///
 /// A [`Device`] in this context may or may not be registered with userspace. This context is used
 /// for reference-counted device handles and during device setup via [`UnregisteredDevice`].
+///
+/// [`AlwaysRefCounted`] is only implemented for `Device<T, Normal>`, making this the required
+/// context for [`ARef`]-based device handles.
 pub struct Normal;
 
 impl Sealed for Normal {}
@@ -327,7 +330,7 @@ fn deref(&self) -> &Self::Target {
 
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
-unsafe impl<T: drm::Driver, C: DeviceContext> AlwaysRefCounted for Device<T, C> {
+unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_dev_get(self.as_raw()) };
@@ -357,12 +360,10 @@ unsafe impl<T: drm::Driver, C: DeviceContext> Send for Device<T, C> {}
 // by the synchronization in `struct drm_device`.
 unsafe impl<T: drm::Driver, C: DeviceContext> Sync for Device<T, C> {}
 
-impl<T, C, const ID: u64> WorkItem<ID> for Device<T, C>
+impl<T: drm::Driver, const ID: u64> WorkItem<ID> for Device<T>
 where
-    T: drm::Driver,
     T::Data: WorkItem<ID, Pointer = ARef<Self>>,
     T::Data: HasWork<Self, ID>,
-    C: DeviceContext,
 {
     type Pointer = ARef<Self>;
 
-- 
2.54.0

