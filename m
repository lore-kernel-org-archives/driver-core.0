Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C9384CCB;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036195; cv=none; b=n601H9wEs+237PqW60I2p03TrQtpVoZgyb/xe0HVHDPVHrBycpuamBLMpX2uXgbOWHNqmyGbr5c+S4A9J42TYFA/bturcIKymS3qBMjggL6aet8v4QcJVIEul6tvtglm5PtdYrCrUPrKWvarVv+GDneJRknv1qBbIJraVkvDdjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036195; c=relaxed/simple;
	bh=0SevxM4QseTr6vo1UBUryrO8o+ks3okCtZz/y52EsJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLi6qsOqudHzTCVixqgsqtPl5JOMJVqgtckFSUo+YkhYRrLU15iwev06oycecY0Ytr7okNvQltFFtRuXLaQAGLuw6oviHaTOS/1hLDBHkHpOvHvhXEKYuRjNCp+A95kUVeYRwbS5cTrmNFaJgQ03FI8opl1iS4kMTVXSBVlPWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i2bIAWzZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i2bIAWzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CEBAC2BCFA;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=0SevxM4QseTr6vo1UBUryrO8o+ks3okCtZz/y52EsJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i2bIAWzZgpUXscjw333pAnU1FQNPuqMwNv6O8K77TvUTFrAOe+aFCppMOLY6LNUW9
	 ZEIl7jP0SkEvZkL0Q6R0wwc+JcvSI/NdUM6pkp3ECvHVtju1wXRRu5NrLIfngVK+Uj
	 9xecXu19YwsAW0vwd6nS4CzBeGamKNnEjnOMYFO4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B1AC56208;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 07 Aug 2026 01:07:28 +0800
Subject: [PATCH v3 6/8] rust: drm: gpuvm: add dump_gpuva_info to
 UniqueRefGpuVm
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-tyr-debugfs-v2-v3-6-ff5595ac66ae@linux.dev>
References: <20260807-tyr-debugfs-v2-v3-0-ff5595ac66ae@linux.dev>
In-Reply-To: <20260807-tyr-debugfs-v2-v3-0-ff5595ac66ae@linux.dev>
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
 Greg Kroah-Hartman <gregkh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=1591;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=0SevxM4QseTr6vo1UBUryrO8o+ks3okCtZz/y52EsJY=;
 b=iQQbLPYqcK2qdOzUHwdC80CHg75KN+Z/RKSJaI4MvvRPMI1fCfbiWcsk1Ev5nNdhkboKAwdV9
 xbvlNvVyrgiC9ixL6YQ6Q9rWqSyBL9DoXrEDRUG250lfoT/Ei99JAGC
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add method wrapping drm_debugfs_gpuva_info to dump GPU VA space
mappings into a seq_file. Needed by the Tyr gpuvas debugfs file.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/bindings/bindings_helper.h | 1 +
 rust/kernel/drm/gpuvm/mod.rs    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b3..c3b2a86528934 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -30,6 +30,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 20a08b3defeb8..9348b1c3064ec 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -312,6 +312,15 @@ pub fn data_ref(&self) -> &T {
         unsafe { &*self.0.data.get() }
     }
 
+    /// Dumps GPU VA space info into a seq_file.
+    ///
+    /// Wraps the C `drm_debugfs_gpuva_info` function.
+    #[inline]
+    pub fn dump_gpuva_info(&self, m: &crate::seq_file::SeqFile) -> Result {
+        // SAFETY: `m.as_raw()` and `self.as_raw()` are valid by the type invariants.
+        to_result(unsafe { bindings::drm_debugfs_gpuva_info(m.as_raw(), self.as_raw()) })
+    }
+
     /// Access the data owned by this `UniqueRefGpuVm` mutably.
     #[inline]
     pub fn data(&mut self) -> &mut T {

-- 
2.43.0


