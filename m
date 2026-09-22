Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD67E541E77;
	Tue, 22 Sep 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081874; cv=none; b=jR155SaYA1CKyVutEi/QTu5tTBmuY8ebWJEygbPbUNy1SKUfdQOHAt8TGos6b6vKEvAAaNNPnhmfbVA5P/m699e6q2YQfgTQjuDcVsTZYmPm8TzEtnJcFKKUtQvwY5UIpT8r7ELYrJab4W83axyjcWaQ1zXRNHfyFoiwy6ntTxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081874; c=relaxed/simple;
	bh=1JB2OWvrS5FnXNFCXir50TyMcuITb/uCxTCv9puyY0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J1yV+Jvqz1Bs3IpDP8lixdP3YvFyKUVQTlohnSnT63FX7KAZCyGI2Ie05hvYugayUyygm5J/J6UX0HYgPMdRGFQz+8fgjaJWqTjguFyozCF3pvWRf//3v7g5PjlzJUymaeIesmGpdqF18UcEEp4YblyToOr3IC36TZudlteHSO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKRgMh44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKRgMh44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8EF1F0089B;
	Tue, 22 Sep 2026 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081871;
	bh=1JB2OWvrS5FnXNFCXir50TyMcuITb/uCxTCv9puyY0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iKRgMh442U1DjN77O6C+yTgzEhzJJeu+Zz0wdcaufPMTpBt/IJxwTvrBs0SRIZy88
	 1BjqJWAgFqnP21nEhtxCDhBHpDk4T4qj3fw2ln2ckBjsE7p8/x9vxf2nBB3lbk9D+b
	 0JkAhTn/ED/pgu+Xwo8dHoLS+n9fZlsSkwSUjTCZz/4j720LhCaKu7YtfqfzZS6BxH
	 cXw0+CVmDDyRuxlV/vwmtVN7fRn6gN40Ba34RUCdQdzBbeSKxQYGMhYaY1kQ0txQW4
	 zV8aVQlbRItLGK4S+CcTZUlCFYQkEZpRDCY9b4weDbvT6uZIOxNMjLkmILZhRHO1Ks
	 sPasMIjwsa0Xg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Laura Nao <laura.nao@collabora.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, Deborah
 Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH 7/9] rust: time: add arch_timer_get_rate wrapper
In-Reply-To: <20260915-tyr-interfaces-v1-7-5d28f1f75aca@collabora.com>
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
 <asOARI-J8kmq8taBbAZfrIPqjHuih94wUuKDbaEB5Ofz-1Y21xx2I-Y57RFAfS2HhZAK-AiLXe6n9EuNajPBfg==@protonmail.internalid>
 <20260915-tyr-interfaces-v1-7-5d28f1f75aca@collabora.com>
Date: Tue, 22 Sep 2026 14:57:39 +0200
Message-ID: <87zex930l8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Laura Nao" <laura.nao@collabora.com> writes:

> From: Deborah Brouwer <deborah.brouwer@collabora.com>
>
> Provide a safe Rust wrapper for arch_timer_get_rate().
>
> The Rust binding calls a C helper that returns 0 when the ARM
> architectural timer is not available or not yet initialized. Map this to
> Option<u32> to make the absence of a valid rate explicit to Rust callers.
>
> This allows Rust drivers to query the system timer frequency and
> select appropriate time sources when programming hardware timeouts.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



