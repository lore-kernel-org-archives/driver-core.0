Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FB42B74A
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079850; cv=none; b=YwjM7tFcvUBxeej+TNCAUjhvlgGbMgm2sUfiwmIFKHc2K3GFQCHeg95sneopOBrwOTJbL3I2DkGOKdr4u+7DARnU63EEOUR/8Gr8acWT/tEV0uMYtwPRKqNmvQs6Pw9k5joctNy3jEVNZzu14/CH5QSY+Q5JCL2G78JtXqs5rao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079850; c=relaxed/simple;
	bh=zMcjO7ihcoZk5wDoPdCIM8BBGLPEZ3tF+HA3S1Djtcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=pS66vVks8PCq65eXxqATiNtvYCrQVmqjgh0L8+RkUqP/gkibEMKuqI5YRLjaaQ2f06qxS0pVzGU5IVI4f5a/YfMNZywcd0YhzKm+IG2SgF3STbZeigbMlyqTmvyMdNcBNwMdO49M5OwlC+ltCDTO4GDT4FWAhczZuUzMnJkQKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRN6QGtF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRN6QGtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/7mQeFXAswtNMl7FgMd29VC1UT1l6NcPQS0ZRAe3HI=;
	b=hRN6QGtFWj38P5NCttuiPkTUXpmJSr5b/slmmTTA9kgxKrEVmE1LYuOLnnwRVZgO05uzz6
	op6ZVfIf47HRSBp7P0fQXEZITTYezzt8KucnCRZHMFL2dEDZ+fpv9g3MovIkXNrhU9PuAw
	Pru0TQ9JpKdf9Ip+QrMGMOctFNtz72M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-UD-9UEbMPOyM73EmN8uYHg-1; Fri,
 29 May 2026 14:37:20 -0400
X-MC-Unique: UD-9UEbMPOyM73EmN8uYHg-1
X-Mimecast-MFC-AGG-ID: UD-9UEbMPOyM73EmN8uYHg_1780079837
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2514F19560AA;
	Fri, 29 May 2026 18:37:17 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0ED91688;
	Fri, 29 May 2026 18:37:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v15 2/6] rust: drm: gem/shmem: Add DmaResvGuard helper
Date: Fri, 29 May 2026 14:34:00 -0400
Message-ID: <20260529183702.677677-3-lyude@redhat.com>
In-Reply-To: <20260529183702.677677-1-lyude@redhat.com>
References: <20260529183702.677677-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: GsoDGZDmZx5-5Z0WyTFm35rFsGSsh50QMvOLS7OG4Jk_1780079837
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 8b7de136ab1f9..a116b0752e46a 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -27,7 +27,10 @@
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
+///
+/// When this is dropped, the `dma_resv` lock is dropped as well.
+///
+// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
+struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);
+
+impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
+    #[inline(always)]
+    #[expect(unused)]
+    fn new(obj: &'a Object<T>) -> Self {
+        // SAFETY: This lock is initialized throughout the lifetime of `object`.
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        Self(obj)
+    }
+}
+
+impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
+    #[inline(always)]
+    fn drop(&mut self) {
+        // SAFETY: We are releasing the lock grabbed during the creation of this object.
+        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
+    }
+}
-- 
2.54.0

