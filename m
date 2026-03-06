Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081D359714
	for <driver-core@lists.linux.dev>; Fri,  6 Mar 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807084; cv=none; b=JTwbSUBYXJZYU+/6RqrbozgI41JhVa7Fl9E1qR+AUKyozRzodayzDmcgWhEV0pifdoDcxKeZM+sx89BTivp98gJCpbHUGonjwHSGHPzIWPZF4qTSow5KoMARAWRZ2dEg2BTS7xkjltJS8aS8fccIU5DybQxgD+XyRJ8/6GLDBBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807084; c=relaxed/simple;
	bh=hl6pFNxP7jj3KljVsJ9bKVelwITBWKRNPNiCZgqMdC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLuR8/EpTaEQnAhRDrSTX89o7JxAw3pVMc4pVb7Rb1MyfBGkZ4i0IAxmoz6HZoWZh3uALvJVRwZBkxQY+gyo0LoBnoGvaGa4kHWeAcykeTYh0DT6Le3rpxdRbyFCti/Swhu3kc8qw2zhNCvBLVjgBrIo2hCeteFinhYXBowuqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex0nrsjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex0nrsjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67933C2BCB0
	for <driver-core@lists.linux.dev>; Fri,  6 Mar 2026 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772807084;
	bh=hl6pFNxP7jj3KljVsJ9bKVelwITBWKRNPNiCZgqMdC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ex0nrsjO43dbmooTnx5o0/AEl7X+jdgE94PqzTsTl+41YJjU5EDnDYTQ52xd7g6ok
	 CQPFs0Bk25y5o93zkEr6+0d1KDLWkGtSa/VfBDadTXbNOW/P0FUpDaZjXH0MHJkvJy
	 SlCo4CGTTe1E9aeR5az3mNtjZTWgMIPPeSmDt/GVm630opgiFspS7kqOKpeyhs+qId
	 KvXJfp/+oDuWzA/hdDfSjPdmCtAb8P5GeZ6UTbGBJQz1GsoD0L0Uva8oAKaThQqgF1
	 sjwhpVe8ESFPQ3MDxCcjvpBCmABu0nZJsp+35JjnMky8s1uW5f+LDz84td49w/4MNU
	 ARj5usrEo30XQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a41026318so5051741fa.0
        for <driver-core@lists.linux.dev>; Fri, 06 Mar 2026 06:24:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLRUeRdmyPVBXO4Dg3TlIJ3TCZkKFzfIIMEbWaJWAu+oJYeVucMTo1EnYwAdNtO7DN04es55U5RcQTVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOXqJOdDiUmxc8NYebDII6qf8kC+9VK+ISX6XYyT5M9hbCkjQy
	KCdDB9lImUi9kn4mpmmC5OboPMCSt5FYIH5dcH/H8jrAEmfnywa2OBjmzZY1UJwmn2JbYgJVQGe
	2yr4TObXRxodS7nxQ99wW8FNkbKKzoKf/sc9D8LoqLg==
X-Received: by 2002:a2e:ab10:0:b0:38a:27e:b931 with SMTP id
 38308e7fff4ca-38a40b388bcmr8447511fa.6.1772807083040; Fri, 06 Mar 2026
 06:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
In-Reply-To: <2026030612-collapse-empower-285f@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 15:24:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
X-Gm-Features: AaiRm52THfaU4XmFd6fm4aH4qJ4NVJZEh6FshZ52F96OCJ8r_i80QV9Cq3KMVvQ
Message-ID: <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 3:13=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 6, 2026 at 2:54=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> > > > Add a new variant of faux_device_create() taking a firmware node ha=
ndle
> > > > as argument and attaching it to the created faux device. This allow=
s
> > > > users to define and read device properties using the standard prope=
rty
> > > > accessors.
> > >
> > > Why would a faux device have firmware backing?  Doesn't that mean it
> > > should be a platform device?
> > >
> > > > While at it: order includes in faux.c alphabetically for easier
> > > > maintenance.
> > >
> > > Hint, that should be a separate patch, and is never something that I
> > > enforce or require in .c files I maintain :)
> > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
> > > > ---
> > > > Hi Shivendra et al!
> > > >
> > > > This patch is related to my response to your reboot-mode patch[1].
> > > >
> > > > You should be able to use the new function like:
> > > >
> > > >   faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_=
fwnode_handle(np));
> > >
> > > What is the fwnode handle here for?  Why is it required at all?  What
> > > resources are involved that would want this?
> > >
> >
> > Shivendra creates a faux device that registers with the reboot-mode
> > subsystem which reads the reboot-mode definitions from devicetree. The
> > faux device needs to have the "reboot-mode" OF-node attached. In his
> > current proposal, Shivenda had to bypass faux device's probe() because
> > he can't have the fwnode attached before probe() is called.
>
> Why would a firmware device be attached to a faux device?  A firmware
> device is, implicitly, already part of the firmware "device tree", so
> there should be something for it to be a child of already in the system.
>

Shivendra: I rememeber there was an issue with using any proper
devices like platform or auxiliary with this but - as the series is
already at v20 - I can't find the actual discussion. Could you please
describe what the issue with driver matching was?

Bartosz
