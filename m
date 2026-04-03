Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE2280A51
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230475; cv=none; b=pNV9+lImVrEWLRbaEvv3o3ubOEhj2TYoeqXK79uQvwXte4fptclDzHGfA1jaIj/fAHCvagPDYO5uU4iRx3qMrj/CUE4IEodNp/bpmBhpPUs6rT6Mi+R6TRstnmyF7B3cnBGPSxnEBuU7zv+9XJRQkjaEU/23pALFxwnFDFZOjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230475; c=relaxed/simple;
	bh=pnTONFLO++i9o+h4aHJcqHOAz1eTweHpgY38cxWoQ64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+ym/9J9/VHd59L6Su2Bi19DcIloJdPZm2iw6qL3Nm9m7Qw7ajBo3jxRhOEXBCgqMAaSA2VBZeb+Bx8GgXhu9hwps0rBg6B01/PaFCNzJDetannmYp2KMk84vLKNnMtxsT6y97pq2/gTEBTSLa47U3O3m7uSxKfE3Wiek6Uc91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nN3wpT97; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nN3wpT97"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bb66db39dso3195051a12.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775230472; x=1775835272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7re9TIHgFQF++cPTDonCe06+mmw8C8DISy7Otb13OfU=;
        b=nN3wpT97w2r+Nn4g9n4EGYdJWvACy1U30hr63d7BzQxNI9fTD8Ka0GHfDU0hiHuYTA
         928Vwfcy60Ybv0JSfdHGVNJhENYtKPXjAoRfpoeQqpQj7XwN+1u6PpjwNIEJElPpi7+V
         wJizGjGIjvpX0EVvSF334KGP/W7F4C00x9x1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230472; x=1775835272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7re9TIHgFQF++cPTDonCe06+mmw8C8DISy7Otb13OfU=;
        b=SWWAU6l/PH8sXOwi0l9EisBIG1+RHjXAaKe0ndyrib/MtjcZVnC5os7Za7qSDSjtUy
         k0ud/LskymnDU6IJCdbIJk4uDkUGe41J8SQ5YjUvjcISbX4VibPnVhpsyFaigmAtnAZi
         MlAJirUVCyNBH5VKEN09o14rnG5f6ieF60UCYHkWjDY8keYIlCEoawzGAru3zpHtPBBV
         bCmu+Uzt9jlQhmh2DlayZHfjAXOcK4C1OMWsdm/YB4gJaBVYMqdmWkCbDp76thCyiJPV
         COUtgCLOdQCi4NFIILi6eZYeS6jicn/yFWBTMpx+AUzrIvVlGmXh1QEuiEu+hOy0rbcv
         asrA==
X-Forwarded-Encrypted: i=1; AJvYcCVr3EQHd0tIY0Y1dOLzLvWJi0u21wDm0gXUrAvkAmqY+DrhAxJtthEWM09QOspy1Rdz1JRGT5K5GT8TUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpAm7Zg/Lw6Pb2YxRKvlchE3H65Ef6iShQaMlBQCmprNuA1Ff4
	mWlVoglRguI4l9KcOJ/2ILykznAICQysv+0myJojOsYh1CuUQf1Pv2WQ95si/wKwQBLvYkZvFAJ
	/OQV4fA==
X-Gm-Gg: AeBDieusTRCfgCea6wAIzrtWuYL6Che76ixWRntlJbcJqAG6rAC/ZMZd8unw7v/HmOd
	tDYWO8vFtYLO8D9/myeATGPmMS6NWVVdl8nrKzck2KxrUDQ45vIFBAlPlrotLrBMHAuuWvz1KbW
	5DXY6oqmJn6rdgypgYQ8+xtibbzp3Q59kiznkspIA13siqta7FZKyFNkDZ8g7krvGFpGZo/tqNc
	oRM4tVPWrgWYEwdGijARd1OmdKMS9h1Y9nWJEXF7k3LobpUnP135AtvQ4xn7cHbI6m/VseSIwy5
	pULsHD4AFlf4yu8Nh+ornWabMDqfxF4e9V+hcS7xm+C7Ta57Y38JhaxqG35Y9c0XiKGAPqSwvnM
	P/WzmgwgU2YJUzgC90x7ReEUcVQhsnjt52z6CNitOK0Buk3HOL5JFNvvtNdkgbvzZld3x9u0Yc5
	PwgAq/Sl8JLbUozUTOAQmJDbT2AxLkkwWuyczeLdumtao5Df6HGQ0CNNJLoMmePGb0Z82w/0E2
