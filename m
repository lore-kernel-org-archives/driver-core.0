Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F99371D1D;
	Tue, 19 May 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217196; cv=none; b=RJv/2e/bD1Ixw8eS5o7s9UkAPEllDOglJDj+3yLjkymVQRcxnd1cm21RnbxmBnGbRgvY4PqFPR4BM9BHH84FB8ynL44hjDQA3XDhxl2j1Rh1SUFvPNkP0Cfw9QJg9yr8sUswfCTA1pJlRwO/u0LuoOb7FZwQCuxkKz71bBcIxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217196; c=relaxed/simple;
	bh=JWuDBoqe9zj8HOexhMmHxATI2cTIGanQ9Wq2YyALxfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5f63E66dIl+dPljU2v4A7jh8EA2XBjWcACxC6xnVYg46dbSD0yLp92c40W0ekzTzV5SCHfvIoXy7nbBanwIpFY/nj6ThJ29mE8iSWzpbUnDp1M6werXC+FQjkzGv7DrTMkNBoyAfw91h+sLCSxK6PCiKn2F0qp8h+2tOVBCQd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dzYv+gkf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dzYv+gkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779217193;
	bh=JWuDBoqe9zj8HOexhMmHxATI2cTIGanQ9Wq2YyALxfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dzYv+gkf+OPWDvQfPpp4SUNYeDglcuJhp4zM/eGn7ttibouZv2zZ5xdcNvCM/Gba/
	 7tXWbkGewY4po66vru9dkJfchtCYgIra+A6qbULBmkT+aAdC02GjJM3h0vpOOOnsLk
	 F7HwLvgIZjCS05gqOThlLjNDbErvsGs6UsouDXdJ7NfpucRAGVoyEboNEoumU13IIP
	 7sMCT2hEbaZcj33LT7VJx3NywnFdP7HCUs6JY9h29yZYDKpKapply3Sx8p/NDYJu6v
	 litfCuA8lOQrIbAWWn136aBrQpAuoW36dapDOUOjwzusU+VxzrDdmbQEYXL6apO5/j
	 qe3ARjDU6quvQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 554B717E124B;
	Tue, 19 May 2026 20:59:52 +0200 (CEST)
Date: Tue, 19 May 2026 20:59:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <acourbot@nvidia.com>,
 <apopple@nvidia.com>, <ecourtney@nvidia.com>, <lyude@redhat.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Message-ID: <20260519205947.3c9d99b3@fedora>
In-Reply-To: <DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
	<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>
	<agYbppHWXk_hW99M@um790>
	<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 May 2026 21:07:11 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
> > let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;  
> 
> You shouldn't need this anymore as the drm::Registration itself has private data
> now that is bound to the lifetime of the underlying bus device, which should be
> the correct lifetime for juggling the GPU page tables.

The problem we have is that, to initialize some of the sub-components
of the driver, we need to be able to allocate GEM objects before the DRM
device is exposed (registered), and because the data we want to attach
to the final registration contains these sub-components, we need to
defer the data assignment to the registration step (which was allowed
by [1], but apparently this was dropped from the latest version of
the series for some reason).

[1]https://lore.kernel.org/dri-devel/20260320233645.950190-4-lyude@redhat.com/
