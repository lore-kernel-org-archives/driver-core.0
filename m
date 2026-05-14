Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D83DEAEC
	for <driver-core@lists.linux.dev>; Thu, 14 May 2026 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765725; cv=pass; b=bRzM33HEAldCnINAG+4BaPcsKUW0noeHnRq13BzFlW3iIjdGcVhGmrGGxVr40jUdR8e63eD8aS/D1Kw/L8e8i0uP7oQ7lIEy7+8pYqulOO/2riokGePYmklbQs0KxY5mHBh9D3+Kgo1uryVOdqZQT+AQjfLbBe/YBZSRmp77WSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765725; c=relaxed/simple;
	bh=jfTb2qsWK506XAoCkoP52xxUlxrTeM08aZ0+VWQpZ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rodtp4mOpCqnQq9vurA4IYtdTacrReHMMyWAp0IxzochA+Kxgkc1DApqQydpXIDeuVpm3QUi1OQgam0V/1q+AY5yLjHK6nTYoH1crULtRkvhG6SyCeWTrBw9lFFB+9xCy8WGakknkNVbum+uQ10wWQD56fek+HPcOTnPA4WSuJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=put0VAFr; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="put0VAFr"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-439795d2310so122589fac.3
        for <driver-core@lists.linux.dev>; Thu, 14 May 2026 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778765721; cv=none;
        d=google.com; s=arc-20240605;
        b=i0Uh/zy9hd7YliYU0xLp/4QPlS+a15ybgosjE/uQItyTH9o+8JLpDeuLWPYB0KJvh0
         b9m+RcjeZRZ5VV3kp5Xk+RaWsMckF4ALz5BTspJ5hAp6gdpSO6UzVHcz4f3+8mi2SD/K
         BvvQRQ8FnBCno47gIj5oaTiM1/8gOsRUPE49QuF7BjUSnGlEvLiEp6Ou6nhhzpiehygS
         gR/Ayo/xFXSGLRdNvoXMmdq6ZZSYDpv0b94MZoQeuG8XFXC6EOHiWBjbfs1nMZ2CUoho
         XvraP/NJ2O/h7NjpD6Q8WNI2L/5LxXmHoCqFnDkBE8BS40MG0HAkz+SwafPacO4rYmig
         escg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        fh=yU2t2qfZ5SGSeVe0RbkrWkH7exkciBjPuaraW4KAxnQ=;
        b=VtshqwPQVsxqlJoGK0hvM84SeTk8zDfZ9oUtSTecCU1L7iullIi6dmF6wltReXrZWZ
         p2gU5mhUbWgsktyJFILb9oLec6AB7BO7mCyOjGjS2z3fB0hPnA2LgTXvu2hFD4uDbxuc
         yQiNYtRGJD7jSVp+6eoGKPqpYaAD/ZP79/k36WzXAnO575AWoFRcHdKJw83qTg7a1E9C
         2smFaw3+YFpqLf3zIi1gChjTjns0JH7zfthzSBLYJb2ZicQ2FGt5G5TkBWfvsur8WuFm
         uQWZtYxvP2tmLWE4xJTS/mz6kyypgBMpRmZLdMVFaztXQqrreEGJcRhyGDED4pBvE1rE
         8j/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778765721; x=1779370521; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        b=put0VAFrxcSg6JYlnHThn8ypnu9fpAPsr1YJzpqvS5YNlBmalJBwYBlwWufSNNT2lp
         pmnKPSDehVKazkO182q+XqphluZQk/FN5afqcF6ZkIvlntvjjxMDFYXdc5Ld6D7eIzPG
         64OiGdOpd4ph6JrMQ6ru3QpADn92kOppZf1k1Wx5uDsuqSQH18QYIPxsDZcQm0kX7vzA
         hHI2viydJXbcHJfxxQ8wkvguzuBwoSpzlyP08J8xAaiWzrHaay9LMxsZJ+RSQn4TL9n/
         aa4s2K9bGJcNb0+IJyCz8fwz2Nr5zR/LVcdZCneyGKUhFf9klMIOXqeILxwXSC7If0gO
         ypqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765721; x=1779370521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        b=GfUYt3MhbxGpNCWBHIhja3qz2Dx1MD9OBbfLp8txVT9KQYLySs9bs9uZd6teDDjrfv
         OR8BPZugFzfg1WMjicDWmKXtKFIIS+1dXq/YWZ54DrSYQFbAnRkQ5fhVf/vNLBIR6QIE
         5AQNcsjuPz9mDrEFitutyM5SM8/qAO72NlE2r6+OkFUjx5YlCw51Lun4GswT8TnZJXNC
         y9wJ5nQ6sIOydXhVc8obi/M0dfyVf2EbaFBbIioTIWrNbVSycFz4YmOkpCUsKjz3ixqz
         SmnOMhXfB/tA8u/hyqOyEGC9H/GaPHz/FylNctiNxc4lssrYt0lDaCC5aYggNFObvwM5
         zIsg==
