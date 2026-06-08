Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B43909A6;
	Mon,  8 Jun 2026 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951860; cv=pass; b=QY3K0yIj6X6AZzt1pYTHBknX/NEZpHZ94bFNCVgKsIee6O21io65gUqQWczaDYY6IOhCqhFsRjJenQd4NPzU4+eR24UdaSKPjn7sp01pyWQMKjrhLUJNvbgzh/1UP2FZo5kFR0s9859ZRvvrf/errLBnf8I5d0YBnrGLlEoTUsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951860; c=relaxed/simple;
	bh=+Vyx7KJnk0dsuda/GMVnXSw/LT/stfy1yBFTIoH1/cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6yKTPZ7kDoCm/tWH9eU876Bi8G81BmTsRtkMaoiIULOQYU/aTS3ZYxbGYIiQDZuvcx4BYAq9JFYpSGZGo+dJ9tiiDS4zyMBp5JbEdAsO++xGfKUqgw7rxd3XbQtNyszvY5252QVm2x+4TSKYG8vGmwtVjG5bRTxsvzUdFM+Lg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=LluCYvea; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="LluCYvea"
ARC-Seal: i=1; a=rsa-sha256; t=1780951851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YUIoCuZWnZ6vXyqf16WXu/4w+iSebNO/5kZ9Bq1ZUIhryZ9Cem4xQpVbAfazmWURliYvuzhevQsCcoFwKo2cLj3EL74fJHzrng+OwzsSfkYjbUHr4hDcR2wwNV88S/l5mgLd15tVgXIO9b6LivT4fKoIQoSqOBS7W4A0tJA492c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780951851; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=orSHiGssWh9CUnwqRkVkOnj/qdpi42FFWxBmEUn5Els=; 
	b=LH+hvVd1w8gndEa1Xj1jm9Aw6EMsknsgfF6qruItEEc07HVFnLD3QvCh8hO8gllGbnDYb+6WK/OcGz6esrPOgFfjD530mYwdhf75IqX1iafZGBt85TSR9bMMMlrz3HvQIkwOO8Wstfbn8muaWBH5Y136hRnxXbNNkrGc39pmiuY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780951851;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=orSHiGssWh9CUnwqRkVkOnj/qdpi42FFWxBmEUn5Els=;
	b=LluCYveaLpx5+v/KArXMSkkmtfn2ScduaRYumjbv43yNXxmokF67PuOYQbPbl/q0
	TuDJE81IrhX6441ZeuTwRKys7iiU8ctqlSnl6LQvKqmOxbgGJ5APxJR2+y1M5WuQMio
	Pfo31PnaONxi/6xzxYU2Kcg1j/y3sFoyILSxyg0A=
Received: by mx.zohomail.com with SMTPS id 1780951848113484.6361367367341;
	Mon, 8 Jun 2026 13:50:48 -0700 (PDT)
Date: Mon, 8 Jun 2026 13:50:47 -0700
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
Message-ID: <aicrJxmZNI_o4jCJ@um790>
References: <20260603011711.2077361-1-dakr@kernel.org>
 <20260603011711.2077361-4-dakr@kernel.org>
 <aiC41_huOYhvacQD@um790>
 <DJ0BD0O60VAB.10S80F8N6MQPG@kernel.org>
 <aiINpEVaLW85LM5j@um790>
 <DJ1XEW84UTAU.28B9WK4VR0QLP@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ1XEW84UTAU.28B9WK4VR0QLP@kernel.org>

On Sat, Jun 06, 2026 at 01:23:04PM +0200, Danilo Krummrich wrote:
> On Fri Jun 5, 2026 at 1:43 AM CEST, Deborah Brouwer wrote:
> > On Thu, Jun 04, 2026 at 03:53:32PM +0200, Danilo Krummrich wrote:
> >> On Thu Jun 4, 2026 at 1:29 AM CEST, Deborah Brouwer wrote:
> >> > Hi Danilo, could we use separate data arguments in UnregisteredDevice
> >> > vs in the Registration? Basically we want to use the UnregisteredDevice
> >> > to initialize and boot the firmware which we then store as registration
> >> > data.
> >> >
> >> > Could you have a look at this patch, it applies on top of this series:
> >> > https://lore.kernel.org/rust-for-linux/20260603-use_tyr_reg_data-v1-1-97f64e951cf6@collabora.com/
> >> 
> >> They already are separate -- UnregisteredDevice::new() takes T::Data and
> >> Registration::new() takes the registration data independently. Your patch
> >> demonstrates this correctly.
> >
> > Ah, true the arguments are different, but the issue for Tyr is we need
> > iomem to initialize and boot the firmware before we have a registered
> > device.
> >
> > Could you replace your Tyr with the changes i'm proposing here:
> 
> I don't see any change in your patch that belongs into this one. What exactly do
> you have in mind?

Since your patch is introducing a new type RegistrationData for
drm::Driver it would be nice to show more realistically how we
would use it in Tyr, specifically:
* replace TyrDrmDeviceData with TyrDrmRegistrationData
* pass no data argument to drm::UnregisteredDevice::new
* pass TyrDrmRegistrationData to drm::Registration::new_with_lt()

But also this has been a good exercise for me to understand how to
use the new type with Tyr, so it's fine if you just want to proceed with
your series as it is and then I will follow up right afterward with the
more substantive changes.

> 
> Please note that this patch is about core infrastructure and should only touch
> drivers for the minimum of mechanic changes required. IOW, your follow-up patch
> already sits perfectly in this context.

Ack.

> 
> > [PATCH v2] drm/tyr: move probe resources into registration data
> > https://lore.kernel.org/rust-for-linux/20260604-use_tyr_reg_data-v2-1-f77a1ffcf08d@collabora.com/
