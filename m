Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1547884C
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819058; cv=none; b=dH+JcnYHVSWYzmnoIDPDTPQkhq5/5ntOLBkUbupOGBBJVpl5KzQ9NsRaQ917AGUnfuXRREt0X80ZKDyj3rxo5C7RUMmPRTzT4SBYJi51KvVB+EKFpbusD7AHLef2Th++Kd3gJ6g5NJ7XWb5lQ6fQa9kg1CF9DPI05wSbzVVmEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819058; c=relaxed/simple;
	bh=UEMwl1mUTJq51zU6rBTHe0+55FnjRFqfSf95Y/ByeA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aFTUWw3ItHsq7saXx26N1kwpy5wLwShxedHFoUzSzdoPwlv7AtFslVjZ2lB/DOseW4+GSK2cqnKvYTCoVBcqAdvL3j+S8EpXC7cT3LU+5JVKQs6KWLlYyRX1dQOKj4UFVyPEpv+/MWQKVw6jE2k/y3Ab1Hhuv4PIxQeytlPrHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZG8ETC/c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZG8ETC/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784819055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
	b=ZG8ETC/ckOrzbedFhQ9vSAwHoPwiQ2kOklaYEGEBWfdu5iSBkcHRaI//W5gSY+AtEBUDAZ
	6l3w3Xq1cQlbJB46YUswiJX61yzT08hg3cPGq68q1P8k7VuCX/yTnQ80kRlmQnWqLTqH2a
	d7rIdgscyuyfh2HvCSpJxswGTo3NKcI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-hbTdvsElOc2lpjwlkQYNxw-1; Thu, 23 Jul 2026 11:04:14 -0400
X-MC-Unique: hbTdvsElOc2lpjwlkQYNxw-1
X-Mimecast-MFC-AGG-ID: hbTdvsElOc2lpjwlkQYNxw_1784819054
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso20628871cf.3
        for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819054; x=1785423854;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=Q4MkVNowdQ6SkqrVvLXk5TOHQzqFA2cAhaE1pUJu3eSkv73vvv08MRSl9lzFFpwA61
         tDwksBwI6nN9iemHGtKibjuDrxt6yJQezJZqUC7Onv+YcLsduokxR1vDSHuH+Ab6DH+W
         v6gp8zWE5YXCnsqG07hdU4sheUwtGBMBYUju9VLlbxXOc0mAL+t2BWFdFu3D8CTTR436
         H0NYndN4+XdzPnWUENbf4pqVZSe0g5rFrUdE4/Ox2YiuILcloVZCpl+FC8YezDvrt7sH
         z/dXpSthgDixtE6+xUtxvkZrJxGXC27lMDpuBopZ47edhKvpimN1kMTnYqkSkBWO9nIc
         ctHQ==
X-Forwarded-Encrypted: i=1; AHgh+RopTVWTXiJkr+aQigLag6ZxOq5sA9JAJVdtI99TTbNRvJ7aUEeuSrzDRqe1g2kGS2zV9pB6Fdk0jOna2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8ei+qxOLi7OdvruuegYaSjGT4tPEeiNrjOgnap6b0VjhcXd0l
	LzSLpC6cLGNjQL2AYOg9ZaBCpZsjBGcvam1cc7t03NoeSy9CzYnvuK8G49wMiOicoAAaufrNclM
	HlYCxibGiesOsChYtu4Mw6HCDju8G5UZ/w6gKp/e4VfjwBVl8I8AyzP991dXEWfs6
X-Gm-Gg: AR+sD10Iy/UntzSI7IwZsqXF/eBge7uXygd1x/KEaPeyDeB2PcOwv68BF1bcnbUFF0r
	8y6MIzuqEwWq3chn91i2irVHRzJGM18XyvjZjY9o398t8tegF6L1mhQMezKBiCgdR0BZtYeXkQL
	gV1iU9R4CqhRSmg01wqhrrDvLjpqIxAG4L+YXZP1ptsVL1JV1W99ceLb/mK4p6faEkY0z57i2rY
	ta4Qqm/9HZTYRK9T4H6ms3Y8YQL1Jn+WxOJRLmspTggFm9mBAvQgafBv1kFsITaiDQCZ9UZqodC
	oyiPUjLot5UuxNJ4asYs/p7ElJJ2xcd0Ipi9SCGpG9Iw5xpbt9gFwE1tKfbWAPpFqdaoe1npy2u
	ZSQAJjfMk+naGwG/aM7+Ec5fhIWrWDzAsR2g=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053641cf.88.1784819053796;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053161cf.88.1784819053161;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402cb05sm36676211cf.31.2026.07.23.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:04:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:04:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable()
Message-ID: <amItaLCmjtmH8SRQ@redhat.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-2-suraj.gupta2@amd.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260723123838.125145-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lB95jYVHojoiKDKkD_A7gj33gZW6dazXbfiJLVMxaJQ_1784819054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 06:08:32PM +0530, Suraj Gupta wrote:
> devm_clk_bulk_get_optional_enable() gets, prepares and enables a set of
> clocks with device-managed cleanup, but treats every clock as optional:
> a missing clock is silently returned as NULL instead of failing.
> 
> Consumers that need a fixed set of mandatory clocks enabled for the
> lifetime of the device currently have to open-code devm_clk_bulk_get()
> followed by clk_bulk_prepare_enable(), which loses the managed disable on
> unbind, or fall back to per-clock devm_clk_get_enabled() calls.
> 
> Add devm_clk_bulk_get_enable() as the non-optional counterpart. The
> underlying __devm_clk_bulk_get_enable() helper already supports the
> required (optional = false) path, so only export a thin wrapper for it.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

