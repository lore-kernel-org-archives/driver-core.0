Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832174;
	b=D/DVW/eqYaDJmHBp7GiyrdNp2xHny33GWMZosxmPAVkmX1W3klhRxbaM8+vmoNhePreH
	 2JnVTjypfRuH92v1wSiv/XpfyqRGYaN2Zfj44SkiDALldeT2b1jAbYTvGy6z4mRM7XHBB
	 qmUDXdlJVktR1ICOVk31GkV23rbtw4mOEgegQa1h2+Ws31mR8d0W9w9dBLaC60BVVdbzl
	 jE22Xr4oGhYG87V7CIS33cZZnWWrF8jDPzxZ9qm341jq5ZXXOilenxrjBtNAzqtDPjH7f
	 6vmJ3EGFEOSwApN1xdDgas9IQUJ+XM+UUgOUeOHFyHLiGJuIdrEbpgpZWYb6ZJBTI+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832174;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=guwh6GozeLPvfz356i8dWE3xUsjRarXnXelDp26/pfM=;
	b=0uOmUF+7O7ayGypZ8qKBRvGrfltqCglKinWISJJLO/aieWexR5QQ6z94zVyZ84kg6Lf+
	 A6l46n2hl/T0AOKWqmUXtVWdtcyUzn7POC2bQg1cGt9TaQf1RKudOKCOuIC1riMxQBTXB
	 GlOjTr8qsK0Gn2bh1vXE5AJ2ccAwAeYIkMlxG3c3DkwoMoJU588nsbCRw/HwNs6lvXoh/
	 SdCWBRPqlvvMYW8bZsRVjHY6T3NW5hOBV02VP4vhrkdHGRzzktDtj0VDxNce5q8zGpLz3
	 8qklWJ9ij23nBD9KMtNpztpjCH82fLuE0r4SyV4tHafLKLcri927EfPClT3JjSC9s4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtOT5pas;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB895606A31C;
	Mon, 16 Nov 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtOT5pas
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C731F000C5;
	Mon, 16 Nov 2026 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832174;
	bh=guwh6GozeLPvfz356i8dWE3xUsjRarXnXelDp26/pfM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BtOT5paszL/iHTVLo7bxBBQaxXYSu4mS5U31XRsJQwxbbyqtQHDN445nhI1N4gY7M
	 RuZtqBcHPweZutKPJaSM9bbn0Hs/8/DcvtIa4VBx8a9yPe0pnv6ZPG2vXI673s/rJQ
	 iYB1EK3Fb81UJi+OmE9L2/NDTRNFiEHmQ39f5KiuUET88zv8DF6gvsYZbXrMtcamBP
	 NTLMRdu4RM7AT11Q1vXvuRA/wYf89tRcKedxm6r9G/E0Iz+h+nx5cIkNJuppszSRuX
	 0q+zjL0Sh49t33CJ1OdSvF3ugVHLsJ5uc9AlReFTZG8h7egWMMKGdd3ty+Hg+VfPyo
	 aCTBlVsnkVS0g==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 13:29:29 +0100
Message-Id: <DMWMWJV23VO4.1V6D60QKD5KT5@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: remove unnecessary firmware
 pin-init
Cc: <aliceryhl@google.com>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
 <20261114234324.82387-2-dakr@kernel.org>
 <DMWC44MU9W7N.3TBNH0HCKK065@nvidia.com>
In-Reply-To: <DMWC44MU9W7N.3TBNH0HCKK065@nvidia.com>

On Mon Nov 16, 2026 at 5:02 AM CET, Alexandre Courbot wrote:
>> +    pub(crate) fn new(dev: &'a device::Device<device::Bound>, chipset: =
Chipset) -> Result<Self> {
>
> `GspFirmware` is 312 bytes, that's not enormous but that's also not
> small... Shall we keep returning an `impl Pininit`?

I considered that, but it's only ever constructed in Gsp::boot() and does n=
ot
outlive boot(), so I think it should be fine.
