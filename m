Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4C324707
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140288; cv=pass; b=JV+Zh2K5ZW+8773BQ7527zP138MD0apRCoBiUwH+b+mXSgKjugjG2VrP2qCw/fC9GAlf9afN+fDh0zKbZFLYaCXkGZy0c1HRfbZh95VKOxHNu+4PfXCp27lGD0eN4ZoqNf7kHZPrtL+MD2w6CxgHJafNA8wsGdzcwR+RirhmhWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140288; c=relaxed/simple;
	bh=4YzknxHBfsROI3oe/0Gw8Zry6luJZkfAyc2iFek3R2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeccdDFj2lHQl8xguah6xyPx3VZQgnqga3aWz9iFhLuHmeUS4IacqyXejFJsfZkkom2K2g/LUwtdBpuoOxpwQZNM4vat/hE+f9vJmtasj9MTHuxu3QGvIPBDXufQjIn/MPWqmPB9PDOCrvalti6nFkWJYqATtOIfgT1E4TYDGeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MD6P3OER; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MD6P3OER"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so129a12.0
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 09:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770140285; cv=none;
        d=google.com; s=arc-20240605;
        b=M0v6Gr0BWHyMFF+VBGnDrxbDbY0KY4Lg5EPD1+kz8Dzri64Hq2CklR+d0Zz7MbtbhA
         xwgedJidPJ2GhIAKdBRFtRpzzTb8zSuPeIq/6ClgAAQcBi3YNjWt+e/7JuGE+lmDMZt6
         wkeUyaqwmd3u1Qm7FgzjoMoZemzRpe7q6OFio8CZp086Z/83VWTVNRImm1QYlaXM0+WI
         S1X3SrSbukU1uZ/+EdnHqvwcuDL+zx6A9i4/SfHNQlH3zT0v6wbZFIlba2XNlKDL5ctw
         9zpDY6NLg0YGFqHg3zd+/IaTcVrhzDoZluX/SBg71rCeFh1aYj3RTv9DSwhgPFa+h/Gn
         EAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        fh=crYXTxiBixzL7dQWan9e3G8Qavn4x/kOPX7thXQDPh4=;
        b=O8erMRzbfQK9Xa2EEaZQlhASSBKa6ipeSfG2myq9BwkC7VC3rkeWGQgI2lyqbCbcuY
         lJkx7E15pnIEq1/FrXhkTkDhDY2pkyMSugpRAaUiQEZPetNFSF58KazaWhDzsiEdj0/V
         VJswH6HZaDvg5puO0JSGSCem5GZbgDl7wH35ShWzR1WZr75oCu89lhvV9AWivHyC4oUa
         DCDk+mM+uy8zbYDbO+6URYpIJFDxTZOfJri/lBs5g+5d6RBHeU8FRod1GJJ6/jbAGfrr
         wixn8dLFMD0/ffvUmJo+biNqW9HMVPQnbDo4wiFIK7fE40hPjfDBYuK+/5lPg3GddkTz
         AXIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770140285; x=1770745085; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        b=MD6P3OER5h22XhWDrYgXEd/puLEUIPUx5KE49pQunjFpJ1rpcpAwg7JWZecsPGLNU7
         Swn8Axr1Nzr0h9I+6hPp+FV3qebzx2AmGzw63D1cKQ4lVJvSKHzr5Gw+/FTM3UpGWZdr
         yDTuYx0z+rP8COcFaCjMCWzZ8Qy8VjyWnCLajRydoFio86DTBI1yJU6aWjd6eiNh+UZu
         2Z8meI6qQSnzHzB+GSUgC32LzeXMsljmh8NsfUUXkO4imOpi99cxKd9POV/XuHz0ipnv
         NVwvBpmibD7N+S3MvpnI6f8E119k1QyrQc3xMh5ZkEBWHbI4pVkLGwPknzDhtc45vRwW
         UWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770140285; x=1770745085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        b=mWFV8TmC5K3SP3uFuqestq/LRya4edA8uBF0zUqe3jyh/nro3497Hh00b9OxHZ3D6I
         ji+HwNQMikgXKsZ2iNzZXxgkyoVEpV1rlQdjwEjkL/hJK+Mmo2WzjBtqVjJc/NBX/SXQ
         yHMijF+J04NwmyhMl9auYZ8kbYl2Z0BlRa4awSf01ftmcG+p1NLVq1L+qPzmKfiwM87F
         PbtordX8JLheBlYXOGVRxEKAru3tlo0EUqZXm2uWd4/HvaGmVex7O1rl7VHaMFsRL0sm
         SdbGY1JIrStq1OoyqWjEra+4cn5HnpGDr4DdpQSxapbpeP6VLEXD+AUnAuLoYAY63LZb
         CSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtQVGIIEWvWnBoqzCMAk2xu9+WU7Si7WnpDpIf2T+lul5SBMHuMMH7PM4rH+UZ17HCLcIY7lmpehHNbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6NuRoajM+AtzeoXACOy3o8X9nkvKHMVYvFQ3XCUybweAK/pjK
	8JWWndpISrNy7M03n9V6cD4iVLUManwAE1wE2O3GWcDP3koJ3SPLWGP/7f5wTEPtZ6Aufa9BOML
	yiE/33oqLu6k/JSSEucDnsrumNZ4o517T11Bpp7tl
