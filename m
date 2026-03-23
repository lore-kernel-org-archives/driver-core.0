Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA46384220
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306130; cv=none; b=u7A0CXgctSphOOyr9y7/TywwM3jnhkdwF3gA8/u37KSbLGV2goqdPwbAuiuIh7dqV/yUv7fgZKs/CnRouYbVhq9OPP2mGM5Q8e1OkzZ8gA8gHOsswTnTQrUrDF/lHVjH3qlaXH9QH0TFSb/+FaP8g0Xsxd3p6ubcr1/Vo5J6biM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306130; c=relaxed/simple;
	bh=RMwiUT2ca7SpehwMARA0+INqWPmeSfWclA5GGkGeRtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahSDvcRnQrxVr54WZFf765FMtRKJ0+JgE4AHZoqn/hcHNPACOIRAsRGN8CwcAfR0dIIwyM5dxxbn3G+vjDVn+icOWiZC4sN3XcSMb0TrCzTA+J0B8JgRAixfLEnmK+cKEYDk/erTrfTVl7CqXp96j9dAHJt5gAREeksMrufLOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzQ6H6ZZ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzQ6H6ZZ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0bb213b16so8258890eec.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774306127; x=1774910927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FGbAPMtb3fAC8y7bB7RIg3tLmv+zXAom99Sn+GnnvxY=;
        b=kzQ6H6ZZOJ05ytIsGSrkFyOTcB8KnFYij2pLL8fRtJTHVqhedYqcOd2+H5xB63Sb8i
         KAMlMI3AzwZNwFMltqA8O2ym9eKFAWDYvcIeFZrmYqKsoyL958ungMiH07JdneqoILrr
         0w85iyk1YuE9qNwoOkmOhAtwMUw41nhYJnVa/BpqWHLKkarX9wesp2aEYwCGWWTqNaQV
         TGU2349/J/MknMSDsaVqPTB8mnoJpHs3h+FFu+p51UJKu4HtxXz1CCoUetV+b6yjLCx/
         49li2qJwLg4tIS/1Ht976OgY8g/LRHwh6hapmdleLEvzn+fJ7AbuqTNaOpmXlHzJPtAk
         MF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306127; x=1774910927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGbAPMtb3fAC8y7bB7RIg3tLmv+zXAom99Sn+GnnvxY=;
        b=mKFW40gwEOeiA+ohRscyy1ivAUfTf5LkCJ6s7QQrGnIKkqC+g2zuINPvM/V1xbE7qQ
         E84w+DHb/HbWTNvfED7AZO7I06Woi2KUcwgbz2luHyqmfzFjfGmpOewQ9az0W4IhfSNI
         BcX3gOtJjsgWf79ODUX6GFuCshe/10JRM254ebMMjIE5qx34AGAdgnKZbDUicx5Epk2Q
         f9ZoPL9VKX4W6L8vHlN0tGkOslRXbbwlbCNhWNODnC03R8mWrBjBV4L4x6rprbL39YIZ
         TD39mSAg5L+6RHBtJ8oubS4cLd58ff4UmKvyMcEaTrXkvYaeDrOPkb0rwls7B4O+3LLx
         dNdg==
X-Forwarded-Encrypted: i=1; AJvYcCVqwpN1uLEP04Nw+p6S5xNEJxPIFglmC7C11Qu29DoKvgs1cjJzvNzX3gdIHWO6Jn4WGjeXoqMZtVGK9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsTIqP+cjH8jEPeg5nBaFMDOSOs2Ri5XuJM42JNR/za3s0JiX9
	lY7TfY91SVKT7MA5q5QAJGbnx7xgPpvw2BmTakjhF18JYAIYz9rxqyl4
X-Gm-Gg: ATEYQzx1zjSyw+EqbfosLbgkUVTwJesgqdcek6RhYYOG9UvgeFf2vl35B0kUcVk/mVX
	DqkNdXmW+efmWLMKDqQ5woc6GSqdtPGkxZE4vTmWUnuTZhnJW2LONm5d8tmJ97MwXjQvktPa0Te
	ta2Axt3SpSgPF/+pce4CFwVJyIfsD8N62Qpk76aMRWpqbBL7XArbPM5xKIQ0AGScgwxoDe+gY1n
	qAdpVhLzx7kSJejoh/P+OTUdBH+RsZbTQ/gfGFGQz5b68g3Movfu9F7pL8yLqJRViCUY9W7FwQE
	yBeTC/EYZAojw7NchlG5HAgv2pcpwfF6+3Aq7XqRdvVeBeiYbpvRY8M0PNdx3j72l0wgx8tIYl2
	sU9P1GCp4faPpLpePPbtDr/UlYe3785OPdRtDsDcRGEETpL5JvkXFov/QqVde8DcoH5A59/LmUH
	OGeb8DDiyxIUJpqTjJ11xSZ2bpIHUXrM2XK2yYrOBuJnSpTNKlGU3df8dSyWco/0fH
X-Received: by 2002:a05:7301:9f0c:b0:2b8:4c95:365d with SMTP id 5a478bee46e88-2c1095f54afmr6740228eec.10.1774306126689;
        Mon, 23 Mar 2026 15:48:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm5080230eec.14.2026.03.23.15.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:48:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:48:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
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
Message-ID: <acHCIA1d5-s2xkvz@google.com>
References: <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
 <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
 <acGzJV3vKhuty3nd@google.com>
 <09072374-65e7-4792-af7e-97d7df93f9bd@lunn.ch>
 <acG9BPkFr_De-ulu@google.com>
 <27f4ed63-08a2-4621-8943-c50261de31cd@lunn.ch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f4ed63-08a2-4621-8943-c50261de31cd@lunn.ch>

On Mon, Mar 23, 2026 at 11:39:03PM +0100, Andrew Lunn wrote:
> > If there is a deprecated property you can do:
> > 
> > 	error = device_property_read_u32(dev, "prop", &val);
> > 	if (error == -ENOENT)
> > 		error = device_property_read_u32(dev, "deprecated-prop", &val);
> 
> It is not as simple as that. There are a lot of optional
> properties. Say "prop" is optional? And not present. So -ENOENT. We
> then look for this deprecated property. That should not happen.

Why? That is exactly what you want: you favor new one if it is present
and fall back to deprecated one if it is absent. And then you decide
whether to continue or abort.

Or you are saying that new property is optional but old one was
mandatory? Not sure...

> 
> Using of_property_read_u32(np, "deprecated-prop", &val) actually makes
> it stand out, it is special somehow, which is good, because it is
> special.

If you only have of_property_read_u32() then it will not stand out. If
you advocate of using device_property_read_u32() normally but
of_property_read_u32() for deprecated only - that is a possibility, but
I do not know if anyone does this.

Thanks.

-- 
Dmitry
