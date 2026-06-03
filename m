Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2139DBF9
	for <driver-core@lists.linux.dev>; Wed,  3 Jun 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516354; cv=none; b=Cx9K2faWRP28riqZsNw207fezk8m6oRwSrNiovwcilvGk1lRy17fZBWFA0O4vmc4cOyu8bQaPoAiwGv38ygkiv02r2ou9xCnuxuUenO+eqHhZLPq4gxjQ6wSEzP0Q0JzbxpduhGh+D10TPk+AkPUrRln/zAFFn5Pjha5X0bqs0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516354; c=relaxed/simple;
	bh=Y1zcDOXSszlJuofsWKWpt+J9xZGS0l3vKMIEq3in/XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=DFCQksD7yRXe0r27x3q/sm5f0tGkjNi7+S8VeatZ0yVwR2NPumd4VHt5jqbkIA7qiGls5RYPKytnsLI67SRhwwiALc140PYxeQuHG/7yf5vKWr59Dra9+Nwl5Q6n6qV8ObLuX+PHxCdGyGXduyGhlbYt5sRqXhsmtp1N1JpC1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5WaMC5Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5WaMC5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olsmC37uFpzY+y9wtmCt1x1gIahVEJ6Wl0D8b/LZIzs=;
	b=G5WaMC5ZYdHHN+KTvpzZ61U9B1EGCIhadReET7F38/uZ4uBHx8vxHMSlM1sz6GdXA4YOrc
	anSRVB8g1sHCdjO4yPwZes3q9qti9z5s/OF2VngbpbCkHv+fnXAEk1U41dcEP+Ysd4cxXq
	ZOj5xhGH8M5MlaElVieFOgXAvTjNEm4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-7TCLGpkIP7OuSlDk4Z0O4A-1; Wed,
 03 Jun 2026 15:52:25 -0400
X-MC-Unique: 7TCLGpkIP7OuSlDk4Z0O4A-1
X-Mimecast-MFC-AGG-ID: 7TCLGpkIP7OuSlDk4Z0O4A_1780516342
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B027718004D4;
	Wed,  3 Jun 2026 19:52:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2A2601800351;
	Wed,  3 Jun 2026 19:52:17 +0000 (UTC)
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
Subject: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default implementation for ObjectConfig
Date: Wed,  3 Jun 2026 15:42:30 -0400
Message-ID: <20260603195210.693856-2-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-1-lyude@redhat.com>
References: <20260603195210.693856-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: M5yVoBlIM3Y8lFoQrNpqZDDDDhVgZr0mPtGG8Cps2Jo_1780516342
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

I completely forgot when coming up with this type that #[derive(Default)]
only works if all generics mentioned in the type implement Default (and T
usually doesn't). This being said: We don't use `T` for anything besides
using it for a reference type, so whether or not it implements `Default`
shouldn't actually need to matter.

So, fix this by just manually implementing Default instead of deriving it.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V17:
* Rebase
* Fix format of commit message subject

 rust/kernel/drm/gem/shmem.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 34af402899a0e..084b798ce795b 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -42,7 +42,6 @@
 ///
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
-#[derive(Default)]
 pub struct ObjectConfig<'a, T: DriverObject, C: DeviceContext = Registered> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
@@ -53,6 +52,16 @@ pub struct ObjectConfig<'a, T: DriverObject, C: DeviceContext = Registered> {
     pub parent_resv_obj: Option<&'a Object<T, C>>,
 }
 
+impl<'a, T: DriverObject, C: DeviceContext> Default for ObjectConfig<'a, T, C> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self {
+            map_wc: false,
+            parent_resv_obj: None,
+        }
+    }
+}
+
 /// A shmem-backed GEM object.
 ///
 /// # Invariants
-- 
2.54.0

