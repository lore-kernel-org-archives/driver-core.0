Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534813AEF4E;
	Tue, 19 May 2026 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218904; cv=none; b=H/kadOy4cKe9rApHiWjibDdSnRr6X3AWDLCVPpc01R79PL0gtBtEzS7xEeL8bo0CXJV1kyktUAWx2st2pQKx7c+mhnFwvJ5+lzsT8tldWzjIJAincoOm/cMijWOS+ObZrF3OIkrZv6uVep6GCXj0xd3EH/0hRPNkBjXNILzZGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218904; c=relaxed/simple;
	bh=YTS4bNSKOXdEhxMkE7f4lWZFVBdpOGwn8B+fbBdHW54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nCNUB+2RGlBwd7qsokx7rk4ARLoBnS8XBWpEapzqKgNdbPa54wtK2VPJImWoa7BX0w1UqXfv/K/PiJlZEYn+wia3uiWErt+JvE8ZSdSqgJmhTLYQA/03pXCdkFym+sOarSV2cQPoasI1pleoQ7nsuq/3Wyf+khdPyad40lME0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbadDv9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbadDv9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB30A1F000E9;
	Tue, 19 May 2026 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779218903;
	bh=YTS4bNSKOXdEhxMkE7f4lWZFVBdpOGwn8B+fbBdHW54=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FbadDv9wrtzbzkKkSw8dYjPu778nxjROQmQtwhRK+NNtocjFx8EboYmBwBRABUZFn
	 rV4OBNHwv0LeKw5OExpucpC+ZIesPYmD37jOI+wHmLaQfMYYB3PwX/PK55kkBNmKRo
	 hXOIkVpquhHQDME2jJlhEnrJ3aN78hPIQPkZNj9AGjhELCcP+r5JvF/qIVYSO5YEJg
	 H6o9PWTywMR0oFyem7P90XIOrcXk95HBBvFXCm9+dAT26oTeV8lWrk2Eg1lUSF/w+P
	 LA04sJu6SBTNnsUe++9WCqnuxG6vHwbOABotrPw2bUD03PVIbITXea8WHHBe1d70dz
	 uggt8NBQ1rfRQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 21:28:17 +0200
Message-Id: <DIMWGLNJ922I.3PCET9O1J83TS@kernel.org>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <acourbot@nvidia.com>,
 <apopple@nvidia.com>, <ecourtney@nvidia.com>, <lyude@redhat.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
 <DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org> <agYbppHWXk_hW99M@um790>
 <DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org> <20260519205947.3c9d99b3@fedora>
In-Reply-To: <20260519205947.3c9d99b3@fedora>

On Tue May 19, 2026 at 8:59 PM CEST, Boris Brezillon wrote:
> On Thu, 14 May 2026 21:07:11 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
>> > let unreg_dev =3D drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, d=
ata)?; =20
>>=20
>> You shouldn't need this anymore as the drm::Registration itself has priv=
ate data
>> now that is bound to the lifetime of the underlying bus device, which sh=
ould be
>> the correct lifetime for juggling the GPU page tables.
>
> The problem we have is that, to initialize some of the sub-components
> of the driver, we need to be able to allocate GEM objects before the DRM
> device is exposed (registered), and because the data we want to attach
> to the final registration contains these sub-components, we need to
> defer the data assignment to the registration step (which was allowed
> by [1], but apparently this was dropped from the latest version of
> the series for some reason).

I'm perfectly aware, what I'm saying above is that you probably want to sto=
re
those GEM objects (that you can create with the previously allocated
drm::Device) in the drm::Registration data. This fulfills this requirement =
*and*
ties the lifetime of those GEM objects to the lifetime of the underlying bu=
s
device being bound to the driver, which is exactly what you want for GEM ob=
jects
that contain the device page tables.
