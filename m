Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B604E3241
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415123; cv=pass; b=sv/SYPQs3JimyPNysuBnOQ+QUZmAS+QZXhq69OPhVp8X6oZz96IGov07ZR1Gkyo4vTGDPhDu6WLdpB+o75qmooHergbFKRQcbc0pJ004nP7E71Ykh02x0KtGjqUN01mRiQxPexvxDCTus697ig1rrKjkf4QWw460N78zS+AZPVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415123; c=relaxed/simple;
	bh=mysYr6A8Sr788QG2Uz+xMwHs9QNcHlODUZov9aP5+dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDAz4lUjmsk+EniCOTDVhSK12+Bs75IhmLKG5JBwRcnlTwl9yn3TYRC86qOoiMT1szpIlZlov9knTUov99NYOGYE7Rytw9kWMSqARdE1noF3fIqFc/QWeI/TVzSROAvrrfkWfbC2/EQB+YYZsdorfyMxVwgj9d60MJ7h0DRnzfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XIYoTnpq; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XIYoTnpq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so1063176f8f.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 06:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792415120; cv=none;
        d=google.com; s=arc-20260327;
        b=GPHQ2/8JNbEEighHMGDcgUg8EFwFa9dRwirJ7Ysv/FpcfR9ZgfAXuUoGzEll21Zs3a
         8Ji9g01Z8wS1Y54Oo3+1yDYD5kUPlJOnnqSu4hQFzxQQBcNRUQ3PAwn2f8iyi5z573vX
         1jxt4wkLCgTx7NvoNFqkXTnknNPe2cQP5yXRNuvgtkSBVUHxq3n2mTa+MBzl494ExDoE
         kx03ACu8oD4kHXVwTh7tc+eTvwVaVil1aWXEpXdeJ2XHSB5teRik10sM4sp1AXaNm1KL
         bS/degaivQ8e4eoBF4oYWG0bD19oaaaUAUDL155yYCYRWAy8YODhhYcLX64jkgGUgp8J
         rrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        fh=gTy6kkkFk1v700x61B5qQiTTebne0/UcYlmDMC5UDVw=;
        b=pPzCt640EIqTxoiTZMd4pD88ZeoMGCcGyAvJYfFfyD2jl0TMT60ymvPtZp8Kei4tL9
         /RwuEgmPC3qSWdrkY/aCuMGGv+sy5J9z+g92JPLwBfplGPiYcbBMmaq3VjSmOWmxbV/2
         HO6nx9aLhtH8akdNnOKU0CS/tM5ksFpZI4ExDTWBKkRO8WIEp9SaTw6H7UyaVZTD/gz9
         VkZ661NZIU13aq5gWIJwJJZ3SeE4fqcfThDWTWoASdxQ4bSJ/JQUAeVUYSRM90UoHsxU
         votlkpOa4gtpozj7SD1m0TyVyXKL3h/R+1ATTFCt+RVMupzMeExevFOG4EgliORHPQhf
         WAaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792415120; x=1793019920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=XIYoTnpqX+wV29BeM2NsgIvL96kIsxdLS6Ue/4z8GrN0caiUSKNuTAlDtmIOahTN9i
         Qp+pTM9pyW+NodP7fJZfMu9PCkiqM1ZUBkTpQuwlhWMPJCtvT941/yWsGyFZ3regd0hh
         xoTjDRaQdwkRxUb6kpBoj40qRQkvEUzH9ku4PupT/quMfiRoQsgo+7y8YdJ4OagxssSo
         U8A5HrsvDnFI75zEMGz+8R1PkbBT/TbkA7aSJNyD5cIPjJOAofh1VQ5eWijjPBA8DsE+
         FOJYz45pCtZtQi/suYE/1CkYVt13qLa9Ns9w7SeFoRRxRgQOmMpX/XloZI8pA02zCzEY
         qtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415120; x=1793019920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=FukOUGyf6B+/3F6yYO7t7OTvoLI8JfzlHyITXoS+iTGiNJYOcyVs/yTAoU0aUagCSc
         LIZgZE7mtIlFHq16zlSmF93vp32xGZzd2peoqmDJXf4PJZl4Dw2Vcn4LrCGMWEEa8PFV
         0IgS4vqTYxFNwL5nST9pMMrb84BXx2QRCRGETS+9zdOqq/CugsXzVkLnEoTXOzcGnb6n
         dex14ortKELkK9L8mnQPQz4Wkw/znZ0Qve+ti/eONq2YgXT5boI5C6o8WRa/05QP7Yzl
         5St4hSHCAK42dJYK3EFAqR1Nr8kwSRD57ZyBQLjDdC0t89TIl3nivj2HszugRSmsOiPf
         oVpw==
