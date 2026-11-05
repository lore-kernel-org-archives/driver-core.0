Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878075;
	b=h/LM2OpAqizctqEzVrxu0G2E+Ou8RJdfiGqGmfm4VUrjPdTngVvNCvpl1/XvKjBcvQ90
	 CnR1DdXDH6U0pHEsy24/3EBStci/rY1VsO2hxYDH96x+wB9C7dKDJ3XAruMZnDBt+ncpZ
	 Q66MUDUjzOqkUqSgEz1RRs8TnjYeKUr7jAQbMFCrYZBuOa5c7xH2Ygbv2VEM12sikGXdA
	 6GVmQOFsF7w5bx/6UCxAv6+LP9LqneARb+CbgTvqwvA/b3us8t/fE2xWZwIDqK+1jtkAW
	 gtwakYzJ/sC94oCG2SEHmHoX41KyEzI/SYFdAcaSxHIb4r35NCZ3WZxzSaGmWScClmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
	b=tB4E//EnBefS2SGyajJ/qEFFsITrwgvXGoSw+tW0bMBQguuNTCJ5qPNnHTcK9QDA1fKS
	 F/s2bLXRmFW5Q7WjwMkB2LiarO45RvT+Oyjy9bMJuDWm2uWBZ0rZWvidbY6I0N4tq8Wfa
	 AApp9frREp4uXKbZ/uepubg3PK+JA+AremSe6yDTPfk24vABK1RWxvVIZIKIRdEEZzUd5
	 Q6OtrNAOkNr2dvtrWXdv/u0PvSV4uglBZoiZZNY/wRBCdJG23nWC0c/8xloQkdnv0bLiO
	 Km5y1tR59Jv/6sa2O9W9OM3jCc5qrA5CT5JiFM+fu2m3QTLqJC0fnW3xGQMd357bXaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=No98XNED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B54606A32C
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 11:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=No98XNED
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4ced671398so270330266b.3
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 03:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878073; cv=none;
        d=google.com; s=arc-20260327;
        b=HfGVEB2fT56cQHtGpGwcGuAKAX4fmHBrOK78fSbywkjYhnTdSST2AJwzP/WZOBYKyJ
         Ju/vXoiCEnawZ4mItRfrTFAJAxFyiEPe/KdxOY5ySbSNtmODwgBV9kHmO3fcrGyID79/
         sD/AIrfIyW0JhXkUm4zxZGrsX/QfbuM+s4TnIx7DA1qgn5reHiME3yRa219diJ+PMEU/
         5TvfCFt+wkhEBYWLPth6V5VU0GfliTzOeXcV2u7ZQw9HC0roZ9DGhBE1zBCT3jeT+7HA
         kr7tGp8T37vlNfMktePmnbGOLxUR5tpA0CX1Wn7LrY5vuWfHJcIWCipYfXIFeGyN1wGT
         5GTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        fh=m5I/nwpeEDoQm/xVrzMgIA5PQSXvKJZE6btiBxq4LpE=;
        b=Ro57qRRidJ/gQ+oyPwWjheTqmd6yCjjQE5Q/0RBjMw5oTRwZWMi7QgeqG05BrlJKnz
         lL6cp3e9EzPXsrhjSSH3vfBeoQLB5zcV2sQbKA1JcE0nJLiCWQ/i0bIurOXJuhbeGBYs
         Qy+OOk2vfQVx5IXugWjcs3gj1FRutmJy4sXXuWIlN43fwHNbZF8objwYNe8NgyKleAPq
         2cQGCGnfXP9JByWl3feQi4GuqQcGjpuf15N8FPBROzM1/cglYqIoQ2OE4h492zrgYTuh
         eHU5+KabB1hc+5xcbOWJ4/X21XxyFwke+glJDHoeHJep9qtYDb+plgDLMaGkInKDhaGj
         ahMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878073; x=1794482873; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=No98XNEDPRth3pCL/B1PJNv5isMC4cC4jIWoGTho2TVwY1ighFiEZ/ntUuAiz9bOG2
         mr6OcuyeB82AkzYuR/dnWDkGNZEdJbOBkueK/JReJWvlpUYvA/gL7r20pXQiAEL84OLN
         DGLeGSHqBjpvyITcnK8aq6ME+1Of6pFBfzrOaArYsK+uqDflWKSbvXiprUrOcIG3aXPZ
         I/+9gqGeZU0tsQFSaB0nRa6jutiQ3bbKzxNDWpGh1ULHzyvnTzKL5wkA04DcudmqTIaf
         PobYZRuOPbc+eo9BsIEZuqnaRRFeKFP6oZQbMEmgebuK+SAWE5dGL4g6OzqIBLaVGRJj
         djRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878073; x=1794482873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=Xu2Czhpcaip2ioUzZnMC4yFPeu9BgzQuiED14By7CsuKRLjxAm+BzbMdsw/7JARBQx
         oyKJ2IRQyTRUKqHdosnq7+OawkOMAbubUcYAy6koq29oLu3Egfery6Miq4n8orfWAMXT
         lETjdf6aHE4Kb/ceUOMJuMQxDDo0ubZvFt9sbxfVvGzAxxP4byXTlNt2LSLU6nu+E407
         m4C0fn6ON2bi4092G3i2OoJTSTLDa1q6IQfFHRmLqyetJdjrEcqCqPgy/Bosbr1WmKm1
         tWdTP6/yJJDoVuVoJeMSZgZqDT1Vwj69NZbF6nURzblC20/hZn5OcLXhq/dDd+npFmoQ
         /1VA==
