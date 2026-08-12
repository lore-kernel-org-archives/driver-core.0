Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E439427F8B;
	Wed, 12 Aug 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530812; cv=none; b=aC/bT8Vus2F1s/QT5EMoU6EQIv7DBBPvQf6iiLttl1PSlkmZB/S7mTBY4Ww+1p/9cG6jdEJJAOkz/Rlc5KU2DTfPfYdJ2uxaem6v9qp7xeqOjGQ+kFDcQoBux2GjLGd7ExK1FBgV6nigHaxJTDsudKnkzzvrLEHbzRuotaS4KeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530812; c=relaxed/simple;
	bh=LqcQAf1V4IIf0KyMSGGEZydqhw5OwAD5VP8KQsnzhNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LSGcdLNiaYDpInAYGRjxeBFsSio3X4mko2FFxtlAPvhjwYxJmrQ6OKfPAqgGRjUcZw3y9Bd3iikrTWe53Z443pNC5iDsgewKlOKEwj+paG83Jo8u9BJRQzua68EfA6qfY27HQ7+WUeVqD5dGhLMMX26YEb420lx1wvXjCEg6Wlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2duz9Fc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2duz9Fc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F28A1F00A3A;
	Wed, 12 Aug 2026 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530799;
	bh=LqcQAf1V4IIf0KyMSGGEZydqhw5OwAD5VP8KQsnzhNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Q2duz9FcIuZHVU+1M5M7QsfLCnsAfx6WY9Ko49tsEeXN0M516FO609ro+CFXBqw2t
	 dMQOvvRYavOCikyhRKC8/yhqpUJgUphFaASHOca25dTJ26uv+rrqOEpo69+yrfBRpY
	 bCDGUcXzpJJweifCLS6a6Eyrh07U+40GI+Vo50DrCiVvhtyoL72OlQ8rebBEpiwEmK
	 MRFImUOLmqP/eqD8hkTDTgZK8caSEQ74bRY0bJdO3K8zDyAAIAP4p1Tz0/XuXdG+32
	 /lHrQtk6pe+sqUFMCx1F89EU8S5+F0r4MoBjsYTVBe5QUbcY2uudPR1IPwW6lSewYX
	 Qu5hvJJXi6H2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Breno Leitao
 <leitao@debian.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Lyude
 Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 2/4] rust: build_assert: remove macro from crate root
In-Reply-To: <20260811-macro_export_scoped-v1-2-e7782b102819@garyguo.net>
References: <20260811-macro_export_scoped-v1-0-e7782b102819@garyguo.net>
 <K_HAMdNb4Gu0e2EkB54DjtKSIZhaVVQHQxdqTou5ObGNw65meyBKWhG07bC3g0n0OCdJjLktRePRnAVFy_JRxg==@protonmail.internalid>
 <20260811-macro_export_scoped-v1-2-e7782b102819@garyguo.net>
Date: Wed, 12 Aug 2026 12:33:10 +0200
Message-ID: <87jypv1vdl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> Convert `build_assert` to use `#[macro_export_scoped]`. This removes the
> macros from crate root of `kernel`. A few remaining mentions of the macros
> from crate root are removed.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



