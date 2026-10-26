Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032875;
	b=qx6rJFGgmWcNATtYbHlf3rfYCaqRB2lVlJosw+2v7gGD3M4gCTmkWZG6LglWRs1oh/p4
	 4HCfabX/ZXusbaOkEyFhqcPsZZa4GpSTpI+1m4BbibjhbLK5o9OOCr6j4/yQRovh8xc3J
	 m8lKyrk1I6zQDoBRsdyIbPiJx4QYaggJh+RmwqppzZYAg5ActmXoIp+1q8ln/8ep4eTOF
	 HZIC+y8MFi91PaJylqaxDKUciygoGR2XDPkBeXT0fFYjcCy17Lyva2ihabchGIgGZc4AM
	 ZeoyHzBP7PTqo7Qe4Mv5OzP9cW2TBj6A39tlDwAYQVfrIfDwhAovlPcMb7tZ8Jo5Lmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032875;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=bok5NjKODvkiY5nMCexC5d7f4uLZSorsBHFx746FxTqCDlmY60aWhi5gLDjo8ujabLzR
	 MbMilKn5kyGC1d2ZIq0vMUR8fMU0n1nA/e+x3Nv4ENcDbMHr+34WI1Wd61x5QUorr5A67
	 eFCZojc/HuqhheXhjXn+cJDOq1JZVR/cHVOgoCL9bXHzwtKCc2EJqnRNNru7CJVjVx/Em
	 bB4vrwhb2N3JGdpGg6jbmGzs3acLomhW/ipY29VFv5ma0sQBpTk4fYiZeQwGkZNcdjjiO
	 HC/qxWl3tev9w/6gph0tb3ZjIophJy4h1BUKw11nlk0aqFDpWlJiG6BVI5dJ/3x8Dwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+xSuyaS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50395606A32F;
	Mon, 26 Oct 2026 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+xSuyaS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032874;
	b=MTVWWunWNI/NR//pplG6czhnrkhg6fwqbsPTKahDf4DM9Y4Y+R/z2ivTcSueI+xBQChx
	 /b/Evvs3EH3xHS1XGQenzL6PCoXSfqEyfLqahrgzUZDgHUjhO2q5/mEBY5bpEhdONxTOy
	 8LkJcBzAU5bT1s6VbXz0mdVeunf8HiuuDNm1lRlNk/GignoErPf1hi/9ep5TkN4v35cOF
	 z+o2fdpQh5QhWdWFCaIcguoK9CExTRnI7Z9ld1YeSBn1Cm2xr5Klix5bHbSIkAD9oUzpl
	 IBE1mc8pDBh0uP92dcZAoKN3HI852+O5BoiAN5tZ4yFtpxMMgjWQZwQo5zc5FjNhEOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032874;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	b=Ze3fV5NPAAEBb13SJeONi5RePIRJ9M58vjk4LjMUWG4hD8JBhgheg+ux97+2uvlGMvud
	 BQoN9WCnItSFOKprTMjjDEoObxtdQl3s1X/eOwvVMgZKTWFwVrH0q9tOL8sZKSBHHWWio
	 8xeAS/nibcOv7b/b5+q6fHPbVdFUabE9IDiDSagCQI0OENrf7i0N2qJIsPWLPj57xW31E
	 nNiR9UYoAIb9q67eAVgvD83Gdyqixvi3dMxS/vbDZqY06ENTnzMBeGKF8oATT2QGnNrEK
	 IaIyCjBjIfWPfqJQyvvSpHA+M1SXOoDlhCkjgdwzBY1FfLWNEtmzIwPnP4/gDsr5Pmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FC531F031EB;
	Mon, 26 Oct 2026 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032874;
	bh=eN4JBX5Yi3bsMUckUX9jCNXAb+0k7j4yV01QcPouoZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S+xSuyaS22+VeFtbyObJ8Pp2E1pWqKtJel6OMdwkhNzkl3Y0EvLAUDnR+SX2sCD8n
	 VCR1bLSEJ8vaVwO7Bjs6Snvv06ty5wAJBSkDvZNKNkU6PlWtV5WGAFSkGrp2lU9m1U
	 e4Uvot1G/P9nNKg5a5ddtTj8v8Q61acD3MmjbX3lki57jyGenC41DjXcPiHRHdMFER
	 0XC6ggwo9va231o9Hti6eRzbl0aZDHvUPcWlAAWq4dpgjiAxBTL3lCqDJBVVG9gVbC
	 3djT3GvF153z2/RDCTtKUlH5fkSJIhxyUEq466qjNpTHLO3WN/vQ9Uptgp7YvJpOmZ
	 E24k84nCigWnQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 80FC944DD9;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 27 Oct 2026 00:40:59 +0800
Subject: [PATCH v5 06/11] drm/tyr: add BO creation and lookup helpers
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
Message-Id: <20261027-tyr-ioctls-v5-6-59dfe98cb003@kylinos.cn>
References: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
In-Reply-To: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
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
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032870; l=2048;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=NWIPbx+eohkv3FNLcTsYqaXCTEHpzUO212X/sd33Vuo=;
 b=X4OCylbW2f7Y+JxaVNoCO2kgmx47BLLZ5ZaAPGwNsryuXoKoN/xzYLrjktzqg2ZTyFc+1KREA
 cKeg/bOZdWIAt9uDTeieIAKJCDWI1wklHDh70mncUx+QztZDJmNRUVi
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


