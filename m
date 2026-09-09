Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD313E51F7;
	Wed,  9 Sep 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938390; cv=none; b=A+So/BXd0X0v/VcNToQSyc1otZVh0T5LIgztI0mt13GJeTUEz3GKUL9/g89XvXnbzQbG7bppxOvUOZSB88yHtI/SRdhA2raqL/QZwNpjPVNk+FawTedhoEwWm8XoXr1SQaylbBrbXbVT+rVCF06KPBYKcP7nlwxXd5KoJAyF440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938390; c=relaxed/simple;
	bh=iUEUHp1+6Zf6BwIRDEgsvqvIR9hlgm46o4EtujvoXAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q07AGIEmqp/37dI6BzkMeOHcM65Zb52kwydFyp52A9yLfjcnpdYmxj3SDXRgBEeUrQ9vQ8kOZtQxcHT7Bi5ub8TISQC6x+HNm1Eho+H6LjL9uIf/g8AvCzfNiNrPGTaGyZchCKYAs48KjLiPKYT2+CDDIO0WgmmbK3tmnZFmwG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xAoshE5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xAoshE5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB3F1F00A3A;
	Wed,  9 Sep 2026 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788938388;
	bh=N0q41QwdeiDQ87IXkq7d0znywJUQ5D2+Ee3mhNoWht8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xAoshE5bR042g6AaAnPQZdZsVgcZfhL7FlE4U6VNDtXcPEIEX7bVtEEQDQdta5j4D
	 G2jBWpnUbRgvz4hW80WKanqSVjQJHZKVA5c3Gu0KbxcLRNgk2neK0IkBn0XWXcttnQ
	 qRN/5btWA11WtSRdmdemynhdq30aWi+m87zsyIm8=
Date: Wed, 9 Sep 2026 09:19:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
Message-ID: <2026090955-lustfully-fanning-33f9@gregkh>
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909033246.2779303-1-georgeandrout13@gmail.com>

On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrote:
> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> `auxiliary_device_id::name` array without checking that they fit. An
> oversized name is caught by the array bounds check, but the error
> reports an out-of-bounds index in the copy loop rather than the
> constraint the caller violated.
> 
> Check the invariant explicitly instead, so the failure states the length
> limit rather than an array index.
> 
> In a constant context exceeding the limit leads to a build error; at
> runtime it panics, so add a `# Panics` section for it.
> 
> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abstractions")
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> ---
>  rust/kernel/auxiliary.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 60dfbec8f330..1f3ba86d6d96 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
>  
>  impl DeviceId {
>      /// Create a new [`DeviceId`] from name.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if the combined module and device name, including the
> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes.
>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
>          let name = name.to_bytes_with_nul();
>          let modname = modname.to_bytes_with_nul();
>  
> +        assert!(
> +            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
> +            "auxiliary device ID is too long"
> +        );

We really shouldn't panic, we should error out and fail the creation
instead.

But what is placing the constraint of the name size here?  The C api
just takes a pointer, it doesn't care about the size, why does the rust
binding care?

thanks,

greg k-h
