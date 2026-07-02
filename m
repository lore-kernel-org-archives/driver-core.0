Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EB4A3408
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000808; cv=pass; b=AMZ8JzLlIDgCjPxl964BPVHjxaSYsdIZhtR6Hahdz2nUgF6sooLw/r1NLjQeRSRv2ZIs+idGTsAbpNL7afcP4wW2ScPmjuUMIIGBoFzhZEeeDOhNQNAjM87A6JeHGxPT9yA6Aj8bE8MNuVYiYxIGcut/+aljzNMhPJ28q5Z+Jds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000808; c=relaxed/simple;
	bh=utoARpDnvA3c3vaCWBg5H9ujL8C1Fui0A2kGFCJI2Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMybHpnCwFuBx3IR1EkDr2OQQocvMOBZdlC2tkBw8wRcjhYHO9KbybDPcJoHkqa8NUeLDLCsothF2EXolcLaITg1A74Bh0nXDyhUdCavsRpS0i0WqGUaZswIOWSchFIwdqsZypGQMl+2bCvuimIxdUVIepqpl1pfgmUrDQpsD8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jFhtmtzv; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jFhtmtzv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b7612475so15633045e9.3
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 07:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783000806; cv=none;
        d=google.com; s=arc-20260327;
        b=AgELVwFpYK7cquyz024xMWBkLg2gHNO7Jiu5lwyJFuDm3lnePdbrCq3lirM6m70qZJ
         x3xeM9ifi4BO394U+NEJOSRC0pMx2i1ww3DzWrn9d1Ddug6oKzyG8p1CzPJ0FAle4NGA
         YN31jziEjgK3ocGRVrOxDCEKaDFvuiVs4p87HHipaCjLyAZQ+y94FHh7YCdsQOBBAlwF
         Uf/1+HUUQ6t6cp24djjve4t9vWSiMbu2cZwWdaJWvwYwc7cmzJZaoX3pfeVdXTHv/p7j
         4z7uR6u8MTWj50Vy39T/mQpqEY4i+P4AtzfusZGkopnqwmTxLdqlbwc9LNE7lwrSgPZo
         Ohrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        fh=yPkHeH4o7Dt0rmM1tDWdK5qcSWtAYJ3wtPtDf3DTwv4=;
        b=S+ry3Rya1YERK5GJo56YSvfEqf/GylDLWEp1MX8X63+YPVqXPdmS+7y2TUpyXm2TZY
         KiwIIDqCXCvWuCyAMLXAvGXZgWZc4dG9b16W7Ol0CshYQITOg+yPfwmmBAogsSumBxmq
         rrCD45bxJKa6z7a+oOwp5+sv7Mq4ffqrYO5xeyBomF8+TMwo40GEUp94R9vGE6lKb8v5
         jIGIBeaM2aqQl16AsQrRP1ylQNlCPj7p4uBGG9Jxd4iYFQA91QUIXb6PZZTrwedcdj8Y
         RvbiZ/TJw7xROl5Z99P9hCew++qlX9P3ne6bvxHJIATZfbHKGjBOg2FmT3psjbE7U9vK
         ZXBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783000806; x=1783605606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=jFhtmtzvZLZ9rfwflzz1pIMUqI1kUkWo1wtnQcI5Z6WKEdtZ7rcGh9Ys1TxKTuTh4x
         zfKAbF+QqbSnUSMWdkbXiMY+2xHFbQCm4DGZNmdJUNRX02YpWXEgO3SUCZTFrMkl4qTZ
         vtsc5PnyCsC2SmsF1jKF+ybOfDbaBVjLzZyvTWuNA0iRY8W7TVyYwqg9KsZkieHHz5qR
         NrJD2QKB8Alr7xJX145GzXRlTXdACusnBdAK18nIhJOFXKgiQ4UietSvccMehIBbwbDV
         sfVvRMco78PUf+ddBeBEoryaOEJIOkac1T5Ldfv6jQzfzqwD7Rgqq8dKEorZdw8JOjM0
         i3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000806; x=1783605606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=lQCJMoo+VXOxxJlDEiHkThBQGAfhgrNyB1sBUTouVWJ8LWAulyiIh4sSo9qYoya80G
         oyJZoq3fL91vaNl7JJ3RipdrXDX3zLEXmmSQP7xyNzJcEHBQ9VSwtL1jjYBHE1a/nzge
         Z8niSXmMo/BHFWWVyMFwEgHe/QD7m+xZWYEIIJMWF7r5z4AHQHq66JdIHFpsXJ76ITfi
         OyRyXZ+DZR8urH3Cg9TlGEWJ06pjMSDNORHftmbww/hIqKP243Wc2kXsuB07uadB5Cs4
         +tNMMIJuRvm7tOaFLxERPAYeYhZxNcGbMHAZPAPR4wC3zFONV2JHLl7t7zmxoFtbu/xc
         c7Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+6ZeevryrNhy5/aL9sKLjFST7hQ6zgEb7X23GWuoA7EDgZBEnq8IzGFCjiOJpbcVdaPx8wFZo4xk+Sng==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp56ZATLIAUoIJlwjfD7+/eYnglp4Ib4LM7eJa5Cu4u2nJH7QW
	4RNFM/uHndNjtuTTwkRZLOSdRREWpknX/S5M2xK7DUjyAnoo5Ac/k4r8euZKGoPIa2O5DUZ+lml
	zvNxQVBaJOgZCI60ZHbfAHrM4sqAM2uy1XdsG9mHB
