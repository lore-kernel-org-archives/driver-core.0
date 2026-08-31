Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4A408017;
	Mon, 31 Aug 2026 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219662; cv=none; b=ULYR9BdNsjZ6/foYl361BlY5aJM6qjzzxsdvwuhxtTAhf4NcjLGA3eLbcitegBKA7O8adoECIAAh4mvcaAU09DKuLYm9qvCJGN6mZ/MMcvR5V74qS811Sua3LjG6UpqKKzxtkXFK/JfZlVPYb6lUbIh38fuMHJ/Y8L2LNPKFpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219662; c=relaxed/simple;
	bh=lzTPqvCpuD3Offo77tFmPZMg+nODPXTVZbeeobizTTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=diPaSJgLhyD3cyshR7z6oRGzo4AC8mSqpFGskk9uSLXQyO6LbbYgt2/7149Of2MiaX+uN+ZKZZsI8X1W3tdSlW2DeBgvxIMCfIHsiS9SoGi0rDZO0t4iaBe/cObEtOmyo4ExmCi7WyxelJrSclRJIrQXTuo6Dx2w/oD8q1EEteI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=dT0O5try; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="dT0O5try"
From: Matteo Kloiber <kernel@matt3o12.de>
X-Lima-ML-UUID: 61c678b1-c3a4-4cff-a8c9-6ec6af3f13e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1788219152;
	bh=lzTPqvCpuD3Offo77tFmPZMg+nODPXTVZbeeobizTTs=;
	h=From:To:Cc:Subject:Date:From;
	b=dT0O5trySNUNRvAe1CSCRUGb2BG5Xm8RJHVHbttbS+OaiFE4rMD+AQ45I2GM3cdwX
	 lpFh+A74WK2S2fihnHpxwomEs4pRhokdVqJ/MncVHSOCLuJ6EflWIU2NYBWKTj+Gmk
	 5KA9A35SXg6KItmgCYy7OQ74QNCcYqD2GX1FHm6B/Cd1Vi6u43/Yi3+DJEk0TyFBBw
	 5gMETmD7kkS0OidtkmFdvCvyoMEBKLt7KcFl2WvKadfWZ9oo0SXz3qL3vRotdnoPQZ
	 IL8Z7NTprqAnbnNvAq4onb2gSo5yxU5qoPxTI1zE4SuXs4kn6MqZwkdtge32M2+Irw
	 lAkhlklOCArkw==
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ojeda@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matteo Kloiber <kernel@matt3o12.de>
Subject: [PATCH 0/2] rust: honor the maximum DMA segment size
Date: Tue,  1 Sep 2026 01:32:13 +0200
Message-ID: <20260831233215.287881-1-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Booting nova-core against a real GSP with CONFIG_DMA_API_DEBUG=y warns
when the ~60 MiB firmware image is mapped as a scatter-gather table:

  DMA-API: nova-core 0000:00:03.0: mapping sg segment longer than
  device claims to support [len=62914560] [max=65536]

There are two separate issues behind it.

Patch 1 has nova-core declare the segment size it actually supports. It
re-decomposes every segment into 4 KiB GSP page-table entries, so it has
no upper bound on segment length.

Furthermore, I also checked what other GPUs do, and most do the same:
set the max segment size u32::MAX. So this should be the correct
behavior for nova as well.

Patch 2 has SGTable::new() honor dma_get_max_seg_size() in addition to
dma_max_mapping_size(). The abstraction is generic, so a driver with a
real hardware segment limit would otherwise silently be handed segments
it cannot express in a single descriptor.

Tested on an RTX 5080 (GB203) passed through to a QEMU guest via VFIO
with CONFIG_DMA_API_DEBUG=y: the warning is gone, and GSP boot and RPC
still work.

Discussed on Zulip:
https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/nova.20core.3A.20DMA-API.3A.20nova-core.200000.3A00.3A03.2E0.3A.20mapping.20sg.20segme/with/618319830

Matteo Kloiber (2):
  gpu: nova-core: declare unlimited DMA max segment size
  rust: scatterlist: honor the device's maximum segment size

 drivers/gpu/nova-core/gpu.rs |  7 +++++++
 rust/helpers/dma.c           |  5 +++++
 rust/kernel/scatterlist.rs   | 12 ++++++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.51.2

