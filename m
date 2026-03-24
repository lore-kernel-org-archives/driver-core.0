Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895926ED4F
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380656; cv=none; b=LwlyyLqM+P4lGeJJEpm5xoOkKxeh7ZdhsMK1QHJNMM4qXUsJeIfEGiqnaKOvoVz4XYXqAwky3KUh7OFwri6nV/+9F0EWVUr3qkgVlUwRlTqw2e3Asj+u/TINaj1O+YRJUiuRbQ9/hAXt/+bsGsRF9r/BSK0QRE/DE4ImHKnPgr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380656; c=relaxed/simple;
	bh=r38S0nWhhaLmeZEvISs8X/+v1UT7b9ltLpdNkOhId64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzNVoKYDivdsyzk7sUxrczSygnH8NBSts3xlfx3iOYvX0RF0GeJ035WJw25uLlUTCXFfXkrSnelsgOsfIKDa0LFlAOyyB/dP99UAjqg+HRKQ6CfveSkmTggwnU5tjvB7M1CwyaUlhY8BeejaWEzFv+Jn9POKLjZIrBDak8KEwqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O03n1ntz; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O03n1ntz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c11c43aca0so191740eec.1
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 12:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380654; x=1774985454; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypx9rfrY0J5L5iqrWjidoVBfIQ360TmZRevjJTH3pYc=;
        b=O03n1ntzwrsIlC6KV8m8NUeQyKsL0dpP1MQNTFvO+z25Alw4GwapnKn5TK9lFi2hmV
         niCOR8qz0SWN7cDv33K0rHkZeCugU4ghhKkBAhzm+VBYUg4cj0yI611sHE8EvFNeEP3H
         GAU1MvJp1YFMqHeDt/WvtIgTl0N5JY9YUCw3obHVEfeORKJHZiYo4cS1hKArI+gnN+/+
         rkLDxDyAHguQLfSkdp0ZybXpucQCZIBRwi0heLVYeuU+yVr+Fx98wTmyxsZV3qlJI+JC
         ANk8xTVQyi8/5nljql4B3yIVx0P+cPwcofR0i832kwtNgl/x4sVLuSibjUI082v8y6uD
         ZYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380654; x=1774985454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypx9rfrY0J5L5iqrWjidoVBfIQ360TmZRevjJTH3pYc=;
        b=S3xJG45MrEatZTiMr7IzxKzvRdk/ItfiBGoIGMHZc5SQBo2YL1JOpcvBfmVnLcUTYU
         00bu1jshoMpm+iAxmomu1Wag6fKkbh0HxKlLnTvJQ/xMocZncDtNlxQ6vABu4fAEWQwF
         JE+A2XZa+lrqmb9pqt1EFgGod//l4kqjCbaF4i9W8elZ2p/UORQ0m+vFPEGyECBGEk07
         yvlBWSeQxUZwuviibRHlX6e92OBdVCm6C1qrtbRqxPv2jTcWJ5mvDU3XA3pjdBCoZulQ
         TH+gTGEO2H7S0jryf/PsCi4Kn5Obm41JWnayA5ULQy+b8irDmCpvG0oFbMYDExFgRZur
         Bdkw==
X-Forwarded-Encrypted: i=1; AJvYcCXsco7VuU6cCfh/2V7/YLbzpAgJkAyFyjgEAZslBMm2O5KZokApVK6wggucDjQLx39jQY3gwM2xpSaU0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqbwsUYQwIxjhmEmW1qFsYYIXqWKaeTDows0pptljiz9+uN3aH
	fjjvT2LCefrefJSTi+2E6A32MnUWaZBmI7BqtH29X+KJFKNwOFJ5PwfR
X-Gm-Gg: ATEYQzxFv547I6KQMGHdYINH0MMaLhrImPsbyJQlSqGSE+GolNjTp3GgpujYLQbrok4
	IrY7ab8ltr38n/vw41WoKWhsF3HxTNR6m51Mrsm19j6dH6bEw3IBYUhNiX7uQj+pbkzTEYejPU4
	S60ML3dxzrX18qao4iTuntUdho2dk1w/M4xuGxGfL/W2sYYXb9xdwdZbLm6FFFq8gNV36G/QKy+
	Qu+rsyrcgQkKCI77IP38jNPRR2E5EjtWw8nhy6UrexUnjH0Yb4NZvaBdOSLbwjOwgOfkQTVc4Vp
	EVGRg4mSdS6PQjECTAutk7QL8waAZb+KLlHDNwliE4q++NR4mys0gZJSZjIMJRMbMxGLbcuCAwX
	MA0RmuB8TUqKlrND71zGu8WMkcemI8QNZaASXRmkJiV8XtjaRPkK7/UnTCPUD9gyjIwcu4diOtF
	hKtCzgu9kwTjBEL1auzXCMBKQtLINJzzifXK7W5k7MXJVcECi88oQkMahUg6wPJaTr
