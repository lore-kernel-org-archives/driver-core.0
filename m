Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F633E0082;
	Mon, 27 Jul 2026 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184152; cv=none; b=fItUk9STR1AKXHgulVl6Ezv0vlm5rXpLqcRo08u+HvdVNE6vul52F3m2NWK+OhPpWU0ejponRjnfOVPEWFniXi1frWSFYLKx4uODqWqsgiu098tEJ6FzzmeJ1APJHcEzMrdIxz69/Q7O4rPg8PkcxH4M486nVVLs5q4Uh7m3duo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184152; c=relaxed/simple;
	bh=+mhrcsHFyz8Oo8FXFcUWfvrtP4o6MC4VvNKJNhfoc+o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=fM4hYMl5tEYmfRUWtQnRDoWPr4VmHmtVhy2/8Y/HtN26idtFdh25vGu7qaU/3slc96krDz81gU79/wAwSao3ud4zuFPcvHSgtfREQiGwJxP3jGKfPWfSH+CK9k/y5XbesiFD70CFbYRK+YxMQkcWlbqbZpH9xK488fJ5ZI1SD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPEA56PX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPEA56PX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A631F000E9;
	Mon, 27 Jul 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785184150;
	bh=PiIVeiXywgIm/YQBVQ+jGYUbAYEK1HwG+AfFHYErslU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=PPEA56PXg10hOSlItvQ1Edgt7o7ubNzpZ9a3A0EbSyL1dXkPwNme3kD/2PCfBLXEe
	 3HQRj6Jljs6a8o/T1fVZJ5xXsp8N9SBEiCi8eMz622GKjjqFVgE12P2CjXfjIzyvFs
	 58Y+/epzwQSFF0Ys+p4hDpJur2a0sl6/Q+Ci0aWGkr4kPw5eHxPoQsBIwILUo6/J53
	 2T+k6loeB0hqfWWteUfHYxjuZBLKTxxYE6SG40YgOc/FqJVwbEoF88nvUZrW2X4gzL
	 fBxka7QU7jh+BN+oq8Go+4rYDS2Bpu38V9FNxCEXi22H/nniZB4oWQ9Rm1nqOsL1s2
	 KxZm/d5Icj2Hg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 22:29:05 +0200
Message-Id: <DK9MYQPGPXPS.1M53LWK3OZUYT@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] docs/driver-api: infrastructure: add property.h and
 fwnode.h
References: <20260726211200.2643484-1-rdunlap@infradead.org>
In-Reply-To: <20260726211200.2643484-1-rdunlap@infradead.org>

On Sun Jul 26, 2026 at 11:12 PM CEST, Randy Dunlap wrote:
> @@ -17,6 +17,10 @@ The Basic Device Driver-Model Structures
>  .. kernel-doc:: include/linux/device/driver.h
>     :identifiers: probe_type device_driver
> =20
> +.. kernel-doc:: include/linux/property.h
> +
> +.. kernel-doc:: include/linux/fwnode.h

This introduces new warnings, since some fields of  are not documented:

	WARNING: ./include/linux/fwnode.h:185 struct member 'device_dma_supported'=
 not described in 'fwnode_operations'
	WARNING: ./include/linux/fwnode.h:185 struct member 'device_get_dma_attr' =
not described in 'fwnode_operations'
	WARNING: ./include/linux/fwnode.h:185 struct member 'iomap' not described =
in 'fwnode_operations'
	WARNING: ./include/linux/fwnode.h:185 struct member 'irq_get' not describe=
d in 'fwnode_operations'

I send a patch [1] to fix those; I will pick this one up once it landed.

Thanks,
Danilo

[1] https://lore.kernel.org/driver-core/20260727202748.2232253-1-dakr@kerne=
l.org/