X-Forwarded-Encrypted: i=1; AFNElJ/VzXdpD8pjFSHnAye60rzew2Xewfx0gGPszN+AKx/AHRAurxQ0fCMC9WRPNItXrzeykTJ0BvsSc6buOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym46B4bzc0xlSyH4aoCY0Qz97c7G3YhOvbmx0rqJvGFcUv4LnX
	P4y4RUd/mcKQT+6W9tGlgirbhZ5dqnExzFgY0HTFZRvYn5iUw44tcRJuwasrapblgtBsHLoy0q8
	73aVEG9SGOYEKYSgvfh2El44GP6D+3BY=
X-Gm-Gg: Acq92OHMAtLx4RGFgKzBlQYmox5SCdoiQVO4BBOqUP0KhyfEUDFV11sKzWaeQZ2IroJ
	uGucnA1cyC7jeBgPXPBF64hm9wIaitSuNdbvnxb23nZU1vYc93rUWq2T1fFjbjE+mAx95vO7aTB
	dqfBHMLT8K3EBn4zy4H0A6+jHpalUf5x8pOzVmJvaia0u6Qa+E/I8uopr7amfaeSjlNP888U42j
	VHKFkq5xk/bH1h1vBsdTLr5ujYHwWOLZEZbwq6VmXXVuRDXhWlkCcWP4tuJT3ilKcSU0NVNc/27
	Ffig7vST9QOz9a1FZ4s=
X-Received: by 2002:a05:6808:3096:b0:479:fca7:4655 with SMTP id
 5614622812f47-482b2d709a4mr2750387b6e.6.1778765720618; Thu, 14 May 2026
 06:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
In-Reply-To: <2026051443-exuberant-important-534f@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Thu, 14 May 2026 21:35:08 +0800
X-Gm-Features: AVHnY4JpJ8WSGm574XlaZCuvUqTaRt41BFmoX4Xd01QZiwb3yvnh1k7vHB-QaDk
Message-ID: <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > From: Jianlin Lv <iecedge@gmail.com>
> >
> > Device drivers that use asynchronous probing can cause non-deterministi=
c
> > device ordering and naming across reboots. A typical example is storage
> > drivers (like sd/nvme): asynchronous probing can lead to inconsistent d=
isk
> > logical names after reboot. In scenarios where disk naming consistency =
is
> > critical, the probe type should be set to synchronous.
> >
> > This patch introduces a driver_probe kernel parameter that overrides an=
y
> > driver's hard-coded probe type settings and allows runtime control with=
out
> > requiring kernel recompilation:
> >
> >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific drivers =
sync
> >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async except =
usb
> >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drivers synch=
ronous
> >
> > The implementation replaces the limited driver_async_probe parameter wi=
th
> > a more flexible interface that can force either synchronous or asynchro=
nous
> > probing as needed.
> >
> > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> >  2 files changed, 74 insertions(+), 24 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index 4d0f545fb3ec..b43a8bd20356 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1377,12 +1377,27 @@ Kernel parameters
> >                       it becomes active and is searched during signatur=
e
> >                       verification.
> >
> > -     driver_async_probe=3D  [KNL]
> > -                     List of driver names to be probed asynchronously.=
 *
> > -                     matches with all driver names. If * is specified,=
 the
> > -                     rest of the listed driver names are those that wi=
ll NOT
> > -                     match the *.
> > -                     Format: <driver_name1>,<driver_name2>...
>
> You can not remove an existing user/kernel api, sorry, that is not
> allowed as you just broke all systems that were relying on this :(
>
Could you provide more suggestions on how to improve this patch?
If extend driver_async_probe to implement a 'force synchronous probe'
feature, that doesn=E2=80=99t really match the name driver_async_probe and
may feel ambiguous.
If  add a new 'driver_probe' parameter while keeping driver_async_probe,
then their functionality would partially overlap.

Regards,
Jianlin

> thanks,
>
> greg k-h
