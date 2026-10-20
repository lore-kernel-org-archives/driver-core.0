Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512156;
	b=Y28bCJmgPOQmFSX0W1ZabXkN/N9AWVhg+adf7L0DGfTM+JWfqnN0EPVw9tDzj02wVh/v
	 pnC8pu3/vGC8rNNJBOFs5m1wILnkdOrGCXZ5hah9fPa07EvAlbuiaBL2Z6/KAKb0Ykl6p
	 7XMntwdwt0M+UMQwpp5vHrhNoN3aGC/DL5rjlQsBOUtY+bAeHE8jmAXBu7cotMJC5f9HI
	 JoVgR4ODYSPPLWEATGKGBuq/onwLPdDYoUSBbK4lr9nc0iLEXfGmLXJhCoC016duO/1TU
	 JXn0z8CB2aZX1gefaOfwW4lyBm411kw4fpv+U3i9oxBK7LaOijz2W5/oGLs0Td5X0Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512156;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=T6Xn0GgbQ2LS6M/ihkwGknyXfBAZO+tMr2iX2I+xIjg=;
	b=uHD5BFtgDEhGC27IXgaYc/F6MUXlHSysSQymIqpqOXmSqDBexvlgfIuYUhEnEp5xHx3C
	 v9Hd0CoJwOkoeg3nLmTZVZOdQJePZ8O2fB3FqE5riQH3h+Gy9I2lb69HCXoYeenspKkQu
	 vdlExsHU/nyvHLhVtn1+QCuv4AwO5S6OyRl7heH5h1j7gZzeexGxTdyNccDdezlb10EiP
	 DPWJY0ZqBG6xn7R2OzmmaLNne5m6x5bnnMXlcmy+pSPr6hl6BSgPp2rgYz3eipzawzf5J
	 ru+l0Y5txZgQSS6W6Nd9y0Tm9y62LwQCAnwwSwHI+T7DQ5HXTRighHSRWRPran/Nt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521C606A321
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E421F000C4
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:02:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3db57938so2922483e87.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 09:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuJUk0rn80juqx69Cvh3yqkkPPtAur437HHUQ+nVbY3nknnz+LC8Wrmn+/Zkotpsg6l0aXdYqc/z9xfg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKFXY14aWFvHL5da7phJ/0ExeUBFWm7K5CnQP25Xw8fr3dVIEC0
	kX1q2csdj8a0PvnrNDBI7rLRIAyp+iDm3jtqzcY/ScwErU88/4XkGCSDUEiI2uVM4Dg7RbZOy1R
	SZfptdxMA+t1D+RNwo92gE4gaSIe49dk=
X-Received: by 2002:a05:6512:3d8c:b0:5bc:d9d6:6a98 with SMTP id
 2adb3069b0e04-5be50a471cbmr3402594e87.10.1792512142493; Tue, 20 Oct 2026
 09:02:22 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local> <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local> <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com> <asieTvinZ7c2QpQm@red-moon>
 <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon> <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon>
In-Reply-To: <ateI-JcExDyfXKrs@red-moon>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 20 Oct 2026 18:00:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h+S3z3YqpJYCwcZXpPNEawedSof1z4+ydWn=tZbL8L6g@mail.gmail.com>
X-Gm-Features: AclHuK8HDf2yPjcd4rawrCfnLbX27pb5S5MNqmvyCllH3hG9fIPbIUdmHBI-lNo
Message-ID: <CAJZ5v0h+S3z3YqpJYCwcZXpPNEawedSof1z4+ydWn=tZbL8L6g@mail.gmail.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:30=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Mon, Oct 19, 2026 at 12:34=E2=80=AFPM Lorenzo Pieralisi
> > <lpieralisi@kernel.org> wrote:
>
> [...]
>
> > Basically, yes, the idea is to defer the creation of the platform
> > device until the dependency is met.
> >
> > > till the dependencies are cleared but then, without a _CRS, where wil=
l
> > > the consumer driver find the platform device resources ?
> >
> > Well, good question.
> >
> > > There are multiple facets in this issue and possibly some of them hav=
e
> > > been already solved but I need to pull them together.
> > >
> > > > Note that the dependencies can be added to acpi_dep_list after
> > > > creating a struct acpi_device with acpi_add_single_object() and
> > > > acpi_scan_add_dep() is not really suitable for that, but it should =
be
> > > > doable if the dependencies can be found.
> > > >
> > > > > I need to have a deeper look into this next week but I wanted to =
ask first
> > > > > whether there was something I missed - most likely.
> > > >
> > > > Well, it is not really straightforward.
> > >
> > > Yes it is getting messy. This RFC, with all its flaws, does not trans=
parently
> > > prevents enumeration but rather relies on -EPROBE_DEFER to sort out
> > > dependencies - though it does so by adding more stuff into ACPI stati=
c fwnode
> > > that to be honest I'd rather see gone.
> >
> > I think what you need is a notification mechanism that will trigger
> > when a specific device (enumerated via the ACPI Namespace) becomes
> > operational.  It doesn't look like any of the existing ones (platform
> > device probe deferral or ACPI device dependencies tracking) is really
> > suitable for your use case.
>
> Yes. It might just be a notification from ACPI core to say "the driver fo=
r
> this ACPI device probed, go create platform devices that depends on it".

The ACPI core doesn't know about driver probing, so this notification
would need to come from the driver of that specific device.

In the regular _DEP dependencies case, the drivers that provide
dependencies generally need to call acpi_dev_clear_dependencies()
which triggers a dependency list walk.

I guess driver_bound() could do something like that in principle (it
does a similar thing already for deferred probing), but I'm not sure
how generic it needs to be for this particular use case.
