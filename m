Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609531;
	b=fItdTadI5beSH8XUHc15pv22aMJLqbSD6Rxjg0WqHp4PeLEHmiF38b9TWIje1Ql2buF3
	 OC+PZCv2dktgxS+DI9ge4fBzYeRcNWsfcSWFV64YLoR0kDzDVsmosCUfk0ASTw3Rb5lzP
	 L3pnGKfXNJRZc6GUJbAN6WjS4iWmB4p6IRuBE99i149Es4q46EKMQy07P29eJYHZJlD8l
	 ztJKOc3GPRV9crQ/2wkdtRk72LEZQM+zt//e+p2pumcavW5Goxb94Fg9/v3fWmpjDvEqX
	 CrNOqwaVtNh0plAJyEV5rFlndXWX9tqD+QKE/zx7VIRCqEAVdacN2y34gdSMp42cCag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609531;
	h=Received:DKIM-Signature:Date:From:To:CC:Subject:User-Agent:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wGgrenPAGONjx3juK4qLijjOoygFzEm+H058XYYA0mw=;
	b=SHh9a2N7HZbW14XspH1wM9vEk87hDeBAgaCmUTJ0a4JGPqV2kTxAWNGAO2LjgrkDt7k0
	 i4AcjjqqC5RTcDkS0uJBSdA9E35edMuT+Rki4hEPkp8lM8jgZS8pp2DFI38/nL5f6HYOy
	 G8I2rtYjLF+xWLlN8cx8Id7ATA5WFcrWLFN4Kz1SnLFJQ8jUlmu2hjSlqZN9DbssCRWu3
	 qdxDBrSB8NzfaE7yiG8BXyCT+lNzKqTHGmRaG2/JgUHrmZmRpzmAzQMkAhxvnhVMkyC0e
	 SXs5/bXweiitxnLRCzH2iheJD9apdjtssuWTtCI90P3p8uFO2LGI3ICkJ8maJV4wkNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EvE/GvIB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA92606A324;
	Mon,  2 Nov 2026 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvE/GvIB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767291F000C1;
	Mon,  2 Nov 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793609530;
	bh=wGgrenPAGONjx3juK4qLijjOoygFzEm+H058XYYA0mw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=EvE/GvIBiEFTDXxwEUC5tvzEJijo7zXDOYLOML9+ltjNOpseXD7i+8IYs9z/BsBYs
	 ACDC2yeNqpa0MyIdtB1tW20MWPu4XAfot60lvub2IGfowHnpXEMmnEeacigsCrhHb6
	 CqQRSc/FJ4cR+RTMZb0anmg47wSTk8bCW6xefbDPMKwt44SPEmZFVb/NwLA7r7kXJj
	 C7iGvzlDT4TQcLgTu3SqojLMjd9vLUgjEAXSvEcLLABYqAf9yuUaqVcUdBkpmYz6F4
	 CMNijMiLYbpA+al6ynGl8Pphwx68I1zP/cyqG1e+is1lIWz9ic1uNCOWaKPWHxAy8E
	 EHEwcoi+9MsgQ==
Date: Mon, 02 Nov 2026 00:52:09 -0800
From: Kees Cook <kees@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
CC: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, driver-core@lists.linux.dev,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 cocci@inria.fr
Subject: =?US-ASCII?Q?Re=3A_=5Bresend_PATCH=5D_coccinelle=3A_Add_?=
 =?US-ASCII?Q?devm=5Fkmalloc=5Fobjs_conversion_script?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com> <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
Message-ID: <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia=2Elawall@inria=2Ef=
r> wrote:
>
>
>On Sun, 1 Nov 2026, Joe Perches wrote:
>
>> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion scri=
pt")
>> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_=
KERNEL arg")
>>
>> Finds and converts sized devm_kmalloc-family of allocations into the ty=
ped
>> devm_kmalloc_obj-family of allocations=2E
>
>Applied

Please don't send this=2E I already did this=2E See the PR I sent for rc1:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/kees/linux=2Egit/log/?=
h=3Dfor-linus/v7=2E4-rc1/devm_kmalloc_obj


--=20
Kees Cook
