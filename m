Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE374D8D83;
	Wed,  3 Jun 2026 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525472; cv=none; b=Qpgovl88G2f+moZLaH4aTbM+e5TBLAdwvksTDojPoEyF/JWpzJn5ofdPCZozyL3lZAAapbJybenDDmlw3OowTuohxa+NsZToU8iMGUg6k8DAxfTqgrsIpJTI40XTCw2z5Y/bVSu/zC+wieW/gPIT0eLPk9wGJYmW+YaiyeVKvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525472; c=relaxed/simple;
	bh=oRue9xuachtE4XhgPrxmCEMyrffJqhjMfVZ8HPpUmZ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=RfSQNJwRfjSa+65X0Ug3NxvF5kPum5+IDUKeBl4gZNnlyW83ZtF/zHx+K+3eH0Q/kqdItei1GOUstMvP9qJPON9OX6USRQbNVIHNHS8kcvUD5Tx/P/rcKwtpXoxzJuiWTO7IeIgZq9mtYaaM/qKeenCnkVf9lvCj1QggCH0iH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8RAAhUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8RAAhUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9702B1F00893;
	Wed,  3 Jun 2026 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525468;
	bh=Kb7DLANZrh0uSUV/FMB6sG54v+634aEu5TRlzCENpd0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=l8RAAhUAK6MntbWawBEqiUgzxL+NQCcWGP4ifYpEY2XSoR8rODZDsneb2mGXtk20Z
	 3iVBxbWp0lZ4bO8ja+qsn2EwrmLu6hVKInu+VFcdjtiPZJ1ZyvlkrpDBQ55KwzZ4aN
	 1P31DI2wLTDpbxc74LWIpGrXKA40uEj3G7S03XSmQCAmb/bvHDtf5qRiJ7p2pl7a/H
	 7lDLu7LU+rIUfNASDz5uwDLWCxnpf8dnIwgp5GmedehLmNaBKk6GL+5sldrmfD28V2
	 4CVsaRWXlr2LOfT1vVKQ6aZ4migElw3WnOPqxsf0Z/mX/ckKHO0CKEJtd9PwepC16u
	 q3+jti5l0493A==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 00:24:24 +0200
Message-Id: <DIZRLM5N81KS.DIRUHYO435XR@kernel.org>
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <acourbot@nvidia.com>, <ecourtney@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <deborah.brouwer@collabora.com>, <boris.brezillon@collabora.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/7] rust: drm: Add RegistrationData to drm::Driver
References: <20260603011711.2077361-1-dakr@kernel.org>
 <20260603011711.2077361-4-dakr@kernel.org>
 <DIZE54GCJ9MS.DW75EP5OM604@garyguo.net>
In-Reply-To: <DIZE54GCJ9MS.DW75EP5OM604@garyguo.net>

On Wed Jun 3, 2026 at 1:51 PM CEST, Gary Guo wrote:
>> +    /// Safe variant of [`Registration::new_with_lt()`] for registratio=
n data that does not contain
>> +    /// borrowed references.
>> +    pub fn new<E>(
>
> This is currently unsound, as leaking the unbind guard also gives out
> `&Device<Bound>` in addition to the registration data.

For this to be unsound someone would need to be able to move the
drm::Registration into a context where its Drop runs independently of the d=
river
unbind, because otherwise leaking the UnbindGuard would also block driver u=
nbind
forever and the now unconstraint &Device<Bound> remains valid.

So, I assume you refer to the case where someone calls forget() on the
drm::Registration that was created without the promise not to do so, i.e. n=
ew().

> I think we should just remove the not pass `&Device<Bound>` to ioctl call=
backs.
> Giving back registration data is sufficient; if a device driver needs
> `&Device<Bound>` it can just store a reference in its registration data; =
more
> commonly I suspect it will just store whatever device resource is needed =
and
> doesn't need `&Device<Bound>` (with the introduction of lifetime, we have=
 much
> fewer cases that we actually need `&Device<Bound>` and cannot be replaced=
 with a
> direct reference to the device resource).
>
> Not passing this bound device allows us to make this safe, and also remov=
e the
> need of patch 1 and patch 5.

I follow your reasoning, but not passing T::ParentDevice<Bound> in the ioct=
l
makes Registration::new() rather pointless on its own; given that it takes
T: 'static you can't store &'a T::ParentDevice<Bound> in the first place.
