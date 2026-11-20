Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177829;
	b=UYNCyeiBbrww3ZzBLUkXKeSxB9KBCRqOBIvYzqB3ktDNRM4yeVi1p04Y/NM2hTE3eQfF
	 Xw/38YIMMUZi2Uh3x8Cy+FWDJMVpRSzaXQt/YSfP1XFfuPQEd9nFHYeYabtni3T6a9phY
	 qY22NXeULD9cv5odjCstUtttBkfcd0r86LDjthpp6AZ1tLENDOXbx06RiKC5/IehNWzKp
	 pUsprQS3ENMsxSWFYYJ4XHRySoRe8hLCPZ6Dc99gh8gUicac+h0cGGZOXD9wd24XPjoQF
	 NkPkRabklCivSG0RJ/Zz3v9BkqXcsPAsNkUsFnP/LeztW3f+sC7x52/QmfXEWpiMr/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177829;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2CzzDn3ucdlRM6Q6yIuZcgRMk1ELXmAjK6dNGrcYuQ=;
	b=Szr3m6uPNrYWpPRYHoWrF+uirXdtpWDRsACRZAbQ1A8TRpm8/P7zVslTLTArPPM1fCtO
	 kGuJ/Zhm6SCo6LQd1qKRx7elzKGUOFRZTETk2EZnCDYve5CfPM2wDBJs6NLMvTEPzH/Xb
	 pZg7z+f/uM84RcOdPTtV4+LgxGbdDbnAMXM7IZtmDdUBkS385K422dhOGcbbm6OJDRX/6
	 maI4PnEMBxJ4g8avjZyYqxbKSBmv8RWMqDMXorBLKaGXeor1ugp/6/FxfXL63DML0Rz6N
	 54bWn28i0P0Cz9+PTi/ARhD8AQeCz18wLU03jBAatFgkHeOUwd1d5VLNsg4b5HC90nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvQVJNcu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C62606A330
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvQVJNcu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178241F008B2
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177829;
	bh=D2CzzDn3ucdlRM6Q6yIuZcgRMk1ELXmAjK6dNGrcYuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MvQVJNcumbWOrzjxKNGYXhwx0IqI/ui9/A/NI/x3THyuGDyzcmPzvrixTz7bWgulw
	 aaF0+EjEYU5umKWlh+0LvkgzchQUgpU4i0HevtPCFfWPriLD1RQ2+/BCO1X7CVxCNq
	 BjnVN3VBwrU9yVnp8Uis358h2ouctx1bUCVyrmDFcvcXDaEHUm9usF9s6w+rIL+T/U
	 BTYc5xIBE5/WYQGxJZUytT0pllApwmu1CHJ41ZgXyTLD7SlCa+KYwtJc2y4inZMk7t
	 9XPgJgwpJEcrhUf77N5SY0LSZeMacD8eZrxf76l06HmussQ2vTnOMjIpechrpCT3Tf
	 30uHB2oUpZMag==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1957763e87.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHtOqB1ltnYc8B9QYSxcbzZhUZT7K6L1N3VnV9BrQk9gGddZY2B2hZzPiHsbP5atPoJ0chlbhM/wtbuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9PykfI94zPOs/82X9afBQYvFnPNis8Cjd7jREjqMEdQM307fwX
	Kej0idsv72OGFS7tbSlh3wyo7SWDIU52yd4GNOz/JMf3FKp7t4Azphaj+mtVYu7lNKl4EsTe88o
	S7FsnybG57CcAufLQWEviBKjcVbT/x88=
X-Received: by 2002:a05:6512:2513:b0:5c0:307e:e114 with SMTP id
 2adb3069b0e04-5c1bc8ea5c4mr772357e87.25.1795177827417; Fri, 20 Nov 2026
 04:30:27 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1978814.tdWV9SEqCh@rafael.j.wysocki> <3453847.44csPzL39Z@rafael.j.wysocki>
 <c1a2c90f-c667-4bf2-bbc0-2cb3f840ad97@rowland.harvard.edu> <CAJZ5v0jX8iR5x2eS1uAf_P12Ke_OBq6kx2FRCiVuSRRRDgMzLQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jX8iR5x2eS1uAf_P12Ke_OBq6kx2FRCiVuSRRRDgMzLQ@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 13:30:14 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j39Wzb3F+ACHC+KM49oruUuekN3fDzJFcfHTtnDXqk+g@mail.gmail.com>
X-Gm-Features: Aa3M54pXfBGYjeRmljNbzHspqgJ4KhYbwJXOHAc8EDlXH5N6zPLSJn9-2so6iuk
Message-ID: <CAJZ5v0j39Wzb3F+ACHC+KM49oruUuekN3fDzJFcfHTtnDXqk+g@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] PM: runtime: Drop space characters preceding labels
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Linux PM <linux-pm@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:11=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Nov 20, 2026 at 3:47=E2=80=AFAM Alan Stern <stern@rowland.harvard=
.edu> wrote:
> >
> > On Thu, Nov 19, 2026 at 09:17:08PM +0100, Rafael J. Wysocki wrote:
> > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > >
> > > Drop space characters preceding labels from the core runtime PM code.
> > >
> > > No functional impact.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> >
> > There actually is a valid reason for keeping the spaces before
> > statement labels, although you may not agree with it.  Namely, the spac=
e
> > prevents "diff -p" from thinking that the label is the start of a new
> > function definition.  That's why I put a single space before statement
> > labels in the code I write.
>
> But this is not done elsewhere in the kernel and there is already some
> inconsistency in that respect in runtime.c.
>
> Since the next patch is adding a new label, I thought it would be
> better to make it all consistent first and I chose to follow the
> common kernel coding style.

I can drop the $subject patch though if this is an issue and make the
next one put a space in front of the new label.
