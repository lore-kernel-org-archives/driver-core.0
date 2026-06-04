Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341237E304;
	Thu,  4 Jun 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581218; cv=none; b=ckELA0PZCAxhxm7Bow/I8uNJDV0shNekFyBI3gvbJ7I/bIH3qxeC4a3CYrIciUiY9BegLDZ+u4Gbj2liyaGp9/Rw6hvkBMZyuWLTHnnnq7PgC3u3XpMBdtbAqbAKCqreto7+2vFW0Ho/ZHOQNbdzNnfMzkrKvlV+gs0EOP8NPtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581218; c=relaxed/simple;
	bh=3tNRq6VDKdkCaUkhtn82k6pDJi8lH5/RPheKwjzO/po=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LsP7OGnl57NYe3PpMchpnCt9enFPZ3hrF32YrBRtVK4k7bD4rghWpRRgEfevBbJ4iyehafUAl55xx4TTS6WDtpt6kFGPYKbsVxDz/RU6bTCmkCyFd1tiG7EyTbatmGM8w3+W6U3366jqoC2IF/izKQ8jY4d6361JI+ilK41T8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SI3SXia8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SI3SXia8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E351F00893;
	Thu,  4 Jun 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780581217;
	bh=3tNRq6VDKdkCaUkhtn82k6pDJi8lH5/RPheKwjzO/po=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=SI3SXia8KpslS08g/xKwaLJWaS+55xfNn+IKuvBVXsJsoAJKjr5fcHbkOGgNYGzZw
	 3twnPyrzIOncNjMd6MIUvV8rAMH/PxpQfScvKRKSgRvuV9AayvYC3grgg/qDmD+GyY
	 sWH7//YOw7Z2UrNoJ2awr5aN5dNjbtrlBAXtldQddOCXVNYl8vwj5wM6jBT8kKYTG7
	 LM0MsWjmJnC23HAY0gn5J0rHnLjpp4yKzhfpfu5KOWgDa4/sp6ReOKvv5Z/TPia+rq
	 U7/GfbhQPME/+pbIjSwrNhiZN0aTlK2Wa5FA82ttTMJV4NYtPZA/5GnFjcbnluQ6O2
	 8Objg8h4PHhOA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 15:53:32 +0200
Message-Id: <DJ0BD0O60VAB.10S80F8N6MQPG@kernel.org>
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
In-Reply-To: <aiC41_huOYhvacQD@um790>

On Thu Jun 4, 2026 at 1:29 AM CEST, Deborah Brouwer wrote:
> Hi Danilo, could we use separate data arguments in UnregisteredDevice
> vs in the Registration? Basically we want to use the UnregisteredDevice
> to initialize and boot the firmware which we then store as registration
> data.
>
> Could you have a look at this patch, it applies on top of this series:
> https://lore.kernel.org/rust-for-linux/20260603-use_tyr_reg_data-v1-1-97f=
64e951cf6@collabora.com/

They already are separate -- UnregisteredDevice::new() takes T::Data and
Registration::new() takes the registration data independently. Your patch
demonstrates this correctly.

I also replied to your patch with a few comments.

Thanks,
Danilo
