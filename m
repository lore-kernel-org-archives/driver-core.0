Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B43E8675;
	Tue, 17 Mar 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758433; cv=none; b=o+eNyl3+48w6YjQcGdkbpn/qFDs/NdhmrLHBRByXQfl4hIOFwCeu14/JiAigGGIhcE/CBpJoIe52vTiS+aqlejssqizpGgnxRlgtEI2up9gCOyZp5ouaRky6njHqU9uQxgtaHTklJTGUyOEqS35067DEdH1OwCXMwWJijB85Ooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758433; c=relaxed/simple;
	bh=EvYCcTW9OZ4w+eYnCud94ZVVBQFcEHeOk0Qf21v1cWs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gOVb2UCKXoEYuJfZuRqHdjlm5pkElpHhxBu+Ahe7WVkCh5SmZR3Y1cmhmpPXgmv9/ll/fOITbYYR1RZrO9nWVqh8O22TnZUJb3GAUpmam2bVkG8j3FjPXPPAqoBE0Pm6eb0Te/mRWD2dwcz7TBC9z8V7e6SyaAk7DH5kRvA+uKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YET4X8Al; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YET4X8Al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8DAC2BC86;
	Tue, 17 Mar 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758432;
	bh=EvYCcTW9OZ4w+eYnCud94ZVVBQFcEHeOk0Qf21v1cWs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YET4X8Al0E7xW+qNdPitpEBKm67SGfBeakvvFwPWtHFId/MrUTmacfbxc+Dvtprp7
	 l89HGwLfRbb6UNAOtar9lV10fYIY9tfSp2yohZK/tLKjgJ2Fxl2w+vYDgYbHs7piq4
	 7et28Wse4LWMT3UF5yDw6KlqDutJ/VxXIED6eesTZVsCerJSN1+x6i0D/b83uX9qKB
	 6ykLvlCHefbUiVxdUo2c3SWCGT363ZQZ0xekXjun0eLrlRFBXZPxjL8yRaA9dCUwcs
	 ZtCa2MkNk1ReLDHuZBhvC+39B0/Hj8mR8tTAigYX8f4GM078sQ5rYPvGV03tah/F+m
	 lhT176bR0fCtw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 15:40:28 +0100
Message-Id: <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
Cc: <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org> <abj6I9c_2IR0cKJ6@google.com>
In-Reply-To: <abj6I9c_2IR0cKJ6@google.com>

On Tue Mar 17, 2026 at 7:52 AM CET, Alice Ryhl wrote:
> On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
>> Currently, dma::Coherent cannot safely provide (mutable) access to its
>> underlying memory because the memory might be concurrently accessed by a
>> DMA device. This makes it difficult to safely initialize the memory
>> before handing it over to the hardware.
>>=20
>> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
>> before its DMA address is exposed to the device. dma::CoherentInit can
>> guarantee exclusive access to the inner dma::Coherent and implement
>> Deref and DerefMut.
>>=20
>> Once the memory is properly initialized, dma::CoherentInit can be
>> converted into a regular dma::Coherent.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> overall LGTM
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Gary and me concluded that dma::CoherentBox would probably be a better name=
 for
what this structure represents. I.e. you can carry it around and use it sim=
ilar
to a "real" Box until it is converted to dma::Coherent in order to make it
available to the device.

Is your RB still valid with this rename?

>> +        let ptr =3D core::ptr::from_mut(&mut self[i]);
>
> &raw mut self[i].
>
> Alice

