Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253240757F
	for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970787; cv=none; b=XMOCH/aPSnp2QM2phFGUVD04LUyqwb7kU7MLDPtQ1KWax+H880bnYSA0GXMr+MLsCcISjd3OEaXYYV4C7rHYShztRTlXfeRaUuatBht+VCcrVHtK1m9JhRqkyLjcaDtQpSnX2GO0Ixvc6kttCP5raVhqpKAgvB9BjpAI24l4BA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970787; c=relaxed/simple;
	bh=p1FuVBtkzvgZxkA/85sVWcISljQ1QqCRc/77Myie85M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEOTloTuxmZqwdA11z1uC3d+Ag/BwYeEHd+WgrUjCX/HfbLWliwHO0yQtMVWWepdNEFsvTV1r96mP2jlA/07HU50Y1ibkSkgY+HhzhcEzbHQYqoGJUtUTr4oto+hxSkgTQm3UhOaJSbGBhKtHzeeEFKcvBSTsx5Mq3aGpeenL90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XILGEOKG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XILGEOKG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9841aecf72so708596066b.2
        for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774970782; x=1775575582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv9FvyVYU4HlL8YK9g3Zs+LbipJa/4PqgGL/7ICcHJI=;
        b=XILGEOKGTkqw9eNGmS0i5D1+KATJe561IoKoDaErT/E82qoVrZszb89PLtGRHtaoO8
         24Cr7t47BbxPlL3Gx/Og2z5OTPIC6awtaS+P+mOF1V+E1P6X3op/rW0wV1FGkukQYMkv
         d3qqO4Ig7qvhXT8IaMPE0l2WEyGLZbP0glDck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970782; x=1775575582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv9FvyVYU4HlL8YK9g3Zs+LbipJa/4PqgGL/7ICcHJI=;
        b=rRtZZWdIM7Mg3TjnKLfQWNcm+52cXkZOF3E8pkc5CaM89gimtXy0714j/VH0DtDoH/
         noIpRTRp/TEBkiA+xFeU/+XcIv02M9NYBDAEupS9nbgmG8yp0uMGLwbBHpnHZsY0Bxxk
         1AhSon5/GbBEg7/q28So6pYzyzSYPY9msphkFwwHlEK/F7sQ0PxEu4lNhV3Fo9I1cN1B
         +yNUEuQAMsY2Gz4jit4Mha1VS0wRWUcjATt3CjZHmBbex2KfLz/896gzo5oe4NWgJHgU
         vzvBY50/VRdnYSXL2Fadnk44ZztQ/jPJbKQr7JLtQQtFBMPVJyuo+qjuGSk27Lt8BM3F
         NGqw==
X-Forwarded-Encrypted: i=1; AJvYcCXucjY4JNwz99R+KeQ9dETajn8SrpqSh5KnId9i5G8/yAl4knxljPJort+zRtNKo+FhTISaoKEdrQBBew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiaHn1yjOo6vmPi4BtiRajLt7gs0pbI/f5oPLP6b3KNGgzDJKO
	6wCyNmTERM1C8O/El8ZWvSD0o8RJ+0cOCAwelN98dhgmTQH3DkT01t2zpQalM1r7tHyStQCGahk
	RWqBo4w==
X-Gm-Gg: ATEYQzwWj5I6aCaqfVh1jIM03imvagFuvg5d3WGM/+C7AgVTxRbCNe49p5I8AhoEBYB
	sjUVsxJPneoVbVC+/imlkish3uejdDVseDiEgA1s1erx+zAfPfMtZflkn+CC94CR3cAeHFvrZ/z
	p4qRRu6VqFtjVtUfgArqdxIlz7bocsMA+5kiJBj4YXnw2jMHaD116usdbKzpzG4B+mCjzXYqn8W
	4StoGzIYUpTvC1tyrdNdu0WhmaTu+ozAtblfi1WWtvtYUyJ56eBAolcp9WIBQX0EiaaZKif3HUk
	ej/EfiIk97ndbp4xeqaf7C6qrRCSCwDqSy9WgQGgDlgBTXEpBgsh5PWkIZN9HKdVcWt1dl6wz1o
	33TJzqhOZfjJF0gnSWApl0kpCnLWKn+L9xNAfJp35/sAIEV340Fw2Uzzdmo4lv6nyDI3UDZ/csm
	mV1UhaguJnOZ/b7TWAbcuP9xc+eaD3zry0aHLhp99GgF0nvcFWCRsJDJN6j7kHSQ==
