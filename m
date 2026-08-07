Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A832F5A36
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089119; cv=none; b=pUwTEO9g1DiV2d71Z9aPENnVF3d/uc0etWnDdKShuC7QSHpuLItQ3D7e2HKwigY1n7mqLjAFqEL6Z4yOejnpJrHMEiH5TvYSu1QOYFNZesCAsW6y7WLpnyXc1MPdmRtoLAT5mUiHphqgkl0i9IjRKVVKulFZ0iQeJtx3XsuNP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089119; c=relaxed/simple;
	bh=l8mpfq6qX9klG0MRovOqta+8QF3Dgc5yI/RX+mIUgpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WlNYv4EAOYQM8Sq8eelCSf2E/+Uy+qQEXwOM6sITSdwVg8R/atmstedn+f6R97tZvWSV42DH0Q7pmxgcGs2Q2FPCZJDnbKvRSlp7d8wsiHkfWWf/ivMEnjGV7VMLCunI6d/mBiJISnsKsHwPRtpEzq27+YcbXGFM7EulICmCc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Ze1oGHWS; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Ze1oGHWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786089106; x=1786348306;
	bh=pwktWLyirbuofoaJBZxMUbIYCFGM2Ctjc4nVtIzdJDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ze1oGHWSzJa2dpWXPikD0FUZXIAGxWAfn/5EZDYd6mj8nl4X2HgRQtBGFVWaffibn
	 a/wVGwb7NM1lQPGtzZGD1GcvJ0KiUa0USJjHuFHkOn+lmABULuRC7pRVQ+NneVVKN3
	 sKQLreUNhQj3ZPYz8+a9XQaeCJmD0x1J+m3g/uEn97x4VaMChh5UaycCxXIqTT7SrF
	 K7+65L82bduav5Rp4MjLiiflPXuJ/Dq0DH0tE0dyz7zNdtz9ythS6AQTsrAvwTo8AN
	 Nzp34NkGhf0CYo2P5S3jdeXyb8fUiK73IRh0xaPsm4ZnWzvrLATBUkwIQ9SqTgh4n5
	 rHwKToHX3+5lA==
X-Pm-Submission-Id: 4hGbvM2kKKz1DDWc
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
Date: Fri,  7 Aug 2026 10:51:37 +0300
Message-ID: <20260807075141.9294-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260804195248.665636-7-dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org> <20260804195248.665636-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 04 Aug 2026 21:52:08 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> Add a method to cancel a work item and wait for it to finish if it is=0D
> currently running.=0D
> =0D
> This will also be used by ScopedWork's destructor to synchronously=0D
> cancel work before dropping borrowed data.=0D
> =0D
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> ---=0D
>  rust/kernel/workqueue/mod.rs | 8 ++++++++=0D
>  1 file changed, 8 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs=
=0D
> index 5de88c59b2e5..2b87f935712a 100644=0D
> --- a/rust/kernel/workqueue/mod.rs=0D
> +++ b/rust/kernel/workqueue/mod.rs=0D
> @@ -585,6 +585,14 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bind=
ings::work_struct {=0D
>          // the compiler does not complain that the `work` field is unuse=
d.=0D
>          unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }=0D
>      }=0D
> +=0D
> +    /// Cancels the work item and waits for it to finish if it is runnin=
g.=0D
> +    ///=0D
> +    /// Returns `true` if the work was pending, `false` otherwise.=0D
> +    pub fn cancel_work_sync(&self) -> bool {=0D
> +        // SAFETY: We have a reference to a valid, initialized Work, so =
the pointer is valid.=0D
> +        unsafe { bindings::cancel_work_sync(Self::raw_get(self)) }=0D
> +    }=0D
>  }=0D
=0D
We can't directly add cancel_sync support to every work items. Perhaps you =
could=0D
pull the exiting effort for `cancel_sync` support [1] which is also used by=
 the=0D
tyr reset implementation [2]?=0D
=0D
[1]: https://lore.kernel.org/all/20260617131731.145337-2-work@onurozkan.dev=
=0D
[2]: https://lore.kernel.org/all/20260708114358.957305-1-work@onurozkan.dev=
=0D
=0D
>  =0D
>  /// Declares that a type contains a [`Work<T, ID>`].=0D
> -- =0D
> 2.55.0=0D
> =0D
