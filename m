Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03958038A
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985953; cv=pass; b=BSjdmIHgEBFw75V9RLwfLvtfHWSCKSkoie3T8uOKBNcQqGVlb8QYY6iiz2iDkR3PSp3C6FHj3Y2lBfmTMy8nPQE55SRiDA55ZxaS+DA3zsniQFWJgAQMBQJ8YZscMwigINiKNVVYtizXBcqOHvjZy/Arck6bE8sfApRau8Vnf00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985953; c=relaxed/simple;
	bh=RDnvDdT3gqyBnSoIqf9qQ2y2LD/nCKQusFnx59PqfCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIYmYumKtpzwIQut7Jg+loHGTWu+GRXN/va2LsU5td+0B0e9xntckmZEgSdQvjRh+DOLSNiZOuWZoc/wAK+CnSPEEzQrtFSj4aPVfudAUtQ0HzuVGLV9VEP4p+JxTqNF2gCAvq4OQ1L1WBg/WXoz1fhg9rwncbvLL5LLqyD+F1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFPs+uqi; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFPs+uqi"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eae7so1348055b6e.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 13:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985945; cv=none;
        d=google.com; s=arc-20260327;
        b=fSw1II4B/moKNdUH5EJiLwtur+r9OLvWP3geu3wmYIgucH6VVy9HO82IYax92joa3Q
         t35GUnNvaCuPXLeCdWe2kyQDLMhSa7taXsfOJ1OPTjxeOpJewY/qbUFFrwhr6o/x9MnM
         jKtjYL5RETFYHibuDFEHxHVrSiUghia+/Ge2psri+Le5NaOQ659TfMEvtdp+n6ImEMcY
         RHMf1gpQfOXKZL2STvWhkG/GbDto3WWjA4iF+OAlf03Ivd403GXKYO6prh6tXdz2+DNW
         FyxlGtURMWnHOPcg85LO5Lc2PSox+lzlSu3IKlXrWxOLHC18JPuBGTp7+6UDx/1nnHF4
         RuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        fh=uaP052N3jM8P3X7QglrJ1sHlYnraOODcgsEntZ2ZkmM=;
        b=Jm9JtmYVJ4MeNEVLqkISDqtXev7uasctMAsXsPsaqeunXgtfb9gn2kYQj6LE12ZssP
         kLeoV1wJ3LPR5kSwXk9frGno91jD1PWnH4DEJcO0yZMa5TbKamA0m7Mz1Aq02XIYpVzE
         mpKwc0btSx37dIxbMyL0zy1pgt2n1/SVKpdLoa4erHQOBfjF/Pty1h0PfVDr6eMYScfJ
         CVlBq4d+dF35ProwlmtItpl/spuE6z5utrsv5UEagSFE4j7Wrsb6FH0m0GIju1kaAzoL
         QXP+XHdb0EIPV0wXZl3RgUUYLhbu5vd/w/7rtL1KLFBoHMrKhZ0b/eJB/FpN5O1vOIc8
         dcYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985945; x=1789590745; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=DFPs+uqiQ+oQ17LKpW06FP2QPovzuOE95c5oLhrZaCaoDfr6a+2pbD5LfNTbh+ZfAI
         omPS7Gcq9XXyjHMOvTsito//vkmCmFk6bQ7EfwqiOT8cAkZy7mOcVgz+qsXmBkmZiafA
         qnACDQUd4dzFOq9LYec3476Qa1Urd5CbwQmN1rSJX6NO3vLKPd+RF2NuNVPkqDqQc7NF
         iMNEXwImlC7FW6vbsnNCu1BX9gkyHSZaY9ZdlxcUU4+y9gdZH7hKCIzcdNMK8zpiMxW4
         3CM64I9RfIOq/vGMG4xN4ZuZK6GoT6UiVPAFfAh00gjyFeaUUg6EOUZUChHWtIKVLoqU
         9bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985945; x=1789590745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=BhLKZWbhU5F/3sC7sRZtPoUpCWpDvgUQkyAZFd8nB9xALs1/CFseCaTw0p0vijKAp+
         2urwJ6EUUownXCzVuxUlekuBeRqTSdVLLTXdq/l126FlROlWFI8LOzozjWibZRWmV0fu
         Czk3rwfXeMhoieYNfL7nTF4pMq7mpWV0mGELPRuvwNeq7cZ1lmjUSUOwvuXdOBbVnCJs
         +HPqX9ZaxPVbMgKxhIf6ODo+lrt21T68+Qiehq1pAOZKK4pm6E7BpOp7VLCfRWi6Glwt
         FiCk8gVyBJ4KAOI7vcKESVVtvMu8ku7178M2kCAGpcfU5PKgPXbwdSkEbM3CWSKnd9KG
         DkXw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ5mttiZwVhgutQaEka9oxTn5v4OGWFXmfSII1hYz2gLqaoDVzUky65Jn/5kiIJyahNo6uL8LuNJY9+g==@lists.linux.dev
X-Gm-Message-State: AFuF++k5yLzoE4L8NMmA+fUJ7Zhu4J9ThIrzf1OKvoDMdxwB5vWChS8C
	PP+oMlIvQcda2rTUHEB/AzsppWvb1pUU3CKye/I5hv90ei4Hp65/pVOqtDQWkypZeDuIBgbmt5p
	zB1+kbVmLPfTdw5wUBP9nY9i8jBunepw=
X-Gm-Gg: AYBFou3tp5j6zIFXIC/wNgXXcXJGgZJB4e+6XheGitjLEgltLSpfb7fQL+Llo9VlIiP
	FEZgVoA++QJbJSRDBK5vU7c/DzEIh/wsDGUjHt0RwRajcOElrd+FclPo3hNW1La25smgmqdqfjP
	lDuS3MMtxsxOSqpp9MXHLwFSr/66nW1zDg6j1nc+amUAdBblLRXUm3rvL1Sj7OUG0bMKb1cXGYy
	3IJoCc2FyiG7pMYBHfgug1W3DXD7aA0D+qfmJWecqIvYIgg4FikZNM9x9PMyaH+ymGQ+K3weI+E
	V1MjMjKhnf9OCoHmQr9I3dE3sMhonn7mo9I/fp58m3H8Yeh1VT05bCbISWjvrF1Z8PLQkwe9Zgh
	6aCDsuhoestBUxg==
X-Received: by 2002:a05:6808:199b:b0:4b3:7a14:6b25 with SMTP id
 5614622812f47-4c0250d649emr9426459b6e.14.1788985944982; Wed, 09 Sep 2026
 13:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
In-Reply-To: <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Wed, 9 Sep 2026 16:32:14 -0400
X-Gm-Features: AcwNN1UhJN0ysufwaCf-45J3Jdkut3tQFJ3a4uYdflnPIbeGW7A1nWp9glQ99fI
Message-ID: <CAESH5oeL4+rgO1PODjza1PiTzvfOBmCP_WtUoAyaejwSCcQkSQ@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.

Agreed, dropping it in v2.

> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.

Agreed, replacing the `# Panics` section with that in v2.

> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?

I believe both are covered. `to_bytes_with_nul()` includes each string's
terminator, and after the copy loop `modname`'s NUL is overwritten
with the `.` separator, so `modname.len() + name.len()` is exactly the
required capacity.

At the boundary, `DeviceId::new(c"a", <37 bytes>)` stores "a." plus 37
bytes plus the NUL, which is 1 + 1 + 37 + 1 =3D 40 and is accepted; one
byte more is rejected.

> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.

Ideally that would be enforced rather than documented. Miguel pointed at
Gary's `#[const_eval_only]` [1] in the other branch, and `DeviceId::new()`
looks like a good candidate for it: it exists only to build device ID
tables, so a non-const call is a mistake rather than a supported use.

For v2 I will document the intent, and the attribute can be applied as a
follow-up once that series lands.

[1] https://lore.kernel.org/rust-for-linux/20260903-cv-v2-0-e93b1613e40c@ga=
ryguo.net/


On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Sep 9, 2026 at 9:19 AM CEST, Greg Kroah-Hartman wrote:
> > On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrot=
e:
> >> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> >> `auxiliary_device_id::name` array without checking that they fit. An
> >> oversized name is caught by the array bounds check, but the error
> >> reports an out-of-bounds index in the copy loop rather than the
> >> constraint the caller violated.
> >>
> >> Check the invariant explicitly instead, so the failure states the leng=
th
> >> limit rather than an array index.
> >>
> >> In a constant context exceeding the limit leads to a build error; at
> >> runtime it panics, so add a `# Panics` section for it.
> >>
> >> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver a=
bstractions")
>
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.
>
> >> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >> ---
> >>  rust/kernel/auxiliary.rs | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> >> index 60dfbec8f330..1f3ba86d6d96 100644
> >> --- a/rust/kernel/auxiliary.rs
> >> +++ b/rust/kernel/auxiliary.rs
> >> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
> >>
> >>  impl DeviceId {
> >>      /// Create a new [`DeviceId`] from name.
> >> +    ///
> >> +    /// # Panics
> >> +    ///
> >> +    /// Panics if the combined module and device name, including the
> >> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` byt=
es.
>
> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.
>
> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?
>
> >
> > We really shouldn't panic, we should error out and fail the creation
> > instead.
>
> This is only ever used from const context to construct the device ID tabl=
e, e.g.
> as in
>
>         kernel::auxiliary_device_table!(
>             AUX_TABLE,
>             <NovaDriver as auxiliary::Driver>::IdInfo,
>             [(
>                 auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY=
_NAME),
>                 ()
>             )]
>         );
>
> and a panic in const context makes the compilation fail, so it works as
> intended.
>
> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.
>
> > But what is placing the constraint of the name size here?  The C api
> > just takes a pointer, it doesn't care about the size, why does the rust
> > binding care?
>
> I assume you were thinking of something else? This struct represents
>
>         #define AUXILIARY_NAME_SIZE 40
>
>         struct auxiliary_device_id {
>                 char name[AUXILIARY_NAME_SIZE];
>                 kernel_ulong_t driver_data;
>         };
