Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30C214A9B;
	Fri,  1 May 2026 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659577; cv=none; b=pouIQlfdD3nO06M0RqV2fLFSQ6PLwAtmlGZZKZOhNbdO5e6zfTvviH2fEbzL5NL2lCBLZF97Mm2u2PiG3tgFg1AZxm5wI6WryAQCDC9N0p3IIbkGHXXwHtMZpYxTV3D1IDh+5gqpslsejRk9sW0gBWWxkcvm87ByE9xVFuE63WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659577; c=relaxed/simple;
	bh=x7XyYS5NnDwRAdzbATLwofaBy/VKmNkNCCuPMBR3vcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uyBK5tTtP1ir9VM79xnoxxIrdxpiXXKe4WYZG/kcv9+QcPDOXNuggB0hzZF1LLYRDa8euwf5qyZBAAbGS1tlCvcpVpzZIsiMagIsGgDiSwWGepcIJzTs/dnGChpyIqwK3WhcpPG2pS//Se8wtTAxAl2wjj0z3w+agtl0yxMnU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpWW9lcY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpWW9lcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AA7C2BCB4;
	Fri,  1 May 2026 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777659577;
	bh=x7XyYS5NnDwRAdzbATLwofaBy/VKmNkNCCuPMBR3vcA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JpWW9lcYeit5RaU4y6bHNOMQZ7S+PSUBgZ2OkmftjdP5iGSAHN+uhYwJpG8kL3DDO
	 PEJZzvG+Y1RAnasW0dv8mcJ/wi25twCkLOMcgSnHaMV4NBppG0Lf4pZVOlKxul/vzt
	 GhdHUV+6sIFN3B3H6fP7FRnso2RpQKat00yrK02wO3Umr/X6fIMLW5E3aIwgw+TqL0
	 HzXBCHJ1/IIC6wdvyPnVUuu8PqPjenioZqRGLaYhMmmF6ucJ2iA1DVjpBMN7WAr0KS
	 EhyO6B1iSxPsiT0BvEYoTnkm6jiiUs3YwxPNhvIu0Pq4SYHJeWWzZdiL0IPODif9as
	 b8a5sgs+vBBSQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 20:19:31 +0200
Message-Id: <DI7JQ529XI9V.QMFHCU2HMGSN@kernel.org>
Subject: Re: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in
 `register!`
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>
To: "Yury Norov" <ynorov@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com> <afTnQ1KCyybUE3pH@yury>
In-Reply-To: <afTnQ1KCyybUE3pH@yury>

On Fri May 1, 2026 at 7:47 PM CEST, Yury Norov wrote:
> If it comes to another round, maybe split switching to a bitfields and
> getting rid of the bitfield_core? For maintainability reasons.

I'm happy to take it as a single patch -- the deleted rules are dead code t=
he
moment the switch happens, and the code is local to the same macro, so the
intermediate state doesn't seem to add any value, or structure in terms of
touching different components etc.

Did you have anything specific in mind when you mention maintainability rea=
sons?
