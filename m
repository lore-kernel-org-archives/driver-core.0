Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157159;
	b=DrAY5SEiuRmvm59lUdT61PoMtTn4eyCkvuGiVEOEqd4embN7OyhavYHeFDeb/Ug/pNNR
	 4K8JAbIVGvjYNhu8Rb7TcszLkF3ijkMg1egf82neruJAG/SJdVh4hsZDBG67nVu46sf5L
	 ARAQD0mgUVo7dpXBL+bRnM+28JI92BuEZ42xTTJ0LouGJLIq7A35UfY6cTzCg3RVwHt+U
	 cN6ZoL3Yf4GKVC8x49LJ1R5VgrciiflhBnVNbEm0lQ8LfH8Ieko+1QYOb3+rs95T4BO9b
	 6IPaPS1i3SC4cnYFvYtzSZC4DhThUrG2Wz6OtA09wY6/A1CjvFTMbauCatUJ2PM91vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
	b=vwmB2TlvnC6k0F7Zeu0PadJTW6qDy+bjv+XCzSSz3llXA+BUwJbmuFmZAOfdTdebgPtR
	 eh7hU/HHjDbi4lzvAG2kygG+1kY09LrgQZ98F/za2jGRkva5M02A7vb5VSzT7PvNhzYlV
	 CMVmMj2Cs/6pCWKS36+n+5VTmaSzzFq3qJAw/SRX8Qo34cEq9Id9MQp5nJf8DW5cRrVe5
	 NchbMztetAsw2Wd+lDdy9L6ISgN+z1mPPvbrnMFPcuExNNWwf5c3fo/yrVMkVnLDc53me
	 ulqZyn2j/r8IhOAos/NC7vpaLX6hPvmDvqqHQyf3slBEc+ayzDsmY7Wu71Q0t0cePQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FF606A330
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 16:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb57468feso1719876d6.1
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794157158; x=1794761958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=TQOS5doud00tkS6qBnEOKRQCvE1/93V/TCUt0drTiMBaxn8/7sVyyDzftJhcPX4GGb
         br3GEWLP+mtdYGvT8xobLggmVEYkMUaZCUV/hBTrPk5kAuGm4XCmLf4LDdF5cHcbsBvW
         9V7hPCimT/HdE6lYrOT53MTo26XkLZutl5m0srsCzfMRs+xDzW0kfbsb5qkef5s48iaC
         kuPyLliQ7dXySkF1ctBFxJLqKBASrsTPLm+AXhcGPTow3yHqFMSFu2Z2ar75C7Uj9ylZ
         vPvScF0hIRhBVrWyKEYWZYr495q9NyFacEiRrwc28CIgagESWy8Mj3JMaBNUIK1U0Ssk
         LjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794157158; x=1794761958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=PIUCcWpsPaMZhKsFA3bkMFk//Emc63wAp4skbdanwMJ6hZAjTgSb4heIFBDkMkS6Ae
         Hel1/CwmOQONUZRJuzP+b/iBT5A8RDSP7WgbI3Yod9K+WbtkHlEZhfQlFM/gauGykq93
         KuU4bMXAPKpPWnHwvRa9s/oz7OtyRO4Bo54z8LALNio7jIFFxvdnkI8D8j4XksLlXbo5
         xPjD03+ZBqavta+iQg6RV0C49zf4HnFFjNUlnyGMpVgB6iHh+BCZAqDrckqd0D8BJ9xX
         p8sggdxWYH93MXUXPWY2px44LzrrqTorfDkGgk18pOeWpdwCY0yLrw97hHaAvRfvP4N/
         m8lA==
X-Forwarded-Encrypted: i=1; AL+hErHI3jscAFDLy2kOkdEiNNn4AoOCz31wgD7C6NpM+Y3Zm78HGB4H2hADtH+XWa6jj1fdupr/7lW4BEWZpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8kCFgLL9JKekcq/zBFoEA/U94/HNOzWJPB1pg03QDmh2/m/9Kv
	+MpqXEug5LSXgzQhKOTjD+qZ5+UWeeF6MdUKm0DsagddI0nH7JDm3IZAjLfVZ3qtJQ==
