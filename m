Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41AE29E101;
	Mon, 16 Feb 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238100; cv=none; b=BXDMFP/q2k4cErxSJNcJGqnDPt8/0otcXYf9HzbdKqbYrPrU0Bofw9Z5Va/y/6tNqaGh/aC87ZZc+bDNDiRBBnZt90E1b/bFsk9F4thr/zeyUEEPg4z92Y89NjG+okBEirhffEaA3JuyEuCVcR4NEztZjQ9NxLqNGA7KF1hhcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238100; c=relaxed/simple;
	bh=/2BeNWAlYULFR5Q9wmcHGInhRij16LyccZTNcZ6eQgw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=joLKsnF6R8M3IA+6j/83gHtqZqu22sUkSEq3rAFDC+WobUMbURftRYEctE5uKdK/OOvzu9f4OdLr3k/V4df5nZLjiaAzBSIjvoo3IjVgbTfnryOFxzLIxNSJJpcPAb1+9MFW/O9JjOoeH1OpNAKpvs8wlfY+8UtptWNgu8eTjwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9AxuLzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9AxuLzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C35BC116C6;
	Mon, 16 Feb 2026 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238100;
	bh=/2BeNWAlYULFR5Q9wmcHGInhRij16LyccZTNcZ6eQgw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=m9AxuLzHIgr3xO9OFc2qdTDZdU9q3uDf7VT3t+O6Z2MFLcYsjVCEaRxBXyTHgAoDz
	 nGdjlC3S+0j1XDSWwTRFHYafAgAaoiwuJAUeryx9rD20VJYec2k3BBCu66ZNrUPddZ
	 ZKSrKZSa97bZ1oQQuT/xpiAPn+gPl6aY9KCmhT1lHb6t8VyPF+rB0KDIlnUWNqtQfg
	 5038nF//wM+5V7y98haM/upymMNLFoDp2DJZqb5vWXY3XJsoOm3ZBe2MfVMdR8mCFl
	 3lYP0VtMecMEzwkHvlnTjJU6D+4ThoR6bU55mrgIxX4PZJu0UMOn/1s1/QjO6AdrOv
	 oaUPjtV4X4d3w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 11:34:56 +0100
Message-Id: <DGGBI4DU4J4U.2JOBHL5IFUCTL@kernel.org>
Subject: Re: Mainline UML Rust stable io.rs unused imports
Cc: "David Gow" <davidgow@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Richard Weinberger"
 <richard@nod.at>, "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, <driver-core@lists.linux.dev>,
 "linux-um" <linux-um@lists.infradead.org>, "rust-for-linux"
 <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com>
In-Reply-To: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com>

On Sun Feb 15, 2026 at 1:47 PM CET, Miguel Ojeda wrote:
> Hi all,
>
> In mainline and next, for UML with Rust stable (but not with Rust
> minimum), I am seeing:

I think the problem is not UML specific, it is about define_read!() and
define_write!() being crate public, while the only user is PCI.

So, if CONFIG_PCI=3Dn, we get this warning.

I will send a fix soon.

Thanks for reporting!

- Danilo

>
>       RUSTC L rust/kernel.o - due to target missing
>     error: unused import: `define_read`
>        --> rust/kernel/io.rs:229:16
>         |
>     229 | pub(crate) use define_read;
>         |                ^^^^^^^^^^^
>         |
>         =3D note: `-D unused-imports` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(unused_imports)]=
`
>
>     error: unused import: `define_write`
>        --> rust/kernel/io.rs:262:16
>         |
>     262 | pub(crate) use define_write;
>         |                ^^^^^^^^^^^
>
> Cheers,
> Miguel

