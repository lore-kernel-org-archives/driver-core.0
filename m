Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612978;
	b=LQL1M3HXopPtujJEvEweSOyrDfi+JKd13g1IMdiexPIq0CLB5dAWq3g51OqWLfjW3Y2B
	 xNYr6wgpwoaU3iQ7HsT73bUNUSGh6h4KxxrUfeBhFCi2amiA9gMXsOIah2QbgdefX/oh1
	 I22z9QCkRaU60eIp346bKI1ycg9By/xdTvH+89uGVDTPsX+9kPtANtxLVknfzL00RrO0I
	 f18M7Ite1SmcbxR+2aLynmOhOqd6ZzXPH4J4cgro4iISKyWj53l9BuS1r495fC4AdUJEx
	 Y9x0+E1nKjfk1unI27M8wXBXgtGZc36pai/rcTkqzyt38dwrWQcGB4PFx945rL3V5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612978;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=Ab8tZXede8oabh2B0II2aH8ED810FxslsFHu2YmqFbc=;
	b=OGYO2ll8RywtBNBdO+CGKS20Qo1QJPwoM1tI+EykOQWiJP3BemKzjxoRwGd9hLbWW3cU
	 fMSWbCb8f7JbLTU3BREP5Jw0d4JMiOohLeiS6vsRyODpu86tQGnMKzmEmvXY3oN2+kZnj
	 XumfOiqUCjXZQSZ44sJuWXBEHpit08RUDSpbGpu15IlXwSOrgndvDmzGeLX0iTdkeQMPS
	 OAYLGYQ2XbHNyed91D2saPIGEsZOJVNGj8NaNHq5D9+ylePHGQjKNqqFdT0ktmr1767bn
	 m4LuE1tH53KH3tx/25m9Y+GfIvhPcDHBXZBOfoq91ugeKfFsSa1LiEAN3yOFRWIjU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgFUJ4x7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C2606A320;
	Wed, 21 Oct 2026 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgFUJ4x7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2CD1F000C1;
	Wed, 21 Oct 2026 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612977;
	bh=Ab8tZXede8oabh2B0II2aH8ED810FxslsFHu2YmqFbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WgFUJ4x7r4QY28J8pGE2EF3ync6DDzsqWxh3p95oW33NVKj0Z93xlmR4YiHxfzWGP
	 nEjpkS3CgeG4uiGgB3nyja3GzAgKN6puF4xPLU7hpZ2voFD4lKpp++yfXkkBy7WtJ3
	 RSqtncQ8vvGwwp92jd3XkjUqbz6KpyQ1YiIQXaOU56FpXTJ9S8t2Lo35YA2lshfTLX
	 x1r5PD3KONDRKQkcgo84RPz7CanXEZOD6+6AbJexU1bYGUoh9inVC4Gk9mByphT9MX
	 5LU2aZUTjCsYPAYJDzUE4gYGKfruc1DEX+tlvGTItCmLiq/tOYNLyHvxJ5sdRNqGQ/
	 XubxETpGoxqVQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin
 Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for
 hrtimer_restart
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
 <DclDw3aZs6h8rmpTbJJg71sEKbRT1NZ7qUCqLvjmyjbcPRFuOmdZIAmF3_ENu8U-ijSu_cOpzgNhX2qJvJqibg==@protonmail.internalid>
 <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
Date: Wed, 21 Oct 2026 22:02:45 +0200
Message-ID: <87a4o6zusa.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Sami Tolvanen" <samitolvanen@google.com> writes:

> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
>
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
>
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg

