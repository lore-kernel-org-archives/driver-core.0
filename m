Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484748;
	b=ur1UeKBVxhACt3/AhKVXgzbZ+uH221b2B0I9aezDFWdlmV61+Lrgocktf8V1vncqEpiV
	 yGFyt+eJ0oXER5kjnfSPSRHJCyQdo1jY/6tk10Is3SyZ9JjyW0HTX551YdYeXbi+openB
	 /8dyumkDuQqcQfRSRqEaOshcoNqa+8068XxhErw1yP45m3qQRdF7MCHRfxHR/oJMEsAO7
	 +sMFfmL6522cfHTBvbsg+yv3a6da0E4IHx7QJ7BwFDQlyN/AAkv1SNZLLBJ1axhzr4n9C
	 7E5EGsMmZDx3vlHFYy0VP16MpzC/KzW7IMIDXvk5kOCbe1ABszY9toDAnMSTVb8jKqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484748;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=j1pr/I/LG5tVSY0x1TwKI7X95YfZzFLgFQ+XgBsIV28Okt/K9b241j3d74cRD1QFDWF6
	 fHmZqhuq6BqHbu4Rkig6d/7jAxsUn0iE2enyumyvHaD24Oy28hQPB7ZS6CzSCpPaCrQVw
	 R+m3IIz98vkkcyc1t0WmgBXGH/VPAWb1qFlq9IBtNhtvkdrrJeR9PzFwYEfNoCAdawCoC
	 imhnwnoWcY3UXctvaDoUOp/oeaoMDYh7fd/q8rMVLyWqye4SkDIKVbi43wZ3t6Pk1js7Y
	 Vzx0+V+6MoORD9tihOIoV7H2XVGu3dBQR2SGpMeOKRVEcPRuuoPm+jGCoRDf4FETqKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbINRPiW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49471606A331;
	Tue, 20 Oct 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbINRPiW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484748;
	b=QQ0CEUHSVT0A6fnnSDsep7+A/v69VbvPnV3joARpB5GY2eW0py9boq82qzSbbGAl+/SN
	 RxCWGId29C45QUHTKTaGclaSNsx42uVGF7MiXltInVHv1jMoMJhNvLRmUIdlmmMPPD+q9
	 Qzi0Y7nqZhBBWSkSN+6UyzAFTXHhf5kfG7NyIhl+uWad7T18yM8WQ8yGrZqjSnuzFKi0W
	 Uxr0sNJyrFZl9kIk8HN533Ht7PBY9nQ65NZBpbv+6PGDhtcWKzVZj+dYn8CTuZJsSCw7e
	 JsSOce+BReOuJsS2fqCrg+Yrk2hKDHpVxwKKa2vgUjlkEul6RTKm9l62PSPImtCc7Aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484748;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=fDy7plA0OASev705iOhSQQv470CpsFQndgDsoXBgUqk2vrbM3Kse0LmqE0q+2YEQ7uQH
	 7rBds3jbk1KfkDleuMgp5uU3C23EkFSmu7KGl4vNjLVrx9mUrwPhAKc46vrDjPCoSHM+b
	 jXRqdcFLAUMCUwBHxO7eXUp1rBOFS4fu0+2FmdSHvrkYtIVnpRMaCaJ8+x1lVQNrbHm01
	 +VRjmHF86wTikYRazg22Nrn2zSPuTU3wTPIY8GZeYHjWMFEZ+JqAXQV9O8qsEn+XYZghy
	 O3vB1/5VXE2Dq12aPm8upRt9nwY5F0XpVZHq5LoY9lzACb+L8VrvXBOGNANkREBb2+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7190B1F000CA;
	Tue, 20 Oct 2026 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484748;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LbINRPiWNRT4+LzE3Xuy0a0LNe87uvyK1l/Ed/MmFZK80+il9Ia7twW6DTG+OIYy0
	 Xv6Ut1vv4wySM3ZGOSDyX0wQpLBzrWIQ5VLRdRZwojqGiZ4pmA0DESOHobOSly2ZlE
	 34X0yZMUV8gkFUpiaUWWg9G8eWh0v4vWsX+WwJM3aaEenLHrjNx6/kHasmRylqQ+t3
	 VxqiuFceSOdnsl5bIeVyc0B3cLd8M3fDFSpflCvQ402tWdUzBX6tiacb78dnBcFhhU
	 jC8Mvu6y5NrYssQIH7NEq0QYBUd4HoVQTG+Ew/mT2XZN9U+xo8XgCC/BTYzU+gh1HQ
	 g/YBI+eDanH8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C7FAF430E7;
	Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 20 Oct 2026 16:25:23 +0800
Subject: [PATCH v4 06/11] drm/tyr: add BO creation and lookup helpers
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
Message-Id: <20261020-tyr-ioctls-v4-6-704de77da223@kylinos.cn>
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
In-Reply-To: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
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
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 driver-core@lists.linux.dev, Ke Sun <sunke@kylinos.cn>, 
 linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484721; l=2048;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=NWIPbx+eohkv3FNLcTsYqaXCTEHpzUO212X/sd33Vuo=;
 b=3ajd9tKpWFuQQjti0zd8w3s07U2VeQ8WgEY97UG0waNHuy7WkKZ2mqeaEaCdFJ4AX3To52G4t
 3p42+nfl4aICwEEhmKAqKCBpVcMI9C/JJ1KK3WdWi9Vnx2G06rTvChT
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


