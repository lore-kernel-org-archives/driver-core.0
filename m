Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4463B8BA4;
	Mon, 27 Apr 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289326; cv=none; b=kmmPfZqb+qGMacNLq4SAj/bQ77+XItn3ddXYbFzjaL0oyaVADs2rYrd55PLgsGBCMDAMCPucdPrq7E6cA2fij7DlhfXN+d7PczckRzFFaG0zHbAubwi8k+sQFMv1fnKKncl9u9XaRge89WZbvie1/CAaaqDmhJmUg/1uaHDHlQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289326; c=relaxed/simple;
	bh=t8qbdGApkXc67C5NnjZ7tvOcU2R+JY87tSW+zpj3HpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MPGdma+jflMOqYKYuFa6e37VCZzTPVWguNjTCXMhjusrtBwDblXKOPgVZYg6enK2A1SbEbD7mkIxXkYy8gq4LPQmb+BxHhaa1n8NB5MUeI0n6Wrm3K2Lyfc6CJ0p5P9arFpb1yGYam7Txv7TWzOVf5JIpZBT6twuju0LaBJDjos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKf7kjVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKf7kjVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48676C2BCB6;
	Mon, 27 Apr 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289325;
	bh=t8qbdGApkXc67C5NnjZ7tvOcU2R+JY87tSW+zpj3HpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CKf7kjVaGTbyarud+ThC4Vxiu8xbySQouSnNVb/Vmzb1AWQR6AmGBbWlgljgoQzB4
	 LW7crYz45tOqZ9D85aVv+f2uqFy/SO2IHk+sFtbb2oInLixMS2ezG8ZSAGOwhYkVD7
	 W32cfeHWob0h39EEEo2xJkYjbfy8c9MM+i0dxqBMmmEtNwMkhj6BW4fxdoSd0MpvVG
	 /lVb0IFO0ewg1qMpHZr7VDmt86BZps2ybG+B6Q813TXyiJpCO2fQhQvaTyQOCx4dTM
	 +w+rPl/+gPc4BH3+v5baSFY5BLzzXNYmRkL2lLSALBeJ78T+zzkJWyPeFd+YE9eSoL
	 K5U8sVVf59wOg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection syntax
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <Y_UaWMYTo9Xb8viyPNggy28srKaFUvKR9HjIcL1PpalkyTdjVdIgSU_O-zU-kbfo7QT3pyp6v8v03_EeVCUNEw==@protonmail.internalid>
 <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Date: Mon, 27 Apr 2026 13:25:58 +0200
Message-ID: <87o6j4r6ex.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


