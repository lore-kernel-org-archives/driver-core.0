Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCF3B6341
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514056; cv=none; b=DF4swwvbdhXj3oCOyJm4c5V1wjYW5sVeXG7JHG2arAXaPxYKfElN4pDGJ4BWrd6WSflTWV3wWlrRzr+nnsXtrVXM9Arvcs1BvpWfyuQUEagufKz9wfRRD3jxWrtuI7z41b8mq81CWO8CSUsiQFTZPoylysqZ82JTIAnyhTRN4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514056; c=relaxed/simple;
	bh=2GPPwrhAS/2I2dEVlIZY4TiBjyyp59j5dJ3UrXf8juw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXEObEbqpLWUaFVA1GMzPnpMNcZw/+iA1mPF0qj0b1vGYd+reXVUs2xRVtUGyykp/UQLqyL5ISWBGlE1oKa1VHiAskzBCwUijQ+JzI9R8NE39UEORRe4+EKdlfmJwmU61UwLDB/9GwFQwFfxaGjy1YOvsIhUVgKLXtJff314Lwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxDgz1A6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxDgz1A6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5363C4AF09
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774514055;
	bh=2GPPwrhAS/2I2dEVlIZY4TiBjyyp59j5dJ3UrXf8juw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qxDgz1A6R+w/KzhI/4/WSFtxgpL8+9DDB4YndvC2jpcVypS9VEpAp13Xhpd1vhbGq
	 Mq+Rkzy2jmkE0tlm71h9RlYo1UNHfxn8T0ZX7Mkxv9JBxkE/SxLlD/mR1xK459/NZ3
	 SZq4zwpNZXcyZpYpdc0neo5PLlK5uPshoTPKnZOuDJZRUXT/OcLUGhH2Qr0EliKtPt
	 6tJi6T/3Xdbl3eqVTjd4RcQ7Qqw7uxQqYVCuKQRW1MIcv4szftUHHOxc/B8lm8+R9+
	 +Nh7g8fGjOo0QpRrzWuym66vnUMEume9wxIK2dGYy+jbePhFX5Eaf32sNJtj3bDn1L
	 tPoQZBJQT5k6Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38704f70ea3so6625801fa.2
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 01:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAXVBl+7itnYwrfs46g2ohgGXJq3MwAlzP5Q2lBlTUbeXgNX+/K5OK8Hx6rY1q7ntJ/EXycA4FzRCHcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcJC5C0MParwu6CPLtMNMygLEpYtZpPr9u6B61PlzuU4jYqhRB
	wpzpACi0GTV4sKrmbFIb89uVFAeThKVg1Ap70NpV03eIsvWUYMYhO+WogyTwiaVDwa8O+9PAZDM
	4929tdUvX7nhF4jt0tJ6cWeikJpzqI4zkf31y2v44WA==
X-Received: by 2002:a2e:a98b:0:b0:38c:4b3a:32f8 with SMTP id
 38308e7fff4ca-38c4b3aa48fmr20651991fa.5.1774514054310; Thu, 26 Mar 2026
 01:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <acIV6xF8mY-8wd5e@google.com> <CAMRc=MdJ0U2_ZQ5rP0Vmbv7+-xurf9F+WOwD3LwV=n5Fx33U=Q@mail.gmail.com>
 <acK69OColNT7ViLf@google.com> <CAMRc=Mcw66QpjQt4+_JdMq9JiAY28hjzNHa24gfOCCXyie-uRQ@mail.gmail.com>
 <acTtzuGD-K5XvVir@ashevche-desk.local>
In-Reply-To: <acTtzuGD-K5XvVir@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 09:34:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeEMx1w5HaXBUP6iAu8T8b7Ti1i7JVDDTwvpjaEOtDJuw@mail.gmail.com>
X-Gm-Features: AQROBzC-il97F7Nv94OXjqjdeAzVfHinFNT9M4SjDpdWPsPzXiV_3k7cYz_77i4
Message-ID: <CAMRc=MeEMx1w5HaXBUP6iAu8T8b7Ti1i7JVDDTwvpjaEOtDJuw@mail.gmail.com>
Subject: Re: [PATCH] software node: allow referencing software nodes by name
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 9:27=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 25, 2026 at 05:32:06PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Mar 24, 2026 at 8:30=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Please post the reworked version so we can review all the details. My
> > > concern was that it relies on notifier chains to notify when devices
> > > get registered and unregistered, and instead of matching node names y=
ou
> > > now need to somehow match device instances and software node instance=
s,
> > > which again likely is done based on some name. This just piles on
> > > complexity where a simpler solution would be sufficient.
> >
> > I will post it. Hopefully before the end of the week. I want to cover
> > both OF nodes with paz00 as well as ACPI with android tablets. The
> > latter case will have to wait for devices because there's no way to
> > look up an ACPI node by name that I could idenfity (correct me if I'm
> > wrong).
>
> What do you need from ACPI exactly? The ACPI namespace in the OS is repre=
sented
> by set of ACPI handles, each of which is the object pointing out to some =
object
> in it. Any object in ACPI has a unique path. At any time, after parsing t=
he
> ACPI table(s) into ACPI namespace we may get a handle based on the path.
>

DT is unflattened very early into the boot sequence. Is this the case
for ACPI tables as well? Knowing the name of the device (HID + index,
eg.: "INT33FF:00"), can I check if there's a corresponding ACPI node
(of_find_by_path/name() in DT parlance)?

Bart
