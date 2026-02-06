Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FD22F01;
	Fri,  6 Feb 2026 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384831; cv=none; b=mPj/OqnRgDEGo/MLqq/zlT8YcxoNQicjQw88E17aunGHFr4kKijLMMxE1EbQtQArdSwXXqYagBRTbCa+J/QY6OrcGvoJH3GTvm9+FwJpLAdk8U0rtVJC5km959N5ef1FoRNAjSX07ykg2uXKv4mWkc8BOgqiFZeSOGi00271Zhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384831; c=relaxed/simple;
	bh=1jKCP6SsxZfuhMhvUTJmujxPIXbuq/F3Ryh/qRwY49U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KX2cRwIeICsQUY1EEhwmD4wcXhEMvm2sDFfyuuj3FLyOHrpUuR94hokMRiGlSYbbPgyrhNsvsTWL+oDwrUEMuGvpgvkG9AQcz6Fgs2xwjj17TscA63mDy3s084YgKrr+XK2YavhazHgiwEGOnlEd3/nIpW4nHTwHxzlDC/P1hzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRSKZo2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRSKZo2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4868BC116C6;
	Fri,  6 Feb 2026 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770384830;
	bh=1jKCP6SsxZfuhMhvUTJmujxPIXbuq/F3Ryh/qRwY49U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GRSKZo2XBB9p4Yx/Un/dkMw6qIXWcVB+Ej+TFEEKvaCD9sfHJ32tG3nBxjEVICvxP
	 fAR0YyM5x1BxlP43jAvUEWdmT+6e3v31EWYU0e89oS71k6LLWeUVnCiCXppw7tJgCM
	 2D0kNNTFuld85tEWFdQhmgPwuAr0R9e48Q3c93amEONmIV34DY3d07E/m270oyP39N
	 /A5IIsKFx9AW/UPk6veuPsF5srMtW+E3WRrj5kkLErY2pZGHmSCxGrpU4sVERZqf9n
	 rSfyKhuv1wiGp/8f6534YMlOcASqb997jLtfgqg8YV1APrR+sK5PNSzRft8sXtXdTe
	 x40n8Se/Xnn6g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 14:33:47 +0100
Message-Id: <DG7X1LYSZ1IC.2Q4CYXM97A62A@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Alice Ryhl"
 <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
 <2026020618-congress-tuition-8893@gregkh>
In-Reply-To: <2026020618-congress-tuition-8893@gregkh>

On Fri Feb 6, 2026 at 2:25 PM CET, Greg KH wrote:
> On Fri, Feb 06, 2026 at 02:20:06PM +0100, Alice Ryhl wrote:
>> On Fri, Feb 6, 2026 at 2:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>> >
>> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
>> > > That's fine, because the rust driver core code should also be built =
into
>> > > the kernel, not as a module, right?
>> >
>> > Yes, but the Rust compiler may still choose to put some of the core co=
de into
>> > the module.
>> >
>> > Especially with generic types and functions the Rust compiler may move=
 some the
>> > generated code for a certain type instance into the module that instan=
ciates the
>> > type.
>> >
>> > For instance, even though rust/kernel/devres.rs is *always* built-in, =
we get the
>> > following error when devres_node_init() is not exported when the users=
 of this
>> > built-in code are built as module.
>> >
>> >         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko]=
 undefined!
>> >         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko=
] undefined!
>> >         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova=
_core.ko] undefined!
>> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] =
undefined!
>> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_p=
ci.ko] undefined!
>> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_a=
uxiliary.ko] undefined!
>> >         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Er=
ror 1
>> >
>> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great=
 at all.
>> > Hence, we could do something like in [1] instead. I don't know if ther=
e are
>> > other options that may be better though.
>> >
>> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
>>=20
>> You can use #[inline(never)] to prevent this.
>
> Ah, good!

I tried this before, but it doesn't work. It might prevent inlining, but it=
 does
not prevent the compiler to move the function into the module binary.

For instance, even with #[inline(never)] on Devres::new() I see this:

	$ objdump -t drivers/pwm/pwm_th1520.o | grep " F " | grep Devres | grep ne=
w

	0000000000000000 g     F .text  00000000000001d0 _RINvMNtCsgzhNYVB7wSz_6ke=
rnel6devresINtB3_6DevresINtNtNtB5_2io3mem5IoMemKjb0_EE3newNtNtB5_5error5Err=
orINtNtCs4gKlGRWyJ5S_4core6result6ResultBK_B1i_EECsjBm7MKWXKwW_10pwm_th1520
