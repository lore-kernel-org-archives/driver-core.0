Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DEF36997A;
	Thu, 16 Apr 2026 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776377943; cv=none; b=HDH9kZsXuZXIjRLppP2fmZiy9nIuv+hvw2lw4tB0RAlTBMb48EN6z1//ElHtiePMWy1h9GjSQzl1+fQxtJBTTYDrNZR4tUZkUT8BSIsyc97qNoBMU98rEjrh3/URIE4xPD8Wunj/4f1yJHMk3kVwb63Sk1L9ekuZ966+RDicreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776377943; c=relaxed/simple;
	bh=6gKe+C7aovSqogOpgng5S4425BdIF18vZOv6JAeEIzM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=CIDkaK2PG8Gqom7ZJH/FRp9G5SVnCIjmtJwCU0NTtD4zjnpxBWadzTSj4LhwAFiFKwzX8KdaU1qewzoD18lDU7H8i2I3PVAIvkwCu3OH+clc1gXo6622qVgmLMWZseEBASKQGmOIMkkozw/7JId7IaUoiqmXyfNvg5yAHoPwyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEBN06aA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEBN06aA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E23AC2BCAF;
	Thu, 16 Apr 2026 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776377942;
	bh=6gKe+C7aovSqogOpgng5S4425BdIF18vZOv6JAeEIzM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=WEBN06aAXFBHORGJuxkOAb7bhg7MtgQ6MTwuFZEgFibFBeoJl7kO2QniT3x5qZXbc
	 vu/abPFHXuMSOFiPhoTUF73+f3mPGHb2Ca7/M9zMHyKmHpfcqQS3VF2bUqjSmoJwEb
	 W7Q7VdR0wiCzHtyN+KxQ00lImJNf2ma27XLy5uc+DnP8Gb9omOOrK6pigRzy/CRmnu
	 b1wmyiI/E/jcyypHdzmX0T5U9JXSt2cveBWiheBsGsSuZWKMZmxMo9Dfp9WBsVEYfr
	 xB9dtIn8466mLuoawUHBEtD3SXU/TS2WUpxCYicsMvgcGH3Kw0zrv4N/GkbY6pOUJI
	 3Bx7FKeOQYmww==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 00:18:56 +0200
Message-Id: <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com>
In-Reply-To: <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com>

On Thu Apr 16, 2026 at 1:22 AM CEST, John Hubbard wrote:
> Can we please put this into your drm-rust-next-staging ASAP? I don't
> think we have any comments that would really need to hold that up.

I would like to see the first patch being split up and we also need to agre=
e the
merge strategy for this series and obtain the corresponding ACKs first.

That said, I'm not a huge fan of the drm-rust-next-staging thing. It starte=
d out
as part of Alex' (private) process of staging patches he's about to pick up
(which is fine of course).

But now it seems to develop into some semi-official "shadow infrastructure"=
 for
when the drm-rust tree is closed after -rc6 and during the merge window, an=
d
it's not part of the official drm-rust workflow and other maintainers don't=
 have
oversight of it.

So, in order to not motivate workarounds, starting from the next cycle, the
drm-rust-next branch will be open for new features at all times.

Consequently, all patches applied to drm-rust-next after -rc6 do not target=
 the
upcoming merge window, but the next one.

Fixes for code that is within drm-rust-next and was merged before -rc6 have=
 to
go into drm-rust-next-fixes.

drm-rust-fixes will continue to be the target for fixes for the current -rc=
.

I will update all corresponding documentation in the next days and send ano=
ther
announcement mail, so it is not only this one buried in a thread where no o=
ne
expects it. :)

- Danilo
