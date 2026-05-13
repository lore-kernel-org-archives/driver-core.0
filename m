Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456283E4C69
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663109; cv=pass; b=BiqiygbM6/OvvbF0jYy2G3ak+NSPqGB3uW4Eqflkwc31nW0EAP3Fx/61GAnb9YDjUxuNIY8nMFeqpxhEWXyp1FgSmWPal6mcsnRnZRjvCXrVV+yKOHCY92nBGxFz+GiyvH+FJfugtdxPhueENxZVZprIkB2ZCK8SJQ8qvdr8+5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663109; c=relaxed/simple;
	bh=HVbPGmpsziIklRB2aj6jw58N/M9msEmJ9NtCMs5V62w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCQyBX8EgV2frB481QR8u7EewLdMq/V0iXnOCY7dlhvm12pNk0/rHSLnILFYm89aTQW56ZwIpnfVvKCmbfdPNrtmmtjKe8AnOqYrSmF9moJSSiKuhRFiLCAzLQyyGogD+lmcJq+e6WFdcu3ekLBvGuyuLVN6CghDck6HAFsFbts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=csKP+wy5; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csKP+wy5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8d648466bso4067747e87.3
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 02:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778663104; cv=none;
        d=google.com; s=arc-20240605;
        b=ABcl8tHoXVSQhmrzrSCHD7syt/UwS/LP4OnDA+u0jHHnExsB6Bnq1OUJCnR3bGho71
         6gSLJdVXSG7xiTEMrO7Aml9cHt6GOtN17JwXuYi/SKn/0/EsLsgptPcQCutMWXtvDTHL
         WiFUQfBPbKgtYXiYdfmi6/h9DDB48Xw/ORaQfx+0IAKUjUXiFSgyfRm25n0Y4Tq138G3
         Laagnmv1jr7iYKs4umfdbj66clLWZSxnrE/QoPUKGceNiex3q+cvNs9CZFog8KcVt15F
         tsRQsBmrQ4LUwRiXLeX+OX9sjeCrjoxd55rierjcfX2ai+/tRAdprLUkReU3oDILN2Mq
         ahww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        fh=I17XeV5IPKG/ZNVisK0gA3e0DG/RG8+vNzzBL57TDI0=;
        b=cUTHSTDrLk0FEqRJ5x3X3/f75B9X/l1d/L2NE8svdKeBPd7v9YedS0525FBNQsi30t
         DqM3dnNvVXv0lYRsx/xyJhIPkVwbUVmUJS1qibxY8kz9qdCPm4OKkIO7er9maX+KxIxp
         5fu/SkG3cTMXmPivkaLvwS+Ko25Ooz06ci0b+YMFXMiVa4F7rmpVF0M/Q9e3IIjYOqM3
         mMzhclo0wLhnOlkGut0hGNU7Br2jhsvTkxHR/YsRxaUz2i6JAKUZ5yLYaokoQYSFBuEU
         CUJnud4kWQpmrk7VShvF3kFvSjRGLGzdz2MZCxNf3WcyzqEdHTHpBdIqpD6oJ5SZY/D5
         fWEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778663104; x=1779267904; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        b=csKP+wy5jSPBEmqPeCo36jWn0YaoJx8EszP/sOSecn81EkZWteG7syFyYd7qB0IZaq
         GiNgguSIOSijbkujnbHmhq9THgLGqUehPiON8vhNdqEMNxJHDdJePAFNZiiUEadk+auY
         u/zPh1qztZEGNtNWwZVYALtEH7Vu6QdK8WL7xAx1cLG75Nbg1DO/kwZ6vY4HaPu06yEj
         levuGA+XVT8FVeAaxn7G9vQzutIR2b1XhIiXAU67XBNmstkXctZCrHQzLrAXu0vDP5xn
         dtVcuH5QoRxFWo4fLEWKBlzWcqPdriTZL6w4oOnNuhTlyESJC2EBl/sr/JrXHSDvYPto
         fyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663104; x=1779267904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        b=qG1W0hcSHmUGrRHLREFVVfZXuePA2RmPG/w/O7SGbj2gfu8W7zeFviFmr0jAxuf1vK
         ZCNSHg9PFXxvulxMD9C9/sgbmyE+8KdtOUb8kcfywbmTRKm/r+2VpvPd+NTB9wtdggHK
         532GN2LTmRdvkbT9ETdzJdMHKK69PhxeNQmRPRX2yBVPwjBfBhFx0Kp710IR7yVuiUSI
         5KmHgvy1PvJJb+8YFUJIidz/JIgyr4/FbEHbX9rY4GyjJTV6b8BYpO+jEa2JVseWXphp
         TVbGtbo7UDa95qYlKH0UQGvmZxma5A3OKYsJtNRuvUD8mT8n6TJmqmzqSDr5hp61vh4o
         nCJg==
