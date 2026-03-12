Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97E39DBC3
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315626; cv=pass; b=AORiGnaPnpTc94yxm9Y1Fft41m40ZqGqgffwLnamMS0Z3XBzQOiYHtYDkPwJuIeyhI5LqLwR0EnwinzcgsqSnSlp5R4dWKOhotYkLQ58KjbnOxSgeDRZNz9Nl+JRi3eg9sfgYBQIVRbaVSHOo6AXRZ3aDL6NB8xJmVtk6uBhbm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315626; c=relaxed/simple;
	bh=2TPSG+XCAoBTjV6kl8Kgjsjnn5MIxqg/Bno09qD0lBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIc8qOC7/WDku5vhjTK2pap81CSDZLZ00YYfcpz+0FMJ/yaYWW3U64/TsHQvMnWMcqKd8psrndKi8w6qKzvLiqFSYnBG0l+xImPj6X9j5a2qIk0l49c/F+1EYsihuAVGiZYnroF0DFwboPFE8xhJHMqR4+LzkWas4Ebu7wJSdIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmsvZVhy; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmsvZVhy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b96e1ae843dso124717366b.2
        for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 04:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315623; cv=none;
        d=google.com; s=arc-20240605;
        b=MH/L365I6uXfOE9XOr6fF4U3TGgXcrzJIE8n2AAeH4CnE/DHy9/3BS2s+kU/aUIp6/
         axH/BPRCjA/mmvAUpAzMWT3PwwKVG9Adn1xtSVh2u/wrXlVUBh35GSDlxSFTGKUlvuF+
         Fy/0mtJ9ziGvsqpRkayrFhIyc11665REBtalaPcqO/jBVm9jqeu8dDQZiwGwrvyn3VXn
         QD1+5DE23P0qb3QCGriOIHgp/Pht07q7bpTlR5t3Ma4/2aI6Aaih+KIrbePeOFJoD+Yd
         TFip32Aou57XyDk/HwSfw21SE+0xivzGJbe0c9ffmeZXXAHhfpmBJWAUKHlWsdIMBZAU
         ZIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        fh=yqFd/CAKKxZhrxfpl7H7NmXtHnB1ts2BNHv/+MXdqLY=;
        b=P8mC4CFtk9oeh6oTvo7e5SbavjnwQVcYf+tGwulfvo/3AMZmpoNkUQ9Q84r1VE64Du
         mgFSG9qM/bbXCbTCJEOh7AqCULfuFDeIOU0R+zjHWcSp3RjOeeo5aHUN0unmBeSMlC/D
         bQDZ4rjuwZg47ggfFQkaULUinorBgbOaVdWaKVzGAP0ruz1zbeSzV4Qo+EiumfJslbt1
         64stIhg5TarG23eC5yGdYHHIZI8Cf/qXaiC2V1gDOJaTseKQlIV83K7RKKWSCwvL7yvb
         yne1KgawFdVSCezNj8VDtpWFcqSVtDOx9Rp/ihcDH1kZI3HkwhAVVnLXS0ktI6waWoTD
         R1zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315623; x=1773920423; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        b=bmsvZVhypJ0YF6eSIdhHY7rl9zxGw30m/sQxaEbY8kAVbYpsHi7tWNH6uC6BKd3zax
         2CcquCd3PfVWw8Qj6AdTYhX0Rq+llGm45a4tUDbaSskHhmpvErbZRzo61cmj+YAphwnL
         4oVEtmdo4Ep9a20spLaZ0hEDx+EWXNFafnJ0JKr9Evt6TkBaQSQbsSIojoxFjfUfCIeL
         P92ZoxkdVKTzvsfUwdmd7ik7e51JYlT/AbSoD1rqKxZb6pTqcAGR+ww8K20hUOuwuQyn
         Vbsx6KJM4Dm50lGTn2rsJ3ltUQMfQQ5Un9XjT9MDBS5lcFnkDDBVoy3VGs1iSqfJUCvE
         Aurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315623; x=1773920423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        b=qDBlNplQ4mdoqMUSZ6DzQS4Vs+xG7i9MOXkjTuLwyabYxUWJBLMoig299LKE4hPQQn
         GPml87/ZPTzA7xZdk15UchDHGSUFPaRHh6hlaVRHCXOepwTvZhFk7otKZqwAfLxaPSjs
         c2M6HdVQJk3CW5YOq5sUGNRMaucm+vjbbgbvzXiUgDEIdUAnXxpovq6OObxuagBM6zKT
         QVLJ4JUIpDA57ZPyV30ujmF3e5/9Hjc3EezKgjvwARHhqQxBSjutwreO0uDh4qcPRfQx
         AyVYZVO9gdGo0KOCX9yuvkQwqCAFE4ijlt9KLtj9ioDL/WxChZj7SXqIbyjzZ+l21Ytn
         KOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6tFllcezKWBKR0TldHJc2HaTlPDW93TCKx8svC4gvghXphTWub+/7hSaWxGX2TgP+WsqyojrjG3MkgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXYCKSMvcq5EBCkA+9YRUtZ5T2i91pnMtrjn/Bgk0AMI9+1P/g
	8h38wEG4A68NTTYJkX4U3ALY/ICcFJkmMrFJYzl/oT8VjQQy9y81t5mwNXTmg2S0tmp05rAX7+T
	PjqLFz5DHPIIRWgFHUICdhHiAdbWoc2s=
