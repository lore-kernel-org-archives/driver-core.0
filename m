Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B753CEB96
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294925; cv=none; b=Ea11ZV1xNWGdNIas+VliqdtckP14LT9GaSJMpXerNDLFf4GZ8TF2pJUMAgexkmy/utsEWxRX+bU6Uz5Ctt/l9I0vUrHLgLooatCFAiTRbDDesPiXdbpbT/gQGqF9OZ/wRlLUUq77dQgzOoxkNpyj31+w2J083LnuEV973VepeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294925; c=relaxed/simple;
	bh=2SF6pvs2emzV/AhRbggyg1HdfzHcesbv4DvPDEr78n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqVCZ3c156QBOSEonxgRQ/RgNK31aD5lIgQiMVlo6FNqxOUCfDRLqKrahjFZDM7tEo/+0I6AenR1XuLxC7DPNcQyQtzepDQSc4o7Wbof8v/udJYMJ1CnaF9lOkbwWHr2TGuttVFVx0mekSe3JdIWBUIYVz1RXrlPspZ7xdroG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmKscJQC; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmKscJQC"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12a80c36350so1830574c88.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774294924; x=1774899724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdMs/q66h1+QBJjH+XkkqQHaHRaGP3OKtdQi49odTsU=;
        b=GmKscJQCpg9J30aCpLz2Dz6V5WdXxaVovvPY4mKPq/S7qHuS33sjNh33eXp3XzwamU
         FQldeItxzjUHW8stAXWxuuIVpTnuo8nl22TdsJEQpiVLCH+H91M48PeZt0NDWmTdpOAD
         KfQ16A5o7oAWrkGVjUPVbLAV2fn9FlXP6IDyw6+qnMvbEY8Q18aH+Z/NDN9i8+1XslIa
         NlqmhDHn07fVcRvHYiXuMDE+eCMZOq2etzM8l2KIj78ptcGBk3O0jeCv+O2rdp6/6tTK
         UUuNo8fjYUUMSPaNi67appaEcso/3+FF0yDCW9uuVF9iri9x8mvVJTs9qMziSPDtoc4z
         rSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294924; x=1774899724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdMs/q66h1+QBJjH+XkkqQHaHRaGP3OKtdQi49odTsU=;
        b=A8TldlpUejqE8QrbgBe1C78POANfTSQfM7guBTz4k4QVcF5QWZTPidueqo/7DvIvbC
         rDuqNn7qgu5+TvK5uzleOVB3D2xhEDAmlv85jUk4BVMUvMMtCae33mIAO7pMLkroJD0D
         +Ie68x5RlXIOdbI3Pvai6/0RWV2u87NXNy1OSaNb9m+HivWnw9+Tf5OEggaRZB4O1bVl
         0BR3Vt2brOvUqMJUKre17HmcTsdJOIFyVdPBQu2sfBYkd+Y6Zw0o+cgr4eOOLxWvVm4V
         v7kf5eGRjxQ8ePMhuxzk542UW14FFdmLn2hG+aojPtwp9J+wbHZQbK49NFw1g3YSdNHB
         DVRA==
X-Forwarded-Encrypted: i=1; AJvYcCUhZ63cIOCJOQrIN+pNlGMnt8irzITQ2F3GpezNP7YxtybiF1N5F0998kmEs7w9WOlhkrvErxddESK5iA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkho7Ehw9duSw7F0h8FGMjO37S+7v8U71txKKJx4NXRtgzT66F
	KutiNt86ELbXUpN5MaHwF6tVbpQcAf9pBkBmY6u2ayoVthytkcyCI5Hi
X-Gm-Gg: ATEYQzxzi3C8KjhWpqMdZdcMWIO7gmCp8359WItQ4hbF7qM9Rh7iNHP/GOWZTu3YZZt
	f9Q6pvY9ixC6yEXwmKvYMlBb5RvdcDTrhvWOVS3a5seqdKo57rVfAY3osvU/KboIkhCLFDSlWqr
	+fHcEA2jdloME9zeFLm6/uZ1Z3PAq+IfhMcHHMdgHsHArQrZWka+DVu4X2JC6ij+sLKXT37WyHP
	FLNf3iEAwM5JLbUNG0orZ96aKSEyUda/rSy2YFpsyyFJuwgp3LBnjKGzubKmJav5mT3N4ez5nPj
	s6I5YOMoqJ0oz/uJS5qo28X3ZJJ3QrNDio8N6Kz721wn4eo/erRUiNTOFqs0G3qRmrDJZBN9Vly
	mdz6U4CYkJm/M143Ylgjq2wCASyA8eMejwPznazhTq/g1MpxcW/6JsgWzSJr90SybcLym0qmEdx
	05spWLK+ydIqOQmoBdo7vDrsCr2M4TLgo7TX9oXZnw/yJZcVAuKg+gSutM9a9nc5IC
X-Received: by 2002:a05:7022:6713:b0:128:d1c9:3633 with SMTP id a92af1059eb24-12a7265f60dmr5533874c88.13.1774294923678;
        Mon, 23 Mar 2026 12:42:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18088976eec.9.2026.03.23.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:42:03 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:41:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGWJf1AGXT1xduM@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>

On Mon, Mar 23, 2026 at 07:05:13PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 11:28:27AM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:
> 
> > > The regulator API is very deliberately specifically using the OF APIs,
> > > not the ACPI APIs, since ACPI really doesn't want to model regulators.
> 
> > For now? We also have software nodes and maybe we come up with something
> > else in the future...
> 
> > I think we should use firmware-agnostic APIs as much as possible, and
> > only use OF- or ACPI-specific ones when there is no generic equivalent.
> > This makes the code most flexible.
> 
> I think this is a worrying idea for core code like this, we have
> specific firmware bindings for specific firmware interfaces with the
> different interfaces having very different ideas of how things should be
> modelled.  The chances that firmware agnostic code is going to do the
> right thing seem low, and encouraging the use of generic APIs that might
> happen to run OK raises the risk that we'll get firmware vendors relying
> on them and leaving us with a conceptual mishmash to sort through.
> 
> Software nodes are already a bit of a concern here TBH.

Firmware vendors can introduce incompatible DT bindings and have them in
their devices too and we have to deal with that... 

I think if this pushes closer ACPI and OF schemas for at least some
subsystems closer to each other it would not be a bad thing.

Thanks.

-- 
Dmitry