X-Received: by 2002:a05:6402:2750:b0:663:71dc:127e with SMTP id 4fb4d7f45d1cf-66e3f70a464mr1338495a12.13.1775230472559;
        Fri, 03 Apr 2026 08:34:32 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034c63ebsm1662356a12.26.2026.04.03.08.34.32
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 08:34:32 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso1985737f8f.2
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 08:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgvBAYzUujAi9lh4AMlA00ZBu6se0h28DAR8s1pkspxfB4/hfWE+sj+qHZjg1N7LcsT54gm5mE05xe0w==@lists.linux.dev
X-Received: by 2002:a05:6000:2485:b0:43d:121c:37d9 with SMTP id
 ffacd0b85a97d-43d29268a8dmr5512092f8f.1.1775230471524; Fri, 03 Apr 2026
 08:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403005005.30424-1-dianders@chromium.org> <20260402174925.v3.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026040319-seventeen-humorless-5541@gregkh>
In-Reply-To: <2026040319-seventeen-humorless-5541@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Apr 2026 08:34:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmnWjVzQcr13GmRKX3cvRortA==5C8TH5D-jRBe0VBqw@mail.gmail.com>
X-Gm-Features: AQROBzBI3qbsutVdmrxjY8uO9-3m7vo2V5fLwzycPlllzj8W2kmat6R3FSfkHcs
Message-ID: <CAD=FV=XmnWjVzQcr13GmRKX3cvRortA==5C8TH5D-jRBe0VBqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] driver core: Don't let a device probe until it's ready
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Robin Murphy <robin.murphy@arm.com>, Leon Romanovsky <leon@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Eric Dumazet <edumazet@google.com>, Christoph Hellwig <hch@lst.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Johan Hovold <johan@kernel.org>, stable@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 3, 2026 at 12:04=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> > @@ -458,6 +458,18 @@ struct device_physical_location {
> >       bool lid;
> >  };
> >
> > +/**
> > + * enum struct_device_flags - Flags in struct device
> > + *
> > + * Should be accessed with thread-safe bitops.
> > + *
> > + * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished eno=
ugh
> > + *           initialization that probe could be called.
> > + */
> > +enum struct_device_flags {
> > +     DEV_FLAG_READY_TO_PROBE,
> > +};
>
> If you are going to want this to be a bit value, please use BIT(X) and
> not an enum, as that's going to just get confusing over time.

I don't believe I can do that. BIT(x) is not compatible with the
atomic bitops API. BIT(x) will turn the bit number (x) into a hex
value, but the atomic bitops API needs the bit number.

If you wish, I can turn this into something like:

#define DEV_FLAG_READY_TO_PROBE         0
#define DEV_FLAG_CAN_MATCH              1
#define DEV_FLAG_DMA_IOMMU              2
...

...but that seemed worse (to me) than the enum. Please shout if I
misunderstood or you disagree.


> Also, none of this manual test_bit()/set_bit() stuff, please give us
> real "accessors" for this like:
>         bool device_ready_to_probe(struct device *dev);
>
> so that it's obvious what is happening.

Sure, that matches Rafael's request and is a nice improvement. To keep
from having to replicate a bunch of boilerplate code, I'll have macros
define the accessors:

#define __create_dev_flag_accessors(accessor_name, flag_name) \
static inline bool dev_##accessor_name(const struct device *dev) { \
        return test_bit(flag_name, &dev->flags); \
} \
static inline void dev_set_##accessor_name(struct device *dev) { \
        set_bit(flag_name, &dev->flags); \
} \
static inline void dev_clear_##accessor_name(struct device *dev) { \
        clear_bit(flag_name, &dev->flags); \
} \
static inline void dev_assign_##accessor_name(struct device *dev, bool
value) { \
        assign_bit(flag_name, &dev->flags, value); \
} \
static inline bool dev_test_and_set_##accessor_name(struct device *dev) { \
        return test_and_set_bit(flag_name, &dev->flags); \
}

__create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);
__create_dev_flag_accessors(can_match, DEV_FLAG_CAN_MATCH);
__create_dev_flag_accessors(dma_iommu, DEV_FLAG_DMA_IOMMU);
__create_dev_flag_accessors(dma_skip_sync, DEV_FLAG_DMA_SKIP_SYNC);
__create_dev_flag_accessors(dma_ops_bypass, DEV_FLAG_DMA_OPS_BYPASS);
__create_dev_flag_accessors(state_synced, DEV_FLAG_STATE_SYNCED);
__create_dev_flag_accessors(dma_coherent, DEV_FLAG_DMA_COHERENT);
__create_dev_flag_accessors(of_node_reused, DEV_FLAG_OF_NODE_REUSED);
__create_dev_flag_accessors(offline_disabled, DEV_FLAG_OFFLINE_DISABLED);
__create_dev_flag_accessors(offline, DEV_FLAG_OFFLINE);

Happy to tweak the above if desired.

-Doug
