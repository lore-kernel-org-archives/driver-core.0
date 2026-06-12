Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C738A722;
	Fri, 12 Jun 2026 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295457; cv=none; b=QRed6uazNxZSO30WpKNMYHa1LTYhzW0SfTQKzuTtn1IbBV/GEMvMnB5yLEcqwLbdqMQw5AKwHqwPU5ChQ0oJdN0IytaZttRZTnItbjjGAllUK8gDC+T+ry7ftE+dD8uU3xxk+j1+wqNBa9GpdRTgUA9o3sO7uc9mQxLUQctOnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295457; c=relaxed/simple;
	bh=RJfOP6QiAj/BixILRrnrPsmmos3KT5ZLsJo7dqbrU6g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oX83cZYFU6Y5eQL9YqUDhPq77WZnrAUVuNEbWb0lflC39y4PDFFPOG2maI9HukEwSORZGxfgOwyYS7fL4hfVbcDhGp2w/addYnxk0kAbal0ihwJ0nq5p6blOPjpirfEFtt5ckseqgrQzd8Ctpm5XjraDsZ+oCrdY9nya9CC8zVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdpxwRGB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdpxwRGB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2371F000E9;
	Fri, 12 Jun 2026 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781295456;
	bh=pJzuNVWTNf+53sy5yuKPcqhP0sKI2LYYj8cvjNu/tSM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=GdpxwRGBrf+qpXAR4d0Nz/svA8GnlSNp4xm1JkRSb71qW3Vv6kndMHbj1bAUWD/NM
	 clLsSWhWXgMw0G4JPYmRM1CVs9R4G39GEuZpZ8fhyLOmcvFBNi/AdHdY76Jjw9J8le
	 HVVbR0yVWHjAT7t0VQT1yh5x+i4wH10aW4joDeSLt0a5oqmAlMnSdwwk6OBm4FMmF7
	 ap9Q4T0B+POpHfHaBJVwAdSxLuXzvSiaMfoJvQP2RVNluhx8jpaR13jfqs3ewInCWY
	 7PYGYcg87etPCjusox7PGggnG6MQ9ng+hjaQeZQ3PMA9sVyoKm3sDk98mVHBeK8PkO
	 AN9JkZRDDvjNg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 22:17:30 +0200
Message-Id: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
Cc: "Lyude Paul" <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <driver-core@lists.linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Simona Vetter" <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Benno Lossin" <lossin@kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net>
In-Reply-To: <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net>

On Fri Jun 12, 2026 at 9:02 PM CEST, Gary Guo wrote:
>> +impl AsRef<device::Device<device::Bound>> for Registration {
>> +    fn as_ref(&self) -> &device::Device<device::Bound> {
>> +        // SAFETY:
>> +        // - The underlying `device` in `faux_device` is guaranteed by =
the C API to be a valid
>> +        //   initialized `device`.
>> +        // - faux_match() always returns 1, and probe runs synchronousl=
y (PROBE_FORCE_SYNCHRONOUS).
>
> Please quote all code with backticks.

As far as I'm concerned there's no need to do that for things that are not
rendered anyway. But also feel free to do it anyway of course.

Thanks,
Danilo