X-Gm-Gg: ATEYQzyjVHze4XvVIF+OcMFZWiAj+XsYzypmW6MycH4gMVkGMH3W5RCDu6vw2i9SbvH
	/py59WaMhOslTYvVpbSeZYQlYEx3nHrLNzukoOTVHnJuKAnv4Bi7RwhLyDLW1BnFFrH4l1Jf2dg
	7lW5bRTnHyGyAImH6I23+COxCaOw6aMZfGQc+CX3blEnyCEGDUSFO545KW6kR/b9LUiRc/K+WJC
	7o/kXtSXZ3kdvb72OZJnPX+SWxt3kWUdZB4cBw9mDgSFHtn4jQkINo/EYztTw+itZ0Ijrvd9pDi
	yx9TrQ==
X-Received: by 2002:a17:906:f58d:b0:b8f:f070:8c30 with SMTP id
 a640c23a62f3a-b972e52a19dmr383837666b.49.1773315622489; Thu, 12 Mar 2026
 04:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
In-Reply-To: <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 12 Mar 2026 17:10:06 +0530
X-Gm-Features: AaiRm52HfWRYYsTJWgJqZ1mPKHzxh5bRhcDvLmP4oDUAAo6L9RCY3sGu0RZ9H3g
Message-ID: <CANAwSgTaZqsHYXD_ACkJGGLgk4knc7N72f4qrJaaenE-cXM8BA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn, Mani, Niklas, Robin,,

On Thu, 12 Mar 2026 at 07:03, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Mani and Danilo,
>
> =E5=9C=A8 2026/03/12 =E6=98=9F=E6=9C=9F=E5=9B=9B 5:09, Danilo Krummrich =
=E5=86=99=E9=81=93:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> >> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> >>>> I have a contrary view here. If just a single driver or lib doesn't =
handle async
> >>>> probe, it cannot just force other drivers to not take the advantage =
of async
> >>>> probe. As I said above, enabling async probe easily saves a few hund=
erd ms or
> >>>> even more if there are more than one Root Port or Root Complex in an=
 SoC.
> >>>
> >>> Then the driver or lib has to be fixed / improved first or the driver=
 core has
