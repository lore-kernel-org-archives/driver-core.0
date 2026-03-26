Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F33FEB1B;
	Thu, 26 Mar 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535497; cv=none; b=Nwd+yzSkdPSA7crt5MUuXOluv1bETXYCu6I2t5o/NR7FXhOu9Ny6v9CurHQ3ehpzlTYIXNU7GdYTqgsOwnZ5A47q4g3MQVfGL0LoxSAJdOvRMSObBw4I0WJQ6/DV+1wRVlZJmHiK7l2YmWBA0tREMCRsv8hFW5OMbQm8HvEiRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535497; c=relaxed/simple;
	bh=DYohxA82BNtlEzecMId5mmE6JCa5A4RBTTnNK643eCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gzzaMYD7TPv5nEuxm+Y7rGEXu5gWoHmMb+7DG1q3uUuqLK2iF7tfDcnFXmrk0YoRdBVT2mQjpbxUNYQiV2aM5TiswQybk7HkB1eszu+1wN59CQcg0+w8D8+7Q77qqgv8cjbERrhmttWDRrXIdQvVeUjbhzcubNs0rnUCEKAhBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkRCMZhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkRCMZhm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADF6C116C6;
	Thu, 26 Mar 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774535496;
	bh=DYohxA82BNtlEzecMId5mmE6JCa5A4RBTTnNK643eCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KkRCMZhmtRSARygOSgjLQKH7zwMenBbq1yl1N2H3F4xfLBcV/4IglPRqsXMOt07PE
	 3/PQDC1AEilC2B3O26AEpVbHmvJeBlm3sxUGNlaIdwTfr9/OUdHDc9rlHuQPlgT2Zl
	 vVP+65be5cJf75ihPO6sh2HCpP9evJeSHLXhzfUbG/qbdOhwGpA1iw40zz2j7ILWQB
	 yZxGr/SgjDCMkLFePnZ6bUQbQddGyvhGIS/AF7WqTHG/RcUG0my2fCgBxFoH3SO2qi
	 qwXuwP7G+JEwL6rab8eRidqul2TzMfCGgA+CcJ/K3cTBUWmqeBtugMiGkOnWS6cQQf
	 Q6jFt6/2GBjaA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] rust: io: add view type
In-Reply-To: <20260323153807.1360705-5-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
 <I3h_hWnImlf7uTzEyQ4hvi9vJvrFgT9QHacWwuAA87AFC_Ye-dL09GYH_FKm6EO5NtnryM7bMQRIRHUL2r-Opw==@protonmail.internalid>
 <20260323153807.1360705-5-gary@kernel.org>
Date: Thu, 26 Mar 2026 15:31:27 +0100
Message-ID: <87h5q2y85c.fsf@t14s.mail-host-address-is-not-set>
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
> The view may be created statically via I/O projection using `io_project!()`
> macro to perform compile-time checks, or created by type-casting an
> existing view type with `try_cast()` function, where the size and alignment
> checks are performed at runtime.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/io.rs | 147 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 146 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 72902a4a343d..8166e47f1381 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,7 +7,11 @@
>  use crate::{
>      bindings,
>      prelude::*,
> -    ptr::KnownSize, //
> +    ptr::KnownSize,
> +    transmute::{
> +        AsBytes,
> +        FromBytes, //
> +    }, //
>  };
>
>  pub mod mem;
> @@ -296,6 +300,13 @@ pub trait Io {
>      /// Type of this I/O region. For untyped I/O regions, [`Region`] type can be used.
>      type Type: ?Sized + KnownSize;
>
> +    /// Get a [`View`] covering the entire region.
> +    #[inline]
> +    fn as_view(&self) -> View<'_, Self, Self::Type> {
> +        // SAFETY: Trivially satisfied.

What might be trivial to you is not necessarily obvious to others.
Please explain why we are satisfying safety requirements.

Otherwise looks good, with the above fixed, please add:

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



