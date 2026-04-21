Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CD1BD9CE
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761079; cv=none; b=d4Awo4qupJiLTkL1m8xgrzHvyJEYsXADakM63UupZPRGWWDm6EUr6ev8Uyw1nUoQPQmU71NtzBJ1VBn43Nv4UDFlUqgXqC+ipoh8Cyhu5gkBEMBQPWzUjo6VojBW7MEnbRNr2Lu7WMsTWbc/FiEi/4PzcPh4k32cdeAVzZLfAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761079; c=relaxed/simple;
	bh=zthUzAeowYez1/zG8ziYlvgYAZ0uD7gLuZ/57ZUOUdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcxKEOy34HyTjSxtAvEruYtGefxe7BdGA1GsNJVbhaBhUhP4BWYpFirQx3V645vckfypuB2r8A4WIRPyf0XA/rMHBoiUQTS0BaaswSu6dpjXEnIMfGf4HRML2JzvBmvlPNznYol+UPcuWnp8hLZWdJJLtCdGqXgucOnmczRSeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxMyhsSY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxMyhsSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91329C2BCB5
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776761078;
	bh=zthUzAeowYez1/zG8ziYlvgYAZ0uD7gLuZ/57ZUOUdI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TxMyhsSYwe4JqW5LRG2TETxieR6aKnQ/8SsDhgmTs0zqnzL+FKBb/KMNgqZwFpv4X
	 h9xA1jw+/ebiu99xqI+mnSGLBfrN+7Au63ksb7q5v2QABID5muZweb5poh/i2hdYWI
	 lyOH5BaABCJ2LpbbtWGGXDl/q+OGQ2pQwvbyNFOIjLva1t5r/pGMa3u9cKNAa6vBt4
	 yrOCT61gMJBMfwkANXO93Ivw268HOCwu8PNW7GjtnZifBROHEkLGh/ueSMsEbhYGZ2
	 4Z8w0BGYr3f3FhaVrqZM4Tlygs/9oNjbYD6CfaAHh8oq2lppAmvdIT3WD3DvE+d7Go
	 kU3C+x+B4hYrw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7fc3c419so36546491fa.0
        for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 01:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+R06xVkn8BI+VuPVcWYCqSsE4xbH2iwW0DVXVhD8uWCCz1TAiYcxgPLfTz64xIs6mkrX07yRohiXjweg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYVGyHfcP8bBbYeYHeaTqIC8tlKBqF5iFawBrKQDaIHCpGYbcV
	Uky7gZXX2Wp2C0yP3K1m6LtRa8HdDnjni/NpnyTo+4hUklHOxzIP2rrPAhb9q+cw6aVUnY25nSP
	HDLgsqjXjzQ14H/fWki8W//coDfTVAZDpuBCAmCHtjA==
X-Received: by 2002:a05:651c:2111:b0:38a:4c95:8cdc with SMTP id
 38308e7fff4ca-38ec7b4e457mr55226561fa.29.1776761077171; Tue, 21 Apr 2026
 01:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
 <20260410-swnode-remove-on-dev-unreg-v1-1-cd7d305f3db2@oss.qualcomm.com> <adxmFlfIcoZ19Nm9@google.com>
In-Reply-To: <adxmFlfIcoZ19Nm9@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 21 Apr 2026 10:44:24 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdE9s-aoT1dY+2uf3kFeOqPG=e-p8VyAgaMfa+tJ43z3Q@mail.gmail.com>
X-Gm-Features: AQROBzAFE8ZerNB7tjgLXmONkqDPg-4GqOeM5VpeS4ZfXOKY8uV7x2Q3MLJve0g
Message-ID: <CAMRc=MdE9s-aoT1dY+2uf3kFeOqPG=e-p8VyAgaMfa+tJ43z3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: platform: remove software node on release()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 5:56=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Fri, Apr 10, 2026 at 01:50:45PM +0200, Bartosz Golaszewski wrote:
> > If we pass a software node to a newly created device using struct
> > platform_device_info, it will not be removed when the device is
> > released. This may happen when a module creating the device is removed
> > or on failure in platform_device_add().
> >
> > When we try to reuse that software node in a subsequent call to
> > platform_device_register_full(), it will fails with -EBUSY. Add the
> > missing call to device_remove_software_node() in release path.
>
> Thank you for spotting this, but I do not believe the patch is correct
> as it stands. We need to differentiate between nodes registered by
> platform devices vs nodes that already registered where we simply use
> them.
>

We already do: platform_device_release() is only set for devices
dynamically allocated with platform_device_alloc() which is what
happens in platform_device_register_full(). platform_device_alloc()
already imposes limitations on the caller - like having to provide
platform data that can be shallow-copied as platform_device_release()
calls kfree() on it unconditionally. Even if the user adds the
software node manually, it needs to be removed.

> I think we need to mark nodes that platform_device_register_full()
> registers form swnodes as "managed =3D true" so that they are cleaned up
> properly.
>
> See also sashiko feedback.
>
> https://sashiko.dev/#/patchset/20260410-swnode-remove-on-dev-unreg-v1-0-c=
d7d305f3db2%40oss.qualcomm.com
>

I'll see about reproducing it and possibly adding a kunit test-case as well=
.

Bart
