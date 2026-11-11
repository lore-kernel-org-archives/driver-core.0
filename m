Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392739;
	b=wrjCjOfH8rEBu8oehhdtBClUUFuxNkUPtPJhCc7g1mbErrdY1RCLbDBVJ4+pvNcLhXFw
	 Uu91zF8ec9OMRxVws6cWFF6ZuG5eaedrJBEuqN3evmvNUBtjGKmWd51Klt6p38wL2X7vZ
	 9fae6Ggz7DyeJ4i7wgQb5HK7JBJPlwpA8TAPxCpFtx+QWZvSYkNQfzOkqggdCwVRLU73H
	 gpWgk+haiuTzbRNkRkQl7q9O9bKv1gOKo3y3G2KfGq3fwkjBUlwocKkI1rBoDZidNpadL
	 T5ivSYVx67oiaH+sH0Md7zvrr8t4/KuG+jn1TBU8hprLcGC/qqffT69AYtUCMDeyM+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
	b=j3p/JSFP3npW+MD/8HMA4zf7GKLrht38YWC120x3xvAW2kO6s0U49WtMkc1FEQ7xRcNN
	 Rg6TZOK14tq4G82jWtkllz8bCAVxN8bI0fECr7JQv2JBHIIdY3VlS7U1jlN6mqNA0Ulwg
	 n9wS3ds+CT0AfEtS7opm1w0IWyMKlS2d97kKtvROnPA1LXOJAz4PKvMM0n6GJmPCG7vMY
	 iJ7+QVhQ3e9F6MmByery3n04R2QrV8fzvW03NuLovFSnxycFLACruFp4zAws81BP7gv62
	 3BJ5eqe26FD3ujchjEzchNVk3xfr0qW+6KkMUIsmv3Y42oh5pri8DCxNE3+K1p1V8RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlYfqlUq;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D23606A326
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlYfqlUq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so17417005e9.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392738; x=1794997538; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=QlYfqlUqKJsIH9u5SyVCHNSOTeXj4XAOYKR0hly0QJFGwbklm2RhXw8IroChucr9MQ
         x0wrEDZJmaw1Z8dRwkCF4yatcjUtRbhZX+EdhYXskAnPsWnIGkQf6Z66w1gRPEWqP3jm
         tx0a2on1LfvvQacXflXShd0Nzx7jfScNUaCGF66XJGJLv8yFjPKj4x6x6pK+ydw7XxBF
         FrBn9cMOVvf6v9hddgpvR+mYksr8N704H4vUciSEF2n1zTcOm/I3sF4ACce0mnOQzyxO
         v0wigu3/25XBDU4tgOLa1YfepUNlfdZxREiOHzw8KzsvyblcyWIzfKXW8Hrg9CnokJtn
         yb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392738; x=1794997538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=W4CmItb2HIhbDuvPyTCGftbSCAKilpj/faZQuIkw0BKaKQulGMhTvTMzhPd4dbpq7g
         BzwrVSubKZV6KrKNhjDowDWkaQVbf/NdiDX78U1GKy39PXkuF7Atnj9z5jQ93a08boTH
         ofxAwRvreetRGhXC5NnEGEBMXxtatF0cw3BFL3zrDcvLJxgoizm0m6wcHa0thFOB9WrW
         hHhEos7lG96AM03ViyDdzt1bOCuW+22cK5NIcK58fcCqAxm7FlxYFa6UeJ09fz6e6cND
         J/QhD+ksuYvETkfPRc0J09XFzpUQ1Yw7I2BwdxOm5TtGsngLHMtOwF2lLmactX/3A8eZ
         DCuw==
X-Forwarded-Encrypted: i=1; AL+hErFstiUfZECfwR/yQzuAzQjt+7SLPEnkBy5avEAvO7D6yLbAlYhN6s8IJO+SF70lw6g4k2carcNJ4l47/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9JAJ6WneUljD+6bhTJ9wl5qa+8KjZrJm5fFR4bb5t+O6P8YvDw
	Glh0c5hkiEh6MfG2J1+2AKIifkM2PF6ZwthTAjTXPch5SEjpjAilJRZ4
X-Gm-Gg: AYBFou35jxJrStxHbPMLk/mP7Pw1Qx9oyPG49S8o7DAOvk5ekVGEyKxjivA1uxgHvho
	qOeWCP7Nhl/ER0oOc76ynpm+wxE6/ZT0kINEHTp2BNacm6h76cmliAcacBqSR5NkzNhjp2DGYMl
	cmEA+pouCIJ0FUNiFjOnX3pkdy2btA0dOl7A1m+Ewe4PzPpq6d53Ce/9tA3jGS5Tua2+LLIUowk
	W5HtnsIWAVAaq4tpwIHdgDUg8T2Jv6lFpaDdI6Uy1e/BW7s59yJeTHze8NxpHPOEq3Xma/di2U3
	QV7cjKzVd3Bz3Ocw4/p1L/7OghBVAQD47Lub4X/z4WTvrDR1274wiVhP1uPRatNlbJtGsvJdIe5
	3Z0+A33b/WFkQKxk8ZPRR7HBQoqTMC9aRxuYSuORLK6RG2d4vhOp4lmxp3a+Ak254twlYJke+Be
	/BAq3ksLKeLPtcwnvc00gHACYA6SxyMqHVzPofOv+zsM18iioLKxVfdHyiPIwsWgseq85+IGHxo
	2fEoVNtae324uKU5TYv6TaO02K71NyXS9nGpy9D9oZy20yUt3QzWydMytsAdZTJGOqyH/mB9B8V
	vawtJk6Mb4fvmH749C6lqdT4iciKmijcFGJVohTw/Vz7nfWqdLSMIwfqeg/xykr8y0s=
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr41235955e9.29.1794392737707;
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm8610917f8f.14.2026.11.11.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/5] stddef: Add const_cast()
Message-ID: <20261111102535.434c2eee@pumpkin>
In-Reply-To: <2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:33:40 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> This macro serves to cast const away without risking unwanted
> conversions due to mistakes in the cast.
> 
> It's similar to C++'s const_cast(), but it is more restrictive: it can
> only cast away 'const', and not arbitrary qualifiers.
> 
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/stddef.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index e1851c50c89b..d79a81406b78 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -194,4 +194,16 @@ enum {
>  #define TRAILING_OVERLAP(TYPE, NAME, FAM, MEMBERS)				\
>  	__TRAILING_OVERLAP(TYPE, NAME, FAM, /* no attrs */, MEMBERS)
>  
> +/**
> + * const_cast() - Drop const in the left-most derivation of a pointer
> + *
> + * @T: Type for the cast.
> + * @p: Pointer to be casted.
> + *
> + * If @p is of type const @T, then it is casted to @T.
> + * Otherwise, @p is returned without any casts.
> + * This avoids mistakes that change anything other than 'const' in a cast.
> + */
> +#define const_cast(T, p)  _Generic(p, const T: (T) (p), default: (p))

Should it be de_const_cast(), or just de_const().
It is a shame you need to specify the type, but why not:
	_Generic(p, T: p, const T: (T)(p))
so that you get a compile time error from the _Generic() if the type
is wrong.

David


> +
>  #endif

