Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B303D1CC1;
	Fri, 11 Sep 2026 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120410; cv=none; b=sI+FVEvnqiXUOt5H4h/Mh0di+wCz890nos+dVuzKRiCbI5Ctw9zXvStMlmeuJFDLtqk/dnafTUSKiT1lo5kKNIRHuqQCUuNltmZMvyMrhHHSKpbVV61iAG8Dy6GAu3HGcPVOcGkRrU92okX7b0JTnfIk6LsOxbBMXqOD9QFDj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120410; c=relaxed/simple;
	bh=cWvBrZ5EzEWY6B5Q4YEGoEOGnwb0qHO6eV7PAuHhU4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkrA2UBQ5oW2wk/Gxg2amalaK9ekDZflqKJczLOWZsszJR2Zb+4i9L68/nmDf0NIaJGBjYmHs/qXIOWzRgB4geA3isTzWbjwTuMbrCJopc/xGjKrUNHN6eo+VVGR1wQLnVwmq6sawy+rYeSMzxs/i/K/epPoxdZXGIPrpjFgpuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI6QsPls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI6QsPls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1497F1F00893;
	Fri, 11 Sep 2026 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120408;
	bh=LLy8nolpz9uz95Ne/GucVTFVjWJLSRBAQmDU2+FWe6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jI6QsPls7xGEz13RXALI6DJxVDSNFWrxXBpHqRbDt/rn7xRKmDSTLKAM8E6TITD/X
	 DU1YVXWOGQN/CEdx5HkgW4h0NMyqGWfEtJsiUwM57sewh02XPucNUAQjqoN+3Ka2Zs
	 bh5GGKHNhdprvfFmCPsLFKijA+WZW8/zdP2NSW7ppQUMxROUwT/mOMno7AzDE0w+bC
	 B5uaKxNy6+745bQ29nQ27+atwM5nSJHgQwG0hwl3t2eNsvuRIbfjRrmQWEZlHOAjFL
	 jBShVcBzzxydy87Djv6DnhYzjKhT3DS7l63Hk/id/tlw0yzpvVA3Up6T3HNQrSVqQT
	 8cnr/LORcLaNw==
Message-ID: <4c376405-17ec-4dc2-a5a5-662d1dc3cf85@kernel.org>
Date: Fri, 11 Sep 2026 11:53:22 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: pci: add resource_flags accessor
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
References: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 9:51 AM, Eliot Courtney wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Add a `Device::resource_flags()` method to the PCI Rust abstraction,
> wrapping the C-side static inline `pci_resource_flags()`.
> 
> The flags returned correspond to the `IORESOURCE` bitmask carried by a
> PCI BAR's `struct resource`.
> 
> The immediate motivation is BAR layout discovery on NVIDIA GPUs: a
> 64-bit BAR consumes two consecutive Linux PCI resource slots (the lower
> 32 bits at index N and the upper 32 bits at index N+1, with the latter
> having no flags or size of its own).
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> This is patch 1 of Joel's nova-core mm prerequisites series [1],
> reposted with no code changes. The rest of that series was folded into
> the PRAMIN series [2], which is now in drm-rust-next and didn't carry
> this patch. The upcoming nova-core memory management changes still need
> resource_flags().
> 
> This is based on drm-rust-next.

Acked-by: Danilo Krummrich <dakr@kernel.org>
