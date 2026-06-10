Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D583240D573
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781050832; cv=pass; b=agi6mW837FZ6xUWHrxceWEO7CQb0/cga40NB+R75HXzguVUfAxYAeIgNAzhOd0acu8k2Vdj1Qewq2NCF/oVcpQpgsHktzuN8Ot+2rt/deJvejZVA6avN8oYnIQ2H/uyyyayO87AVKe+DyTrZMC06hJmT6CWxq80lv+gdnpoMzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781050832; c=relaxed/simple;
	bh=LcYzfnNvpPv4kOrLJLk/DY9+nUZ5MRaWOIev0xE1/To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRSf2HkJFG1E/0DJA8t0uFKtI4p/46wr31Zf2FzIz2oox29Ls9cxGRZp67aaqp5eeFMYR8IJ6e3kpqT3oZwM4X0fM2aKFgzldgWAMvtz0RbIuMu1E77vHBjuRqry7PC/LF2TCU5l/ZZ5O5TCxeu9AQxqgHnYUjE7p0bovrMngQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=kZOwsiH2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="kZOwsiH2"
ARC-Seal: i=1; a=rsa-sha256; t=1781050811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Md6nNVHOEmyf92T+nDS9CJqqPti1DRSk4EGTpu6C0HNPBqi7DA1DYIbBx6XVRwZKGYg+7FAMp+zRe7yCffEmmdzShm8ChVUIErNYfWJ2C0Z5rs+Jr8hsTWIn9J8BQuxRZb4sbMgl4VDNNe+Fp/YF9+TLnLcWHr/2HsETWIA/0Fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781050811; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=; 
	b=CtLCFoN/HUmgdMdaKxivguNvewtVOqnOf/GU04aTbIVSPmsAiqq9UfL62Sh1qJdTXzHGhlCky8R8LX2pYa39GqhrE6Q5y6NWBjh3JAboYzSpnuOv/I0JcGJ2wxwR6L9BGZsTO/owZFYHVWFWX4701w6nqoN2HlVw+vD+Fu7sY3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781050811;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=;
	b=kZOwsiH29/dAC81lSN65kYEuoTOcxiFWnRZI3eUfAzUyKksZvENO4jOoeUKfRUoY
	DRrLnkZ+tvZiLYP+qTTiiMl8pibUI+SDHnj/H9Qez+JfTBfn21bbtaEiqZZVW628ZQS
	t+lDFRobsq/ZdrPqaZCGglTpHn7wVk4iLg/THklE=
Received: by mx.zohomail.com with SMTPS id 1781050810087120.3536602556942;
	Tue, 9 Jun 2026 17:20:10 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:20:09 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v19 0/4] Rust bindings for gem shmem
Message-ID: <aiituaFg3i4Qpb-a@um790>
References: <20260608183057.2001376-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>

On Mon, Jun 08, 2026 at 02:29:00PM -0400, Lyude Paul wrote:
> Most of this patch series has already been pushed upstream, this is just
> the second half of the patch series that has not been pushed yet + some
> additional changes which were required to implement changes requested by
> the mailing list. This patch series is originally from Asahi, previously
> posted by Daniel Almeida.
> 
> The previous version of the patch series can be found here:
> 
> 	https://patchwork.freedesktop.org/series/164580/
> 
> Branch with patches applied available here:
> 
> 	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem
> 
> This patch series applies on top of drm-rust-next
> 
> Patch-series wide changes since V15:
> * Fix some major rebasing errors I somehow didn't notice :(
> * Drop the dependency on LazyInit, use the trick that Alice suggested
>   instead.
> * Fix dependency ordering so that Tyr can get the vmap stuff first
>   without the other bits.
> Patch-series wide changes since V16:
> * Fix ordering one more time (SetOnce::reset() doesn't need to come
>   before adding vmap functions)
> * Rebase against the latest DeviceContext changes from me that got
>   pushed.
> 
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()
> 
>  rust/kernel/drm/gem/shmem.rs | 524 ++++++++++++++++++++++++++++++++++-
>  rust/kernel/faux.rs          |  16 +-
>  2 files changed, 524 insertions(+), 16 deletions(-)
> 
> 
> base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
> -- 
> 2.54.0
> 
Thanks, it's working nicely with Tyr. To make this work with [1] I did
have to make a few changes to the KunitDriver and tests, but that
is a separate issue.

[1] [PATCH v2 0/7] rust: drm: Higher-Ranked Lifetime private data
https://lore.kernel.org/rust-for-linux/20260603011711.2077361-1-dakr@kernel.org/

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

