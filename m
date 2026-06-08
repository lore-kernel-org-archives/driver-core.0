Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69B3E16A0
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943486; cv=none; b=nj5sPEn9WlMFkA0Jl5NKxd8r+XdziSSMlZmpgidvZWIj9/TT95ctc0lbaCRz29R+5j2masVB4KKxYvybnZX6Ydn/AbO+dNoHowxsT0ygvfrYB66VNCArhcLdwHP3WrEN1IkORyUaVh/IVb1guvDx6lMec7G/6U+q16aFA15Dj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943486; c=relaxed/simple;
	bh=Aj4PBe2fkWjoL26YUEqoqN9BiMSi2LM2cuwB8IxJ5x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ftWMx85KHP9QdjEB99O8wsq3AWFRPAtH20T8OVTCKQfJGVU/ZFs79OwkHz2GK1icGIWMNso6/mfkwBbz/q4rP4sX5Oq/mN8zzjJ4enQZTrG2UG8gLDRzwh2IAwG2RELptjYHHP+w5/Vz6JQEHIu6ZQtFQia2rif5YcIP7bgnFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUfT0Dqh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUfT0Dqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780943483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0Q78Z8ifFWrqkScVlzVzhmSJQFRs/JAyzSzJkKaHgI=;
	b=ZUfT0DqhAKcPy0Ve/VX8vfliwkw/STjHGQZPWXKynsQ1tVMaPpdpl3/WCTj/zsbEWHPy+6
	qrYkzRVINz+anVSMOK/RjXbed50L9qSi+BkrXuh0AHWd5movmESY2QOLCsNxJW/hUpBSZk
	CNG6PcVf6gJYgf3xzlFh/tfymzewO5E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-GkctutQXPFOOEZJN1ozAgQ-1; Mon,
 08 Jun 2026 14:31:20 -0400
X-MC-Unique: GkctutQXPFOOEZJN1ozAgQ-1
X-Mimecast-MFC-AGG-ID: GkctutQXPFOOEZJN1ozAgQ_1780943477
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C110F197702D;
	Mon,  8 Jun 2026 18:31:16 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30682180059F;
	Mon,  8 Jun 2026 18:31:13 +0000 (UTC)
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
Subject: [PATCH v19 3/4] rust: faux: Allow retrieving a bound Device
Date: Mon,  8 Jun 2026 14:29:03 -0400
Message-ID: <20260608183057.2001376-4-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: X6OEvANrsHTRJvxaWzeDcHRqpeM2mkkkmzqpf5Cu2co_1780943477
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

When writing up some rust code that used faux devices for unit testing, I
noticed that we never actually added the Bound device context to
faux::Registration's AsRef<device::Device> implementation. This being said:
the Registration object itself is proof that a driver is bound to the
device - so this should be safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V18:
- Add notes from Danilo to safety comment.

 rust/kernel/faux.rs | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..20ab638885354 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -25,7 +25,8 @@
 ///
 /// # Invariants
 ///
-/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - This object is proof that the object described by this `Registration` is bound to a device.
 ///
 /// [`struct faux_device`]: srctree/include/linux/device/faux.h
 pub struct Registration(NonNull<bindings::faux_device>);
@@ -59,10 +60,15 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
-        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
-        // a valid initialized `device`.
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
+        // SAFETY:
+        // - The underlying `device` in `faux_device` is guaranteed by the C API to be a valid
+        //   initialized `device`.
+        // - faux_match() always returns 1, and probe runs synchronously (PROBE_FORCE_SYNCHRONOUS).
+        // - suppress_bind_attrs = true on faux_driver prevents userspace-triggered unbind via sysfs
+        // - mem::forget(Registration) is not a problem; if the Registration is leaked, the faux
+        //   device stays bound forever.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
-- 
2.54.0

