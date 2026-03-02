Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29935A38C
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449504; cv=pass; b=EqB27eghaQ81C2VX1URqIZx+D/ErJ/QDDa+6aFTAVx7f+TYWwBi3Hx9tsWAyzZ6VHDu2dQhcnyVLJ+iYL41MWV1DLGXu7W3fPint1k7PV7P4qTFzBRoYBdVNzpJ3DZi3EYynhx2wi/nqTHK7odl0ZqnZksiKBtOnkM8yPiYH6aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449504; c=relaxed/simple;
	bh=MNN0MxQutkVAICnu21/rtSu7MZP/rEU4Ta6qHPWAsoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhk3FrB2JSky8A6g/EW6gIe3X7WQOK+2zJLf0wFxCgZs8Z5ZTfUdiCKrRVoBUIQ8lEBiVnsB8p5fRwNXwHGEBEDo7OZfeDp2eAm9q5HvAMSBMl9VMN/OIh9FDP65M9NubaSkoVWMm4lFvzrVuIWQ6qLuNgcEb4JK32Um5AWA+gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSFQxdKl; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSFQxdKl"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d4cb7e10efso5289145a34.0
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449502; cv=none;
        d=google.com; s=arc-20240605;
        b=GaW8A+0OdsZPYmTBTgLUkj7XPOmOL0gxBx4ngLVaDRML9IFBFsi6k7nhYQaHPmYJ7n
         YGWZAa5piEAKRmG2zXUB74n7WZ3+lP6zkXPZC17U0/B0dDb9MbCLuAOrZvzwmi5+c5ql
         mnh62tI6a9T5+E8hWv/s9u3+xvNKnSjfUrTCYkxQSx0J4S4cXUP0GsbriFKsVLMMNtO+
         qsjjGrGcZPMGtBPv90EgA+UY2jhEv2/qOkZq/0xx6mIuOkZW79qXTFmbMDo5dW8hpRvE
         7Z9YiBupWCctiBtfpx7joVVZNeIbIiqaRwGao1qtRlMJBWgxK3n1nrx4GBZ0MF2Z6SnA
         kPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        fh=JZ7g8DbMYeGRGP5KhY/Pc9RRuRb713Y9QbEASt5kVMQ=;
        b=BeSrsIrd+XMZegIteDlqQ1mg0tjuqGCzOwOV4kDwiKj5M8HSd3MQb53S08A/iskiCV
         y53I6FzmT4/RFRXAgUPOJsk51v1XTxcAIf0ufno95/oUs1WpGxyk2UrL1E30Jc+qgo4X
         CSCTF6WOIKpVJERDqsoOTdI8/wRYDsu69xO4q9zV/vhsjYNVrm1o3k7QlCtJfGGvDerI
         5w9ZChwe+dXmwjQR8i1XAzC1KLJOCRfuA3C7AiA/n9/Rcjf+/36akhkm/UOxj++Krcww
         tJPdNOaOZzex3Szn5LuryIyv991IfderJJA0JmS9No+23uZNb83sk9tc1roFYJlxACer
         5Zew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449502; x=1773054302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=SSFQxdKlyP+tupXysWuH62JSo26hNzD29sUfwlb4qLh56nB7g48Scq0HQlJ1JC+LeY
         /SCSpqXF4Un0lER1up6kRwLhtYgt1UrS62zriRLb9zdGtYp2o6qzcXKK8uNwuVskYbgm
         GRIklh0gGEfkGDEdeQ4moGsMexFbxbDpQ3r694Bhv0jt6WzcgVh32H5J0icXs0RMsCbQ
         AZqm1xSzOHL4xWe3sRfpHcbDaAmEf6mhe2oRJRTczWzQXGgsMTIfo90cKmeTOffL3xCB
         Bbj1s4EfSBZEeg5fO0fdUX3XRMItjhDd00Czk5X71761v+tDIGJOV7rzGQlfl3xRFkpZ
         9iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449502; x=1773054302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=uXMPtvkl3DlCTncApvfRDNaEfxORrPp3kp6Yj+HevzD0k7eIEgIGmxbR77ood/CkZc
         VT82pvDcJ9zFB2nDJEFGsdvmVqyeLLEeMG5UqYqmdfAAgddzJeOfWnkIBJ2O6D1EeITo
         Z6M93KZDjT7gtQ26XjIyGAiXDxgVXCxKexCQ/7782hkfEmmjez9vhrnvjgDEgLsnHctq
         tV4huPen85kiKrnFG0n2p03xfaQTSK6qVpO1BOsPBpNEKi5j6HWWL3DiWrwpxXFTafpm
         qn8bpSElCtUb/ZWhJRtCWnvS5aRsJXabHvF+VMRqJGOczapA0XOOPgaJsJr9L46INcu1
         orMw==
