Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F339352C28;
	Sat,  6 Jun 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744990; cv=none; b=XRLvRk2x7hKp2Gclm7iCLcHcpD93mEMmD/3JZJlGVij6YTGLRIkF0/+/UcVc2fo+SA8iwyByRk0HqgqV7K79+kYKsdxfP+MPFtZW9WHah9nVjznFusbYaT1G1KNfuShqOFg0m6jxFR2inVsUqdDD9uV4hZKyqXSbk9VnocS4jSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744990; c=relaxed/simple;
	bh=RW5iDI1nw5+hsyNe8SDVvtSzDbtxr9FzhrWhpqGQpCI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GvcS/KlOff2DiIV4NPekUt+DVsTV9z7d0dUFYZzWeZxuVcINGrO0q4voV7ribySVNkGmxLcJ3DyMlo71ubPdMhI3jOxXyfb9h8Jiy/BBAmFp7IlRGrz04uWNwt7oZQB4s96m2cgJRNUXCYPzzpq2aruJqWU1TibcX3444D/Ql4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chVxYjcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chVxYjcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B301F00893;
	Sat,  6 Jun 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780744989;
	bh=RW5iDI1nw5+hsyNe8SDVvtSzDbtxr9FzhrWhpqGQpCI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=chVxYjcD+H8dRnfy4Ion4alSdIl2BOAY9eaMuPzyuDQkyy1J80SdWT0ch9NJHTCpm
	 gKLWqzCgl6yTSjmCu01XHOSgSBxLHl/HF/db6rWcNBZFzFRCT0IlpdiXiXNuNZi49W
	 y90fW3Hg34vrtv6+3mg+aTiEhiI5sJBThntUB0x9EoBjckeeavulJH2YiZsGUQopbV
	 arCDSjbOaKCxi6HlYY8erE6Nc/lPj86n4QFUYOXJ/WcpNNSWshJzMANCFzKZMPO1Mb
	 5VnLE0qIhBljeLEDqPl8G3tL25vCnxFSkIafpYDI6s03Z0r9TtbyFw+c5TXG5c9G4D
	 BU/uZmF51xFfw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 13:23:04 +0200
Message-Id: <DJ1XEW84UTAU.28B9WK4VR0QLP@kernel.org>
Subject: Re: [PATCH v2 3/7] rust: drm: Add RegistrationData to drm::Driver
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <acourbot@nvidia.com>, <ecourtney@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <boris.brezillon@collabora.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260603011711.2077361-1-dakr@kernel.org>
 <20260603011711.2077361-4-dakr@kernel.org> <aiC41_huOYhvacQD@um790>
 <DJ0BD0O60VAB.10S80F8N6MQPG@kernel.org> <aiINpEVaLW85LM5j@um790>
In-Reply-To: <aiINpEVaLW85LM5j@um790>

On Fri Jun 5, 2026 at 1:43 AM CEST, Deborah Brouwer wrote:
> On Thu, Jun 04, 2026 at 03:53:32PM +0200, Danilo Krummrich wrote:
>> On Thu Jun 4, 2026 at 1:29 AM CEST, Deborah Brouwer wrote:
>> > Hi Danilo, could we use separate data arguments in UnregisteredDevice
>> > vs in the Registration? Basically we want to use the UnregisteredDevic=
e
>> > to initialize and boot the firmware which we then store as registratio=
n
>> > data.
>> >
>> > Could you have a look at this patch, it applies on top of this series:
>> > https://lore.kernel.org/rust-for-linux/20260603-use_tyr_reg_data-v1-1-=
97f64e951cf6@collabora.com/
>>=20
>> They already are separate -- UnregisteredDevice::new() takes T::Data and
>> Registration::new() takes the registration data independently. Your patc=
h
>> demonstrates this correctly.
>
> Ah, true the arguments are different, but the issue for Tyr is we need
> iomem to initialize and boot the firmware before we have a registered
> device.
>
> Could you replace your Tyr with the changes i'm proposing here:

I don't see any change in your patch that belongs into this one. What exact=
ly do
you have in mind?

Please note that this patch is about core infrastructure and should only to=
uch
drivers for the minimum of mechanic changes required. IOW, your follow-up p=
atch
already sits perfectly in this context.

> [PATCH v2] drm/tyr: move probe resources into registration data
> https://lore.kernel.org/rust-for-linux/20260604-use_tyr_reg_data-v2-1-f77=
a1ffcf08d@collabora.com/
