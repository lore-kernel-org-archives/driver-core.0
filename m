Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD5223708;
	Mon, 16 Feb 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237156; cv=none; b=OFRog+nXZ5PdfzfFyYohbNIB5ErI21BnhCPX+0vMPeyYEn1XozX9CcExM+aPQF0nJoKgLLxRXJSjeIyB4OtYtME4oMAF5BNoSk1x9R/MzFecg5Hu5XVQSZ13VjWxC7zeOO7ZrqfQLAeyJhfzRREfzFpDwJyG0xYhMb86ueiNSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237156; c=relaxed/simple;
	bh=foN7eBSH/BQQH6FijjnQmtw6BFXfrNqt0XLjalP+Pb0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+peNLKxgU7EesNk+DwCe1z/wzmd/+KL8z5xPQh3IPpKejsiE8uzxysiLWzaOS+6pRNXPos+nsCJipmsf7vreNGYPbTbMtMnSUwFF0uC9nhAU3vufUqUtlR9dHLZeI7LqnSuSDztsN2NCpOhqkbFHB+1kG43f/WPbKksB+xnNac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=x4fRjI7i; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="x4fRjI7i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fPpuQghjjBLmwcDQFbY9dhkiK1rjd17YsAWDWoD7RXA=;
	t=1771237155; x=1772446755; b=x4fRjI7iO9V13nyZqv+Q+V8FIqRIyQBQ6Iq8H1NqOXQQF95
	TClLOrj6IDk5z10jf/FyHqKkTL2ukV9i5TTREqaTfsIxfts+diiB4P1bBC/EcBZTgegpe1OPSwjQD
	AZUs7dH9hSj/m6pRMGQI61K6X+dT5N2o+cDfsWzRcYTJLtqZWrBbQXiP3e4ol85MdqMRCNfwtSdZM
	tmsp7xTXLj2gbNN/4zJWjH7imfH19S5lNzNFjeGjI5+PwAO7osLWFt9ybd003WTCPOw+Dftg3ABHA
	1mfz0w522PBOx/cwfjXmc7eO4og6ZfTokp1MNYuo7JN2ii5Z0vLopQk3ldmaAaBg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vrvh8-0000000APgG-009C;
	Mon, 16 Feb 2026 11:19:10 +0100
Message-ID: <9fc2586e16c2a0fa3599432b19fa7049e561a7f6.camel@sipsolutions.net>
Subject: Re: Mainline UML Rust stable io.rs unused imports
From: Johannes Berg <johannes@sipsolutions.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, David Gow
	 <davidgow@google.com>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
	 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, driver-core@lists.linux.dev, linux-um	
 <linux-um@lists.infradead.org>, rust-for-linux
 <rust-for-linux@vger.kernel.org>
Date: Mon, 16 Feb 2026 11:19:08 +0100
In-Reply-To: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com> (sfid-20260215_134720_322640_B137859C)
References: 
	<CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com>
	 (sfid-20260215_134720_322640_B137859C)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Sun, 2026-02-15 at 13:47 +0100, Miguel Ojeda wrote:
> Hi all,
>=20
> In mainline and next, for UML with Rust stable (but not with Rust
> minimum), I am seeing:
>=20
>       RUSTC L rust/kernel.o - due to target missing
>     error: unused import: `define_read`
>        --> rust/kernel/io.rs:229:16
>         |
>     229 | pub(crate) use define_read;
>         |                ^^^^^^^^^^^
>         |
>         =3D note: `-D unused-imports` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(unused_imports)]=
`
>=20
>     error: unused import: `define_write`
>        --> rust/kernel/io.rs:262:16
>         |
>     262 | pub(crate) use define_write;
>         |                ^^^^^^^^^^^

Not sure I understand, the cfg() seems to only be fore 64-bit, but it
_is_ possible to build UML without IO accessors at all, since it's just
virtual, but I don't see how that would reflect in io.rs.

Not sure I can say anything else about it, sorry.

johannes
