Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D13EB108;
	Mon,  7 Sep 2026 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815207; cv=none; b=XCDBeY/IakHKwDN6JztQhn+20dwuBVClyJF/KsoUI2O7IACnW1APgj5VYacFeXAeVNswXNWw+8vvW/OSfbTu5ok6So81APBpEaxRGolskXo8n5+D0hov1nzbo9jqS9WlB/iacriDKEdUAaQ9dj4oQ5+9J0PMG4o5gbOjKlDGfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815207; c=relaxed/simple;
	bh=u0NXWeg/Httt9i9X81l4G9xFkgPmdQRSI5qAMBSyB1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:
	 References:In-Reply-To; b=H4VXjbjL+Zx7vcrz6Jz03iC6av4tkza6qtlF7i/9O3ZPBNwnpuEzYixfZPFC5FbXL50f74D0X3Yn4uNr+nLfjqPPcIf71GZ6Ek5ci2uvFra9/10SzZ8FAlGLb5fVIHKi8T61BbKMZdnR92I+X+0eHJcMvgjE/Lqc2bvMpUCp7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaoOipGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaoOipGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9161F00A3A;
	Mon,  7 Sep 2026 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788815206;
	bh=90F9gpIn6ahg1Sh32fek9TE5xaVsZqJW6WdR2q7nJtE=;
	h=Date:Subject:Cc:From:References:In-Reply-To;
	b=CaoOipGMy+LRNytnbxmP9ZFmgaCGRcVpuOcDUxNDoNnDM+chAKVS3z/SXqC61FkUo
	 hU5DbovmMj5tFB8LfDtshTKDvvGJdBPkrfS0YAj2pmLNy2AgCEyhsXk67NccTBz845
	 oISqnvxdR/VOFI6UfhjeoO3O5Pu2gTZG8TzN2jYS0+MW58cq8ZUjLJL1vfChPKVAX4
	 VvZkwdVgN7soN9BkH89HPHNFtn5ckczW6lmCuht7erv7PdPJ9CU9m6ObULR1/xi1wS
	 RbNl564Rg+zj66OfqyUmjs2TD8gunPwNniUK0TyuOE32AKpROMJx9fLuku2w8wbovB
	 rnv5+kbJs1aOw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:06:40 +0200
Message-Id: <DL9E2EFLN138.3DMBLYEZRFW1R@kernel.org>
Subject: Re: [PATCH 0/4] rust: dma: tie DMA allocations to the device's
 bound lifetime
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <mmaurer@google.com>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260830193824.471089-1-dakr@kernel.org>
 <20260906153753.3207797-1-dakr@kernel.org>
In-Reply-To: <20260906153753.3207797-1-dakr@kernel.org>

On Sun Sep 6, 2026 at 5:37 PM CEST, Danilo Krummrich wrote:
> On Sun, 30 Aug 2026 21:37:12 +0200, Danilo Krummrich wrote:
>> [PATCH 0/4] rust: dma: tie DMA allocations to the device's bound lifetim=
e
>
> Applied, thanks!
>
>   Branch: topic/rust-dma
>   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git
>
> [1/4] rust: debugfs: drop 'static bound from ScopedDir file creation meth=
ods
>       commit: 9dc6cedcd971
>
>       [ Remove unrelated change from Self to T. - Danilo ]
>
> [2/4] rust: dma: tie CoherentHandle to the device's bound lifetime
>       commit: f6b56da8e1b8
> [3/4] samples: rust_dma: separate driver type from driver data
>       commit: c3d4fd0e9d27
> [4/4] rust: dma: tie Coherent and CoherentBox to the device's bound lifet=
ime
>       commit: bed87375f90f
>
> The patches are in the topic/rust-dma topic branch and will be merged int=
o the
> corresponding target branch soon.

Merged into driver-core-next and drm-rust-next, thanks!
