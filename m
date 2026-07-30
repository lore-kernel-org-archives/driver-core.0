Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995B397E9A;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431151; cv=none; b=cVQWBbAZzmqe/EFdIBGAs7+t6rpeqQEZ5Be0smWKN2USdTZtT00XQWBiz81B4ql8haEKVY3BSWbxc3y40hV5yo9sEA/xYPpuuY1aDquMTHHxBOKLD9nPe75x43e4TmV7n57sOXkpX3yGdK/urXIvF0jIRQ854EInLYx089poTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431151; c=relaxed/simple;
	bh=s/xpgHrjMnr3Dw/gDnMO8NhtKWrQpFIoMn7udGnLIvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfFNGVgkGHga+Vz3PHi/8w07+SqJQShS6Y3PLkq/StPsZN/MlZir9+D5qi4TVr5F48jeJ1ZYM0O6NdDFBh+zgbSv3in7IreyTbMLoNdMumA0vRUal5nwDqJQBSseBNmeHHJanCl1wNew3nJpeSstJpVWSPsJWo6rg1wU/WlMljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O4Ao7arJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O4Ao7arJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1817C2BCB9;
	Thu, 30 Jul 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1785431150; bh=s/xpgHrjMnr3Dw/gDnMO8NhtKWrQpFIoMn7udGnLIvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O4Ao7arJNeeVq9ckYXQ0tqcqhcbIBJTyp7blBbOf95UHmJjvfn+4maqpQBRCjdm3G
	 wS0oHJEEKXAlJk57dPeByPJjCCuCsHFeuOb/LzgTwoOWOK2ygNDonHUyNaCxnP45cT
	 KqnqF/FZohcfaHzBT5UoSUIXkESUksnY1XCV0xT0=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02D9C55162;
	Thu, 30 Jul 2026 17:05:50 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 31 Jul 2026 01:05:39 +0800
Subject: [PATCH v2 1/9] rust: seq_file: add as_raw() method
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-tyr-debugfs-v2-v2-1-aea19eccb996@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785431148; l=882;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=s/xpgHrjMnr3Dw/gDnMO8NhtKWrQpFIoMn7udGnLIvs=;
 b=RllQx43KbHuxgGco1sV76In+WKsRfcxUAilY4N3HdnKKwnLHutWJYha4dKAQ3SU4ikxcNuoVI
 X7YXbjya30dAzwLGJRoE2TzSdEk4DTVXOA7frGQiq4WSXNZaWgkas6X
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add a method to obtain a raw pointer to the underlying struct
seq_file, needed for FFI calls into C (e.g. drm_debugfs_gpuva_info).

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/seq_file.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 518265558d66f..fbc75e0e77634 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -29,6 +29,12 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFile {
         unsafe { &*ptr.cast() }
     }
 
+    /// Returns a raw pointer to the underlying `struct seq_file`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::seq_file {
+        self.inner.get()
+    }
+
     /// Used by the [`seq_print`] macro.
     #[inline]
     pub fn call_printf(&self, args: fmt::Arguments<'_>) {

-- 
2.43.0


