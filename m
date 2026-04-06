Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409D3932F1
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775501975; cv=none; b=LwUT55FPkrZbGJkrz3J//ln9ykwAMFMFYOLrEd4Xut+TGG6CwDoCHd4ypexHJH/q+SMmrgfJ/Ui5S25kGgVFRQ2xwEwFIke8QCPoAd2VkB7tKq8kzJYGOJ9K9QjoVlN7vTA3eR3iBhaAqKg0rcxczgfEP1GJJwbQHqAfc1g2MbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775501975; c=relaxed/simple;
	bh=MP5XJk9iCIod9KfOfPbBtryirQRyDqiT9ZotrAUZfnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvW7O9Af7ft5Bnc+HnlqLpxA3zk+xKmfeym3L3U03HZo36L/2TRYMCk4z373MH4LQtHgW+iD9cJhSQ2DO12Dlyg/6SYakqv6sZhTmFDpTqn7Mym3++mkth4ZOLdGM4Xnv7sAZhFpri/1MEt494JleOAj6hSjmgRzOYLFmWfH2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=caz+II1O; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="caz+II1O"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c9d03524cso275328966b.3
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775501970; x=1776106770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca80400b16hxnkq4OIBWd5Qd7l94fMZC2WBMvwuhtRk=;
        b=caz+II1OFPjLSeszpjoy+UAPi0rRw6RpWeSx9YLDk/3JFUdQgFFwAXLeEdW/NWRWd+
         JN8YYKR64MLO7s8R9NTpHPZjaxw81+BqenVhC0NKT5hgrp+wADwWaMfSVQqyHMX+ipRe
         1chH12VDu+PRiJatpqbWTRopQsUOfYo62eF+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501970; x=1776106770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ca80400b16hxnkq4OIBWd5Qd7l94fMZC2WBMvwuhtRk=;
        b=MFB5nR1ynsNonbURf+l+ZfPdOqAkriyOGwiJMRiJvgNWRTVv423RnaWuRBOJrZwA+O
         nsML0X/uhv3fsW+OVew6/EijtVEKn9WkEtJlxf4Jz4tppaUYKUvZLVYIKTmLC+QYBfZw
         qrS/4lMkReqLAHKu5DhgH3JZsC7klh4GbQiV8DPz8vd5o2Lacx58+Fi7xF4u3e00PMqD
         b+JVJymathB+dgRDbMo/eD5Y2B76853XpcxIh1pN4NhPxSg43o9VsYgf9jGevT4ZkcIS
         rEJLM+OsYNKdKe0qxzmQPFLY0TLJUa2iY3vkHxeLhOjq67Cf2Pd1fYlrKQWZEOGwU2Ui
         0/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUFcgpM1uxFR+m3BaL2xci2tc8IER8bBxjkApxvPFZWPXr3V5CyblussswXUFUaYp8FzfoPjot1I1uepQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy61+GW63Ydks2U5nOeBh2SFyJjbXWoKjytc9HgSJtuTe+im6Zg
	F715uMnAZIsXHvkNCq6lcI4ztwpBQo02rbO0qYzmTbsRK2dF7s/gbAbTZvUHPH54lOWyACcUDNo
	Qp2a4Se2H
X-Gm-Gg: AeBDiesO5CF2LNvKP7DjC0H0HYZ9UTp9MYqKezpDKefFVDXNgekmyq+UvIPLxk5xQh7
	MuaPal+QskkjrcI8sxEt65KI4yEhq78DiSObtTrC04OrRjlVauAdrE9AV1qXBS4k/Ln2VKYp0jb
	yTp94ottNwDP3D2ClH7+yMNcT29gfnun5udCge6/BElNsyFNaxPTNitVc/02PDj3elRGuszkRns
	aqgjs1IWOV+lIBsQHOSuB66mV9cGxWoyLUwQEsf2mfWSJXbHNG9mG5yYQWE1PspGUua64BltgmU
	nX9VSobEYr7z5Jal+2yE2F2qKrXdS2NrunaYCinPNbHF9WKWSwusgK77XozHerzRQNuemCEfBl/
	s1VHtNOGjK8gxvS9I2XNSZwd2UTH8spwaTiSlnk2A3R5DrTENgFC0B9VKVh1XNr4WQPT+P57tA8
	o22imQthstMI3/Te001wEwrQN4QVFw2U8/c/ezcIxQic5GCRsE/XU42ZWq/PPL27CI7+0JCRUo
X-Received: by 2002:a17:907:d1b:b0:b9c:b475:90ff with SMTP id a640c23a62f3a-b9cb475965cmr369881266b.30.1775501969971;
        Mon, 06 Apr 2026 11:59:29 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f2bsm469993666b.35.2026.04.06.11.59.28
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 11:59:28 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso2324142f8f.3
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 11:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8pm2cIk1jDFpQ8uFtwAu9O3SZoqUQS8WS0WZQlU40Uj7WCwMnDx9yDzZJcoLYXAYR3GjXGcAJKGUnTA==@lists.linux.dev
X-Received: by 2002:a05:6000:250f:b0:43c:ea2d:9c7a with SMTP id
 ffacd0b85a97d-43d292ff4f1mr22125257f8f.49.1775501967839; Mon, 06 Apr 2026
 11:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <873418d2fz.wl-maz@kernel.org> <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>
 <871pgscaj0.wl-maz@kernel.org> <DHM80WWSJ2XX.Q2X67PU4K1KS@kernel.org>
 <87zf3gauid.wl-maz@kernel.org> <DHM9WIABIULA.VZ9HOKU62SC9@kernel.org>