X-Forwarded-Encrypted: i=1; AKwUvBwPEzrpC1cWPJ8Lp5E1wMJpudgM6fsyDlgvHEhC5rtP96k2EsHM4hhEnB7m+xoNOHHdztgKjxLsAKy+ng==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3bkODCDVb3HhdQyklrrlc47X28aqixd3LQq3kjgkmvnwf9t9x
	zk+kPhghSzgk3w7RfLeGlxDiglGODitT8DMS2Bug0KgBMWnvDcK83HIX2sq/NWO8zPCbRKKBlVY
	wyxaLzfrK+U592oAgGqCvmRhJVRxSHski2EEgifst
X-Gm-Gg: AYBFou3l+BaBTClQkJkp2JBpbA6BhsGTkff3D0McnY69IHth3HoEWjJNsxLiN8xKmtS
	k+5ovjEvtAQPT5A5eINyQaj+OgUlOLODlNutxZhPsL+2Glu9USLBBoPwZlNdglOHf3KYUtbIUeb
	T/RlTO4PfYqMZnL/45HGXnoKeu4PsRz3DjSGlcpaKxafz8oAanx7LxSVRcqRlHoWvqLItcf6AIh
	Q98UvDIZEgumspUXq8IxD6CuSHWaNqmUZxQJ13fx8U+FvNMKTshOkqsK4yLw8jJ7q1hY4kvm18i
	57N4kt672zFr+EGetEn5vcVJCnEQcRdTmEx0g504pNFhbQWZqxuVaDg9MEL+EL/NrX8hxGhcBxK
	pkpY6I3wNYEGb2oATzrqh21jzGQpgjNN2RMC3KG7kFfGdIP2QOOQO
X-Received: by 2002:a05:6000:4025:b0:485:8c17:9764 with SMTP id
 ffacd0b85a97d-48e07fad8c4mr14437246f8f.38.1792415118156; Mon, 19 Oct 2026
 06:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com>
 <20261005133857.1572243-3-beata.michalska@arm.com> <20261016121230.3724323-2-aliceryhl@google.com>
 <atYKvHQm9qJ9wY-e@arm.com>
In-Reply-To: <atYKvHQm9qJ9wY-e@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Oct 2026 15:04:43 +0200
X-Gm-Features: AclHuK_TBh9nrF6wdCskikKjrKbXbBPQNYzprNDJUvoT1849kJ0giuue1RmdKZk
Message-ID: <CAH5fLgjcqHJs-mVsmUVwatyap7BOKU+k6LiAPFkqOcqC3soB3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:19=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Fri, Oct 16, 2026 at 12:12:30PM +0000, Alice Ryhl wrote:
> > On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> > > @@ -223,6 +225,14 @@ pub trait Driver {
> > >      /// The table of ACPI device ids supported by the driver.
> > >      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Non=
e;
> > >
> > > +    /// Provides driver's PM callbacks, if any.
> > > +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapte=
r<Self>>>
> > > +    where
> > > +        Self: Sized,
> > > +    {
> > > +        None
> > > +    }
> >
> > Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated c=
onstant
> > `const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>=
>> =3D None;`
> > to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?
> >
> It can, as long as no one would mind making the Driver trait sized.

That seems fine to me

Alice
