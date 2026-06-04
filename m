Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B92F9998;
	Thu,  4 Jun 2026 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616623; cv=pass; b=ZIzOfXNLsCTQ8dNoqYAElaATYFs2nKbt42tQMpWejR8kjaYkaR7warfpPzOmFGjzKlBMX7a1cTsO/Ak4eXTRyOCqhROMlhIDUE9gHF5l2N+WLQLYA2ix2o07YcYudbu9DvxlzYne2QoGG+CzkxYbyqGhGHWJCVutpqomXvy1tXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616623; c=relaxed/simple;
	bh=O32b8i+8G45Daj/m64XhqaukpOZcwHd7gXQgV6A4bfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1NShiZtseU6Io4ZeYMJgFhEAczK8sTmcjNcPC5+CFORAmtADBSCUmrjfsEOl1ApLa794qWq5MpOyZ1X7/7nMhT/ips/uS6e9kAdJp+J6ZfEx4IegtpA6rIdM0VYevS3VnJO0j6h3VAr6q6tfaEinDeVsrkiGmPZx0sdMjncQvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=WUI72Ijm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="WUI72Ijm"
ARC-Seal: i=1; a=rsa-sha256; t=1780616615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OcQctru7LzumLZ47zRVTlEPsJHborhDMHx7OsvbadFoigcj6OW9ro3s2xoAxgNDhAIYcdOuNq8SkoB+C6MLMITXo4kQES7C6Kepv6PHT93qlrwop98EjA3VW25dhONCFh7xjzQ8gJnkmC8eB02TqkogNsko20F8Q79GDLngZn6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780616615; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2xSFFEtpYABdcv02FwpXbAPvdTA9RSIQkhuH3iQCIMM=; 
	b=Ix9xo3libm0nN2No00DDB0O0ZeqKNhD/wxVYAgikZREO6v1JismDfTaL85y/zTBUJOolZoIhn2xTj+yIPH/E2iCkhRuDFg+yiJPutD8NYAcobWcvBF0O0CmP2mxm6ZwNyQ2CV+4mlyTMrPgEjwSGpH2JFvPlJXlTkH4nKjMMyF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780616615;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=2xSFFEtpYABdcv02FwpXbAPvdTA9RSIQkhuH3iQCIMM=;
	b=WUI72IjmJTw/G7YE7kcHkNdK9NMzuRXlQ73sa0pds9Ocf2hsaK5vbIBVgJnC8lo+
	oJC6rgn2KfrN+iWo+lAQm6DIFcPJCzQMQI3raSWw77jXlgBazVvITcQO1EwjhHzZ1fo
	/a4RFXGEVPSPeZxOm45asdTFDkIhOTxTJoRgdTzk=
Received: by mx.zohomail.com with SMTPS id 1780616613290687.925188482662;
	Thu, 4 Jun 2026 16:43:33 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:43:32 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com, acourbot@nvidia.com,
	ecourtney@nvidia.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu,
	boris.brezillon@collabora.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/7] rust: drm: Add RegistrationData to drm::Driver
Message-ID: <aiINpEVaLW85LM5j@um790>
References: <20260603011711.2077361-1-dakr@kernel.org>
 <20260603011711.2077361-4-dakr@kernel.org>
 <aiC41_huOYhvacQD@um790>
 <DJ0BD0O60VAB.10S80F8N6MQPG@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ0BD0O60VAB.10S80F8N6MQPG@kernel.org>

On Thu, Jun 04, 2026 at 03:53:32PM +0200, Danilo Krummrich wrote:
> On Thu Jun 4, 2026 at 1:29 AM CEST, Deborah Brouwer wrote:
> > Hi Danilo, could we use separate data arguments in UnregisteredDevice
> > vs in the Registration? Basically we want to use the UnregisteredDevice
> > to initialize and boot the firmware which we then store as registration
> > data.
> >
> > Could you have a look at this patch, it applies on top of this series:
> > https://lore.kernel.org/rust-for-linux/20260603-use_tyr_reg_data-v1-1-97f64e951cf6@collabora.com/
> 
> They already are separate -- UnregisteredDevice::new() takes T::Data and
> Registration::new() takes the registration data independently. Your patch
> demonstrates this correctly.

Ah, true the arguments are different, but the issue for Tyr is we need
iomem to initialize and boot the firmware before we have a registered
device.

Could you replace your Tyr with the changes i'm proposing here:

[PATCH v2] drm/tyr: move probe resources into registration data
https://lore.kernel.org/rust-for-linux/20260604-use_tyr_reg_data-v2-1-f77a1ffcf08d@collabora.com/

> 
> I also replied to your patch with a few comments.

Thank you for your review, I think I have adopted all of your
suggestions in v2, except I would like to keep the reference count
for iomem at least for now because we have multiple long-lived
structs sharing it (fw, address space).

> 
> Thanks,
> Danilo
