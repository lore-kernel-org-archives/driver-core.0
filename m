Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53338B7C3;
	Mon,  8 Jun 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944627; cv=none; b=biD8CCZmQ3KvFcVuEvU8hbZDSsm8wE4NSmg/tvlmEU+62gPhotdlMrdaQCzOvLCguwwFb72xtb8H2yAKsmqpcrF89CCCphdQwI4cXLMfKdc5l9w+8XG0qjBNV3rfxWGUc9g9ACEPNEWtc2PZoHGipMRGTY9tYmj2urhCVIDJ4a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944627; c=relaxed/simple;
	bh=kazApNEu5k3r8vMDOLr5R/4GdfkcLErcS+m90T4yYtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=AoeulaZgwbrHbZPJDa4GpnWLRFkstShx+KIosK9fSUr7jkoQk5i+YOZtFDdti9lNExF5pKaQbjB6eF17KHPumUaIm3xz9V9/y+U1s7HRA8dPusGxeVvdOsb8F+EjDt2aYJjXv5bIxtSaoEfViNG6fvxN6DuZn6V4bjlhu7AzydQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JerpZAoU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JerpZAoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE231F00893;
	Mon,  8 Jun 2026 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944626;
	bh=HjZFDO402ZDsm7mMfRjPVjHrawSFxpu7iqkTSYlsac0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=JerpZAoUcN8RRH6FY2mqcHqv3G9EBFHXMREWaesJnn/P9WJewz66UROs393HxHyNT
	 ur6WEDzFmvjKrRgJiyAQdlQ0h9LJ5XksGmmcDUeqAI/TOG2eh2omxxjcb7fftns4vf
	 mNAu6qSjSuHJopkqS1bpoAnoghSHEJZF7XlHAlCc361Ux8P9Dx1DumrofMHOjm99xB
	 1vuwNzws+r24uxhfZjPVHQlarkTbXD/ZQOKrM+eCfXEClU2U0+JP2cYzIS4lxsBSkh
	 DgTkOvD5ooFE6SdVaRMsaubs0F/Rwmf73eQTkCpX8dEeBQdn+hQI236VVWJw2SDkiA
	 E0kApa1eeJWTQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 20:50:20 +0200
Message-Id: <DJ3W6FP39GZZ.3988HCMO7NN86@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v19 0/4] Rust bindings for gem shmem
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Christian_K=C3=B6nig?=
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
To: "Lyude Paul" <lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>

On Mon Jun 8, 2026 at 8:29 PM CEST, Lyude Paul wrote:
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()

Acked-by: Danilo Krummrich <dakr@kernel.org>
