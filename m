Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0F3E7BCB
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422726; cv=none; b=LkwwvaPJQvChRqPa3jTiQDW+13pC9CMOPdtWUa4IOB0pwePKzPqq2xGrPUClOqSBm+HgLjda+EKs9xm54VruSTEgSIRFPYCJiXdreR2NKkf3gl2wSKzaxaDdEJKICzs+fcnHDmE6cnH2netQ10jRq1fU6Zz+Bnd15ZDASH5KH9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422726; c=relaxed/simple;
	bh=iM3aB4i0XLgxjeAMG6M32ATEqWBg70vVVLIbCxLdpSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeaCXYJ6y3Ua586TkiHahyiUFxciCy4GqF7RIjNuz8YrNpBTVhZwTDO6K9cGYqwf4Kpht+8DJBuFpffk0USJSN+1S9huaaxt+Q57zHBwyJB3Q0Vg/03MHVplYdAZYk9Rurnyxe/vHyDLrC7vZ5OKv7rTQwjEMyjQ8s22MUqnMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=qYurQK/M; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="qYurQK/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1783422714; x=1783681914;
	bh=P2bQGh+hZ3QRONTOM7D6Jj9FJUVAye+5qJn3WJSjBEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qYurQK/MgeEnmS8aNVUbZ9HAE5s6L5eFfpnsfyZ1n6OJ3tDpdNKQQN+Fmqc/jJnuV
	 9CGwL6onk3l9Szj1GVpAaKvDGobSofFQtdX31iq/X2QDop/t7mmjJN/HtKsjksrrQg
	 hVCH2YyoYrsLPW5kmNaiBOoi/8mtZ8ptgeFRPm7+YXxldNfdY6xnIYbdxr/RQawsLI
	 rGB5mqSUOyZJkDhtm7U31UDT60rWEzUmBqQt8j3yXQxVGtJ7JyrMcIb0MpnqUmHXse
	 pT3J9ts0W5Ch0XYM0hJcTg2upA0mk2CdrwqWFEKKHoakW8HhXAc2X/merkMQCNhLib
	 xvVwC1XiGdc1w==
X-Pm-Submission-Id: 4gvdpb6KjSz1DDLC
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
Date: Tue,  7 Jul 2026 14:11:45 +0300
Message-ID: <20260707111150.137899-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 07 Jul 2026 19:12:21 +0900=0D
Alexandre Courbot <acourbot@nvidia.com> wrote:=0D
=0D
> The `clippy::unwrap_or_default` warning triggers on=0D
> `rust/kernel/soc.rs` since rustc 1.88:=0D
> =0D
>     warning: use of `unwrap_or` to construct default value=0D
>       --> ../rust/kernel/soc.rs:66:10=0D
>       |=0D
>    66 |         .unwrap_or(core::ptr::null())=0D
>       |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_defau=
lt()`=0D
>       |=0D
>       =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/rust-1.96.0/index.html#unwrap_or_default=0D
>       =3D note: `-W clippy::unwrap-or-default` implied by `-W clippy::all=
`=0D
>       =3D help: to override `-W clippy::all` add `#[allow(clippy::unwrap_=
or_default)]`=0D
> =0D
> Since our current MSRV is 1.85, we cannot fix the warning as=0D
> recommended, so allow the lint on the `cstring_to_c` function instead.=0D
> =0D
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>=0D
> ---=0D
>  rust/kernel/soc.rs | 3 +++=0D
>  1 file changed, 3 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs=0D
> index 0d6a36c83cb6..7998962560f8 100644=0D
> --- a/rust/kernel/soc.rs=0D
> +++ b/rust/kernel/soc.rs=0D
> @@ -60,6 +60,9 @@ struct BuiltAttributes {=0D
>      inner: Opaque<bindings::soc_device_attribute>,=0D
>  }=0D
>  =0D
> +// `unwrap_or_default()` on a raw pointer requires `Default for *const T=
`, which is stable since=0D
> +// Rust 1.88. Remove when the MSRV allows it.=0D
=0D
I would move "Remove when the MSRV allows it." to the next line as TODO.=0D
=0D
Regards,=0D
Onur=0D
=0D
> +#[allow(clippy::unwrap_or_default)]=0D
>  fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {=0D
>      mcs.as_ref()=0D
>          .map(|cs| cs.as_char_ptr())=0D
> =0D
> ---=0D
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482=0D
> change-id: 20260707-soc_unwrap_or-ed37e674a759=0D
> =0D
> Best regards,=0D
> --  =0D
> Alexandre Courbot <acourbot@nvidia.com>=0D
> =0D
