Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9736655C;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036195; cv=none; b=clbQNSD7BahDf0G7L7HH6zH6sOzYhGfn3yxGLs+impS3VLLUCmy2oPo2nfxU6YhrWSP164qWwQBx+c+f9nWitRKTsJ9Ju4FVSJkLP5THRHGcAPcHgx4WxJ91RlgjqOCabsLxW9mltZfOWdjkzByDKt818tJvocCAD6sxML7hrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036195; c=relaxed/simple;
	bh=RuhGFQg/miapkcuhF9rScJiktA9Kr0LCS5Epiji8ajo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0VqIs/9+jKK8gU1rXf9O/8rqfcBOQbBNVsv5O+SUOox7jk3yxPXiEayiom6oXd75nV86iWoU9YMJNQNR3ndIdrVOY4uQtQmpuaru4jKow5SKgvxMsNwNb3qh4Qohw14Vdimhw+GoooNOrrt3b2j2LyzFuneyuIzFd7EkO9ttGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Yqyfy1tY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Yqyfy1tY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 301ACC2BCB9;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=RuhGFQg/miapkcuhF9rScJiktA9Kr0LCS5Epiji8ajo=;
	h=From:Subject:Date:To:Cc:From;
	b=Yqyfy1tYjNbjY6Gmbrk7qy/zG9Dl936c6E73oY/5vVOJFQ0ZIf23qGnt5OWDWoiRA
	 d8xNt0PS2mer4vsSUK1lPyv9TDYWpFggTyDKVnopbTYMEgc8T00WvGaXDCAWU6SrKe
	 Q9ui4tcZr+H8PsBVuPZaAB4rezbVxX7ZkzQD1Yfg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EF3C5AC7C;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Subject: [PATCH v3 0/8] drm/tyr: add debugfs support
Date: Fri, 07 Aug 2026 01:07:22 +0800
Message-Id: <20260807-tyr-debugfs-v2-v3-0-ff5595ac66ae@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEu/dGoC/12OywqDMBBFf0Wy7pQ8JNGu+h+lizxGDRQtiQZF/
 PdGuygWZnMunMOsJGLwGMmtWEnA5KMf+gziUhDb6b5F8C4z4ZRLqgSFcQng0ExtEyFxkLSy2Cj
 lJNYkS++AjZ+P4OOZufNxHMJy9BPb129KcAmmPNcYUKCqNNo5Vikm7y/fT/PVYSJ7KvGfrgT7/
 yQfBY2a1WitqeuTvm3bB0wxIp/rAAAA
X-Change-ID: 20260730-tyr-debugfs-v2-608cef77d6e9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=3511;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=RuhGFQg/miapkcuhF9rScJiktA9Kr0LCS5Epiji8ajo=;
 b=X5XkghnYmEdXOxcW0VBUwCwj7xAmV82mVDRAHfY3fbEbBTkooxL4P2Hu+pDHRz2Ki3LxhWX84
 uRg1MouoXGwCgflzX6SsVcIYbQLAGi0vhGy2YS0apDzCXpe6bAlAuIO
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add debugfs support for the Tyr DRM driver.

The series adds a SeqShow trait for seq_file-backed debugfs files, a
debugfs_init callback on the DRM Driver trait, and a gpuvas debugfs
file in Tyr exposing GPU VA space information.

This is based on drm-rust-next and depends on:

[PATCH v10 0/7] drm/tyr: firmware loading and MCU boot support
  https://lore.kernel.org/r/20260728-fw-boot-b4-v10-0-9187aefa3f2f@collabora.com

See the full dependency and commit history at [1].

Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/11
Link: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/59 [1]
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
Changes in v3:
- Drop the DrmSeqShow adapter and use SeqShow directly, per Danilo's
  feedback. Simplify the debugfs_init callback signature accordingly.
- Redesign VmRegistry per Daniel's and Alice's feedback: move it to
  vm.rs at the top level of the registration data, use Arc<VmRegistry>
  for shared ownership, and separate register/unregister from Vm::new
  and Vm::kill. Registration failure is non-fatal (dev_warn) since the
  registry is a debugfs convenience.
- Add VmRegistry::unregister to remove VMs on teardown, addressing
  Alice's concern about the list going out of sync.
- Drop the "hold device reference for open files" patch; the debugfs
  proxy fops already ensure file operations cannot outlive
  debugfs_remove().
- Improve SAFETY comments and fix style issues identified during review.
- Link to v2: https://lore.kernel.org/r/20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev

Changes in v2:
- Reworked the debugfs implementation per feedback from Danilo on v1:
  dropped the hazptr/revocable-based approach in favor of the DRM
  debugfs_init callback and generic seq_file abstractions.
- Fixed a UAF in drm_debugfs where a device could be unregistered while
  a debugfs file remains open (drm_dev_get/put across file lifetime).
- Link to v1: https://lore.kernel.org/r/20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev

---
Alvin Sun (8):
      rust: seq_file: add as_raw() method
      rust: debugfs: add seq_file support
      rust: debugfs: add ScopeRef for existing dentries
      drm: move debugfs_init after dev->registered is set
      rust: drm: add debugfs_init callback to Driver trait
      rust: drm: gpuvm: add dump_gpuva_info to UniqueRefGpuVm
      drm/tyr: track VMs in a registry
      drm/tyr: add gpuvas debugfs file

 drivers/gpu/drm/drm_debugfs.c   |  3 --
 drivers/gpu/drm/drm_drv.c       |  5 +++
 drivers/gpu/drm/tyr/debugfs.rs  | 20 ++++++++++
 drivers/gpu/drm/tyr/driver.rs   | 16 +++++++-
 drivers/gpu/drm/tyr/fw.rs       | 18 +++++++--
 drivers/gpu/drm/tyr/tyr.rs      |  1 +
 drivers/gpu/drm/tyr/vm.rs       | 33 ++++++++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/debugfs.rs          | 84 ++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/debugfs/entry.rs    | 15 +++++++-
 rust/kernel/debugfs/file_ops.rs | 60 +++++++++++++++++++++++++++++
 rust/kernel/debugfs/traits.rs   | 11 ++++++
 rust/kernel/drm/device.rs       | 41 +++++++++++++++++++-
 rust/kernel/drm/driver.rs       | 11 ++++++
 rust/kernel/drm/gpuvm/mod.rs    |  9 +++++
 rust/kernel/seq_file.rs         |  6 +++
 16 files changed, 323 insertions(+), 11 deletions(-)
---
base-commit: 0ffc014cb2abfc79d161662b125e085b3e7107e7
change-id: 20260730-tyr-debugfs-v2-608cef77d6e9

Best regards,
-- 
Alvin Sun <alvin.sun@linux.dev>


