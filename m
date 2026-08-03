Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D863955D8;
	Mon,  3 Aug 2026 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779789; cv=none; b=JXyXxhLO5pR3IHCPOMCUwO17zrS7dny2ZTEOzxYVcCP6SXTjypl+5bkBndJc6itCl9X2+E3tdRQDCmoRXpaXAnRsFyA9ETTWd4XxmYixVgxFNE9M6+Nugv773fNgD92H/jtcN3Pbf8o7atZ1EYcOe9GN4eQisWgHD/9mYbS2erY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779789; c=relaxed/simple;
	bh=Qvrs2oBboVMB507TatCgoFZaOC1I0y25AAlsZMSic58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=oF7KHDHtovuT4Mjpdg07pif2/FFV4em1aY/Fw2negpsNrpEDqYGTuHQ89vOSbmcJoRzeuTziFt+e+BK7/blJABuY/426h0jbGnjMDw4gihyzWBfwLbD4PtEe2zuRiKVGogRwFFgpkCTTL/h5yi5wjp0blEp3JUWIoZM+KqzemSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuFz+tmd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuFz+tmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BE61F000E9;
	Mon,  3 Aug 2026 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779788;
	bh=Qvrs2oBboVMB507TatCgoFZaOC1I0y25AAlsZMSic58=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=fuFz+tmdn1gJS5SbwyUATSbpaBEq0otZ4K4VKTwmDHWnoxOwfCuemfOsEzo0u8YMj
	 cP7X9rlSZJd5kezXZuUewSlPM0U7TIVTWyFp+vECqHmbTv4Nkg6QtrOLFfaWTMRU6I
	 JQbefjoo+z8uRb/+uT6WpCFqGdiIdx9myxhVBm5cuU6+J8100nRlTRZU7uO4zQPriE
	 kE42qw6IfsFzYgLIQRac2gjUzVOMy4l9gmPxkOTjm9bMz0ib33pOiV6eIdI6BuIDgT
	 NdkW0EPvKeMD11BI4Akb+YfKhBoH2Mk7cn6Wt+Bqoja/4BevQSzlLBfcv8ggqw+BJj
	 SDM+yzZAgWdng==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 19:56:21 +0200
Message-Id: <DKFI3M4IEPIS.1Q2UYQGFIC6EO@kernel.org>
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
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 6/9] rust: drm: add DrmSeqShow seq_file adapter
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-6-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-6-aea19eccb996@linux.dev>

On Thu Jul 30, 2026 at 7:05 PM CEST, Alvin Sun wrote:
> Add DrmSeqShow trait and its SeqShow blanket impl for Device<T, Normal>,
> enabling Rust DRM drivers to expose device state via debugfs seq_file
> entries. Device registration data is kept alive for the duration of
> each seq_file read.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

This patch shouldn't be needed with the ScopeRef approach. The full proxy
already guarantees show() can't run after debugfs_remove_recursive(). So, t=
he
driver can just implement plain debugfs::SeqShow<RegistrationData<'_>>.
