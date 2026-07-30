Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D1434E3E;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431151; cv=none; b=LTFjz/KYK8iGmD9aJKY14bGWmlGzsCU6hX9I7IqtmCi4U2ehru05ZHHr0DXZ3kGh+juCY2+Nh9liWJwPReHaHa5QqAPUXp84f1Ka4py0lUcEKsbWnh7CEKeznCd1Xu4j4OaKg1/T6g2sQZawP3ZCIgCBZhzkRPY9D/r7AIizuEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431151; c=relaxed/simple;
	bh=NX/9FQXMAwjzHsZtdfgcGo+thvCbDsU1kpIsxoHDurk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMtbuHw1XECoQSAaAoJ2QEa/q+u1Ntbpq7VXUYl64vE1dMSEQYu7Epo7PeqbwNPt0v5mD2mkb0TQHiGxeMnO+diOz/IfcCFf/FRbulioflvT4QZ4vlxEJCBEc/TWwwj/Ocq9KawnrydjTjojxaXQRGnsnHZumaJe5mI02iO3QXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dhwEsmcq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dhwEsmcq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C7F0C2BD01;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1785431151; bh=NX/9FQXMAwjzHsZtdfgcGo+thvCbDsU1kpIsxoHDurk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dhwEsmcqjbVlVUIEV607eSZN6VTYj4jLxgnN2BuMwP0KbIc840FtymcmOINeS92Sc
	 mUi6tIm3NNvZQuZNONbq/hc/Q6IFLyGbP1BBbugxAn6HK0v8/bYl9wHcaRhz7eWx9D
	 5VQTWAASGXVRtiIXbu7P2jQyR+D1XmSEL4XQp9/E=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B59C5516E;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 31 Jul 2026 01:05:45 +0800
Subject: [PATCH v2 7/9] rust: drm: gpuvm: add dump_gpuva_info to
 UniqueRefGpuVm
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-tyr-debugfs-v2-v2-7-aea19eccb996@linux.dev>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>, 
 Eric Anholt <eric@anholt.net>, Ben Gamari <bgamari@gmail.com>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785431148; l=1085;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=NX/9FQXMAwjzHsZtdfgcGo+thvCbDsU1kpIsxoHDurk=;
 b=cD39ySEYIbIAhUOKIQFpOc4MgiEtfltDPaMc4WolTSVbYVrpErF1ujIo9f14HN16T+q5MJyJz
 EnwgmZQwiviBPwAqNYogW//0Hpe0VYPTPP8y9CXV0uDkuY/IRUuM3yO
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add method wrapping drm_debugfs_gpuva_info to dump GPU VA space
mappings into a seq_file. Needed by the Tyr gpuvas debugfs file.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/gpuvm/mod.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 20a08b3defeb8..9da88501a4206 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -312,6 +312,14 @@ pub fn data_ref(&self) -> &T {
         unsafe { &*self.0.data.get() }
     }
 
+    /// Dumps GPU VA space info into a seq_file.
+    ///
+    /// Wraps the C `drm_debugfs_gpuva_info` function.
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