X-Forwarded-Encrypted: i=1; AFNElJ/ilNzs/puEO3ING3pqNFg+qjmaPY98KY4Cf4o0k8U3laj0u7bq9+fUdtFWVeo7CnLkL6n+E8GT4QvMcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYnxneKvk34J+mjESYrMW64gD9y8qwYB1X9wuy82KKvpvvigp1
	I+xP1WpWQVFfkd6OTydMpW0ikcufizsYQuo1BBI0SlWEeYdQk/HpK2wQz8G/yL0mmMjYenZKgJl
	nANNQOtdkc4IGncINX+QpizRYUGB1BquBWgNJRbRaOg==
X-Gm-Gg: Acq92OF/Ml0MLxiwLHa/rBe57rMwzqfoUyZBBKncaYxyEB0vueX3udkmNRmMWRDfy4n
	e3u2UpLGZoZGWuDhpOepsJRQ2chY/cJKqIkF2KUTPWQpbvjt/SPN8klcMC1y+LOIQM1QhW0gx2T
	4uDRrmMsY2mNadym4EmAC8DCyhZ+hMyG/4F1d5fUkT5inAuaU+ve2YF64HNtYSTGNumyZsQBeUc
	MxiDd9vWP3XvW0NDR4qfNKnRH9tgDtzNXpxw0PDjiviMUF88w1ifNsBaJLOyZEJRDKW1b7BDPZL
	oIGYD5udNRmxjhbY3G97NcGlBXxRXGnAZPBIY/Bv
X-Received: by 2002:a05:6512:3c8b:b0:5a8:d648:4601 with SMTP id
 2adb3069b0e04-5a8ef99cc5amr878284e87.38.1778663103512; Wed, 13 May 2026
 02:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org> <CACRMN=fseD6-ODYnOEE42S9VKAb2F33kRv_VPYBGyPsitG2how@mail.gmail.com>
 <CAPDyKFq+F=zn_Coicb9LzyMtQ=b2Lrd+3Czx6r4ReY-DNyb9eg@mail.gmail.com> <CACRMN=dZFvbXjZGqTvFdNVyXfyvS6YtWNKQnej9A1jihGJHcqA@mail.gmail.com>
In-Reply-To: <CACRMN=dZFvbXjZGqTvFdNVyXfyvS6YtWNKQnej9A1jihGJHcqA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 May 2026 11:04:25 +0200
X-Gm-Features: AVHnY4IY1Hl3PHqVdEbwrzR1kYI3x6GJYuzpslvlmUfAwZ9a3eA_KZCjdMuftMI
Message-ID: <CAPDyKFpYkzmmx+d2-x0YskO0H2UD2v1LmZLMRqMmDoLSfPk8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Saravana Kannan <saravanak@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2026 at 07:01, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Mon, May 11, 2026 at 2:43=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wr=
ote:
> > >
> > > On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > The common sync_state support isn't fine grained enough for some ty=
pes of
> > > > suppliers, like power domains for example. Especially when a suppli=
er
> > > > provides multiple independent power domains, each with their own se=
t of
> > > > consumers. In these cases we need to wait for all consumers for all=
 the
