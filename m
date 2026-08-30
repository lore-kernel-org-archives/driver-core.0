Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC61429D;
	Sun, 30 Aug 2026 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788118751; cv=none; b=gzCn12Toc5vM4eM4A3njZxL8hEjDj/tSziO8MR8CW7w/6qMRTOxt7vKb4p+h9LykSGWYLsSWOEyWQR5sjbxfTOgq3kHC+oS9ejmnlaLCQpuQIc31Ga444TH4tUDn2XqxocKKxpYfrmslzQOsJiL6/tgT84Hf5RqIZBpMJMH3ShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788118751; c=relaxed/simple;
	bh=aKCL1L/l4Hob6dllE1zyMCEDUs+iEKCi98QzuCRPWZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHq7BktADbFN2MFv6nq6igeuip9A3raYlvt8XPZwHpybmMCQcITKq4YPRVSYDT6nF6vD6kELvESAlTRi8YK7xo4OpGPhNy5EI3OKzTGXBFWgMYNdva403M/N0flBRUyEa1insSSrV0bJf7FB2seC7L4iniNQuno7DLaJrRRLSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIAcc3TV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIAcc3TV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E011F000E9;
	Sun, 30 Aug 2026 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788118748;
	bh=fLNwrpkdSyF5CJbc3fw4p3nVMnS/vZaro/92PCXSWU4=;
	h=From:To:Cc:Subject:Date;
	b=LIAcc3TVFroExdYUUvX+jRTjeKMNzyPvmNR3+0H7p+5ENDGGJAqfdKkJgId1MadCo
	 f8wf8dZFDiM5A6nFSkr0LyRiDQi3QJp3KCzV9rjZyzRbI+WyWxYvSsot6+9urDmXHI
	 rGA+PiIAYIfsTfiZ9h2yd17IGYXG0/Tvpc8RB2pFi82zUxkjhk80dQl+JgFTCleIj2
	 PYTBvUsEYaUnThCBsSJ4eCiImsopS7RCT4yM5Wg/EysJa1zGNEcWnxpGS9Bz7IMhjt
	 6fBFlgANTpY5KRlI6D0Aq+uesJ7VEw4ahmVPbjz6dgbSohAz+uh4aOkC/GQC005/kX
	 3YewMWB0voZEg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	mmaurer@google.com
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/4] rust: dma: tie DMA allocations to the device's bound lifetime
Date: Sun, 30 Aug 2026 21:37:12 +0200
Message-ID: <20260830193824.471089-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA allocations carry device resources (e.g. IOMMU mappings) that must not
outlive the device's bound lifetime. Add lifetime parameters to the DMA
allocation types (Coherent, CoherentBox, CoherentHandle) to enforce at compile
time that they are freed before the device is unbound.

Since DMA types with lifetime parameters are exposed through debugfs in the
nova-core driver, first drop the unnecessary T: 'static bound from the debugfs
ScopedDir file creation methods by formalizing a type invariant on FileOps.

Danilo Krummrich (4):
  rust: debugfs: drop 'static bound from ScopedDir file creation methods
  rust: dma: tie CoherentHandle to the device's bound lifetime
  samples: rust_dma: separate driver type from driver data
  rust: dma: tie Coherent and CoherentBox to the device's bound lifetime

 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/fb.rs                   |   4 +-
 drivers/gpu/nova-core/firmware/booter.rs      |   2 +-
 drivers/gpu/nova-core/firmware/fsp.rs         |   8 +-
 .../nova-core/firmware/fwsec/bootloader.rs    |  12 +-
 drivers/gpu/nova-core/firmware/gsp.rs         |  14 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   8 +-
 drivers/gpu/nova-core/fsp.rs                  |  20 +--
 drivers/gpu/nova-core/gpu.rs                  |   4 +-
 drivers/gpu/nova-core/gsp.rs                  |  30 ++--
 drivers/gpu/nova-core/gsp/boot.rs             |  10 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             |  35 +++--
 drivers/gpu/nova-core/gsp/commands.rs         |   2 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  12 +-
 drivers/gpu/nova-core/gsp/hal.rs              |  14 +-
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |  16 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  34 ++---
 drivers/gpu/nova-core/gsp/sequencer.rs        |   6 +-
 rust/kernel/debugfs.rs                        |  26 +---
 rust/kernel/debugfs/entry.rs                  |   4 +-
 rust/kernel/debugfs/file_ops.rs               |  52 ++++---
 rust/kernel/dma.rs                            | 141 +++++++++---------
 rust/kernel/uaccess.rs                        |   4 +-
 samples/rust/rust_dma.rs                      |  30 ++--
 24 files changed, 241 insertions(+), 249 deletions(-)


base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.55.0

