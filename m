Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C3384249
	for <driver-core@lists.linux.dev>; Sun,  5 Apr 2026 22:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775429392; cv=none; b=BMWfzJ1XjjyZYJC3WIk8DV2nzMecHyYRKxvG2K8MnpJKzMpVeZeEZaUEpQWXuNtnuWEv6N24mbfK5l3tbtd3krq2r94oUN3FL2XvH6o4j8W8RCTz8koyHuKRY5gMd3phJXeQwRJ43hvpIwn6N4FdTPCH1pq+28QUrjZhPzpYpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775429392; c=relaxed/simple;
	bh=zzMy5NtaL7AD5tUyCQ9LrBMAHeKvVDbZmilsbp1EV5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZACKpw+QokgNoQb49lKIV7Ov+l+xs84e7IcwP9pLnc/rMeb+nWPcZLArbMGZsihSz3ZSdNxiY+1ZKj7nFbmU6+F6i0WZYIi7g1vh/pFEjdln8X/U7yc6tuCX89YRkM11XBYjRMyrN3tmqPj8E/eK5jNfU2PIKi5+LVlbrJTqIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i2YBiZU7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i2YBiZU7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9bff57cb62so552438566b.2
        for <driver-core@lists.linux.dev>; Sun, 05 Apr 2026 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429389; x=1776034189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=i2YBiZU7LoZvI98AYRyASnPzYAqvefnH2uQkFxjpKYrkYEEEJpAY07ahV4P2GIHapx
         quK/oyAZWsxuh0Iei168jtq1HXYLDVr2NjZ/5fS60gzV9TeteNPxowqXrIv8Gc8CeG1a
         4h99t9f9lkVnwu33e3UQWfN3SdJ7Lpd8fH+zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429389; x=1776034189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=jMbure1iz/w1uxHKGb0S9cY0mql/79X+13U2w9iO7tr0iVT55oQpvsEwJ8icRCkhQZ
         RUV4gtjk5A5JoWvK37kRMvbyCwV72TrYARmW0dHIPf4avsqZw5RfdLh/G1yiJI49QHpk
         EchXMQ2nId/7sPEY41p59YsU3/rK9RGWnq8vA3X3+Mf/kVE892fBA3xAXblgfGPIU1Ly
         EYzxgwM0GjB4/M+z9jc3UmPGfZQDe4Oj4c5zsulj1g5QW5dUYcMVs6PwCWK6WOkUHvQq
         18ExeRDM4+nNsghJxKNhMYI2CTuFD97SknPMBHluusTQ2JUXAarmNVP+sUnvo4G8vHLp
         2KNw==
X-Forwarded-Encrypted: i=1; AJvYcCWulK9heVfx2YzCqLU7RWVf0rsEMMGrdmWiWX9Oc1TYvKLpAA0c6Tdyl1OSgDQ4NnN21H23AMCwuDjlUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUCCN0r6o6PX/3ZrGSGvFQ+uXiE+ati9vbkVgXjqBbpSr8t6ib
	HDMG62sy749RP8vN1Cc40SDd+8W5j8AVHhnqUaHnEHjfjpRv3bYrgDIA817vWY/BslVJBGPmxc5
	73iEDkEms
X-Gm-Gg: AeBDieuZuauYHdxgBDE5G78ohIlOt3OKQlnLKMD69Ou/x2JNl0h3nTgfVFKggLoTJwU
	g28SH9Ru6y8DwRK4roqqJi3FXkykqbJQJusGCVx76vvrHL5ZyCPzmcfJ651T2Pm+kkfi7Jeucbr
	ObTtk/OLJa6w1AN6xKvcGoXcURnC0ne6Uog0SqPeAgDh9Cs3qh+hAVYAyl9aZo5don89JdVk9eg
	LNRBt49Cbjq1dKDDJZaEIWuOt4JH2UgliHjh3H2sXoEepMO/lfpTZOhn0uqcPOCQTIjgDuu+gn/
	nqM/+DJqXiLb3azqMEc3/SXvlw0TMxCVfFcUrar9h7w/DGU/NboBI2g5MVVlqK/JcfSrJmbPPSp
	Ixpd0kB9afNZ2IEoWGPxBNniwtNdb2yVaz8lxq9DvK1xBrgsHHlDs+SgJ3bKtnwLIt244yxWuC6
	YvjUvQD07gCOskcdnKf8JvSDgAIDQmkT6E372MBft3WvQ3c4QW83LoUqo4/wtd/9KTz+fMo0KM
X-Received: by 2002:a17:907:d08f:b0:b9c:10c4:e708 with SMTP id a640c23a62f3a-b9c67a34a9dmr464718066b.42.1775429388602;
        Sun, 05 Apr 2026 15:49:48 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec6esm419174166b.16.2026.04.05.15.49.48
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:49:48 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so4407020a12.3
        for <driver-core@lists.linux.dev>; Sun, 05 Apr 2026 15:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj7+WnA+ZZM8ulnJr1cXIw+guEn8JQqHpbKL7fhYnS/ABLbgi+qETrsUa21fOkDHT+2hSfkC1f5YNVqg==@lists.linux.dev
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Apr 4, 2026 at 10:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> > NOTE: one potentially "controversial" choice I made in some patches
> > was to always reserve a flag ID even if a flag is only used under
> > certain CONFIG_ settings. This is a change from how things were
> > before. Keeping the numbering consistent and allowing easy
> > compile-testing of both CONFIG settings seemed worth it, especially
> > since it won't take up any extra space until we've added a lot more
> > flags.
>
> Nah, this is fine, I don't see any problems with this as the original
> code kind of was doing the same thing with the "hole" in the structure
> if those options were not enabled.
>
> > I only marked the first patch as a "Fix" since it is the only one
> > fixing observed problems. Other patches could be considered fixes too
> > if folks want.
> >
> > I tested the first patch in the series backported to kernel 6.6 on the
> > Pixel phone that was experiencing the race. I added extra printouts to
> > make sure that the problem was hitting / addressed. The rest of the
> > patches are tested with allmodconfig with arm32, arm64, ppc, and
> > x86. I boot tested on an arm64 Chromebook running mainline.
>
> I'm guessing your tests passed?  :)

Yup, all the tests that I've run have passed. I also threw in an
"allnoconfig" compile test just for good measure.


> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Thanks. As per the other thread, I'm happy if you or Danilo want to
apply it, and I'm happy if you want to make minor fixups when
applying.

When I see the patches applied, I'll send a followup patch to address
the "needs to be undefined" comment, unless Danilo makes that change
himself when applying.

-Doug
