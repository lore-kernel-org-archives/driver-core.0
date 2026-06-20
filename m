Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21ED1BD9C9;
	Sat, 20 Jun 2026 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917159; cv=none; b=o84DfJ9EVgiwgfgw/U/wkU38un/wAs6TvXTjdq2GBCpBJZRrhbH9bwIoqOXHfuCTWyz/NmbDlnDcoiH+C/Ya/c0gEWnx9a20T9hrY4uI0QgiokPLwKaH/gKSsFRYhrqx28XAN2wP8pq7Xwf7ZJ5qDKhKvz5PIKj9Md6CFfh60Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917159; c=relaxed/simple;
	bh=o1ch5hRNRyiymotD8WT25AFIPoaFbvyEk39bbC6BZyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LD03vqvwYK2LcbLDMmq02bt+7D4S5Z4saov8+cXR36oxId7SWGNEeTrt/evL3LnS59NmP7i+AL0gbBJN9lR9eoBE/UH+vfJ6QyMvWjtUTT2ZibJWiOnBktBkTTFmdykfD1Sn4XrgiIFllTbt06Ifmw0AaG+Q/U1WL9YBf9avtcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4BbblC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4BbblC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE991F000E9;
	Sat, 20 Jun 2026 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917158;
	bh=ovlLpIFcIqJIS4zpHh69eliJrNZqKzaspRBt9Riw0zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a4BbblC5cN62eclmD4C4TDruE8ujeK/gG+Jtm0Nvk+7Ctfn4xIMjfC/3Zos0HBznN
	 VT7+r6nKFC7v/agT1ovtsx3C99B3/90krsyKMH9cJOWNScnZqs/NRhD7qmC0gOISzx
	 xv+IMPfprLRkPfdPbvhjFZyTu3jCShuX9poh7dqdyBHGChqCmKd1k9+5e9uPzDa8Jc
	 Pd9MaB8E+yT7ALmOu7BQZ6skHj3Qcv+N5RhT+piI3ODqd6zMo5sFlL5n47dwXcrgyR
	 uWrQSuVn8heaVxUnE+laFLC0mCTh/uVhwk1tOpsyJgVFhNzSq7Fno/aM/tAZ9E6AJ9
	 Zj25Wuef5mN+A==
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
Subject: [PATCH v3 04/13] rust: drm: restrict AlwaysRefCounted to Normal Device context
Date: Sat, 20 Jun 2026 02:51:16 +0200
Message-ID: <20260620005431.1562115-5-dakr@kernel.org>
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