X-Forwarded-Encrypted: i=1; AJvYcCXv7NuR9JisuejZJ/+N+r/nseBoLP4nTfVYq8kv23FoTWxsjKN7zhrlCDEKn6C6/5GcTQG/ArcYR7CBKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOcpW84B0py2MmE0m1TkMz5o4o20ufDj97KktCr05mr7OjWl/I
	/pnRRsCvePGsY0itftIXH8wJLEdeV6ujbkqo/VPuPgxwibIC8fcKNUlosjxsDAF3t7oIogaDhpP
	N/+viNyyJCYiV4a/w7KaK3SgBXJ40ITM=
X-Gm-Gg: ATEYQzzSbVoC4Xm2g2YLVvoUsQ+bvc/e8LNJIHiotjyQpuKQxYt6XdFo+3E9X9mxgii
	b3G4gisZeegjcVy5s+y7lVz6M+FLO1bPuTkfNcx8BwfyCY2K57lSeJeWuyfQK8NwLn4/q7Ear/o
	F89iyQ87775LnYwKFHkOUN9uO2rVIaFk8sfczOlKE4f8tPzu//Ds4Z22vxbyRK5JkLP1jiTac/B
	9syP5lgxb0Ya1x2fsql3otkMjMRFG/LQtmfzt/s15SLvtNEfLK2cvpgilIj9YnJVZfNq3THD7Sm
	E8fd0s/uVcwkLRiWDEkvz0IvdVR5uyT3fOeJbgu2td/pqR+t6n8miaNqfxXTPrhQQ+ynv8ctSaw
	=
X-Received: by 2002:a05:6870:ad08:b0:3e9:1643:5977 with SMTP id
 586e51a60fabf-41626e0fc5fmr6099442fac.18.1772449502199; Mon, 02 Mar 2026
 03:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com> <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
In-Reply-To: <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 19:04:51 +0800
X-Gm-Features: AaiRm52arKfwi8YCxjpEdTXQmweggZZESyxe8RNIzUhwuktCE_TgfQAoQ172OQc
Message-ID: <CALbr=LZ6Qu+oi0XiTZO4u+H2Jsv51jWazmK7xPt5EgK9DOy-hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 9:36 AM CET, Gui-Dong Han wrote:
> > Applying the following diff fixes the KASAN issue. It was just a minor =
bug.
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index a8cb90577d10..09b98f02f559 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
> >         devres_release_all(dev);
> >
> >         kfree(dev->dma_range_map);
> > +       kfree(dev->driver_override.name);
> >
> >         if (dev->release)
> >                 dev->release(dev);
> > @@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
> >         else
> >                 WARN(1, KERN_ERR "Device '%s' does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/core-api/kobject.rst.\n",
> >                         dev_name(dev));
> > -       kfree(dev->driver_override.name);
> >         kfree(p);
> >  }
>
> Yes, we must not access dev after the release callbacks has been called; =
no idea
> how this kfree() ended up below. Thanks for catching!
>
> > With this applied, along with the PCI driver diff from the WIP patch,
> > the issue is resolved. I tested this on PCI and both PoCs no longer
> > trigger KASAN. I also ran with other debug options enabled (lockdep,
> > sleep inside atomic, etc.) and hit no warnings.
> >
> > I was working on a similar patch recently, but your version is better.
> > Not returning the string directly provides better encapsulation and
> > makes the API much harder to misuse.
>
> Ah, right, I remember you mentioned that! If you want I can add your
> Co-developed-by: to this patch to account for your work.

That would be great, yes please. Thank you!

And thanks for all your hard work on this patch series, it's a really
solid improvement.
