Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00E3806AC
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302070; cv=none; b=qGJLu+gS34nCyPOzq2/fs12DRcrHpUqdHPeDDtmu/eg2QuOOF1SaHkk5jCUeO+1x8wU/v8i6i2hqQnZpk2CIaITlkwvprKnUkg2gMJ3Z3Fc8HcMogNAutO5RdkdA5biaL7FOiWXLaqaZ2DajYLCbou/aqlo3SP0oHTyEcrqjG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302070; c=relaxed/simple;
	bh=Ia2wOeaNxrGGSqm94OjQXh1deCH4whLtBppic3PUk3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKQWXUacUvKQkp3GHUIXHcM7ya4dQ4aAJ/l+jNYr2KQa2Va0wjtdgDnrYlyd6lL/yYPixyS7JAHMliIrCwAZQu4gv/ud4tteykn968rxclO+0NAMHfHc9STvgC5w4Ll7dZ3lNBi712vgNa70k41AfLwdhxWXcw/1Qpd3u8J4mDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpWYlVpd; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpWYlVpd"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12a747e7b2fso1117844c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302068; x=1774906868; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HCZ5YthEu6Sto4GADNi5rznGP/hi6UoU7AjdQU+RY=;
        b=fpWYlVpdoXzEYr2L9VmsH9ssxcxxZMnhN9wP6BRh50ATOLxHGdF0Pqob3xP2K+PG7C
         FV3vqp60Kbod2eBQ1KVeXf5ivcYujJhkqADYdrceDMSNAbhvgYNwA7rTGeFgJBrpupqC
         LO/yNX7JevHN7IbiiTXs28d1OmoYKRdwdyTXzy1TSIvls6RoZ1kbxk+hlva1dCOeAJjy
         9iumYkzwx6N9PbVWmu0GndyiZpkoowE2Mla5u/kN3NGOwUYNT+WKLn9V+XeGxxSJLhTz
         eH5zLCLi7D5AMQCa9dEjgLY3BA6wVZBX0f3ZKf4Glz/U8E4EbYNMEVN6i+A0vQnJTuod
         WNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302068; x=1774906868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7HCZ5YthEu6Sto4GADNi5rznGP/hi6UoU7AjdQU+RY=;
        b=boyUC+p9ntaQ7cHJxgKhd3ur+vKDhMBSVZDE6mTZBWM9QzlS2Z7I6teB+1m4dxw0kE
         e82BNskjnYV6KFcreu0nzjwhf0+HCu0pcDor4ZAJpsqx3dnY/cgK5e5Ozaixt/13XPDk
         u1BJIgrXzpBveB0xY91iQ5TaTryRx2wbYguCYoyagfrcur33szO8Ixm/b/WIYzbixzwF
         oxEpXBf4TNnpQQhTOtDmg2KwNkPA5f2oWMMkJ8a9aKJFrQ6WJhkmHBLfLXaJxZDtZXyu
         jgOerJS4bCnb0Pa+vGVdP19FWDPqy/mFzcJGuDYIfDgckrOOH8kEVWMj+7fCTqah6OX5
         bQLg==
X-Forwarded-Encrypted: i=1; AJvYcCXeLJuJLFq3Opfp66JIwAtGzpjJe++0krQP/zq8yEjECIQz8eQ5yFuFGtsxZJHymIxeo55gA+5Gs4xzbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy2HuBdIllET1HbGCu9M8tZIY67CBXK6WEZ7kEwdyf62V1K0oH
	5dPy6FMs2riP5X0eaZIwnI7V37NTEnhF58pITiX4HK2khJpTrp3RODf5
X-Gm-Gg: ATEYQzw1UGGXwy0tU8GKCu8yQ6Lx1muc5ewZAzcZ0/9ZwqjDVFB4sCb528EAMPwWyC1
	3tYpbBPdLxmcC6VfJrtqzrydrTiZWd6Sn8Mq+ROcNWQJZkuJjyrB0tppg5Xmni/KKy6n6rvL90L
	pmkSnnfpYFaY0Y20XXS+18jY9RgGwEKPLTUttSbiG3CP5Ycl5Y+3NljMEJv01xi+Or1UNTtP+Ia
	JmllLpRjlLg1Hq4MK652rVpgfZX+sE+v/9fqf1JFWCwg2HiTShpKb7rSOz76P9NOSnLbt159Slj
	KYW/ujlrfkc2aieu6p0N3eq7Z+FGwSNe+sJ7Hf4WYULJlAjJGTtEVM/ISqtn32GpqQqkoOI9vnk
	0lTTqWLudJ9Qp/rqOO8OrAeqV3o14JLIF64QjjHthwY3gl74R7bnjdkKiTwk0Wxu35LJ519Da+N
	edS+BZ/95ddcH+kQNyp3kFBXF/OD9FYc6nuawt94vrDDye3/KbNEgGxuAW7Us9jhkz
X-Received: by 2002:a05:7022:31a:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12a726cafe2mr5295048c88.20.1774302067990;
        Mon, 23 Mar 2026 14:41:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm9682893c88.4.2026.03.23.14.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:41:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:41:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGzJV3vKhuty3nd@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
 <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>

On Mon, Mar 23, 2026 at 09:36:07PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 09:01:47PM +0100, Andrew Lunn wrote:
> 
> > How do you handle deprecated OF properties? This is a problem i've run
> > into before. A developer needs an ACPI binding, so they blindly
> > convert from of_ to device_ without engaging brain. As a result, they
> > bring all the deprecated OF properties we want to die into the brand
> > new ACPI bindings.
> 
> Honestly that one hasn't really come up much for me - not too many
> deprecated properties.

Given that we position properties as an ABI even if they are deprecated
we supposed to handle them forever. Newer properties usually offer
benefits over old ones and that is how users get moved over.

Thanks.

-- 
Dmitry
