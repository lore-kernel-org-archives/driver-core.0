Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4F3FFD
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 04:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412008; cv=none; b=Y8JxlstOSjifyWC3rQPGzDecISUQHveN7DM+kvJRNCk9LAoptrVjsSp9ehBmr0d/bitjUysIKHjVO885sGZE0Q1TcSXJntNHhmchkOtlu0aZSVnb7NGWXAV94QiCLLO+KmJs1kmox493gjOgog+jbWdWM5eV+EFpPS2AfO0h4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412008; c=relaxed/simple;
	bh=YWJtRNIJC9eKjyIJLS3+9nz0cFYlkBsezKB5NPwjwvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU8M1VKsqhaw2KiAG3JGlhs1EprNXxmZ0k3ZXFHL9PxXYvMFVcyCXRisYoD2HhpcpPCpRr4QLSRgqp6Ze8c1wng0WICaYQlGvSgClLESzXWefe+SkIIWPaoHU5R2dgDQZIF+8Xq57Yg3UDt1voJWc2wmHU1puslSGAPZhnTyCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5o2LF4L; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5o2LF4L"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a693cdf29so518364c88.0
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 21:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774412006; x=1775016806; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1zx9FotWDsXciTr6vSKC3+KwJ/ZkglPq04NJzxyt/k=;
        b=j5o2LF4LlA3Lm/3aifvKxJZMByMWCyPhGgr291dn2FarLtium/UH7yj9WR/8olP2O2
         GDI95jiHwxWhdwPH8WT5YCbVppQFTUsEfYyGYUQnbpK6kPTSDE4n+L5nojov3zIaM53+
         Evvu6F6R5TET1gWdRm5gIUN93hNdSLekONmS55pcVbAWmJJilLdLuRk2sYfuFXOgYARO
         lKYWKe8O8fgnJLdXqaYfo6ALtlTUFR+lnZqH0dD0iFlrxX2QIClfzPogisVqTr7ZUeS9
         Mef4IgDTDFn+ysdiXJ3ZWsvLMx9DuoyoZyduAxDJXLOvyqVh47ZakQ78Lnvct9jP/s+y
         /76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774412006; x=1775016806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1zx9FotWDsXciTr6vSKC3+KwJ/ZkglPq04NJzxyt/k=;
        b=Dp3opZLQtb3cHX2mUsvxw68iIU/0GUhsthLC4KzQwxAr/T9r2j45wE/mv2ZL6UvWRZ
         F9kGIOd60mTuAiyfwWnhCq+NG3oy6e4DiM4JDwdcfPMY6Ik4i3tCTa62BO74UFxNXCNI
         V4CWkcFmtGeCXKHjotS8plFIORTvO9pescLmoebEvPjJx+7f//6BvWDYxtlfwbqcF+RI
         NEI7XGrwfGs22bL3HrXMUJIGsh0HcxyNyuKQzHH2pT7fc0dH1/qLhhsSlDJVSUcPeHj1
         5CJ/3g8jn876aFniWogoUEl+Crv7qE2w4MqEx5l+AbmOpPkV02CWIrt1MQQYStCiqglv
         4wOA==
X-Forwarded-Encrypted: i=1; AJvYcCUmohdPyhTEzhUavTRPhD4sgNkTlbT2CNLJJvSYY2Vzf1Eb56OC68wth0st5zUZeesCt3qNJHbxiUWISw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXSR4Mc42qGZLaKjpNWyZyF0pteVAgOKZ9xTn79J5wwR9MFxqd
	FemLMUDt5izHVdpL9xhQQHGe0znaCs7SvfzbQwrk7BF4IYIG3blbbiJz
X-Gm-Gg: ATEYQzx/awwdxiNY/ipqtU9TdFU2jvr0hElPMN65Vguq/QiE69dj3TbzGWftzirV/vy
	VUSaI9A3rhu/eYmiGgICxEDKSYbc7ImUzeoZx6ZaPzIoKjHQc9bHbu7sVcTYh0LgNbbDfuxrMYx
	P/97cVYgr2JnhyPrGSXpp5j4Sgk7gIH+EonP1uO5TJwhQNviFBXI9YiERv8NVpyf7VPpLvZu90p
	719jueOHYLIBY/PqSgCOTCGoiouKffL4DJr8Arc/DwmUFL3JCby6Z1lGvQz3YAF2wUXGf/QKbsT
	1hIUsaxKPF1gm+74OnkRtu6WYfPm/WNJCC3RGBlRwc+lXhkTUK0/dTmO0w23x1h+4cIzfhcDexm
	M58pURLeCpMsJr8/6UQqTIArf1bWXAWnrdbHQ+HEUG1PRsLA4568mOw2RJeZTrCEvqXJlcFRruA
	dUz5pCQJYVSOuky7H5HXV4CRzFefNPnwp6bzqD4tb6TCbZ3Orkub8Nzh5RqzXq3eICp9Hl1oD7G
	oo=
X-Received: by 2002:a05:7022:418b:b0:128:f1fd:78be with SMTP id a92af1059eb24-12a9684c64cmr1091744c88.5.1774412005575;
        Tue, 24 Mar 2026 21:13:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a39sm12292420c88.3.2026.03.24.21.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:13:24 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:13:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <acNgUoWWMCi1oLU4@google.com>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>

On Thu, Mar 12, 2026 at 12:48:36PM +0000, Robin Murphy wrote:
> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> > > On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> > > > On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> > > > > I have a contrary view here. If just a single driver or lib doesn't handle async
> > > > > probe, it cannot just force other drivers to not take the advantage of async
> > > > > probe. As I said above, enabling async probe easily saves a few hunderd ms or
> > > > > even more if there are more than one Root Port or Root Complex in an SoC.
> > > > 
> > > > Then the driver or lib has to be fixed / improved first or the driver core has
> > > > to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> > > > from an async path, etc.
> > > > 
> > > > In any case, applying the patch and breaking things (knowingly?) doesn't seem
> > > > like the correct approach.
> > > > 
> > > > > I strongly agree with you here that the underlying issue should be fixed. But
> > > > > the real impact to end users is not this splat, but not having the boot time
> > > > > optimization that this patch brings in. As an end user, one would want their
> > > > > systems to boot quickly and they wouldn't bother much about a harmless warning
> > > > > splat appearing in the dmesg log.
> > > > 
> > > > You mean quickly booting into a "harmless" potential deadlock condition the
> > > > warning splat tries to make people aware of? :)
> > > > 
> > > 
> > > Hmm, I overlooked the built-as-module part where the deadlock could be possible
> > > as indicated by the comment about the WARN_ON_ONCE().
> > > 
> > > But what is the path forward here? Do you want the phylib to fix the
> > > request_module() call or fix the driver core instead?
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
>  	if (data->check_async && async_allowed != data->want_async)
>  		return 0;
> +	/*
> +	 * Bus drivers may probe asynchronously, but be adding a child device
> +	 * whose driver still wants a synchronous probe. In this case, just
> +	 * defer it, to be triggered by the parent driver probe succeeding.
> +	 */
> +	if (!async_allowed && current_is_async()) {
> +		driver_deferred_probe_add(dev);
> +		return 0;
> +	}

That means that you are kicking the majority devices (for now) into
deferral path. I do not think this is optimal.

Does phy really need to request modules synchronously (and on its own)?
Why can't it rely on udev to load the modules and signal when phy
devices are ready?

Seems like a deficiency on PHY subsystem that is stuck in times long
past.

Thanks.

-- 
Dmitry
