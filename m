Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7744499A1;
	Thu,  9 Jul 2026 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783639306; cv=none; b=K/3eyM2+pFQ6KMm3Y0bvcIi+T62fAL3vULtUe5/RfYqe1N2bS454U0TEJVjfOcSEAfWp2QftsmYtVAOIjOt4DfXbpKaO4pBRk9/ygTvi5hNJPGRK7Z5+Hxfx5MAYADxrFQ1FQZMnNscsxagKGF+TmrjPUZI8m067GYENy0omo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783639306; c=relaxed/simple;
	bh=hYV7SQ8n0Wm7P7cLiOoCMCf/VW1cm1lqEyZRQv+QV5U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j/Wmd7uswluoAvStL6dOPcdSgKw/MO5ip/2Zlcvd88WQTafI/E0MEhCWtSbNfroz4kshbNxwXa40ZJfXxygMrdVU15q8/0qUjaXwGp9Kfn1ZRWZUUjk8jg8Anww3U6KC/m10CAyTXYdw10s8jZonddIK0TPo+a79XpaqjA6k44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQTiddp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQTiddp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACBC1F000E9;
	Thu,  9 Jul 2026 23:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783639304;
	bh=UGPK0k4zOwKTW2kpdOk6E/XX86pCWktUFaKHCNMbJo8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=EQTiddp43ffu9vCvSQbFxYDz3ZLM6fm+o0LgQulzsuBKGUTg81ycd6UY6geRyKUTV
	 CQsjLyRyrrloE920R3uhsVmBi8Sb90zKTKHLJ+w0rb5lN++XsbIq0cHvK3zSLt1uF9
	 cMWvXSJOIG4twYaoM4rwA9I93UCXINLbWV9TGdImhqLWjfsfQ3QbRZl6+sWQAOiOqj
	 Q+f2Q3w7UP/dzE+8RM3NRonOy1FH2R+VpsXB12iA5AY2tavt558AB6r7JEii0E+hSB
	 9DKa/3j3k5XcEFWXWPFyUFQ2KZbIP3DaDrHVI7ZqqYrSpMzkR1YrQViw/aDkEyQTra
	 AqsDmovR8UzGA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 01:21:40 +0200
Message-Id: <DJUFD2VMD5T0.1279IQJEATG1B@kernel.org>
Subject: Re: [PATCH v4 4/7] gpu: nova-core: transition gsp to TLV images
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260709213915.520109-1-ttabi@nvidia.com>
 <20260709213915.520109-5-ttabi@nvidia.com>
In-Reply-To: <20260709213915.520109-5-ttabi@nvidia.com>

On Thu Jul 9, 2026 at 11:39 PM CEST, Timur Tabi wrote:
> +            let mut fw_vvec =3D VVec::from_elem(0u8, size, GFP_KERNEL).m=
ap_err(|_| ENOMEM)?;

Can you please add a patch introducing Vec::zeroed() instead that uses
__GFP_ZEROED, analogous to Box::zeroed()? I.e. something like this:

	pub fn zeroed(n: usize, flags: Flags) -> Result<Self, AllocError>
	where
	    T: Zeroable,
	{
	    let mut v =3D Self::with_capacity(n, flags | __GFP_ZERO)?;
	    // SAFETY:
	    // - `n <=3D capacity - len`: `with_capacity(n)` guarantees capacity >=
=3D n, len is 0.
	    // - All elements in `[0, n)` are initialized: `__GFP_ZERO` zeroes the=
 allocation,
	    //   and `T: Zeroable` guarantees all-zeroes is a valid bit pattern.
	    unsafe { v.inc_len(n) };
	    Ok(v)
	}