X-Gm-Gg: AfdE7ckJKHEL4rVBjR1x/6sKybe6ar/94BHsNd2qNNwyaLc2GnSvG37bMNjhKN8+Cgg
	ld48BtRW3n+SEt91gsf/3bB9lQJxS2+MYpjo027AwPHht2cReoGY1RiyF18vlqi2UzPDExcygG1
	rtbCYLSxuhq4C2omhsT/tO8eyKAUqf198GnwNLT/vC4MCBUQOvUhemxP0U/s5kkC/vQmsnV/Ual
	75NusJBuKg9uj+h1I5ZBoyx7xH9rKckgqbXtfmhTcTYmN+CylPbSgHooy6Dbux8IFq8bPV1nEfV
	bPcLduDSwYBtx0wU+KKQjJhL8tI=
X-Received: by 2002:a05:600c:5296:b0:492:6efc:7c60 with SMTP id
 5b1f17b1804b1-493c2b99781mr85583495e9.28.1783000804786; Thu, 02 Jul 2026
 07:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702-idtable-rename-asptr-v1-1-e0927273c71a@google.com> <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
In-Reply-To: <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Jul 2026 15:59:50 +0200
X-Gm-Features: AVVi8CexQdyFEd0R-YBeb950WefW10NhAupPBjQ8CXL2XbC1XoogGwE5GSAY5zY
Message-ID: <CAH5fLgjz_FTzv7rFsxcvt2N-3ehPxa2kHJqUHKDBv56OZw5UVA@mail.gmail.com>
Subject: Re: [PATCH] rust: device_id: rename IdTable::as_ptr to as_raw_id_table()
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Igor Korotin <igor.korotin@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Jul 2, 2026 at 1:30 PM BST, Alice Ryhl wrote:
> > The current name of `as_ptr` is very generic, and if you attempt to
> > invoke `foo.as_ptr()` on a type for which this method is missing, then
> > an error along these lines will be printed:
> >
> >       error[E0599]: no method named `as_ptr` found for reference `&DmaB=
uf` in the current scope
> >          --> linux/rust/kernel/dma_buf/buf.rs:54:38
> >           |
> >        54 |         ptr::eq(self.as_ptr(), other.as_ptr())
> >           |                                      ^^^^^^ method not foun=
d in `&DmaBuf`
> >           |
> >           =3D help: items from traits can only be used if the trait is =
implemented and in scope
> >       note: `device_id::IdTable` defines an item `as_ptr`, perhaps you =
need to implement it
> >          --> linux/rust/kernel/device_id.rs:165:1
> >           |
> >       165 | pub trait IdTable<T: RawDeviceId, U> {
> >           | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Suggesting the IdTable trait when an as_ptr() method is missing is not
> > useful. Renaming it to `as_raw_id_table` makes the method name unique t=
o
> > this trait and avoids these bad suggestions.
>
> I think the name is fine. Functions of this sort is named `as_ptr()` and =
I don't
> see why it should differ just because it's on traits.
>
> I'd rather say this is a Rust deficiency. Perhaps there needs to be a
> improvement of `#[diagnostic::do_not_recommend]` so it can be sticked to =
methods
> or traits as well.

I had a similar thought:
https://internals.rust-lang.org/t/do-not-recommend-for-traits-themselves/24=
431

Alice
