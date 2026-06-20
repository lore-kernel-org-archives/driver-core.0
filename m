Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CB175A9C;
	Sat, 20 Jun 2026 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781974369; cv=none; b=HSsP3e3aauyszULJ0+JnjOF4RPQPzGWnWeS8f6Cc8YQ/XWsWOekwNLO8/Jt+NbKA6N0Zqsp5Ebh2BMYPELkY6nnf5MwINLyaG6m1w04sgUw86rvJQYREQwX1O4ZlVGIlZpY1vzGPJO9+xArWhefDacb6TNyw5VzNo/2/ESRkUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781974369; c=relaxed/simple;
	bh=JoW339LXCA+cTDSik90Cyu7BU/Io7zPzRjsu9yUZZtk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EWslKHIFe4ORuRCLmYpHobfaaA+a0iqWaBjLN2utQp5uyHnTjKP4okyUDZuMAoqFvOSNGkGQxiC0ShAm1ymZpDy1SGGHE+Cc1C1PweuunXTIxbbTzlnIV2vvbmAmGu4Q3bErxEv3rA33xFjfqFzt7k/fAmMO2TmIw8iNaF1yy7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QabmGs2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QabmGs2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8C61F000E9;
	Sat, 20 Jun 2026 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781974368;
	bh=wcYU0AFTW+xncKm5k5J8JjTFYk7WbPBX6yf/KqMiojM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QabmGs2QiHgLYdzUfnzECqKAJR10bla50VIIqBzEyEqGBsLOs98eNgJk0nH9FlqzX
	 6n4zx583pcsgvhxKzD2jhUTFOXlz6HCLbn6ythGMm7perAYR5V2YvEbJ/x6N/ALNZ0
	 7jcUhb5kHMIcIOu9ePGdw+XN3Ik0ipKRO3qQ/uUUfk2OBH/Ss2l9FQg1uVnlSRNI83
	 jTKJpHXPL01ooslM8pYruPqv2UbCjOTS5pxPRnKMTlL1DOQ5HKLn4FgjImcclbM1Yi
	 QMzbA3WtxviA87V8cLMBItU3+Qpw6TOSo5sVDl0OTf6itIC3ztAr436omuCXaUytIv
	 sLHwIFkmUk2OQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 18:52:42 +0200
Message-Id: <DJE16WZZK36J.2JINX1VTNW24G@kernel.org>
Subject: Re: [PATCH v3 00/13] rust: drm: Higher-Ranked Lifetime private data
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <acourbot@nvidia.com>, <ecourtney@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <deborah.brouwer@collabora.com>, <boris.brezillon@collabora.com>,
 <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260620005431.1562115-1-dakr@kernel.org>
In-Reply-To: <20260620005431.1562115-1-dakr@kernel.org>

On Sat Jun 20, 2026 at 2:51 AM CEST, Danilo Krummrich wrote:
>   rust: drm: Add RegistrationGuard for drm_dev_enter/exit critical
>     sections

As also pointed out by Sashiko, I forgot to consider that constructing a
RegistrationGuard still requires that the drm::Device has been registered a=
t
some point.

Theoretically, this could be addressed in a way that it is still valid to
construct a RegistrationGuard from a drm::Device<Normal> (e.g. by leveragin=
g
dev->unplugged with corresponding synchronization), but other than from IOC=
TLs
there is no use-case for this guard. Since IOCTLs already carry the require=
d
invariant implicitly, I went with a separate Ioctl typestate.

This and the fact that we can't let drivers infer any other typestate than
Normal before the RegistrationGuard is in place, results in a few changes t=
hat
are worth considering for review, so I decided to resend early.
