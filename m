Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9F1A01C6;
	Fri, 27 Mar 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599966; cv=none; b=AdE9A5XtwABzgFJlF2lUhOtI2Zzmg1XxT+K0Eqi2ukWNH9eyRi3PUWaINH0IZZRPHuJcoKrsAUf+/gV6yI3bYnuRTEsb9VThVtIAHhvlBBgQCsEPi0qSYowYx9Hb6RDnwtrUXr9WrPLxZpC9y46xVNlSYDinW2wEZm+96H91h2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599966; c=relaxed/simple;
	bh=wM8l7YfvnsJO6FuRDtOtLDuJvB9nn3pqtdgv6uwVADg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ivc9jNAvkzULtkSo549kA0Q76XciPllwZZnlbYmSitGj4dx9RkN6e0/BEdS4xER9SxOyiXVBRnXKsJLd/2cbq10mupbKcpJ0CWmxgdPqY0XgPPus5ayLt/9jb74TYLzGdli13QlwJTWwcxJCV2gdkdYbiyHQll3h7dX1dcn/pjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ip0v8y5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ip0v8y5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B6FC19423;
	Fri, 27 Mar 2026 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774599965;
	bh=wM8l7YfvnsJO6FuRDtOtLDuJvB9nn3pqtdgv6uwVADg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ip0v8y5dASImU6yHWoeqHnJowvQ8kmkyS86hh/Aygg7gAiNX90PvTvFWTG2NJwSlY
	 h/v4iqyQY6oibdvOCSiuqVWgmuHJ7lnt2+beBoaHvJhDQa14XlKPtmuFomuEDQXISh
	 6HX1hWVCWwJy6EJXgVlt8DzynG5/ofEvk6Q7yA7/ur5lgRUSCcAZ8nsBMROpE1QBRc
	 nOUGY86+9i6eYrMa0utUaDt8rczW35jeixmV/QiSiMrbicmBguxLOP2s/rZK3iT3f2
	 KkmMIzmvsIwpV95E3a8u56tdcI5b/1WOdy2VrjhjJR+CqvNjUOfG4WSqC0fptVQ7c9
	 5EkTWlchc16xQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] rust: dma: drop `dma_read!` and `dma_write!` API
In-Reply-To: <20260323153807.1360705-9-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
 <uUAO2rPQgNduFkAyhWyOHmxgltGaY27xiF3Wfh3rkQleRS0FTVxS1eszlik-OaONO9fpJtloSl-0qe2CDOt_iw==@protonmail.internalid>
 <20260323153807.1360705-9-gary@kernel.org>
Date: Fri, 27 Mar 2026 09:25:49 +0100
Message-ID: <874im1y8z6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> The primitive read/write use case is covered by the `io_read!` and
> `io_write!` macro. The non-primitive use case was finicky; they should
> either be achieved using `CoherentBox` or `as_ref()/as_mut()` to assert the
> lack of concurrent access, or should be using memcpy-like APIs to express
> the non-atomic and tearable nature.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



