Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65EA3E008A
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998501; cv=none; b=aT3xDit4C31mxH+rYYJUBq0qdwcNay9rYi+u1T8qc7WJMiOEquXpdrqLf9L827Yx4hiW97zR0Vq0Dko3gCjppUtQnKLB2aol3I6ulO0+ib+m5olDvgRCv8qB4kcROuX8+WT7A/vl39NQZZyUccTDSFRZyyHYxuCvfhOWkZA7yKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998501; c=relaxed/simple;
	bh=CfNRJZeZmqs+vpmkTIy+iPYiZj1ZA6vbNYOB8IJb70g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MN6syKsuYC1rLz+4QYuKjnPPjjzUE5wgYnSVA+l/bhHGJYDwbSElU0U+SLCeLaY9B7sJg8gwV9FsKGZM/zYsqQ/CJKRnzZTMFvTWndxeFjI60oTfb6V0wiOpy4Oe7YpSXu7PWpDaLoHOJbKyueORUe99n4JFmjB2lEcfpJT6ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s1+GXoFN; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s1+GXoFN"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c160e8957d3so160244366b.0
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 23:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785998498; x=1786603298; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US1i/tRbzF6S64ni7H83o50wYD7eH+0GOV1v3nMXlH0=;
        b=s1+GXoFNpfJdYIx5MY1jYGa/O/FwuHiunaho8dRrUHEbt1jem7C0DeYLbeXsQHumJy
         +2gKOROl6aPCp691bgCOLuOWveBWfL9CDYo6KjnDADmXh6X6hVmAMd85WoYYGhp8rCnQ
         /Z/ZVLmuGwjDQlYku7Q4dnKs1jEjDnz6Kbd34/nVd4GR4DqncqH93lj6MGbN31ClUUdx
         WaOYEivhdFv/agv678b1vEHFEycUprjE9mausn4HR4iqiBLg58luOviFHYQmi/mUnl1V
         mNsvy/o4gdaU4r5R/xAJkXeaYe+7Xr2KV2Dp4jZThjuxKnxovf1LeDltvYKA5H6SSFwt
         dAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998498; x=1786603298;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US1i/tRbzF6S64ni7H83o50wYD7eH+0GOV1v3nMXlH0=;
        b=QLM91BK6Seb8GGZNJEOEJJuNUpdfPqjV/8e+BSRw3Qr4XkHSP2u53P405L6bkIOsoZ
         ZE1Tv6bxDWRJTMJpeyiSicb98iUJJDcKHijy/A8OpTTbcGEjqdq1geyMT0q69vnvBk4d
         0NLEn6izqYLcJanhTynsOs/vpMH8rcLRu79X5/lqzmMXTTfZO87RGMzVpUc4LOzyG+ba
         NIfGle/Tg/79vP0j4QKMMLedP500Ja813imQGntd8kyDwti8XJDMcksaTlg50ofQgfyb
         1jwPchzsyK089WZJi5Sk7S0KeDYpxp/WVFP5i2venYtNsOtv+655FiP1NT2Ne2Os/ZNp
         wITQ==
X-Forwarded-Encrypted: i=1; AHgh+RonTsyZwqmu9T67B8SUIC+VBN7Ro5E6vCbw7q+2J0ntfZegqXaN1YuQr1ald66s0vUMbD9EfH9uwu6b0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2LdFD8XNuDxbpfVRTY8rNRjfZb3Po/HAvp1bRx1m3Vmred8A8
	4Op0JAciaujKX6Ueo77yUYSZPo04HL4dqgqFzmheBYXoZPQ4YgbNnHvAsdCiqlUCb4vdIRGrzn0
	IuJQBXIXkzUZLk7SiYg==
X-Received: from edbdm10.prod.google.com ([2002:a05:6402:22ca:b0:698:ac87:5b65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1f47:b0:698:3602:d0d with SMTP id 4fb4d7f45d1cf-6a14f252b49mr6344045a12.17.1785998497864;
 Wed, 05 Aug 2026 23:41:37 -0700 (PDT)
Date: Thu, 6 Aug 2026 06:41:36 +0000
In-Reply-To: <anHarTAFv-c4qx4h@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260721153617.869933-1-beata.michalska@arm.com>
 <20260721153617.869933-2-beata.michalska@arm.com> <anGfGWWxiuZj4i2U@google.com>
 <anHarTAFv-c4qx4h@arm.com>
Message-ID: <anQsoIbL6dGWmzbL@google.com>
Subject: Re: [PATCH v2 1/3] rust: add runtime PM support
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 04, 2026 at 02:27:25PM +0200, Beata Michalska wrote:
> On Tue, Aug 04, 2026 at 08:13:13AM +0000, Alice Ryhl wrote:
> > On Tue, Jul 21, 2026 at 05:34:02PM +0200, Beata Michalska wrote:
> > > +define_pm_ops!(
> > > +    // PM state change
> > > +    runtime_suspend,
> > > +    runtime_resume,
> > > +);
> > 
> > I think using a macro to define this trait is overkill. Just write it
> > out:
> > 
> > pub trait PMOps: Sized {
> >     /// Type of a bus device
> >     type DeviceType: AsBusDevice<device::Bound>;
> >     /// Type of the data associated with a PM transitions:
> >     type RuntimePayloadType: Send;
> > 
> >     fn runtime_suspend<'a>(
> >         _dev:  &'a Self::DeviceType,
> >         _payload: Option<Self::RuntimePayloadType>,
> >     ) -> Result<Option<Self::RuntimePayloadType>, (Option<Self::RuntimePayloadType>, Error)> {
> >         build_error!(VTABLE_DEFAULT_ERROR)
> >     }
> > 
> >     fn runtime_resume<'a>(
> >         _dev:  &'a Self::DeviceType,
> >         _payload: Option<Self::RuntimePayloadType>,
> >     ) -> Result<Option<Self::RuntimePayloadType>, (Option<Self::RuntimePayloadType>, Error)> {
> >         build_error!(VTABLE_DEFAULT_ERROR)
> >     }
> > }
> > 
> > This is a lot easier to read.
> It is, though there are more collbacks, that I would expect to be added at some
> point, so macro is just to avoid several code blocks that would only differ in
> function name.
> But I do see your point.
> Happy to change that if you still believe there is no much point to it.

I generally believe that for traits such as this one where end-users are
likely to look up the definition, it's much more important that it's
easy to read when you look up the source, than it being easy to write.
Therefore, I think it should not use a macro, even if there are many
methods.

Alice
