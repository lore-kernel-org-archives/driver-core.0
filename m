Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E338B13A
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148730; cv=none; b=gyc5b1PNRMzZmBu4a6DLwjvx1ck6QwLiBh0BR6p+H5lm9+plI8+26vEBfN+blMbc0lvOKKZSJNuQvTEXyzHkWrS/kwtLRlNadIM8ZEEcZlYt37yRIiZ1P4ZPyXN3zyP/+yTR3+1Ea4r6cn42dhE8d15hFIcrLSteXD2k1K9fvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148730; c=relaxed/simple;
	bh=eGRuEVGcdNj7wxl6wZUUR3W8NIIw4W7vFYo6c4ztUvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VV3zclZ/DO52oYydw8uZJ7ibPSixyZwDZKULeUygpIq69pCvzHiCKWcdR4u0ExYO2TAVTltx2TUn3ZruyIr8rH6vQ6AE8QkEgXDNipsrbtvjibXmsh5dNxN4nrmG7l0xJsdT/Ld31K/wwAIezJAsx+PIX0GyCt0AOdXtmlb6hO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGSnp0Wy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGSnp0Wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CA7C19425
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148729;
	bh=eGRuEVGcdNj7wxl6wZUUR3W8NIIw4W7vFYo6c4ztUvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oGSnp0WyPIZW78fOa4bjSZJAPbqbhY3Ru0aUTb8Cj3/xxcZTFKZ9doRR83nMZZrXQ
	 B51K72A54gcv2+eR5SCEDoaa/sVA0Mm5JzSG2RaPwCTm6t+axbFh+5NPdXhTiwHLJ3
	 7v5FPGAH8LcgK4e8NejXwgX6VFJKle6FtNGdGd5MwpGyHa1Rt51ysDmXxrY3aSvIH5
	 J02PP4GFztMJ/CBcvQ96gstW4raNrs91jgUocPq+1TR+XnW6NtxeJZlwDbT+6HdrfC
	 z4cRJgXdud2TL38lg9wkBHLOdcL6/p3ct1XBephVYGgratN0au2Xzz0ND+Zr9zvqJo
	 RNU5qkGR5Z1lA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12f6871b2so7540453e87.1
        for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 06:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUk4XdpzcQR7Fnu8rgEHrZ+ghiSgka+rIMkN1yq5+t3XcKGNTvyb/iQxqo+oycWjnsUxMJVAzUVNRZWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIDQ77qMPibDDqM9Pq3CyvF8+XX4qcQ+r/fQeMRmqdqpDIIFB3
	2oyngGpv2COZ2da/5mDL3HOl2DJhSjBK2dLW+1e1A5+KpSPDQtP1h+rtiq88MOnWa3zTUvsEuSZ
	TliEg86o0I1NK5sMEfsoQ0M2KiHXLTalJKW86gkHZ4Q==
X-Received: by 2002:a05:6512:63d0:20b0:5a1:2f9e:ec8e with SMTP id
 2adb3069b0e04-5a13cac3addmr3697730e87.14.1773148728567; Tue, 10 Mar 2026
 06:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh> <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com> <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com> <2026031034-blazer-equal-871e@gregkh>
In-Reply-To: <2026031034-blazer-equal-871e@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 14:18:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>
X-Gm-Features: AaiRm50m77pDvIc2yTLCTYPS259U2qKZk2jXd4qMLpLte1PdySCZSCD0cVcOlJc
Message-ID: <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 1:43=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 01:29:53PM +0100, Bartosz Golaszewski wrote:
> > On a completely unrelated note though - Greg: I think this patch could
> > still be considered because we now have quite a lot of functionality
> > put into software nodes and already have some auxiliary devices that
> > use software nodes as a source of device properties/config using the
> > same API as platform devices (fwnode). I think faux devices could also
> > profit from it and not necessairly use custom struct. If that sounds
> > good to you, I may convert one or two faux devices and send a series
> > with actual users of this.
>
> I don't understand why a device that has a fwnode would ever be a "faux"
> device?  Why wouldn't that just be a normal platform device?
>
> faux devices were created to be not platform devices, to take away the
> abuse where platform devices were being used because the api was simple
> and people wanted a device in the tree somewhere, but there was not
> actually any backing platform device present.
>
> So the use of a fwnode here feels very odd to me, what am I missing?
>

A firmware node can be a dynamic software node created just for that
faux device to pass to it its configuration instead of using a custom
platform data structure.

Bart
