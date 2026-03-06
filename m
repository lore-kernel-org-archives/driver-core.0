Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F843659E5
	for <driver-core@lists.linux.dev>; Fri,  6 Mar 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806038; cv=none; b=cUpnTwPUUw9gKuX7RHfQI2Dz7MdLo7kHVlpWzB3znOuKtVH0OMmRT8z09WSg2FUaM4cjb8UlOsdFE3Tkz8dzE6JgzH83BjBJChGo/xxGC1vGDJk17tYSBAxAQJ7q42neMkMCnbCcLDoqOCuyXZdsv7wF49rrDy2CBYD6qLSmLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806038; c=relaxed/simple;
	bh=n/cBPLhChv/inzfeC9Zr2zXgyWO+5Mq5+UcCVkpBqlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDes6/K7mJwShq1NiGXqUKW3WcAV5ABPgg09NFQKorpRDFaI4uVAGVzcgfTmmAOfT+RxyrxzCqdH23ts8fuctv8FVmYlzMSq0yijWcl+wRl2LpSZKCi7XB9YA1CJBFULL7wgB8pNeGllOgAf3UtdbnwTZLMBoIz2smbvwsD390U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsP//Gw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsP//Gw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA5FC2BCAF
	for <driver-core@lists.linux.dev>; Fri,  6 Mar 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806037;
	bh=n/cBPLhChv/inzfeC9Zr2zXgyWO+5Mq5+UcCVkpBqlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XsP//Gw9YkOuNGy6eeFuAf6QTaYo6quwY6KoneDkR/bUn+OYuHGW/tUj4hoo0qUUo
	 J66nMfBnxM0lGewhmii0A6GO8+JTrm+vcZ0r8KbZ6WuZRmmhlmWmmiY51cX4ekhqkM
	 PKDDkxNgCQ3cXIOtMy/ebSXAEMDx4WzKqWbBCfcA3WxDfNvOQimeaxgOQgSCeE88Rh
	 KCiAJan0iyAh3f8xktX5LrDIGRf7uGJsrwwL1uG8XFhsUOxDLrzO7y1zJbL4DQHTFP
	 7Wb/CcZHgUhrrqvNRkDPYzMaCctRiPf8tanLILyH+TBuDosp0hD7UHIiKJiNTuxE9l
	 qJnKT5ia9wpOA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a3225d59fso24919791fa.0
        for <driver-core@lists.linux.dev>; Fri, 06 Mar 2026 06:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNCLb1sJTppDFOI1UTeH/ZloN7fCMr3pGpD3u8IzCiHTB5shc0rGCqQza0g+PqjL+VvPyG9BTHY1NPKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZEMSdZVY67BiJOPYFl+XoTvZ65h33lZichn+DtrXEMX4j/okI
	wcfDyoRnT6qnUWqpgbOQ/rBBBvXpdHLyaMV+AD9gMA2jlop2G9NdviuNXtF/CcmD1iLp3Kncm/4
	2UDHEnaXheTX1C4QQeXVfSGsJK9rmfieJl+bTilSkqQ==
X-Received: by 2002:a2e:a106:0:b0:389:ddc6:a4fe with SMTP id
 38308e7fff4ca-38a40b5d408mr7631401fa.24.1772806035247; Fri, 06 Mar 2026
 06:07:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com> <2026030649-evacuate-emotion-422c@gregkh>
In-Reply-To: <2026030649-evacuate-emotion-422c@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
X-Gm-Features: AaiRm51_HBoeFMVlIxIkybRwVanksoQG98IzDDGjsZs5XpU5CbLPgWBCOLwZ6lY
Message-ID: <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 2:54=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> > Add a new variant of faux_device_create() taking a firmware node handle
> > as argument and attaching it to the created faux device. This allows
> > users to define and read device properties using the standard property
> > accessors.
>
> Why would a faux device have firmware backing?  Doesn't that mean it
> should be a platform device?
>
> > While at it: order includes in faux.c alphabetically for easier
> > maintenance.
>
> Hint, that should be a separate patch, and is never something that I
> enforce or require in .c files I maintain :)
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > Hi Shivendra et al!
> >
> > This patch is related to my response to your reboot-mode patch[1].
> >
> > You should be able to use the new function like:
> >
> >   faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwno=
de_handle(np));
>
> What is the fwnode handle here for?  Why is it required at all?  What
> resources are involved that would want this?
>

Shivendra creates a faux device that registers with the reboot-mode
subsystem which reads the reboot-mode definitions from devicetree. The
faux device needs to have the "reboot-mode" OF-node attached. In his
current proposal, Shivenda had to bypass faux device's probe() because
he can't have the fwnode attached before probe() is called.

Bartosz
