Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670451;
	b=Rs9lF/3h/baZfIUuRUm39jP+cb7AzoBnoMljoqtp+EtM68kPTqGJZL7yaUI3TwgVWHfR
	 megtFkLfqEoUUT9hg0KEDAIHTU/5nLF+G5RkcyuhyKsk70pSoCvjyPpSDgzK39bRCMDWB
	 W2reWRjVTY5v5293+FGd4JBnw7GfR2rTT5XkbhkpwDht9VsMv/7BnLStbBJdoQ9D2eLlW
	 9IptBCEUaBBVszlz6k+BVNLxY/f14089Qec+ofBKTXZR29m999gSJU1FBwMD0LM1kGlgn
	 KWoU0lGRHEOylGcJcBJ0mDgBzsOfa8o++R8TYh73s2GmbSXzV9p9P51OmnJaSKWcVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670451;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=beO2IvzlcTEkpr9TyrCexf/bT5TFy8E4Cm3PHz55W9A=;
	b=2kESh866Y4qRuhe/xlyzeZpJHCaALXoloLf2wdekotepqcMY4wsOR04257b3RkeQdlfM
	 x5GgM7GRNAI1SQz2tXFCWC4hHSEq5IvLUNIKrDAtbZ+UFNA2YBCBf5yHsj1N71AgNqYtA
	 0zarWssuv1xA5H+k80qrfBi7BAQbA+fnH0eBB9ujr0AKENbCh2la31SBisiJ5FFeOfpRK
	 9pktSOEiqH7nUyzNSYmH5qwa1DlVKZUe+JGldOJYrded6o97y1gE2dgleIaz2U0Ab2wTI
	 FxXmhLnAJTzYUysXZzYDv2Soyh4XMMGhWxx3qoYCJxA674qmP1wXdejxA4jrEmZzJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXZuaAkm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47E606A324;
	Tue,  3 Nov 2026 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXZuaAkm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5EE1F00919;
	Tue,  3 Nov 2026 01:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670450;
	bh=beO2IvzlcTEkpr9TyrCexf/bT5TFy8E4Cm3PHz55W9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXZuaAkmF5S1hCxrhE9UVrYuQLhrWSgL+Mu+r/TLwJxOmMmZnMADSXYrIus00UPGL
	 lZWA1vVEJwGQsLQcPo2FlPOoKl/FuaNaznUYD/GQWcL7R6oBYwFXDOI9pebBmihVmP
	 PK5d7JCSxKgDlelnECiGavofhk2dggLoYsNyj7L9rsgvaQzV5FwXQTvtKVM5Fg7ucP
	 x7BwW6jlTmN6wzgL5TN2be3Kv1aaaftyIEjgwpOzEPrwkKSdMW/M8Cyo9KY8gzBnMa
	 324rik4h/L2c2GD51q+pUsObNfgQXAHt83sXu8QTUqz0+1ZAV+b4foa7k7aYV5rZX4
	 fjgAXBUezgQOw==
Date: Mon, 2 Nov 2026 17:47:30 -0800
From: Kees Cook <kees@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>,
	cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
Message-ID: <202611021747.3BD1EB4D@keescook>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
 <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
 <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
 <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr>

On Mon, Nov 02, 2026 at 10:09:21AM +0100, Julia Lawall wrote:
> On Mon, 2 Nov 2026, Kees Cook wrote:
> > On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> wrote:
> > >
> > >
> > >On Sun, 1 Nov 2026, Joe Perches wrote:
> > >
> > >> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> > >> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> > >>
> > >> Finds and converts sized devm_kmalloc-family of allocations into the typed
> > >> devm_kmalloc_obj-family of allocations.
> > >
> > >Applied
> >
> > Please don't send this. I already did this. See the PR I sent for rc1:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-linus/v7.4-rc1/devm_kmalloc_obj
> 
> Too late.

I don't want the rules duplicated, though. It should be a single set...

-- 
Kees Cook
