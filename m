Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393283;
	b=3mE+hfp1CRbpOFMAPF1oTxMQgBXTZ+WKo8Y7n/rqxJQnyfhwk5gmmdxn9UuUTsdnoLRi
	 hO/qPcTNAW1j7EB6gok0C4N6OkStxg/gzb28TXrmCA9isrS3dQcYT7oResCQ+H0PhO37v
	 EqmQKcWztsOt3hNxBFUGD6wb2tVL31gNqLEDDoB4u4wlYDrXXYVnIoUvWvyC5+CztAM0k
	 Ob9BhbxgF+Y7bJy2K4g8FIJBGH3agdsDjZC9IlckE/YvB5tC/4NVeL10/j13Q1qkee+Sx
	 s0sYCbPwheE7S/kCV86I89PZeePJ9VmQVUZb4l8i3Y4MJkzUH8ZrtS57rnpIFTl0QCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
	b=pOygpROTwHbH2hz5UNREsEoqBj9FweQT1UmwT56tDIvq891bo0SCxkle0LJTwUQuLNjQ
	 E5mtV3L0Uf+gckPVh7xVh+o4NfdodMmi5VtaPQjIvxIL2fse6//iFc13eH53Qtbkgrbut
	 YYf4VrFYBQZrx1dbCCogJU2U+1PazqK0MoSwCrzhY4+9UB0Ksx/5AuMGybzdDwii+O2LC
	 0RcbCh0qA+OjFffE2QX8Z/Jsq+IBIwmuHFuUgM+Us0+ZFPrm50YZ1i3cr+75iOmcpqx4G
	 nwTAO7tBZJHaBxy1gVVBgmfeCkG2SNp9U8/VPcpyA4pf0ifn1+PwuTl2nVuYUexT8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHoGqO2O;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF8606A327
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CF8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHoGqO2O
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38256515e9.3
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393281; x=1794998081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=AHoGqO2Od+mEWHoQK2nOLTzoYYsmWrr7RXZ6Wwz1/XH7AS2lSLLhOpPLo0Cnlhb1i4
         3VH2DQqxOGj0vsKLbXVtkI2nCtbYkbGChWQupwaIdwZxzymMf5xo480BKSvPgKye7yOi
         LsXfVjpZ4U6NSelJRO/IZPBeRRh3IlAITNA9Xxq5xmWOjRbubiAfp2VWfN8Ri1UNay3R
         KlTf75JmmoFei4wV2E+iHJXpl4f10IPLDTi0I4lnQj0mDMUiWBahqRxTAy/hCvK9cQtA
         EV0eTweTC2lK2+yd1v818Tf6VxD3gKvz7JGXIm5v7VVQ+KN0LZLqfsZp6UbLgiR0FSwQ
         Mt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393281; x=1794998081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=Z1vKllTYFeCnY6HwtKxgwY8oVEfNUlIsEBXv5ELAfMCgeemVLlE8+yKvVJFuzNhzpk
         e+OzIKMAl5Cts24Q0SzNxYKVVusS+Fa/HSdJhX2f2o3TwMaaBicFKE3IlHUBkrf5JIKf
         +gdbuEUulcBEa0BXAHqRhbVFdQ2rs6jEOGo/FQGGExUSOTR5dOI0hINHxuihmI6dAyJo
         uYaxZI1rTj61SL9ZUnu5RDHOgYnO1KFptfvtZB5QPAJ9cvRgE+T42yqCoquy4MIGxH+f
         ajIOVqI5gPGU9Rx2u5JOpjGKshBdGBYO5FSB0XlHEmH6VNZ9dEWiBoB6+0ZA65KJgoSg
         zRxg==
X-Forwarded-Encrypted: i=1; AL+hErFAoxgztQTGE2DI/EyVt/CahMHdY/b+2gSlM6tcoanQOz+K1EBs529cRWeZRavP1Gv6bH0rabmzfo424A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9NoarJia5FpfjeJwSq1oH77LSozXzFOF28vz84UWnWoXKJfEf8
	nZhK3gMJQjAdJc9VkE9f8w3MgC0+zKEOtJVeOMsEdT2jvMmelKXABthv
X-Gm-Gg: AYBFou2uFZi/jkv5c+WoOLSLj3ve/L+lenWgHhKBzZlTnH4ZCWZaWC+T+kam/8bR+9y
	CBOrnMUtACA+KmUHX+agHmh9drXLJasd8NjVDp9IUqRrsqg0wQ1r625e0PPIpWkAcBsLBuOsTle
	egcUzF/ydnHC/5j1VY4FzXMAT2CjAevoMCZqBvC1eQlB2RX9Y6zBIJ1XTAdj1Yi4IrAWMBq2XDE
	Ccg0Nkhr9+ReoS6yPPrgkDtkJP4WsBIXPrp2oPqVvowBLqyHvpiJKIdCMwxN7MY7CHyi+1g177d
	qGRHc7uDl0tLpj68Z+733LJFt9ufKX9uEXiSFtc+hIxdwMLBntjK/OxFdZymAN1VV4amatcN6c3
	klUudzvx5ZpQSBFPlx/4y7aXp84f/n1cj36hmGjz9fQWl+zkTl+/DuVN/IjeqbGDplb/u6H1XOt
	sKpRnkxZRT8hMm8Qa7mlB6roltZ3EinIYldktXvU9ocNYrUilb6DcmhjdKgj1ndTJPjbxaknSwl
	n4L6H07vwxj+jUuJqPB072rwWaO7W9ZPfVEjoRFfP8Su85i10+viMOFRsNCMk7lIEU2L1v/aYZh
	pZ59ESrjFYlmpScI1mijDqdA8jebTSFeV/hE7xVqkUr0p+rPzb1xOq8vL2mfakoV5G4=
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba09377b2amr30972055e9.10.1794393281331;
        Wed, 11 Nov 2026 02:34:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm157078915e9.2.2026.11.11.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:34:40 -0800 (PST)
Date: Wed, 11 Nov 2026 10:34:38 +0000
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
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111103438.2f822202@pumpkin>
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
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

On Tue, 10 Nov 2026 16:33:56 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9e59f9697c9e..55ca4cb5122c 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

Isn't in enough to do:
#define strprefix(s, pfx) ((typeof(s))strprefix(s, pfx))

which correctly preserves all qualifiers.

David

> +
> +static inline char *(strprefix)(const char *s, const char *prefix)
>  {
>  	size_t len = strlen(prefix);
>  	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;