X-Gm-Gg: AZuq6aKNwVVgqbIFr7h8d2JOybELywwhz7LD7De4UxfYDsv4XQuL09UBc7qte5S6FKj
	NnlBWeBnrO8eV5W19L5l3nFV1SYD4uHsNFYpb/zJx11JbbAZSRfkQyPH1Fm1IFObuCqPHe8KHUv
	FqENsGlLkyH83lOAwTMqrNaMqW/WdrqACiSGuHEDYgdXKNVljfRmAZ/14JYH+m+ULV1hcezbe3f
	o6Suv2582u3+TJZq6GzalV6bpjrUKuOIZjAWcsPPi0HLTOvp6wR6BhgLhPKgh3FrZXoRidSfNKp
	LlFYot3INH9pBBNI7rgVvhuJhA==
X-Received: by 2002:aa7:d355:0:b0:658:bd2d:929c with SMTP id
 4fb4d7f45d1cf-6594a33abd0mr5612a12.12.1770140284581; Tue, 03 Feb 2026
 09:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com> <2026020315-conch-trickle-2d84@gregkh>
In-Reply-To: <2026020315-conch-trickle-2d84@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:37:50 -0800
X-Gm-Features: AZwV_Qib0Xwq7jvSK8YoP13KkCRLNUErONN49KXCI4YsJMCfMFPdjadu_r-_mhs
Message-ID: <CAGSQo03Ok1sv4myQk2Ch68rET19ypq4Mm-=82Ue-T-2Z8kaGmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> > Convert the socinfo driver to Rust for a number of improvements:
> > * Accessing IO mapped regions through the IO subsystem, rather than
> >   through regular memory accesses.
>
> That's good, but the C code could also be "fixed" to do this, right?

Yes, nothing stops the C code from being fixed to do all of this - all
of this is representable in C code.

>
> > * Binds the device as an auxiliary device rather than a platform device=
,
> >   ensuring the mapped IO regions cannot be accessed after the smem
> >   device is removed.
>
> I'm all for this, but is this really an aux device?  What is the
> "parent" device of this aux device?  Where are the "siblings"?  What
> does sysfs look like before/after this?

The parent of this aux device is qcom-smem. In the prior
implementation, qcom-smem loads this device through
`platform_device_register_data` and `platform_device_unregister`,
holding a reference in its global struct to release it when being
released. The probe table for the qcom-socinfo driver was empty, so it
would not probe without an explicit registration.

>
> > * Adds bounds-checking to all accesses, hardening against a repeat of
> >   CVE-2024-58007
>
> How do you now "know" that the bounds checking is correct?  The C
> version also had this, it was just "not correct" :)

While it's technically possible for the Rust code to have an error
here, the error would not be in the driver, but in the kernel crate.
The advantage here is that the bounds checking is all centralized, so
we get it right once, for the entire kernel, instead of needing to get
it right every time.

>
> And which accesses are you referring to?  From userspace?  From the
> kernel?  That CVE looks very odd, it's probably not even a real one and
> should be revoked, right?
>

That CVE looks like this:
1. qcom_smem_get returns an object of size N
2. When initializing the `serial_number` field of
soc_device_attributes, the offset of the serial number field was
checked as <=3D N, rather than the *end* of the serial number field.
3. This resulted in the driver exposing through sysfs whatever data
was mapped afterwards, interpreted as a number.

I agree that the severity seems oddly high, given that in practice,
this will expose the remainder of the IO mapped page - I don't believe
it crosses a page boundary, so it can't even *really* leak anything.

>
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3=
d2b457422ad9f342c 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/hwspinlock.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > @@ -279,7 +280,6 @@ struct qcom_smem {
> >       struct hwspinlock *hwlock;
> >
> >       u32 item_count;
> > -     struct platform_device *socinfo;
> >       struct smem_ptable *ptable;
> >       struct smem_partition global_partition;
> >       struct smem_partition partitions[SMEM_HOST_COUNT];
> > @@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_sme=
m *smem,
> >       return ERR_PTR(-EINVAL);
> >  }
> >
> > +/**
> > + * qcom_smem_get_aux() - resolve ptr of size of a smem item
> > + * @aux:        an aux device that should be our child
> > + * @host:    the remote processor, or -1
> > + * @item:    smem item handle
> > + * @size:    pointer to be filled out with size of the item
> > + *
> > + * Looks up smem item and returns pointer to it. Size of smem
> > + * item is returned in @size.
> > + *
> > + * The caller may take the loaded state of the provided aux device as
> > + * an acceptable proxy for this memory being valid.
> > + *
> > + * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
> > + */
> > +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int hos=
t,
> > +             unsigned int item, size_t *size)
> > +{
> > +     if (IS_ERR(__smem))
> > +             return __smem;
> > +     if (aux->dev.parent !=3D __smem->dev)
> > +             return ERR_PTR(-EINVAL);
> > +     return qcom_smem_get(host, item, size);
>
> So you are returning a void pointer?  But don't you really know the
> "type" of what is being asked here?  It's a memory chunk, so u8?  Or
> something else?  void * feels "rough" here.
>
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> > +
> >  /**
> >   * qcom_smem_get() - resolve ptr of size of a smem item
> >   * @host:    the remote processor, or -1
> > @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem=
 *smem,
> >   * Looks up smem item and returns pointer to it. Size of smem
> >   * item is returned in @size.
> >   *
> > + * It is up to the caller to ensure that the qcom_smem device remains
> > + * loaded by some mechanism when accessing returned memory.
>
> What do you mean by "loaded"?  You are saying that the caller needs to
> rely on this driver remaining in memory for that memory to be "valid"?
>
> If this is the case, why not take a reference count?
>
> > +impl Smem {
> > +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Opti=
on<&'a Mmio> {
> > +        if *dev !=3D *self.dev {
>
> How can this ever happen?
>
> thanks,
>
> greg k-h
