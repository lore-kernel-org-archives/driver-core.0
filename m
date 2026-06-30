Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A83F0A97
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816499; cv=none; b=GwsXRJeMTW/fir7hqzvSeBhZA7MROBo7VSECkaqYdIfiWvUmm9v0koZCA3DawdO8VGIz+lwauiC7VnLmFQsLybn+nSTopGvzbG7oH0nxSg8M94zcLe0Bv0JSLCQ4lK/y/7jehvxefMt9CHKmtc9QSsG3h/eHgDVtvYyIF4otsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816499; c=relaxed/simple;
	bh=HpicAEKNGBTQQuuqPcVX4l62LWLvxMUNi/rLemPWnPk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uttm4owLa47XiwFWIsnbl4bBM5f2zUcrTsakw5zR3mZ7mpbpSLUeBZ5Qi47f+p5jQEOmBM3WuSK1wxNuqvBNHGfTF89kfzjzpjEFi94nEmTnTuPOda9V8bfNoHPdVq8wJWDWCWVHIY+h93VzyyhYLEpZikClCCjR+rxLBEFagAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=G6pTMmFV; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="G6pTMmFV"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gqKcN2JX1z9tQ4;
	Tue, 30 Jun 2026 12:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782816484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQvE6DYnslM8XeDM2Rx/FYXyam680Ubl7oXX2OkNMtU=;
	b=G6pTMmFV/qp/P6mebOml7IVxWL4rtn7SiQ9VU7CMCfQhANWd4lcoNlYOdgxHrALTn+SSQS
	hyQEZ7jiKwjSU6qmIwZBvLJDbHVvU/DfPppXJXLp3x+iziPFNBZRZ97x6ywGhlMbmEyUEc
	Ka/tWvebaogXYea/ytWSJoObnHfwqjNQRdy52JvOp0Vhnv4G/iti3TzP8BaFzbagmC2RIG
	8WqdsOko2PvZl6dfFFZAfMKcq60NT1rFk53gSzpNpI2k6dZnbKHz4xvYRJ3+o7vEEL6Cpv
	cxDuTH2xKZP7Ik73DTnnVPQH8h3z3AgCTzlUm72wmhhkt36M8nGuyTKIbCu79w==
Message-ID: <b791c2ae4a541f3794dc8c4a170db0082f513ab7.camel@mailbox.org>
Subject: Re: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
From: Manuel Ebner <manuelebner@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2026 12:48:01 +0200
In-Reply-To: <20260612145331.189632-2-manuelebner@mailbox.org>
References: <20260612145331.189632-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 7d4b6eb48903ab8100c
X-MBO-RS-META: ktckcz77m9xrxuokdnmasteqb3zkqskc

Hello,=C2=A0
is this patch still on it's way?
Resent for context.

Sorry for the noise.
 Manuel

On Fri, 2026-06-12 at 16:53 +0200, Manuel Ebner wrote:
> Add ']' to complete the command.
>=20
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> =C2=A0Documentation/ABI/testing/sysfs-uevent | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/t=
esting/sysfs-
> uevent
> index 0b6227706b35..c15e18c47a0e 100644
> --- a/Documentation/ABI/testing/sysfs-uevent
> +++ b/Documentation/ABI/testing/sysfs-uevent
> @@ -8,7 +8,7 @@ Description:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Recognized extended format is::
> =C2=A0
> -			ACTION [UUID [KEY=3DVALUE ...]
> +			ACTION [UUID [KEY=3DVALUE ...]]
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 The ACTION is compulsory - it is the name of the u=
event
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 action (``add``, ``change``, ``remove``). There is=
 no change
