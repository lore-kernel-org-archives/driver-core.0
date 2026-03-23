Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7B38236D
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304459; cv=none; b=YjSznlLSUxJ0LgQeSFiodkclidqdNcd9l6wcdzbJNJmuJ0BcLUeQN8YT38A0H2TkfqmKaqkmAs6BaxwUHW7UNq79mu9tOYGgLprL3ND6Ufbm7Kwe3uPhvS9D/BKU+DeYvQezc7OGslMtIqCREKHExXhh/QSIUDGxrAdKbpJw4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304459; c=relaxed/simple;
	bh=qqUgVu3iIB9dI3QgPpQ/I+hkv8Lf18eczVPIEmNZ104=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlLjoAbW61eV1MVfY674q6KmmiZzqgy0fggoNNv3NrhFW7mi//PTV1mZc5++yv524kBiES8mMyU+YylatGSBYlIhVvXHSupPgCpB1+rzJbLfEXf3XbKfWPNCCHzB69Uy4326wBlZ7xZF3PxCNo7vQeSv1agIznMDl+eCnDL1P5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw7ogF2B; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw7ogF2B"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so3507186eec.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774304457; x=1774909257; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kzF6SFWkNpwiVT7Tzq/JseNp5uopL7N2rNpwm2glC8=;
        b=Rw7ogF2BiqLEplp6RJYqy+GZOBrKKwACANBdrWnmNNAuFM0aD5isqjjyCk9WRDze9f
         YjJOeQLloHshmBhTqSvWCdPamPHUG6kQInjX5nBys+Fy8Mh6Flmk8qh5AUEglG4X7oZ/
         Gvea/1jw+FPE31oxQeZYIgFq4K7AAFDF+RSiV7/R48a5zAkvl8YKktMDLs0S7dQe35VS
         mMiuqLEeotF+d98r74JRRees36rY/YG4l4VdK8oRb/wINhf1vuK4EqsiChSrrC5+6yuI
         AOMeanlDHzplQkxzZv7po87HzMRf8xMWZOwgzL5M/tP4q7ylFx7O42Y9RWajcXTK+UjM
         j81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304457; x=1774909257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kzF6SFWkNpwiVT7Tzq/JseNp5uopL7N2rNpwm2glC8=;
        b=suE8gcF/ygKe3CcNDJ8dODzjQN+r7eH913Du3FWX/dk/ycNpUb6psje/5z+mLxo4ik
         J14zCfz+0kzcXxBH1HrVXGj0MMHqiX/weZW4cZl/rJKbeyKsUpo2BmPaZGif3f/s2KMA
         LL6U2I5P3WVaFHkDPZawtnKsgsydrTrGsSe6XzangvdMyAMfYqJjxqdln2wL5v7JVs3F
         4i/1zvIwNLmVG1TEDzgEU1b00a1bGKcwGHZLdqWfz/jXHD4wCj0RtZ1CI7Na2d0f/bCG
         ZtgA+8AEqfAekZo0OudyoNlF85SblhFgCfITurZoRyeewZ/s5SstrNDbvT7b0D4u7vXE
         GB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4YLGIDc1qtOUeL7rrVh8sTevwvJp2hrpUAei45Ewk4SbW/ECGMbdYLgPPobTgwv6bPnzW0bx+eC+ftA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbxnHXWdwX2sabrk0icYe6eP7j4htfk6CQTD+Wsdy2vybM/Qu7
	+ymXen6PJ93WZKz70+AaH2EaHsSLGih/pUpR/admZxfDkNxb/JDTU5pp
X-Gm-Gg: ATEYQzyWdz0dcsNH9l2LRFm8OThRbQ5VkXQcsyeETbxpN5MjwGlO/7EIqwsXn3Oxmx3
	fNS9vjM5rWVBW43P/oE+Fk6ho/0LmIaooXFS8UO9UMC8DQW7Ul2f27TgStPzAooHiCBNfIGndo0
	nreKvhP9wLYahwKnWq9Tb9baUgI5O93NosZCb/1TcpkCPFh3B8m2yp38I/xpwGPHcGwynfuJl/C
	n4ewxROc5hxWEUowbs/UN0Xt+BJ+1P8yeX9m/5Ppd90dd+ZdKe8b4wGTF8A8+uawcimpZUkxptZ
	0EfhJivwKw46jgqgECP4ME7VNVQnYx99NA+7Oi5vA36Wq7FZNv9s86xVApSZUkPSPfWQ8Zf58Oy
	dDo/YSoJn5iP8PJL3E/m5JCyB/atBVrmHRJqfL8lVKl9fMnkOX31hK1dZ8jpL+SPzy11/cMw5qQ
	x9tBLReoVEUCrZ6xUhREpCjWPXxWkWyhmXg2Ln4QZVCA7wRH2vo4WLHIcl+lt//D7Y
X-Received: by 2002:a05:693c:3b0b:b0:2be:ca4:e119 with SMTP id 5a478bee46e88-2c1097abc22mr6650334eec.30.1774304457110;
        Mon, 23 Mar 2026 15:20:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm16033079eec.24.2026.03.23.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:20:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:20:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acG4hY23zHHCRywx@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
 <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
 <acG1JNGVBJ2Mf7jC@google.com>
 <f3c51f5d-e001-4a6d-a219-f2e0698f35f9@lunn.ch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c51f5d-e001-4a6d-a219-f2e0698f35f9@lunn.ch>

On Mon, Mar 23, 2026 at 11:00:05PM +0100, Andrew Lunn wrote:
> > BTW, why would not we want to push for the unified binding? They are the
> > same pieces of hardware...
> 
> I don't think the ACPI committee would be too happy if i ask them to
> throw away their standard and just use DT.

I meant if we are introducing a new to ACPI schema... Not throwing away
existing one.

> 
> ACPI and DT are different and we just have to accept it.
> 
> Nobody really cares about describing networking hardware in ACPI, so
> there is no need to support it. KISS and keep everything DT.

OK, but even for DT I think we should be using device_property_*() and
fwnode_handle.

If there is an ACPI support for mdio it is perfectly valid to use fwnode
handle on an ACPI system to locate an instance of mdio bus. And
hopefully the caller of this function does not really need to parse
properties itself but will use mdio APIs (mii_bus).

Thanks.

-- 
Dmitry
