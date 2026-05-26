Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08203C343F
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830980; cv=none; b=fQGaCQuo0I56bfcYNztoevjEvlccOuEa2ZThNE+bylcvjP984aK4mA77l6/HSqX28RstFKTQ9Ej/oNKqHf6ylc5Jl80DetgGQZh/xhqqCzPtf9xDgvsvpW55sNuGAE2DXSSoIQVxvj0gGSAZkgK65J01TIAzcSAXbVPMHnX6Dh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830980; c=relaxed/simple;
	bh=Dn2TM50mzDAbrgcSU1mNi2bschUg/ZTmfIoSi2d0dFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WIkG/yikW1Zpm8JOj5SNpuDZCc0s4nlvczMa8ZPmUOXvB5tsa5xF1Qqxcj8PNE9f5dy5qz/ZcB837GeVFX4fKk+8bx2CRghLTEEyInoUdeJ4GvEbqKG7y3BVET1uMNCH9RG8JXYDYFcc/UdkaGgM/aePvUiEUeEI2me+ViGR38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6QSQ/DV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6QSQ/DV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjrQ0uPHRJjNR26/22he+vOqqO5eVQABEH9btT98rJs=;
	b=U6QSQ/DVnP2Ve6G14RagZwoz3k8rd+Iy6ipbWjbgkEzcn6KXRKbQkh5PKkgY+ilqvsMRYd
	LC6p6KFxrlddI06FmsF7RiPfQVDb7k55KCenA4pdVMIO9RXw/zctOXj5l6mmKesrAJiptS
	hxjMeq8U760hxlZPdM5GBu/B9FIc4iE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-_JaSSf4kMJ2pPYWBwSB0lw-1; Tue,
 26 May 2026 17:29:31 -0400
X-MC-Unique: _JaSSf4kMJ2pPYWBwSB0lw-1
X-Mimecast-MFC-AGG-ID: _JaSSf4kMJ2pPYWBwSB0lw_1779830967
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5ADEB180034C;
	Tue, 26 May 2026 21:29:27 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6EDA30001BB;
	Tue, 26 May 2026 21:29:23 +0000 (UTC)
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
Subject: [PATCH v14 5/6] rust: drm: gem/shmem: Add DmaResvGuard helper
Date: Tue, 26 May 2026 17:28:56 -0400
Message-ID: <20260526212857.1158294-6-lyude@redhat.com>
In-Reply-To: <20260526212857.1158294-1-lyude@redhat.com>
References: <20260526212857.1158294-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Uu0qzvIRku3t9OlMmX1BdFIUuACbFTqA76NGSmKuyd8_1779830967
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 116ed0a13eac2..1b24cb1129a8b 100644
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

