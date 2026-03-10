Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB33CAE8A
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145807; cv=none; b=QXnSnmupCOIfYQC+Ulpe0hqTofnBd/U5w2tWsrL0rTqp3AKfck2/KzJs4ecisK++l2wKwF8nyd3UQsNZtIR8o+g3K27dz+G15rMIb/675S8Bm8e6KDZ1t53Mxvs36UqQU3wBriif/2ugnV+QGgTmKl28UfXRUrkGCI1BIHGQWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145807; c=relaxed/simple;
	bh=wsYBdGWm/CITUFKray5ohh7E0dp/nLMZXvTvoQuJE4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNhPf7J7t35wH9m8IHif7WSEy/ZJS6YznEkzuDFzfV3q3CgouAuIytErwUp7xq+6e7A+UYKVAlbcXKFK+w7VZzRmjk0GTq1zELlyG67aS1TTdWUyRGuHAgsuDi0V8MdIYdNItMQmI5mtI9fc7VW0+D6u72MIU8xemJ+I5uheR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MR9zSZ0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MR9zSZ0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FDBC2BCB5
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773145807;
	bh=wsYBdGWm/CITUFKray5ohh7E0dp/nLMZXvTvoQuJE4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MR9zSZ0tUQgANrtqUhgxBKOkkHisgXNre0TE6jstTfFQncSSXXg9LKd0d963yIrX8
	 ehEXrczaWe/Lvw0FmNLwrFIIfw8QfFQIeP1TtfUGwVDyyzLic9qtLW+AkZYyLKPSsH
	 EV7gY2YHifFd+m5YiS6vctSJ9DOLMKK3u0KVRfLPJKgiKmvAhJOiDDxAda4f0/a9rW
	 1RKcra8hhrZwvtkWC2Uk1NqbtBxD+G28Hn3b9WDwjSmMWZ5kjmAJizvf4vrFINTU3P
	 oF8V+qXXBj34aFkqVlDD10KL32u7XUeOtEDLLrFHwXpGXL+vZfiH/xkMlnmrn1s/tc
	 59weX3+VWn8/Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a4a8421b0so23474421fa.1
        for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 05:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6FneL4TjkjOtczveBqYNuqBsrX9b2xGMCfTHV6B5ShG3iQZnBbVAGLg27eUcq5JDXSwkAtMJ8sJ4C8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKVUzC7njlA6RN2zJHE5CxYgZDofC8+geDuy/6AuBywAtI9MT7
	5cz6RtTWPsR25Gxw2OeFUARewWRlxR8cyZF7zjiWLuIoaBO9UZEbOhPetgq+oLLPJWUcyG1GJ81
	/xFzc/nVagnXtAWk4cIUEjyGjY0i3bnstWI89SG7R3Q==
X-Received: by 2002:a2e:a985:0:b0:38a:422d:b644 with SMTP id
 38308e7fff4ca-38a422db7f3mr45229741fa.23.1773145805491; Tue, 10 Mar 2026
 05:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh> <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com> <2026030921-dwindling-tarnish-6141@gregkh>
In-Reply-To: <2026030921-dwindling-tarnish-6141@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 13:29:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
X-Gm-Features: AaiRm50rdeQxvxsT6rlGwu5hFUvMtRGtmrzc2WzM18TBMwUNc6jS5TreLwcXJ_s
Message-ID: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 09, 2026 at 09:16:19PM +0530, Shivendra Pratap wrote:
> >
> >
> > On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> > > On Fri, Mar 6, 2026 at 3:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Fri, Mar 6, 2026 at 2:54=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski w=
rote:
> > > > > > > Add a new variant of faux_device_create() taking a firmware n=
ode handle
> > > > > > > as argument and attaching it to the created faux device. This=
 allows
> > > > > > > users to define and read device properties using the standard=
 property
> > > > > > > accessors.
> > > > > >
> > > > > > Why would a faux device have firmware backing?  Doesn't that me=
an it
> > > > > > should be a platform device?
> > > > > >
> > > > > > > While at it: order includes in faux.c alphabetically for easi=
er
> > > > > > > maintenance.
> > > > > >
> > > > > > Hint, that should be a separate patch, and is never something t=
hat I
> > > > > > enforce or require in .c files I maintain :)
> > > > > >
> > > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.q=
ualcomm.com>
> > > > > > > ---
> > > > > > > Hi Shivendra et al!
> > > > > > >
> > > > > > > This patch is related to my response to your reboot-mode patc=
h[1].
> > > > > > >
> > > > > > > You should be able to use the new function like:
> > > > > > >
> > > > > > >    faux_device_create_full("psci-reboot-mode", NULL, NULL, NU=
LL, of_fwnode_handle(np));
> > > > > >
> > > > > > What is the fwnode handle here for?  Why is it required at all?=
  What
> > > > > > resources are involved that would want this?
> > > > > >
> > > > >
> > > > > Shivendra creates a faux device that registers with the reboot-mo=
de
> > > > > subsystem which reads the reboot-mode definitions from devicetree=
. The
> > > > > faux device needs to have the "reboot-mode" OF-node attached. In =
his
> > > > > current proposal, Shivenda had to bypass faux device's probe() be=
cause
> > > > > he can't have the fwnode attached before probe() is called.
> > > >
> > > > Why would a firmware device be attached to a faux device?  A firmwa=
re
> > > > device is, implicitly, already part of the firmware "device tree", =
so
> > > > there should be something for it to be a child of already in the sy=
stem.
> > > >
> > >
> > > Shivendra: I rememeber there was an issue with using any proper
> > > devices like platform or auxiliary with this but - as the series is
> > > already at v20 - I can't find the actual discussion. Could you please
> > > describe what the issue with driver matching was?
> >
> > reboot-mode node is a property of psci which defines the reboot command=
s.=E2=80=8C As
> > its not an actual device we wanted to avoid creating platform or aux de=
vice.
> > few references here:
> >
> > https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofp=
dio6cwe@innio7qvotye/
> >
> > Till v17, we were exposing an explicit of_node based registration in re=
boot
> > mode and then registering it from psci driver.
> > Post this, Lorenzo suggested to move this outside of psci and use a fau=
x
> > device instead.
>
> As this is a "real" device that talks to hardware (i.e. you have a
> firmware device representation), please do not use a faux device, that
> is not what that interface is for.  Instead, as it is a firmware device,
> just use a platform one as you already have a representation of it
> somewhere in the system, right?

While there is indeed a psci node on arm64 platforms, psci itself must
be brought up very early - specifically in setup_arch() - so there's
no platform device associated with it as the driver is called into
before the driver core is initialized. It's just a function called for
a specific compatible value.

Now looking again at Shivendra's patch, the faux device in question is
created from a device_initcall() which makes me think it's not needed
very early. It can actually come up quite late. What I would suggest
is to create a psci platform device (reusing the existing
of_device_id) that would populate its child OF nodes in probe(), in
this case: the reboot-mode driver, which could then also become a real
platform device.

On a completely unrelated note though - Greg: I think this patch could
still be considered because we now have quite a lot of functionality
put into software nodes and already have some auxiliary devices that
use software nodes as a source of device properties/config using the
same API as platform devices (fwnode). I think faux devices could also
profit from it and not necessairly use custom struct. If that sounds
good to you, I may convert one or two faux devices and send a series
with actual users of this.

Bartosz