X-Received: by 2002:a05:7301:6782:b0:2be:b02b:1b3f with SMTP id 5a478bee46e88-2c14b58ec59mr1864194eec.13.1774380653336;
        Tue, 24 Mar 2026 12:30:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm16402723eec.12.2026.03.24.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:30:52 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:30:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: allow referencing software nodes by name
Message-ID: <acK69OColNT7ViLf@google.com>
References: <acIV6xF8mY-8wd5e@google.com>
 <CAMRc=MdJ0U2_ZQ5rP0Vmbv7+-xurf9F+WOwD3LwV=n5Fx33U=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdJ0U2_ZQ5rP0Vmbv7+-xurf9F+WOwD3LwV=n5Fx33U=Q@mail.gmail.com>

On Tue, Mar 24, 2026 at 02:46:06AM -0700, Bartosz Golaszewski wrote:
> On Tue, 24 Mar 2026 05:46:50 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Currently static device properties references require either an
> > instance of software node or an instance of fwnode_handle to be
> > available when defining a reference property. This may not be very
> > convenient when device node is instantiated from a different module
> > (which is usually the case).
> >
> 
> For context: this is a follow up to the discussion we had under my alternative
> proposal[1]. This should ba an [RFC] too I think.
> 
> Probably unsurprisingly, but I'd like to express my opposition to this idea.
> The final decision is not mine to make and we have yet to hear from the swnode
> and driver core maintainers but I'll present a couple arguments in favor of the
> tighter coupling.
> 
> > The original implementation for describing GPIOs using software nodes
> > worked around this by creating a detached from gpiochip instances
> > software nodes, and performing matching using gpiochip label and node
> > name. The gpiolib maintainers rightfully questioned this approach, and
> > currently recommend to attach secondary software node to gpiochip
> > instance, export the symbol, and use it in board file when instantiating
> > static properties. This unfortunately results in tight coupling between
> > gpiochip drivers and board code, necessitates creation of header files,
> > requires adding Kconfig dependencies, limits options for choosing module
> > vs built-in compilation, and alters device initialization/probing order.
> >
> 
> In my first proposal I did in fact create a header and put the software node
> definitions in the pinctrl drivers. Andy pointed out, the software nodes should
> live inside the android tablet drivers that rely on them and not in the pinctrl
> drivers where they would be attached on all the platforms, not only the tiny
> number of the ones that need them. I agree with this and plan on changing that
> in my v2.
> 
> We also discussed the possibility of returning -EPROBE_DEFER if we resolve
> a reference to a remote software node that has not yet been registered as
> a firmware node[2] as it's a situation similar to a firmware node for which
> no device exists yet.
> 
> With the above changes to my series, the problems of link order disappear and
> we can create real links at build-time with no need to set names of software
> nodes (which are typically not required and only used to display them in sysfs,
> unless someone uses them for matching the swnodes to devices that is :) ).

But having them is strongly encouraged anyways.

> 
> IOW: for v2 of my[1] series I propose to put swnode back into the android
> tablets drivers but still use the mechanism that will either wait for the
> relevant platform device to appear or look up the matching ACPI node. If the
> driver tries to resolve the reference before the software node is registered,
> it will simply defer probe, though if we can use the ACPI node and not wait
> for the platform device, the registration will have typically happened before
> the driver even gets registered.

Please post the reworked version so we can review all the details. My
concern was that it relies on notifier chains to notify when devices
get registered and unregistered, and instead of matching node names you
now need to somehow match device instances and software node instances,
which again likely is done based on some name. This just piles on
complexity where a simpler solution would be sufficient.

I think this approach also will give trouble when there are multiple
users of GPIOs provided by the same gpiochip, in cases where users are
split across multiple modules.

> 
> > Solve the issue by providing an option to use software node name in
> > place of the node instance when describing reference properties. When
> > evaluating reference driver core will attempt to resolve the name to
> > concrete node instance and, in case of GPIO references, will use
> > identity match on firmware node to locate corresponding gpiochip device.
> >
> > This approach has a drawback of needing to know name of the node that
> > gpiochip device will be using, however benefits (minimal coupling, no
> > need for adding dependencies) outweigh this drawback.
> >
> 
> And it also limits the ways we can match real firmware nodes to their

It does not limit, it only provides additional opportunity when a simple
case is enough. We are not replacing seoftware node instance in the
reference with name, we allow using either, depending on user's wishes.
So it does not preclude also having the mechanism that you propose when
you need more complex management.

> complementary and puts that limitation into the very driver core. For my v2,
> I'd like to propose additional mechanisms for such matching like looking up
> the correct ACPI and OF nodes and using unnamed software nodes.
> 
> > To deal cases with software nodes not being created or registered at
> > time of look up, assume that the node with matching name will get
> > registered eventually and return -EPROBE_DEFER in the meantime.
> >
> 
> I don't think this should happen in core software node code. The -ENOENT
> should be interpreted by whatever subsystem tries to resolve the reference.

OK, I am fine with making it a subsystem's decision.

Thanks.

-- 
Dmitry
