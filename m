Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC409282F12;
	Thu, 16 Jul 2026 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240305; cv=none; b=PUsuEKXa8uVBys8PKYRY2hDqn1/OuKLRHorbomV/OrUc5dyCXwyEiSpPdCQL9HXLRvU6WUzSf5KBq9WzCLti2cogb0iHEVM4dap8UxyFfep7ImpFa4ekRLctTRzjUvoSbnmJFdRtjrK4HZ7jVv+/zGGsI8vuAJNRIQKv3/MNSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240305; c=relaxed/simple;
	bh=K+jyI1RHhRCTHLsnm3ojQVqZNHFf3RnwHrZP8SGNr1w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=eJNIhbF5DQ1tu3998eUgI6r8XD4AoU+zEnmEWoCeXf/SuCWVpKx32L4pY91NHWwWVRvjZBR03KYt3NOeA+gXiySx7zqCdQ+oqmw0EepDVacsHYiMm4HInESApkSjLxV07dFfojWbMSURRiLtzYYOqf1qQloJG0BO6ZSOL41Miic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=outd0xgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="outd0xgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11AA1F000E9;
	Thu, 16 Jul 2026 22:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240304;
	bh=YToMbk+5SWefsd4xbt2YpFEizUl7t5lozTbx1lRtW1o=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=outd0xgzqvc18hsO7GUsFT6XPLtyiwkUA4jMemgDgx0+/Ioc/Si/a2rMfZdoqk9Xc
	 jSX1p0kdHO3JqdSwyledgofmnEi5hNNNVHNb+esMcZNDzcX5duSP3A1JsgWuBVg+MC
	 gTGgApOz9lUkr9KzozvhxSv9B3xoIVcdjuasddRfiiuZI9X9Zl8dUmcZ41e0KFIZX+
	 Ay1rUdreAOx7oioX71F1MZ22mNa4eBZQFv35uxFH5xKaiRsOtGIyfVfdkxrMteluoc
	 Khx2V/yMjn7TlKsyYwOe3QL9j3Cn4QUS7GzsDlYA4Z5JvIoxQ/zfBP95HIA00lhBT4
	 turQbJlrSreUw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 00:18:19 +0200
Message-Id: <DK0CEDUBPRFN.UBM7NE1GGULP@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Gary Guo" <gary@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] rust: drm: fix non-const `read8` in unit test
References: <20260716142545.3622278-1-gary@kernel.org>
 <20260716142545.3622278-2-gary@kernel.org>
In-Reply-To: <20260716142545.3622278-2-gary@kernel.org>

On Thu Jul 16, 2026 at 4:25 PM CEST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> With CONFIG_CC_OPTIMIZE_FOR_SIZE, the address validity check in non-const
> `read8` invocaction is not optimized away, leading to build failure.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Fixes: d055768429b3 ("rust: drm: gem: shmem: Add vmap functions")

> ---
>  rust/kernel/drm/gem/shmem.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 580e0808d6c0..a687d46d170d 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -688,7 +688,7 @@ fn vmap_io() -> Result {
>          // Ensure the ordering in memory is correct
>          let expected =3D 0xFEDCBA98_u32.to_ne_bytes().into_iter();
>          for (offset, expected) in (0x20..=3D0x23).zip(expected) {
> -            assert_eq!(vmap.read8(offset), expected);
> +            assert_eq!(vmap.try_read8(offset).unwrap(), expected);
>          }
> =20
>          Ok(())
> --=20
> 2.54.0

