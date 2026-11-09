Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794184626;
	b=Is2PStkh/T61D0tObyxxig2taBCgYK9jwJ9sdIl5TIYlSjchHhpFR0K8OYKh3FbBF7Qk
	 /e7k+fmfygtt85wg1Yl8noAlH3LAIv3EVGqodZwB1WmR9DAOE+nBDjcEq8DgaBd6+44Ld
	 nC9dUmrEm9a2lkSVaCJkJmfUC5gJozlhYcptX+puVZjyGxw7XdGscRryFYM1QhTOV/NiF
	 Re02V5MDQTp4wRsIhb9OlcA94B2qWXQyNF00yqJR1fDgZsBFTzlnSLGYyGXSaw7Vn625B
	 vDSu0tulbL20buRZgDdpTFBmFoFLt+QG2nqGSIHCx17CkDqW14ln6CSV5DJzNq3vP7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184626;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=n2f5QPLWN7OabwQBCL4Qm1VsXQV1/Qd2M01LykEjNBMAS0DHbLUlW0G3CQBXCE/duXYA
	 KB/lTWik9lSl+mSdXwwFzPoSyns1oRFObPvbhdGSXKHYnlVnoBNUwAAO4tbIlQIkDro4F
	 IfaF2SK+CrM7fe3cbKqmxk1uxsmH6IvxoAyJ72O9RY6PvYvDHljklPuXmHOipRMDzg5ZZ
	 oeQdQ53I3fCwrtp5ZZKeT2gWtTtH3U5tAoy3WqUqLXrguSMb+VXK85QKuGWf5jL+BTJEj
	 FY4cDFPP7fS61EKekyk04JwvSOv3ILUwbe7KNO93FcbwZQNRW2QUms+6mfq+ROgBhyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ox0q8Og9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08E606D83B;
	Mon,  9 Nov 2026 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ox0q8Og9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794184626;
	b=Wpvtk5byDhqbQG6oCcfplU6fyO34E//+jgZDD84rX7E13rHqXdoFivH+CM5wceZcxiWX
	 V5Mm1CXeAddcEnTBcyxl6ieUvMclYaA2lthl00i0wBdsIFpwMX6ZZ6HLaOSAYtScF2zVi
	 in6Jh0sgCnCamHrDOHZuWzqMjg+blx0NuAsYsX+RWAXm85ZnM0NDYmg6wSeF/UFZtehWx
	 4Ouk5E9DiAU1mxpWPXu+75GcuPf+nKbjlqtVPWcNguRlXVqDeYUvWwSp7jGU6c2QwYMyT
	 j9Q0n6ZJOgMsevqWYWtuc98rxOmeAcsk6OySTCytD28VuiGYuXAgmcjk3tMedb4r4Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794184626;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=xpUBx7AL03K17LJf3H1pAQgCeMamSC6cjt+mLcDwAPVavRAQsOs2JZCCO0AxGb1/2o9/
	 bkgAZNXTWGpE0ip6QBQFCPsbH/jLmf5b6ugdwavNKBt8LOa53ec3SzlZBdSYPCysgBAft
	 8UgwTkvENlVUaGo9JErZJl1lRfqWm9ePBmxLBWODiT6M1LOD1W9Cys8bRoBMuWJLCV4dr
	 uV+b3WP8ekT5smSfmM74xMW4NEF4gLQmscwq6ac5cwd6T/CLNvcn4hgTTDvtm8ih9EqOB
	 sbeQzsQHKSosC8vpyIRxgnVQTJSSPXAvGLRHnap+P6SUwirCn/7cNI7T4pjZ/PCkDbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D41281F008BC;
	Mon,  9 Nov 2026 00:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184626;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ox0q8Og9tBhul4PLOkH6v4R5S2b1ect3mSDBJ+eVDE+RMS9+3uqXhtw6xJSL/v3lc
	 eLAFfz5qhnHhlR2SFOqDgrkaw/fqvSpzgV14pLqhG7d6CGhqB8SDzMXUr+T1Qr1/L6
	 RZpubxaaTfdrNX4oK+HHOfronaqyeed8aPPnwaFVPKVWyqwEIOkWfYbXJwty5HPf80
	 nf9gy+vHoaYtQiHGuO3wyr6apMulbomyGmycQgTYO5tY79IffDPVEjiJa3AfFvOuJa
	 h4QeRbNsDDR+6d4HX4G5QvkEM8Kk20bSbiwuWfJVYZq23tc7NqFcHm63S5kBdTif62
	 faJAjuYsqU4Ew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A168481B9;
	Mon,  9 Nov 2026 00:37:02 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Mon, 09 Nov 2026 08:36:49 +0800
Subject: [PATCH v6 06/10] drm/tyr: add BO creation and lookup helpers
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-tyr-ioctls-v6-6-b2896bf2b3c9@kylinos.cn>
References: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
In-Reply-To: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184620; l=2048;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=NWIPbx+eohkv3FNLcTsYqaXCTEHpzUO212X/sd33Vuo=;
 b=v5Y6H2HA12aejWrtVp/cn39RVCEx6FXp/m7O6tehHHaQ9roFcEU5VWJSCQRSOjvBC34e1Ek0l
 ih8VpMGy9dND8mFtc7Y/zbHXEMgvkqQd9CNhCH3EULo4UEJUYclw3bF
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Add helpers for the BO ioctls: new_object() creates a GEM object with
the size aligned up to PAGE_SIZE, and lookup_handle() resolves a handle
for a DRM file.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 3bf3787f5c3fd..0e0989a48678f 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -9,8 +9,10 @@
 use kernel::{
     drm::gem::{
         self,
-        shmem, //
+        shmem,
+        BaseObject, //
     },
+    page::PAGE_SIZE,
     prelude::*,
     sync::{
         aref::ARef,
@@ -23,6 +25,7 @@
         TyrDrmDevice,
         TyrDrmDriver, //
     },
+    file::TyrDrmFile,
     vm::{
         Vm,
         VmMapFlags, //
@@ -53,6 +56,32 @@ fn new(_dev: &TyrDrmDevice, _size: usize, args: BoCreateArgs) -> impl PinInit<Se
 /// Type alias for Tyr GEM buffer objects.
 pub(crate) type Bo = gem::shmem::Object<BoData>;
 
+/// Create a new GEM buffer object.
+#[expect(dead_code)]
+pub(crate) fn new_object(ddev: &TyrDrmDevice, size: usize, flags: u32) -> Result<ARef<Bo>> {
+    if size == 0 {
+        return Err(EINVAL);
+    }
+
+    let aligned_size = size.checked_next_multiple_of(PAGE_SIZE).ok_or(EINVAL)?;
+
+    Bo::new(
+        ddev,
+        aligned_size,
+        shmem::ObjectConfig {
+            map_wc: true,
+            parent_resv_obj: None,
+        },
+        BoCreateArgs { flags },
+    )
+}
+
+/// Look up a GEM object by handle for a DRM file.
+#[expect(dead_code)]
+pub(crate) fn lookup_handle(file: &TyrDrmFile, handle: u32) -> Result<ARef<Bo>> {
+    Bo::lookup_handle(file, handle)
+}
+
 /// Creates a dummy GEM object to serve as the root of a GPUVM.
 pub(crate) fn new_dummy_object(ddev: &TyrDrmDevice) -> Result<ARef<Bo>> {
     let bo = Bo::new(

-- 
2.43.0