X-Received: by 2002:a17:906:934a:b0:b98:286a:e2c2 with SMTP id a640c23a62f3a-b9c13b41bfdmr2125166b.38.1774970781582;
        Tue, 31 Mar 2026 08:26:21 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c125c4cfbsm5393866b.34.2026.03.31.08.26.19
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:26:21 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1486234f8f.2
        for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 08:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1ZN4FcTNoxe7utGI7mZw8IWiqzKzm+XM+ho+djkrIZzUVW7f9C/7+lyRSLJMJ+Y/pkka2KHSN4fkmSg==@lists.linux.dev
X-Received: by 2002:a05:6000:24c1:b0:43b:3cdc:941f with SMTP id
 ffacd0b85a97d-43d150869ddmr130954f8f.17.1774970778986; Tue, 31 Mar 2026
 08:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <DHH1PD0ASG8H.1K3KG9L658DYN@kernel.org>
In-Reply-To: <DHH1PD0ASG8H.1K3KG9L658DYN@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 Mar 2026 08:26:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ2qOZ7ftDg70AhD0GRX6TfQb6OVyNaUfFg42+hmwxGQ@mail.gmail.com>
X-Gm-Features: AQROBzAO84ippC-b2XO-7R5l6fnyfqHcAQ7sFFgv72ZLW18LGW8l3elfjno7St0
Message-ID: <CAD=FV=XJ2qOZ7ftDg70AhD0GRX6TfQb6OVyNaUfFg42+hmwxGQ@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: Don't let a device probe until it's ready
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Kay Sievers <kay.sievers@vrfy.org>, 
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 7:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> > @@ -848,6 +848,18 @@ static int __driver_probe_device(const struct devi=
ce_driver *drv, struct device
> >       if (dev->driver)
> >               return -EBUSY;
> >
> > +     /*
> > +      * In device_add(), the "struct device" gets linked into the subs=
ystem's
> > +      * list of devices and broadcast to userspace (via uevent) before=
 we're
> > +      * quite ready to probe. Those open pathways to driver probe befo=
re
> > +      * we've finished enough of device_add() to reliably support prob=
e.
> > +      * Detect this and tell other pathways to try again later. device=
_add()
> > +      * itself will also try to probe immediately after setting
> > +      * "ready_to_probe".
> > +      */
> > +     if (!dev->ready_to_probe)
> > +             return dev_err_probe(dev, -EPROBE_DEFER, "Device not read=
y_to_probe");
>
> Are we sure this dev->ready_to_probe dance does not introduce a new subtl=
e bug
> considering that ready_to_probe is within a bitfield of struct device?
>
> I.e. are we sure there are no potential concurrent modifications of other=
 fields
> in this bitfield that are not protected with the device lock?
>
> For instance, in __driver_attach() we set dev->can_match if
> driver_match_device() returns -EPROBE_DEFER without the device lock held.

Bleh. Thank you for catching this. I naively assumed the device lock
protected the bitfield, but I didn't verify that.


> This is exactly the case you want to protect against, i.e. device_add() r=
acing
> with __driver_attach().
>
> So, there is a chance that the dev->ready_to_probe change gets interleave=
d with
> a dev->can_match change.
>
> I think all this goes away if we stop using bitfields for synchronization=
; we
> should convert some of those to flags that we can modify with set_bit() a=
nd
> friends instead.

That sounds reasonable to me. Do you want me to send a v3 where I
create a new "unsigned long flags" in struct device and introduce this
as the first flag? If there are additional bitfields you want me to
convert, I can send them as additional patches in the series as long
as it's not too big of a change...

-Doug
