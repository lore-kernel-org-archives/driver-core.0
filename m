Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F74DB56D;
	Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555002; cv=none; b=in3l+yf29TCoczXRcVO+2991QBX1DZCA3fpCXOkILBkigM+VZap/nezq3rv9aGIeWkeALLe+YW4fLbEJFXljGc1J5Cbfk0aSeC/iFThs0CV+yZggUg0dpkrjeGNVSY6OBTbJhQ5HlSdMCDXC/36d+Bt2cnvFHXppgCenCXpcNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555002; c=relaxed/simple;
	bh=LZhImWuMkU3twctJXiYSMBdRdlQpQCpIy5sEVsTJsPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogKPmi1l9CJw8D6XwMH8fC24KALkI0a26uEtAUTrGv0k7zMBRMcXm3XWA/yBZDppB47Qq9tCh6t+s6OkYEy3Yu2DuCV+M8hQHHJbk7x5eW3fG4YpOZxRwZMnKfwxc4KBCWqtoCAceWmii0hpAw00/Zkrep1xspHffFuOTAWvdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D20tbfkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D20tbfkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFDCC116C6;
	Tue,  3 Mar 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555001;
	bh=LZhImWuMkU3twctJXiYSMBdRdlQpQCpIy5sEVsTJsPs=;
	h=From:To:Cc:Subject:Date:From;
	b=D20tbfkk1xkCPRKVfaRXdyuOyGZz1o7Ue+wpoIv/a6AGFcACdSsZvjdOlt1lRKfvQ
	 Fe3wXKViyuY0H0RA4uCFyoshov8odkRYxqGBg6EyzRcLNkQkE62kddf6fOzsSazMem
	 brjQS63XriSXH5R6skF56yLgRCVC3chPWIzCc4uSzDmAgW/FvZyq5qIWrcVANTNJpF
	 /se/9Zm9lyHKpYaz1ydAdzgPugtxASifjrH6Dik2pVK49p7RiUaPnPw8oSN7K9fUsA
	 omOYTIt2mxuY90G9aG8rA2AXkPg/ApM3+L+tq2V0xb0gIslnkFmktJEWz/zRjtDljD
	 opvtQUPsw7HYw==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Cc: driver-core@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
Date: Tue,  3 Mar 2026 17:22:51 +0100
Message-ID: <20260303162314.94363-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the dma::Coherent API Gary worked out in the
context of his I/O projection work.

Additionally, introduce dma::CoherentInit, a type that encapsulates a
dma::Coherent object before its DMA address is exposed to the device.
dma::CoherentInit can guarantee exclusive access to the inner dma::Coherent
object and implement Deref and DerefMut.

Also add Coherent::init() and Coherent::init_with_attrs() so we can directly
initialize a new dma::Coherent object through an impl Init<T, E>.

Danilo Krummrich (5):
  rust: dma: use "kernel vertical" style for imports
  rust: dma: introduce dma::CoherentInit for memory initialization
  rust: dma: add Coherent:init() and Coherent::init_with_attrs()
  gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
  gpu: nova-core: convert Gsp::new() to use CoherentInit

Gary Guo (3):
  rust: dma: add generalized container for types other than slices
  rust: dma: add zeroed constructor to `Coherent`
  gpu: nova-core: convert to new dma::Coherent API

 drivers/gpu/nova-core/dma.rs      |  19 +-
 drivers/gpu/nova-core/falcon.rs   |   7 +-
 drivers/gpu/nova-core/firmware.rs |  10 +-
 drivers/gpu/nova-core/gsp.rs      |  65 ++--
 drivers/gpu/nova-core/gsp/boot.rs |   7 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  55 +--
 drivers/gpu/nova-core/gsp/fw.rs   |  82 ++--
 rust/kernel/device.rs             |   4 +-
 rust/kernel/dma.rs                | 626 +++++++++++++++++++++++-------
 samples/rust/rust_dma.rs          |   8 +-
 10 files changed, 619 insertions(+), 264 deletions(-)


base-commit: 1195fcbda62f12108dc9be56fa4173897905b90c
-- 
2.53.0