In-Reply-To: <DHM9WIABIULA.VZ9HOKU62SC9@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Apr 2026 11:59:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcphmjoBLisoS+LjD+vq-dEaTvnKFstC_E42ETt4524w@mail.gmail.com>
X-Gm-Features: AQROBzDBBdWTpyX5KojtEtlJPvrjnYkYQBCqXgX8tzjjFkAPK1Blcxy5_IzuMmQ
Message-ID: <CAD=FV=XcphmjoBLisoS+LjD+vq-dEaTvnKFstC_E42ETt4524w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's ready
To: Danilo Krummrich <dakr@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Saravana Kannan <saravanak@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 6, 2026 at 11:11=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Apr 6, 2026 at 7:06 PM CEST, Marc Zyngier wrote:
> > On Mon, 06 Apr 2026 17:43:22 +0100,
> > "Danilo Krummrich" <dakr@kernel.org> wrote:
> >>
> >> On Mon Apr 6, 2026 at 6:34 PM CEST, Marc Zyngier wrote:
> >> > On Mon, 06 Apr 2026 15:41:08 +0100,
> >> > Doug Anderson <dianders@chromium.org> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> On Sun, Apr 5, 2026 at 11:32=E2=80=AFPM Marc Zyngier <maz@kernel.or=
g> wrote:
> >> >> >
> >> >> > > +      * blocked those attempts. Now that all of the above init=
ialization has
> >> >> > > +      * happened, unblock probe. If probe happens through anot=
her thread
> >> >> > > +      * after this point but before bus_probe_device() runs th=
en it's fine.
> >> >> > > +      * bus_probe_device() -> device_initial_probe() -> __devi=
ce_attach()
> >> >> > > +      * will notice (under device_lock) that the device is alr=
eady bound.
> >> >> > > +      */
> >> >> > > +     dev_set_ready_to_probe(dev);
> >> >> >
> >> >> > I think this lacks some ordering properties that we should be all=
owed
> >> >> > to rely on. In this case, the 'ready_to_probe' flag being set sho=
uld
> >> >> > that all of the data structures are observable by another CPU.
> >> >> >
> >> >> > Unfortunately, this doesn't seem to be the case, see below.
> >> >>
> >> >> I agree. I think Danilo was proposing fixing this by just doing:
> >> >>
> >> >> device_lock(dev);
> >> >> dev_set_ready_to_probe(dev);
> >> >> device_unlock(dev);
> >> >>
> >> >> While that's a bit of an overkill, it also works I think. Do folks
> >> >> have a preference for what they'd like to see in v5?
> >> >
> >> > It would work, but I find the construct rather obscure, and it impli=
es
> >> > that there is a similar lock taken on the read path. Looking at the
> >> > code for a couple of minutes doesn't lead to an immediate clue that
> >> > such lock is indeed taken on all read paths.
> >>
> >> Why do you think this is obscure?
> >
> > Because you're not using the lock to protect any data. You're using
> > the lock for its release effect. Yes, it works. But the combination of
> > atomics *and* locking is just odd. You normally pick one model or the
> > other, not a combination of both.
>
> Yeah, the choice of bitops was purely because previously (in v2) this was=
 a C
> bitfield member in struct device protected with the device lock. But, not=
 all of
> the bitfield members were protected by the same lock or protected by a lo=
ck at
> all, which would have made this racy with the other bitfield members. I.e=
. the
> choice of bitops was independent; see also [2] for context.
>
> [2] https://lore.kernel.org/driver-core/DHH1PD0ASG8H.1K3KG9L658DYN@kernel=
.org/

I've changed the snippet in the commit description to now justify the
use of bitops like this:

Instead of adding another flag to the bitfields already in "struct
device", instead add a new "flags" field and use that. This allows us
to freely change the bit from different thread without worrying about
corrupting nearby bits (and means threads changing other bit won't
corrupt us).


> >> As I mentioned in [1], the whole purpose of
> >> dev_set_ready_to_probe() is to protect against a concurrent probe() at=
tempt of
> >> driver_attach() in __driver_probe_device(), while __driver_probe_devic=
e() is
> >> protected by the device lock is by design.
> >>
> >> [1] https://lore.kernel.org/driver-core/DHM5TCBT6GDE.EFG3IPRP99G7@kern=
el.org/
> >
> > I don't have much skin in this game, and you seem to have strong
> > opinions about how these things are supposed to work. So whatever
> > floats your boat, as long as it is correct.
>
> Not overly, it's more about calling out the fact that probe() paths are
> serialized through the device lock by design, so it seems natural to prot=
ect
> dev_set_ready_to_probe() with the device lock.
>
> The fact that dev_set_ready_to_probe() uses a bitop under the hood is an
> implementation detail, i.e. it could also be an independent boolean.
>
> That said, as I caught the issue in [3], I also mentioned the option of a=
n
> explicit memory barrier in device_add() and __driver_probe_device(). I.e.=
 I'm
> not entirely against it, but I think the device lock is a bit cleaner.
>
> [3] https://lore.kernel.org/driver-core/DHLITCTY913U.J59JSQOVL0NH@kernel.=
org/

I've got the series all prepped and it sounds as if the alignment is
on using device_lock(). I'll give it a few more hours in case there
are additional responses, then send a v5. ;-)

-Doug
