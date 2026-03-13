Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8D37FF69
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393944; cv=pass; b=IDg90EGhW688rgr78h8p/5TSlWK032u4AgCbTp2zn8qUnFkNA1m6bLIDpMRM4CodcBtaoVR4FryWAe/IcMS+tILWwUqRsIhmVQey1EkA3Rz0O98Bju17c24rZkUgLoxyxKZAsoP+bKTYQuYy70Y82sTvu1JRblMtv2dR0xkY3C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393944; c=relaxed/simple;
	bh=/uB/tPENyS//AaalGzBZqiwLhleo5hjikLnLUq4+/Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnKl5tWoufukiMBUN/3vre/AbzljV9cq2qUmTU00eaBT6/AWBOL/ckXAdGQHOGoX7WxxKsjNoORCVyPfFFf/Xp7h1+R4eAu0JS5A1/W8R+TNEPHCFgNZGdm4FQSfPF92/2ZknQ8+3+vt+Sf36L9+eqkkR7oiy3SsS4gIrccXgOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1Cz3qDe; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1Cz3qDe"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b94358796a1so268277866b.2
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773393941; cv=none;
        d=google.com; s=arc-20240605;
        b=YVXz6YbBZ3eLUPTc1nla8jdEJ+TME+locCNz7RvtfZ8NV7jyW4kEHJNG16ryvqQS9q
         wQTN0HyWweepOnjdABnVgMg0uQq+QG5SDix54YYYjmK0WFNiqcgtuum6eDdOFU1uRehx
         TKvPWPmkMZ2ZbAZZvkuUS+UZ4Addmc/BolGFzoxs8gIVsfFSgamtkrZJ1XtmqJhfslkC
         JG41IVowciMoJW7CLQkO6uEDGrlJ37XtnOOwgDsatgveSUMcNNGtIJGm09AMXpmFUlEZ
         AbSxx1uZFgDvSsQQkdQCy0Rf0xy663VInZDF/BEupZ4nsBLuHumD8CJFBcC0igOxg3Cx
         wKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        fh=O9t/dw5oLk0G1YarKEa0aC0i8ovcdc7S4+6exwYB1UE=;
        b=DvX5TY2Vau6Zrpfu5QgjOI9vTEGMzerUTUc3/U+FlsZFAoN7aLvJdSgqxs7qsIR/jq
         n1gnsCoMHYL5Wbj6ZOR/8aZggxRtD8xR0ley0I9XpqXyb6mbxUhdUFa9P4Amd5w6p1Zk
         ptxV2hTye7rezKCuZBzHO3ONKFJkDhnkjSHQGf5Cnqj+33thyMOg5GXnLbI5IhNW5B7r
         sa8oZ5HF52zxRH+6AmHGtGHuBKgtXgSlVjLhJRKqvsiu94lqxTs3TkhJRlgwYlPLlM6g
         nV9KMqNL7lZRw66F6x2lg3wdSHLalQ03xEy4bfgOSOGmf68ubUAitTmtO+zWyK3iee+w
         0ZAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773393940; x=1773998740; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        b=C1Cz3qDeWUiWQnxkZBuosKmEQhr+sa04S3S4RN/p3GMDZTCpQZ8zDwNuBKHVJ1R7Nx
         VKfjKoA40CWPNx+2OZ1rwe85+wBk/2MSjo3xIUUzbmCR+4bm5rJRVB4irvG9YiAF+y3n
         5Y/tGUd2tDtZm1OPZlyRY7jXUeILTA93OlILIG5RA5BGNGf/clhPMJXI0WIIx2F0nlH1
         WtPmUNeVeB1stir9PVEHV027rtpqzHUCkdWLfHDuc+nMLZz6YznbqkvgxJDMI6/+Th/W
         7D6wU4Uz3Nt8oOjv8CJAp4WTtnfCeaJcaxC/RDykpSNjv3YSGhMNR8L8ZZAbzWiYySqZ
         yZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773393941; x=1773998741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        b=s8/PKPAhRth5jVw70CP9KF+NRwYP7e2Za+yYvHwPF4XnNT9GdR+eLjqqh0AVCEKHbW
         binrsxcXtocoZwArd73+VyBi8ibXaQNsfimLzBiB210lekB1fxz/sCWr96Ez8kfRVN+x
         bdaCE3oz8KgTS6pOZjejBrQykwlPDZRM8FQhqqF5Lf4iVI68e7M7Zl1qs2+dAYj42ExV
         iwUqs2Nb2f9cEj4DUGgMdA0QHdr+OQ/74dF6F+xFhgeA/ilv53m0DOf6tLFQTA1PQwer
         b7Kg8y2psG6iU4oTwheZOIWbmeBuFEDoO0Up1fzTlg1r/yD+ukkJZkKC8o+IgKRnA8xE
         kjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+l38JAYC+NuKY/NCef1+Pb9xUZG0PuZJg9yHmbl9fQvzVE8LffsP/Vg/9WmK3c/m2qyKX2+uDVi6DFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO5byE5l/bM4jPYUhjPyjETFwgPMOW9/rOGl/FMGbr/+o2sfRD
	PKGBMupKOjZajHRj1DODbFRwvLLjePcK/A7BOSejwZgtp9jFik1d5pxmXkcNiFxk9+NezI/QhmR
	Dj4hCUEa/TnCRUaOns+kZQaile9Wz6j4=
