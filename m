Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461773D5226;
	Thu, 11 Jun 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179588; cv=none; b=f/lhXJDm2Pwcx/CSJImpumcwVcr1rYT6Q6LU9CCB4WlvGKT9sBZuniy0o5e6GP83wKJfGj2dNSR0lfss8IirfEhBrWq5cXQ325wDDY5rdKTQZQfyKnJHZyz91pzikBsdTmMVYFxlMX4laEvzyfRqjutWlqOIdFhFj70ptlhDVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179588; c=relaxed/simple;
	bh=iicmZYcbWS+gki+Cy3qcP55HfbzqPR7+/MXz+XKglKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fuSjFsop1a5ZNeFzmX5MnmqikFHXDNKl1DkGkTMfjs2lw/lFtqThj3B+lPlEZg5p3ZxEnCU2TbYa72NQuutyjV2W80gd4hngaqZaq+5zWq5P4n2nWPkcQIAI57+WsKDAEX8RqtQWLRuHhQgeTOxHJXEq3vdA0/lW8Z1LN3KPSCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5S4pfgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5S4pfgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6BA1F00893;
	Thu, 11 Jun 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179586;
	bh=vcsE+Ll4t6tOK0zqdhAk30KTSJNudRT/Tk/a1RVLDDw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=j5S4pfgy1wTzVXarkvRi9GoSaldgH2pdXFoAaPR8hHN+mZ0G4LkNezvYKDuiufKey
	 iy74qmeGvmGgZcLb8vDjpJE8qv7lbN+Rx83wc7oWdoeVsSH//4tEUTCp9bwR6S0DsJ
	 kAF/FD1e3BiDyIyTHo1/HXbO0N5sS9IAmShv8NZLq56bOKknMMiZ3wuqlEU8NmgGbf
	 MqrHiYJDZDugg+pcZaOi8BI+FPSiryJb7wrU4gTwid89+e6YyS45ZuaPwEIPEbXvrQ
	 SOMM+nl2R5xy6KFnPVGttNmZox3lr8VH57pxHXGoAA5bv3wKd7iQW+xXdTJ2n52Fyu
	 dPULNCiXLWWvg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 14:06:20 +0200
Message-Id: <DJ67GR3JEXOK.1ZSB4X97BV0MM@kernel.org>
Subject: Re: [PATCH v20 0/4] Rust bindings for gem shmem
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610162433.923550-1-lyude@redhat.com>
In-Reply-To: <20260610162433.923550-1-lyude@redhat.com>

On Wed Jun 10, 2026 at 6:21 PM CEST, Lyude Paul wrote:
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()

Acked-by: Danilo Krummrich <dakr@kernel.org>