> >>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is re=
quested
> >>> from an async path, etc.
> >>>
> >>> In any case, applying the patch and breaking things (knowingly?) does=
n't seem
> >>> like the correct approach.
> >>>
> >>>> I strongly agree with you here that the underlying issue should be f=
ixed. But
> >>>> the real impact to end users is not this splat, but not having the b=
oot time
> >>>> optimization that this patch brings in. As an end user, one would wa=
nt their
> >>>> systems to boot quickly and they wouldn't bother much about a harmle=
ss warning
> >>>> splat appearing in the dmesg log.
> >>>
> >>> You mean quickly booting into a "harmless" potential deadlock conditi=
on the
> >>> warning splat tries to make people aware of? :)
> >>>
> >>
> >> Hmm, I overlooked the built-as-module part where the deadlock could be=
 possible
> >> as indicated by the comment about the WARN_ON_ONCE().
> >>
> >> But what is the path forward here? Do you want the phylib to fix the
> >> request_module() call or fix the driver core instead?
> >
> > Here are a few thoughts.
> >
> > In general, I think the best would be to get rid of the (affected)
> > PROBE_FORCE_SYNCHRONOUS cases.
> >
> > Now, I guess this can be pretty hard for a PCI controller driver, as yo=
u can't
> > really predict what ends up being probed from you async context, i.e. i=
t could
> > even be some other bus controller and things could even propagate furth=
er.
> >
> > Not sure how big of a deal it is in practice though, there are not a lo=
t of
> > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neithe=
r
> > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results=
 in
> > synchronous by default.
> >
> > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYN=
CHRONOUS
> > and apparently got lucky with it.)
> >
> >>From a driver-core perspective I think we're rather limited on what we =
can do;
> > we are already in async context at this point and can't magically go ba=
ck to
> > initcall context.
> >
> > So, the only thing I can think of is to kick off work on a workqueue, w=
hich in
> > the end would be the same as the deferred probe handling.
> >
> > Another alternative would be to let the subsystem handle such cases, wh=
ich in
> > this case would probably mean to handle the current_is_async() case in
> > pci_host_probe() or pci_bus_add_devices().
> >
> > On the other hand, this would probably end up to be a subsystem specifi=
c
> > implementation of "kick of work on a workqueue".
>
> Actually, this is exactly what we've been doing in our downstream
> code[1] for quite a long time. We've even pushed this optimization down
> to the individual driver level.
>
> To be honest, I'm not particularly fond of this approach either.
> However, on our platform, we have more than 5 Root Port instances that
> need to be initialized during boot. When all of them probe
> synchronously, it significantly delays the execution of many other
> critical drivers. Our customers have been complaining about the boot
> time, and our downstream team had no real choice but to kick off a
> kthread similar to your suggestion.
>
> The code is very ugly and expose a lot of corner cases problem which
> wasted quite lot of time to fix. That's why I was hesitant to bring
> up the this approach upstream initially. But since you mentioned it, I
> think it's worth evaluating whether we can implement this at the
> subsystem level instead of forcing each driver to handle it
> individually. This way, the complexity would be centralized, and drivers
> that benefit from async probe (like multi-Root-Port SoCs) could opt-in
> without worrying about the request_module() deadlock scenario.
>
> What do you think?
>
>
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pci/con=
troller/dwc/pcie-dw-rockchip.c#L1764
>
> >
> >> I can drop this patch in the meantime. But holding this prolong wouldn=
't help.
> >
I've reproduced the issue on my end. Following Danilo's suggestion,
I used PROBE_FORCE_SYNCHRONOUS to resolve the warning.
If you agree this is the correct fix, I=E2=80=99ll resubmit the patch.

 git diff drivers/pci/controller/dwc/pcie-dw-rockchip.c
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..ecaf1b446008 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -746,6 +746,7 @@ static struct platform_driver rockchip_pcie_driver =3D =
{
                .name   =3D "rockchip-dw-pcie",
                .of_match_table =3D rockchip_pcie_of_match,
                .suppress_bind_attrs =3D true,
+               .probe_type =3D PROBE_FORCE_SYNCHRONOUS,
        },
        .probe =3D rockchip_pcie_probe,
 };

Thanks
-Anand
