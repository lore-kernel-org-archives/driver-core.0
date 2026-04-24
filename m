Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6383C5DB6
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033612; cv=none; b=T9zgizpZEvCYe20RWdzAKCGoH4+HRHhEmzIxdRhBTdBmO3Utg0Bu5ZsR1dfLm3Cx/BxVuiiKyyoLTtuFLqbD0e2dIztRhJ2X4IKehNnBZazZdWxl3qsH72AQrtKCoPOhj4SKxkFlzed9y6b0SzRCLypDa+xV2t8Spq6lIopHcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033612; c=relaxed/simple;
	bh=wnKLPa1uej/o1vrw3CxA9alePlMkKpC+cfG/oCAW1pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj27N+JkbPRyhYdg2ZJEr2o8xf1cgCPnA1X3mMjLlworXBdmNCNrfoqw0q8eUX8RQIwPxZ7jyR5KzAYBA8kSJBeiJwBnO0OHpgkTxSIUFGtRc9G0ngxq7YAz43FCk3/BjTLQ9ZGMwYZvkjhtr+e3FlZACanJ1NkPRcy8Nfhu+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgbsytNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgbsytNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F229CC2BCB6
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777033612;
	bh=wnKLPa1uej/o1vrw3CxA9alePlMkKpC+cfG/oCAW1pI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FgbsytNNIf+VH3ugBO8E/9ataaPKdkXMxRCpVat2dUryqcm/xBzJO3YOJ6LSjQNLF
	 RW4MH5TI+UqgTZsioH97Kmqbok2eVProp/kmsA+ZX6eBEangnemBtiv8Wowdn9whZn
	 EtZFXLo7h+3OmktBIxGbwyI/gQDQVJzBDmppITo1iKPae4V5i7nB0BCbjDUuq7RvbU
	 mOwrJLyp8AmG7lBVGmzXSNDFeaKBSHov+/mL+sratdyTE+z9Nuj9RAsYy04kA84zxx
	 hn0gsMNYLRc/VNtZY2Es6oNpGiKR9y0vvpeoRiqDcg5HUOn1ntVNbMcdho3osa20CJ
	 qBcxt9jUgqF0w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a283c44478so13212282e87.3
        for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 05:26:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pKnXzFr1KJV5WZHuks8dPyXkVzpxQLEHhSi3niZJlWQOe9m3ZUYynyB8mO3D26Q+g0MOkArqRQrHiYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOfBoXvlMtp/63z0IDNtlh6mV0pE1SBxmcnkfUj9UNH4jGywSZ
	k1DCHbxuPmSOfV70dK7JojGjrJtAPJpo62lR9htGm6S4l0jMfzuzWSz1GvLmPPQwSvHhL/vYU0K
	9tSv6wgS4+wDoo5fhxaC0AZ910aRx8eKpKfJ59NUDXQ==
X-Received: by 2002:ac2:4c4b:0:b0:5a2:a355:aa4e with SMTP id
 2adb3069b0e04-5a4172de25dmr10102146e87.31.1777033610661; Fri, 24 Apr 2026
 05:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com> <aepWdKzd8GPeayNJ@google.com>
In-Reply-To: <aepWdKzd8GPeayNJ@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 14:26:38 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>
X-Gm-Features: AQROBzCHLScsUjboeAqJevVU_hb-dqPkjAWviyUz9vljcrjGlui8EiZ7lzxfDPM
Message-ID: <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on release()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 7:32=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> >
> > +     /*
> > +      * If the primary firmware node is a software node and there's no
> > +      * secondary firmware node, the primary will be affected by the c=
all
> > +      * to device_remove_software_node() in platform_device_release() =
and
> > +      * its reference count will be dropped by one. Take another refer=
ence
> > +      * here to make it have no effect.
> > +      */
> > +     if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> > +             fwnode_handle_get(pdevinfo->fwnode);
>
> It is possible to pass already registered node in pdevinfo->swnode
> (because device_add_software_node() can handle this just fine). In this
> case we also need to take an extra reference (or figure out whether we
> need to drop the reference when removing the device).
>

But device_add_software_node() checks if the software node is
registered and - if so - just bumps the reference so the effect is the
same as when it registers the swnode.

Bart
