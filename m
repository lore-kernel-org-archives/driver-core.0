Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D333AFCF3;
	Sun, 28 Jun 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658480; cv=none; b=NHN8zqL9REV/kMe+zqBnM7punYO2Pd8qjiYKY0SkZg0FIVwAaY13eh0AFst9Bu50T8TQqBjoSUc8m7EBmMSo2FJtKseCybk7SQGwl9evAyPe1V6f13BwNzUr1EVyIf/M6N6TeAhlithzV9lAlgCRt15aFemZtKNZ8fUqDtuOwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658480; c=relaxed/simple;
	bh=8dcDyVZYxEORAn5tT3TlyU/x0lMuC6uV1p1T3wTVq5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZ9r69Zt5j+BKHCchm672oUCcQKrNtjqANnotaIfcprLyXZo8ty00QxAtGRPeLHNnFh2xGqsZ8SxuL1O0vgAGILqPGHJefD6IoMU7aEI2r/39LRlsjwIlTJBRwqrQ8nVhCUnaaHYUJbXAtS72aoIdnjLLEiRy7UVxsHbkGEEjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS7YB8Dy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS7YB8Dy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0B61F00A3D;
	Sun, 28 Jun 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658478;
	bh=M4R1ncCH7yJe9pq5SwvtMy7E6HQj3lvtK28zS3b2iX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZS7YB8Dy9sHNzUvb5EgaLBdcTl+gikwDyrNs1UBrxqmsq/Hy9ZWjsqwqin7wzbS/I
	 wlIBtYfaE7ix6NUB/sidogzcf3S3nxCanPLOQ8N0fnmUDlK2kg3xBck7DsSi+Tcfta
	 WnpqxbEdrJcZfhODzKkxqOUp9av1ks1RECy92xajjnmecbkPluKMwo4JNJD0f/e4cU
	 wPJ9X3fMIv76zdR/bewsUq1DTBviddeIVsteeuwzRJgx4Ka9rb4uuqt6uR593q6wKJ
	 ebcndxjhOu8TWbhBMaw7b3iHO/DLhSHoPd8f4EM5UAt0w61aTyGrXkX4VZq0E8r6no
	 RDtmZbobYfGpA==
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
Subject: [PATCH v5 06/19] rust: drm: restrict AlwaysRefCounted to Normal Device context
Date: Sun, 28 Jun 2026 16:53:26 +0200
Message-ID: <20260628145406.2107056-7-dakr@kernel.org>
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

Restrict the AlwaysRefCounted implementation for drm::Device to the
Normal context. Registered devices represent a non-owning view of a
device within a RegistrationGuard scope and must not be independently
reference-counted.

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

