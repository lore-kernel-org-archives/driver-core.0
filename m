Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA636493C;
	Tue, 29 Sep 2026 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648156; cv=none; b=pPqqPhmMBUXWyRPcMMHSTYPg4m5VcPAVRn5gEYd9vYlFwgRBTp1uJWmbXHKUW5qPX+iaj+VcbEpPSfDADP0VACMvM1i3x/gqBWf43/GTxCAh+b17mPd7/rsoVUNK31w0OpBFSS3oszbDeLeI0bTmflBv5kIEo7iEtURXJ9jjomQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648156; c=relaxed/simple;
	bh=ooYC+l4SrJN6bGPugVtyHBohZ+NNQhJkNOGOM/4tdY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YHWuqYVpdlU7K8EKSe0GI+CoJv6GSX6+VnVrjGud76jvcPeew+Pmc+ZwIljlhzQTRoYI3YjsYLt4S2zAkYiSwmgzkEknuive0gwjTbLn9TcL46PLId2rZ61zP8l/TRtfhOJDbsBUjlQOLFJR6nTiKHMWrrcgO9TK0BsEVDo4TBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ersylhuz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ersylhuz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24AB7C2BCB3;
	Tue, 29 Sep 2026 02:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790648156;
	bh=ooYC+l4SrJN6bGPugVtyHBohZ+NNQhJkNOGOM/4tdY4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ersylhuzEEBuuSYNmcupQ+PcDDlh6wvZHS20K2kXFRIqCqTHZQOkTN7qNVcwG6jBD
	 fGJJ8WRYhxw1JOh6xP67tuJTGbfBoczWzbCB3JyM+eE5Z3H85cegaSJC0FCtJPkK4i
	 yFSd79JQYUF+B3OA2dIqG8yUR5ip9GuVBXWXkplFwZayub2Hwf4NKazDoWqGLEZBNk
	 GaXyI06KRyMFCRknbWb2zJAZTNK0U/Kv9TxqF+G7QkEt/COQ9ZEfaG5p9hUQjpMLOp
	 0J5lRz6L8zSqIzEkKGzYyDjRwWohtyg1pP9+m/bP+4KAPwRnT9YgI8a3Zyo6N9G5eK
	 1r8uQONK7zMFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37DECA5FA5;
	Tue, 29 Sep 2026 02:15:55 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Subject: [PATCH v3 00/11] drm/tyr: add VM and BO ioctl support
Date: Tue, 29 Sep 2026 10:15:50 +0800
Message-Id: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYfu2oC/x2NywqDQAwAf0VybiAqCO2vFA/7yNZAu5ZkFUX89
 649DsMwBxirsMGjOUB5FZM5V+hvDYTJ5RejxMrQUTfQnVosu6LMobwNU0ucKAaf3AA18M4Yvbo
 cpiuJ+kFdrGDmrVz+q5xk+8+e43n+AIzm6x18AAAA
X-Change-ID: 20260901-tyr-ioctls-f10ef0dcbfa6
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
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790648153; l=3204;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=ooYC+l4SrJN6bGPugVtyHBohZ+NNQhJkNOGOM/4tdY4=;
 b=vG8aN2wX4mjFn++VavBwQib+q2XRrZvaXLL2g4PG7RtZcyiIFBKfO2eDxKaRvjQzq+49q5D5x
 W20uRDli1WMDBWciO4UHODesw3H7R8PRE5v/6xseI7lpGx9E7dhoRnz
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

Add the VM and BO ioctls to the Tyr driver, aligning its userspace
interface with panthor.

The series is based on Danilo's `drm-file` series on
`drm-rust-next`. It also carries Sami Tolvanen's buffer
cache-management patches from
https://gitlab.freedesktop.org/panfrost/linux sami/tyr/7.3/dev.

The panthor IGT tests pass on an RK3588S device.

A branch with the full series and all prerequisites applied is
available at:
https://gitlab.freedesktop.org/alvinsun039/linux.git tyr-ioctls

Link: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/64
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
Changes in v3:
- Drop the VmOwner wrapper and kill VMs explicitly on destroy and
  file close (Deborah).
- Add Sami Tolvanen's buffer cache-management patches: coherent
  devices map buffers cached, write-combine buffers flush at
  creation, and BO_CREATE accepts WB_MMAP.
- Drop the new_dummy_object refactor; the dummy object stays a direct
  Bo::new since new_object now fetches the sgtable for write-combine
  buffers.
- Document the LargeSizeConstants trait in the sizes patch (Miguel).
- Misc commit message and comment cleanups.
- Link to v2: https://lore.kernel.org/r/20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn

Changes in v2:
- Fold the VM pool into vm.rs and cap it at 32 VMs per file (Deborah).
- Add VmOwner so a VM is killed exactly once on drop, regardless of
  remaining references (Daniel).
- Replace the VmSpec enum with new_for_fw()/new_for_user()
  constructors (Daniel).
- Parse VM_BIND op types via VmBindOpType and use the kernel
  Atomic<bool> for the unusable flag (Daniel).
- Use PAGE_SIZE for the dummy object size (Daniel).
- Rename BoData::create_flags() to flags() (Daniel).
- Report VA-split failures with dev_err! at the caller (Deborah).
- Link to v1: https://lore.kernel.org/r/20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn

---
Alvin Sun (8):
      rust: sizes: add SZ_4G constant
      rust: mm: add `task_size` helper
      rust: sync: arc: relax `ForeignOwnable` for `Arc<T>`
      drm/tyr: add per-file VM pool
      drm/tyr: add user and MCU VM specifications
      drm/tyr: add BO creation and lookup helpers
      drm/tyr: add VM-related ioctls
      drm/tyr: add BO-related ioctls

Sami Tolvanen (3):
      rust: device: expose dma_coherent()
      drm/tyr: gem: flush write-combine BOs from probe-time coherence
      drm/tyr: gem: map cached BOs for DRM_PANTHOR_BO_WB_MMAP

 drivers/gpu/drm/tyr/driver.rs   |  24 ++-
 drivers/gpu/drm/tyr/file.rs     | 405 +++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tyr/fw.rs       |  21 ++-
 drivers/gpu/drm/tyr/gem.rs      |  78 +++++++-
 drivers/gpu/drm/tyr/vm.rs       | 325 ++++++++++++++++++++++++++++++--
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/device.rs           |  16 ++
 rust/kernel/mm.rs               |   7 +
 rust/kernel/sizes.rs            |  12 ++
 rust/kernel/sync/arc.rs         |  12 +-
 10 files changed, 851 insertions(+), 50 deletions(-)
---
base-commit: 47cba9eeecd9a046ee5d211b86aae3e84d2e0b53
change-id: 20260901-tyr-ioctls-f10ef0dcbfa6

Best regards,
--  
Ke Sun <sunke@kylinos.cn>