X-Forwarded-Encrypted: i=1; AKwUvBxCUUeVpNabAGHJ1pxYXQASlIGMPL0IpNw+zI03gfZHWKWEBRpl1kKK9DLHTZwI4ni7SXhpFwlCamoT5Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8O/KYhTg8n46pdoR8tdPCVRbQxQ+j2yBj4xtKNn9Git4o1Eeil
	4Kr9A2ETDHc5PsQ9mz1yckWuKpsxQJvlOobNnqJVBGFdAa794ikzZYl+tr/rYDPhVgnUghPFvg4
	5wRLwHQaBvPwtDJzW8vbu7eNAd6NF17o=
X-Gm-Gg: AYBFou0tJ5y2zwqC/9OnBnZ+WcAROAMT9G8w0GJ9FJc/DB+4CmqKO+wdLRM/O67Kgzw
	Gx9q53vfP1BWbV0YXzCgj9O+jxIhOlJtBip6VxHnSoAC3KGnVJ9ximEOP1JCmL6dGnmZk3wUyJb
	JNoYliP7skk+NNQvWjWM/srb5MBQIxVWhqNcLbJWkmKy+JG+c2NMqJrYdPe9t62aM6cZ16O43Vv
	ys2zsi6sf1Yn27Q0jBAae1z2HZlf5aR7z97aj8GFWcwTwquDjIwJk0TxANqXmrek9+d0/LdjDcR
	y3lhzMrDU66FlT7XNaUMroTUDypsUvkESO5/bgwsZiLHCWA3xmIvTMryeRUBXmIdXJCaeBcGhw1
	hlSvqcGULJ/VVf6uTMADPHWeYSosLST4t6MWk31O+IxVKZBUWpgZmhzEgRY73H5Eq2owfoG51nV
	S/ebEgAJicXykeOzfMt5CpBvzy415eBGke9lAldOyDISi3zhWwyYupY1oatwNAJ3m9jraw6FyUp
	DoErvtrd8B7WH46uZBMTm2RycCmntjSjv6bUb6xeCrDvzOmEUURWKxMWblieg==
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c4ca7a0dc8cmr1782618666b.8.1793878072888; Thu, 05 Nov 2026
 03:27:52 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
In-Reply-To: <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:27:15 +0200
X-Gm-Features: AclHuK9RJR52OSPl8iPokfz3apA8SScdKPa_SxHmGln1p0LZpPbZ_VJGI1ROrO0
Message-ID: <CAHp75Veb=TsXJcjqQeD3ciNGRvLebGr8t8TnZju6FX5ANeVNTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, alx+linux-hardening@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> between an empty prefix matching an empty string from a non-matching
> prefix.  This is a fundamental design flaw in this API, and not
> something that can be fixed.
>
> As always, this is a consequence of choosing sizes instead of pointers.
> Sizes are often the wrong choice.  In this specific case, pointers are
> more capable of differentiating these cases, as NULL is a special
> sentinel value that doesn't need to overload a valid value.
>
> Let's implement strprefix(), a function that returns a pointer
> right after the prefix if found, and a null pointer if not found.
>
> We'll slowly migrate existing code from str_has_prefix() to strprefix().
>
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Ouch!

> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Tom Zanussi <zanussi@kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org

This list is twice as long as the commit message! That's why I highly
recommend moving it under the '---' line below. The email headers will
get all the listed Cc and git history will be clean from this rather
noisy list.

--=20
With Best Regards,
Andy Shevchenko