X-Gm-Gg: AYBFou3R+OBdPK4MC9juR5G3DzcHwj+nonL4qSJDs/P6jCxSmpBEg5vDXvIpaS9E2WF
	sBJL2SzMai3VQTgWrd5Ek5pcbufT1D0mMBeM4EtRXA91vRGowl2YC8PowfRoHFfJpi2vd8I72eS
	viSDbV6YEr0kT8Y2gYEPeNUoCxEzpZJziM8DVdZ+uN001OsyY6JyaUTBBglo7qMeqL2YBWUg6gS
	6l38Nold0tZ+M+3ZZlvAufrKNt7BjSu+JiVa7k1hG7qMU5m2aj61CLrZ6yt1CRuHq97f3XlhUVG
	kp4M24NGjWqvhtTmFsC8ECn3xq5HP/RezB/K3RYfcSJGITJhmo3gFLbS2CzYnDaaUcDbwr5Si5y
	EstLd48TuOKxVQGxpMKqziBDp/XYtptTbpqp/eJc15l+J+MPVYSzRauA9vR6FoL4yD++4W0441l
	DjzWdGYOdgd8wrObEdQO+gxyduLvBZYgPtfhbulBdJaZ8qnnqpotnajW+ygr0JkHOHOrOlqDMyc
	VHQvQ5adjgvxJhEj+EpnnSszypirklu55vJzDpNeSXLj3aKo8t1LMo0+31vNKgkDBDSlR+BjrYx
	xXin9KFJJF9GOjEXtum9vrUSEBxO
X-Received: by 2002:ad4:5d62:0:b0:91e:9d64:3294 with SMTP id 6a1803df08f44-91ed240d34dmr24616736d6.30.1794157157397;
        Sun, 08 Nov 2026 08:59:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecedbefb2sm22431036d6.17.2026.11.08.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:59:16 -0800 (PST)
Date: Sun, 8 Nov 2026 11:59:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/17] USB: Lock registered interfaces during manual
 driver binding
Message-ID: <647f3199-909d-425f-b485-b598a18844d1@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
 <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
 <20261105184442.GF8298@unreal>
 <bf756e50-c77e-40f2-916d-e88887426806@rowland.harvard.edu>
 <20261108110909.GA8635@unreal>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108110909.GA8635@unreal>

On Sun, Nov 08, 2026 at 01:09:09PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 03:04:18PM -0500, Alan Stern wrote:
> > >  it ensures that the lock is
> > > acquired when the driver is bound.
> > 
> > That may have been your intention when the patch was created, but if you 
> > read the patch you'll see that it includes a whole bunch of material 
> > not related to locking during binding.  Namely, this part:
> 
> Once I added `device_lock()` to `bind`, I had to add it to `unbind` as well.

Obviously I'm not making my points clear.  Let me try again.

The entire patch description, as you wrote it, is this:

> Interface claims hold the USB device lock, but device_bind_driver()
> requires the target interface lock. Without it, trust-policy writes  can
> race admission.

This says nothing about holding the interface lock during unbinding.  In 
other words, it isn't a complete description of the patch.  It implies 
that the patch changes nothing outside the device_bind_driver() 
function, which isn't true.

Furthermore, the patch does not change any of the code in 
usb_driver_release_interface(), which is where unbinding takes place, 
because that routine already takes the interface lock.  So to say that 
you had to add device_lock() to `unbind` is not accurate.

Instead the patch adds a new usb_driver_release_refused_claim() routine, 
plus code in usb_set_configuration() to call the new routine.  The patch 
description says nothing about either of these things.  Not to mention 
the fact that your other changes make it now possible for the driver 
core to delete an interface claim when the interface is registered, 
something which was not possible before.  This is another inadequacy in 
the patch description.

I'm not saying that any of the code is wrong.  But the description does 
a very bad job of explaining the new code.

Alan Stern
