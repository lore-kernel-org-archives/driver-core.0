Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9015665C
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 05:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774243042; cv=none; b=iMalFTLwvnNP7ayJNS1Ag5kd6uMvIQUweYZejWqIpB8vZhUlh4EdpnnG2WX+W8/Zhy4EeF38g6u+Xjzzo3Xf9jrvC6EPx2Enm5gK3LY2mh94dgqv0LpruzYx1/r2YPA3JYxpm79PiPnZx3+uzxEL7/1mS+DxFTO0yE3WtG/F8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774243042; c=relaxed/simple;
	bh=pfWTJZqaVhDCbFG2fAE5ptgG+qJ6NN4y7N0S/smJD24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUK59TTG4noOKCKGpGr+3LB0jM0jLdMypWE3e21cTN9nTbzjmmDvfajcTrgj7llDuZlgnDjC7BvpkusxBrOpfQ+m5aG/0ynPelA04pr99JTEun1RZrsy49IBceMWk6B0iZL1VjkjCjhe8VRlDEahz8kQvQnAX778HxM1C9vzm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPpXgxWC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPpXgxWC"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c107ef474fso4641785eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774243040; x=1774847840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Jpqkfz7hZUs+vzaN1OQd+jtBYhuxG1ZULSLXTe38VI=;
        b=UPpXgxWCIhTCGv17RkIGkZifUFnZhPlIwXJKu/ZxvKTuwCJixp4ImUfZpI9li1h3gK
         T3/lweYuXdLwDwqxsG0GT7Lnp99l7KXbEtPR4eLP+rrFekUg3AmPwHkJ2LVi3fmEgOpD
         1pQHOYTcd+Xl2NmmXgxXvVOcoPJ490gz9ypMnEagnFvJd/ErxRPUr+TBpzC/bf4zN7LM
         Hf8V3QLNcd34BowFgEtuVORKRG6ExzJ0or2ge6LagvkftclE72qNzBAeswaopZZwr8Jy
         hnTi2kktPkN3zGHl1q5/uh8K4ppIXzN18nnqrmj0PYoE9BsjWlQ9TPM1kKIb3HRgQk5i
         3JBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774243040; x=1774847840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jpqkfz7hZUs+vzaN1OQd+jtBYhuxG1ZULSLXTe38VI=;
        b=sMyWXbLtC8mCmW+Vmz0Spg6ixm/CzY7VW+seUWbbZ2iXmg4Bo/R9o5ZrXelJpXxPZV
         bgLPVYKVvS5H39ZK3C6kl6BivA6G4DFAr3XM8Su/aps1v0iAEjWz0sxoNdjo1EKwHHiN
         EKIust71JUskl0OewmSYXXrmrvvuZk1wrTT80OYX9aI3Kl28hTqKtsuq+YoElry9Ut+m
         EHN+oM/+YW0eCVJ+Ulu4kTtf1eIJKjOOPONqIygyeT9VLddMCtiwmCIg+aph+jb3SsHq
         y352f54B3uKtR9lzu/YiN34FUh+A8uSlxNvj/LdE9G0Jz1vl8JLWFCQBW58ZAGtRFWHY
         rSeA==
X-Forwarded-Encrypted: i=1; AJvYcCUSrFgX33CCBQOOqREiwBo7VyZYcwhEjUJvgN9PXXAGNe9UC6doP+DFiQtQEaGbPKRWP1S1Nis5/1DrVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBsF9rjBWLNOUxiQ0yQWzVjUuRE+i3czpVGb7oqKOzOFGyZFuR
	MRXQm/2JjhZ/Zk2mzZqfJ6wSA3B/GGzdbM0qsAcY7RmImUKqQkVhB2I7
X-Gm-Gg: ATEYQzw7Xs2J7xC+cgcOVHINoxJSM+1AYyMl6gI+gz7ns9PbZdX8U2emaQaFIIPkiPM
	rAVrSgfx5uOMLxPdJjWkhGVGHUhJGfMHoZwmEaea4xPEkksQQxzmoyOm0Vp3goCyBGR4wJJuEG4
	VxEOPJIYwQsBf9FTvLOBCgUcw8wQKxirVQTnOZiW351H+5RPv116ooKKN5kisDtnlI81EsjFMu6
	bI9glC3hVq4wYd4xqFOBj/1cfYBxJYcuCZlhxMZ7fDiQb4wykTsfyFOZKRatIKt/SX22uYdS1Ad
	tgwNMoYcfDsOqqeXgzkzoTPgFLrVQ2L3UYmYZGqBs5A5EDJVsKM7t9EPdP+3hit99M14wKHcC7q
	cBzAnTCt2WELB6Bge73G6t8z0FlCJ0GVEqKsnTOm+gw3pgGyfhcDXZ3QPyNpH6fSZ+i53WWQyMM
	bqth1vKRF6WvcUNh2bTiJaIptdrwZHBeXvovMjZxrhgXUYkOV6QaSM4UE2wq0kUeQX
X-Received: by 2002:a05:7301:4198:b0:2c0:c775:a46b with SMTP id 5a478bee46e88-2c10961ef1bmr5539127eec.8.1774243040114;
        Sun, 22 Mar 2026 22:17:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm13470084eec.24.2026.03.22.22.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:17:18 -0700 (PDT)
Date: Sun, 22 Mar 2026 22:17:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Tom Rix <trix@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acDLzK8vpptTUMf1@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>

On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > +					of_fwnode_handle(mdio_bus_np));
> 
> When you look at this, why is it better?

I think we should move as much as possible towards firmware-agnostic
APIs and use fwnode_handle instead of device_node or software_node or
ACPI companion. To discourage this I think we better remove
firmware-specific APIs where we have firmware-agnostic ones and
eventually clean up drivers that use OF- or ACPI-specific APIs.

Thanks.

-- 
Dmitry
