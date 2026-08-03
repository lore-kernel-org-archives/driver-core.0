Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777D3290B9;
	Mon,  3 Aug 2026 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779759; cv=none; b=p+hxJd3T4WW494zUR2Z3L5l1EUscMMZzmQsH30GL0mop2JKh6qIv5YhKRWrQ68MCpOTxw2CT2X0gjJFDIofeX4il8n5tR7++Rhy3VIECAkyR8Vq13PDyPfPGMPpG3KLLi93XGp/KMo2TFp497pbl9pfodyydPw0dwrli29t/0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779759; c=relaxed/simple;
	bh=QNouzkrA1TqxDjWgsNxvGGlEWDueKrOGn3kgkX5muys=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=EEglcKPOc6cI7Q2us1Z1RvEbV9ZQzr6sKJrWYOlO4iO73az2HSkzdmfOUWlHCenkDJVZ7RHe0pDrrg38GEhNs9GC3u4ZKU+0u4meC04BhpZoqPZnuHtJggbNVd3tfF0sAYCcVS0XTcVpzwTlIZ5qQOm7eo4tZap4rzci9TM5wOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tnd60swh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tnd60swh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1A51F00A3A;
	Mon,  3 Aug 2026 17:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779758;
	bh=V183rzhhugBwg3vh8YfWq1iT/27aLeKbPvm0NIc25+Y=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Tnd60swhIZLFBtpdJjnNdNWzlFvA6hx1Mhjogl5Ihx88RLTYYwPErXzNP7dWv5kFs
	 IUlU2k7VJaditjVTRNBATsHcGM47qfd4feQ6UueXJj76fg6xY117xfqLBuozr97HoG
	 aUO28JvN8jFbCAzNHB7DaP3tim0KpjZNWyhjZ31J2YRay08p7B+7Wuzoh+A7hdYJvW
	 fjSy18CK4Jn9bANDkRmLHcRybw5dQflyWd+nUdO/dPtFprr9nFGbTKFAwN48kIKbZ6
	 WjFGJ1lo0QYZ4t7lraKb7Cw7ZRfoDuI5+5ENzTmuxDDjwC2M/tKeXvtrcSZhNQhVjl
	 W4SvcbWIRXDtQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 19:55:50 +0200
Message-Id: <DKFI383UHNXW.2X3OG31P5QAJZ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 5/9] rust: drm: add debugfs_init callback to Driver
 trait
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Jan
 Kara" <jack@suse.cz>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Melissa Wen"
 <mwen@igalia.com>, "Wambui Karuga" <wambui.karugax@gmail.com>, "Eric
 Anholt" <eric@anholt.net>, "Ben Gamari" <bgamari@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Alvin Sun" <alvin.sun@linux.dev>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-5-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-5-aea19eccb996@linux.dev>

On Thu Jul 30, 2026 at 7:05 PM CEST, Alvin Sun wrote:
> +    /// Populates debugfs for this DRM device.
> +    ///
> +    /// Called by the DRM core during registration, once per minor (call=
back
> +    /// runs after `dev->registered`).
> +    fn debugfs_init<'a>(_dev: &'a drm::Device<Self, drm::Normal>, _dir: =
&ScopedDir<'a, 'static>)
> +    where
> +        Self: Sized,
> +    {
> +    }
>  }

This could just be

	fn debugfs_init(dir: &debugfs::ScopeRef<'_, Self::RegistrationData<'_>>)

as it is only needed to populate files / directories for exposing things in
RegistrationData.

Subsequent debugfs::Scopes can be registered from drm::File<'_>::open() and
IOCTLs (I also work on introducing HRT private data for IOCTLs; semanticall=
y
equivalent to a Vec in DriverFile<'_> or RegistrationData<'_>, but managed =
by
the subsystem).
