Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B137C924
	for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366356; cv=none; b=GQLjXtXKeNGmog4cUSKAP/ZiayjKtJxQURWygg+h5WNsvK4FHoqqo29bOwafNiffLK0Fs4v4yZVJ4fPYZB6VLrctmr1bwUSn/Nz9fcHbJjcmu/IkxOXzKEGYHtVfHJ8ZZjvROOV8xD+OuDVcLXWaLgcancLgY2UkhUKOUTTv2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366356; c=relaxed/simple;
	bh=PN49QF9Y+V9UUyKGqccy2dhVbl8behFq4Aa04BBV2AA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VX+DvI+PYdtXd/xZG2+r0/Cwn0IgFy0WJv030oKgjkvflsC3fTZalLx2puu9ALuybs/YCE/In+uYCg02gfA2Z6eFqpTNGnUG/qv9zsPvPfJRJ+lK5V/O8+np/NSewNumIWNQ8XJyfz+p9UqmIwM8KQTTb3nM3zw+b2S9MNJg7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hg7ixf0K; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hg7ixf0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782366343; x=1782971143; i=markus.elfring@web.de;
	bh=TaZ0PwElhtxgyPPGfaUjiCdyX+subb2+Sq0EdGJv0oo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hg7ixf0KM0EdkkcXwLKNW3eJtdWSCs01uqO6y3/FFU/hZdFO5B2WVYQ7hYU1P70o
	 te9eal66aEtnrJtw5H/QifHjMSFwCTZxZlopG1Aa3kue+fmyC3wrRucWZg7zTTudd
	 RDt/8khCBtBliNcJ9LAaPqc90eu0bSpGBnk5wPFDqhCDeCjPzN78+txCuR83zlJWH
	 WgX4z5vWclnLbQMOk+sUhN/yTku+UyvTdXTZ2/sjmPUcqbEYgSohwzqIkcEoZ57KK
	 ceyaVHg/N8ew+9V+PSDRF/ZKD3hKfT/uHKCqSefK9wMLXc5/WYP+euY1eSlhtC+Yx
	 6+CD5Ov75OujPhD6Cg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNORC-1wo8S503Lu-00YcNm; Thu, 25
 Jun 2026 07:45:43 +0200
Message-ID: <ee9dda04-d4fb-4bb6-9c3a-d4c04a2b6170@web.de>
Date: Thu, 25 Jun 2026 07:45:33 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joe Perches <joe@perches.com>, cocci@inria.fr,
 driver-core@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>
References: <eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
Subject: Re: [cocci] [PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UmgiedqS/f/O/tEYcLNuY+k5nd61mGwxhds89jgOTnqSz5Osfxw
 PoYct5pnyjixjOXZZjlNSleY46+aMDZD22hi28luwhp12aVymOnzm/CBGnajgD5Zi7cH62o
 z6iJrDWwSrvEXKvKTTDZ3USI92FHK8W3CQ1OM4uHi3IghgchZtN72lTRPeARocYL0Ux/G8E
 OECDnOdUuz2LACfFJf2GQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yzu3o4j95+o=;cE4TlVxuqyLcDNNEG8+KNtcBNYy
 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

> +virtual patch

Will additional operation modes become relevant after clarification of imp=
lementation details?


=E2=80=A6
> +def alloc_array(name):
> +	func =3D "FAILED_RENAME"
> +	if name =3D=3D "devm_kmalloc_array":
> +		func =3D "devm_kmalloc_objs"
=E2=80=A6

* I suggest to avoid duplicate variable assignments.

* How do you think about to collaborate with the Python data structure =E2=
=80=9Cdictionary=E2=80=9D?


=E2=80=A6
> +expression VAR;
> +expression GFP;
> +expression COUNT;
=E2=80=A6

Such repetition of SmPL key words can eventually be also avoided.


=E2=80=A6
> +|
> +	BYTES_PTRS =3D ALLOC(DEV,(sizeof(E)), GFP)
> +|
> +	BYTES_PTRS =3D ALLOC(DEV,(sizeof(TYPE)), GFP)
> +|
=E2=80=A6

I see possibilities to refine such an SmPL disjunction.


=E2=80=A6
> +@drop_gfp_kernel depends on patch && !(file in "tools") && !(file in "s=
amples")@
> +identifier ALLOC =3D {devm_kmalloc_obj,devm_kmalloc_objs,devm_kmalloc_f=
lex,
> +		    devm_kzalloc_obj,devm_kzalloc_objs,devm_kzalloc_flex,
> +		    devm_kvmalloc_obj,devm_kvmalloc_objs,devm_kvmalloc_flex,
> +		    devm_kvzalloc_obj,devm_kvzalloc_objs,devm_kvzalloc_flex};
> +@@
=E2=80=A6

Can development interests grow for more advanced management of such functi=
on names?

Regards,
Markus