> > > > provided power domains before invoking the supplier's ->sync_state(=
).
> > > >
> > > > To allow a more fine grained sync_state support to be implemented o=
n per
> > > > supplier's driver basis, let's add a new optional callback. As soon=
 as
> > > > there is an update worth to consider in regards to managing sync_st=
ate for
> > > > a supplier device, __device_links_queue_sync_state() queues the dev=
ice in a
> > > > list, allowing the new callback to be invoked when flushing the lis=
t in
> > > > device_links_flush_sync_list().
> > > >
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > >         - Re-worked the approach to use a list to queue/flush devic=
es for
> > > >         ->queue_sync_state(). This should make sure the device lock=
 is being
> > > >         held when it's needed, as pointed out by Danilo.
> > > >
> > >
> > > Hi Ulf,
> > >
> > > Thanks for working on this!
> > >
> > > And please bear with my slow replies.
> >
> > I will try, but taking more than 2 months to reply isn't sustainable,
> > I think. Let's hope you can get some more bandwidth for reviews when
> > moving forward.
> >
> > >
> > > > ---
> > > >  drivers/base/base.h           | 18 ++++++++
> > > >  drivers/base/core.c           | 77 ++++++++++++++++++++++++++-----=
----
> > > >  drivers/base/driver.c         |  7 ++++
> > > >  include/linux/device.h        |  2 +
> > > >  include/linux/device/driver.h |  7 ++++
> > > >  5 files changed, 91 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > > > index 30b416588617..c8be24af92c3 100644
> > > > --- a/drivers/base/base.h
> > > > +++ b/drivers/base/base.h
> > > > @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct devic=
e *dev)
> > > >                 dev->driver->sync_state(dev);
> > > >  }
> > > >
> > > > +static inline bool dev_has_queue_sync_state(struct device *dev)
> > >
> > > Let's please pick a better name. This is too similar to the actual
> > > queue function you call __device_links_queue_sync_state() and is very
> > > confusing. Maybe something that has a meaning along the lines of
> > > "another consumer probed". So, maybe:
> > > * consumer_probed()
> > > * change_of_active_consumers()
> >
> > The whole point of naming it "queue_sync_state" was exactly to refer
> > to __device_links_queue_sync_state(). The point is, the callback can't
> > be invoked unless __device_links_queue_sync_state() has been called
> > for the device first.
> >
> > Not sure why you think that is confusing? To me, that is rather the
> > opposite. :-)
>
>
> sync_state() is a callback telling the driver that it's okay to sync
> the state of the hardware with the software.
>
> queue_sync_state() means nothing to the driver. It's just leaking an
> internal implementation detail (name of the internal function) to the
> driver that's not really relevant. What you are really telling the
> driver is that some additional consumers have probed.
>
> > Before deciding on another name, note also that
> > __device_links_queue_sync_state() is called when resuming sync_state
> > from device_links_supplier_sync_state_resume() and from
> > device_links_driver_bound(). I am not sure "consumer_probed" a good
> > name that covers both of these cases; what do you think?
>
> Yes, I'm well aware of that :) The contract of sync_state() is that
> it'll come after a point where it's safe to sync the state. Not "as
> soon as it's safe" -- meaning no timing guarantee. Really, this is
> just to make sure sync_state() doesn't come before late initcalls
> (because a lot of frameworks make assumptions around it) are done and
> before all the top level devices are added.
>
> So, even today, sync_state() can come a bit late. In general, the
> driver framework doesn't guarantee immediate action. There is no
> guarantee that a drive probe will be called as soon as it's registered
> (if there is a device) and vice versa. The same will be true for a
> "consumer_probed()" callback too.
>
> Also, your implementation is literally trying to check which consumers
> have probed and which ones haven't. So something like
> "consumer_probed()" or "consumer_change()" should work well and is
> actually meaningful for a driver developer.

I have no strong opinion on the name, so if you prefer
"consumer_probed|changed", let me just pick one of them then.

[...]

Kind regards
Uffe