X-Gm-Gg: ATEYQzy8n/j053jN+TlrIkduI7/NhAHriBtMREp8tiZMbmft5lvS3QQH4A8JEvNOx4l
	SXABgdNgnKblsnwJsmR1pn/6I9Wve74SHZGdS35y6KVOACrMyF7sihx/cO2vX6xOus3JrBVGoTt
	sc7tSwQns6xkEYDj1It0jcr6zBiKYqQGwsoMXQfhwa0gBhzL7LlXvYlqb3g/a2hKnOpGBXnGlAh
	0UXeKcdTS82hTD9heyHtEjL6Njr2Tnd9Aie4iQzeVH8uvn4PSPwFBN1tyTsLM13flOCNWcFOXo4
	lDZlQQ==
X-Received: by 2002:a17:907:8dcd:b0:b93:81e7:845a with SMTP id
 a640c23a62f3a-b976507ad70mr126077666b.9.1773393940274; Fri, 13 Mar 2026
 02:25:40 -0700 (PDT)
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
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
In-Reply-To: <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 14:55:23 +0530
X-Gm-Features: AaiRm52hlbsJk0-LJBm1qE_mVZnVv4Bhkj1fxNTd0yyF5TYOEj4LUpGTe5M1isE
Message-ID: <CANAwSgTxsDB0t1vj--uvYCCxf4NhnjhBEDLqdevLnGAiuU6_pw@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Thu, 12 Mar 2026 at 18:18, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> >> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> >>>> I have a contrary view here. If just a single driver or lib doesn't handle async
> >>>> probe, it cannot just force other drivers to not take the advantage of async
> >>>> probe. As I said above, enabling async probe easily saves a few hunderd ms or
> >>>> even more if there are more than one Root Port or Root Complex in an SoC.
> >>>
> >>> Then the driver or lib has to be fixed / improved first or the driver core has
> >>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> >>> from an async path, etc.
> >>>
> >>> In any case, applying the patch and breaking things (knowingly?) doesn't seem
> >>> like the correct approach.
> >>>
> >>>> I strongly agree with you here that the underlying issue should be fixed. But
> >>>> the real impact to end users is not this splat, but not having the boot time
> >>>> optimization that this patch brings in. As an end user, one would want their
> >>>> systems to boot quickly and they wouldn't bother much about a harmless warning
> >>>> splat appearing in the dmesg log.
> >>>
> >>> You mean quickly booting into a "harmless" potential deadlock condition the
> >>> warning splat tries to make people aware of? :)
> >>>
> >>
> >> Hmm, I overlooked the built-as-module part where the deadlock could be possible
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
> > Now, I guess this can be pretty hard for a PCI controller driver, as you can't
> > really predict what ends up being probed from you async context, i.e. it could
> > even be some other bus controller and things could even propagate further.
> >
> > Not sure how big of a deal it is in practice though, there are not a lot of
> > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
> > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
> > synchronous by default.
> >
> > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRONOUS
> > and apparently got lucky with it.)
> >
> >  From a driver-core perspective I think we're rather limited on what we can do;
> > we are already in async context at this point and can't magically go back to
> > initcall context.
> >
> > So, the only thing I can think of is to kick off work on a workqueue, which in
> > the end would be the same as the deferred probe handling.
>
> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> appropriate? A suitable calling context isn't the most obvious "resource
> provider" to wait for, but ultimately it's still a case of "we don't
> have everything we need right now, but it's worth trying again soon".
> I may have missed some subtleties, but my instinct is that it could
> perhaps be as simple as something like this (completely untested).
>
> Cheers,
> Robin.
>
> ----->8-----
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index bea8da5f8a3a..3c4a0207ae3f 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -954,6 +954,16 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
>         if (data->check_async && async_allowed != data->want_async)
>                 return 0;
>
> +       /*
> +        * Bus drivers may probe asynchronously, but be adding a child device
> +        * whose driver still wants a synchronous probe. In this case, just
> +        * defer it, to be triggered by the parent driver probe succeeding.
> +        */
> +       if (!async_allowed && current_is_async()) {
> +               driver_deferred_probe_add(dev);
> +               return 0;
> +       }
> +
>         /*
>          * Ignore errors returned by ->probe so that the next driver can try
>          * its luck.
>

Thanks, these changes help fix the warning.
Please add my
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
