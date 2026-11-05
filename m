Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877896;
	b=1rxt9l94bRg8SxO5N8tpQBMKztl32WhqiF0PdkggD425a1fRO+ZxusHo8BF3U7LiXdak
	 yaBQe6xrCY/KfeyM8R47yfLN0jY9cKFZ7iOXk3KHwjca5F+Qkd+YcIltYp6D80cHThK6J
	 vlqe8BSYnvfBY70QkvrhutTfAKXL+gQauTyL4+HC02QqVypJVGUGgyMiuyVSgbED6x15u
	 Vi8mYY/82MHIy7ZYTFZYE1rjXiRT1fp4cxaTJcb0Y0avSn5acsOng2i6oWfpzg90EUDcm
	 r7i1J7zASleyD4enpFe0NpvuNjJHMhTTRZKu8HJFCDXJXRhm4+a8k4SWoj8dCCU8LDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
	b=OGEp7sfEmH94nXvLJgZnJPuK7/tyrpJH6eKR43A2UFo2P9rlGmafFJWLwjLR4N4y0hj4
	 UcNN1m76xnHTNxsceaFK/lYRs7sXFqc3cqdI4RnCgWE1NuVoo7LAZyihd8Cvgh0O8wk6T
	 sdJoNOImXgRphr2ZoX1HrWqtyy6CsLM5XkjD03U2CmVKctctI49JELfLn0Q4ZN5DP+Vik
	 QFljnCdxcWNEstEe6lRRC+GsWZQOpasKGRGeLIjbeoKZr0D+NOEKKC+uQOf5wrMJM/74l
	 adESMu7TqCkci+8T1ZhSDZf8yhqZqtdSHNKREWmEQTnTKLGtHy+x2a8vfwht02ttCvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGAzyd0O;
	arc=fail smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E96E606A32C
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 11:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E96E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGAzyd0O
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c315869241fso267341466b.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 03:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877895; cv=none;
        d=google.com; s=arc-20260327;
        b=MxSiS1DhrA1xgXjjLafAVOFIia9pJkM9N2Sy4UQYXzMeVqWCJRfjFEIIRkj1prQ4gy
         ABGrQf+dC1z8wzYvNTsnrLwCbcLffjFWTPqZ1cV5cxrEcGcKq9x9ZhErwyFbOmbJqSMM
         cN6MCCH28y6k3pCHJt7JFC74NZDxBrY4I18i1C6NeQYryaWv2dbVxMaJWzR38VfPu6Xb
         sdlDFcsH70uOYVhU3OkfNCPoDJST0rFy9eh7g+/n5aWOEFtk/0+2LDPdniI4Af7H1Amd
         z8ZQq+d0BAI2YerWFiHeyJ6mdypcEGyBh34TsRP+Oi0l/5sLyXeJj+f14JUL5/bMuxms
         m9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        fh=qgebi/mM5Bzu4LjyqMQko7zkxNF8ItUVepBoCbiqUEI=;
        b=ex58tsyyUKX7R3lyu9fxrmeU5BFlgrvDflkiI7IwcXOZvqlURfVRSf9bE6n2bKx46B
         8AvaFSi8KY/1HlyxUZvSVNWs0VCfhYybwryopRYROvAwxE/pYuwRe4v7lJXrd5lCNsTl
         M1b6A0y/GGkZfzcom7CGaj4EL0XjT0agxFuNItpQfTi1ce02rGYSZIQ6wda2lS40XRlj
         2zX2IsmpTEGSv8pTWcgefW0i9+dsKv/lOG4kDBH/a25sB0lqAbraa0B7+17p0OzxjfBX
         SS09YMwH2xQr/KQ6Pa6vy0l6g+WnaYBof9IRl5p496FaM17MmUMYVAG5ofrEeDrmnk4e
         YK1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877895; x=1794482695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=mGAzyd0O4oqi8RwhZGvmjOQ9hKdrdGC//GNwvxEeFAcq0ZDicJdcfOI3eITXEpH0T5
         E1jNWVTFZmU5NIB0CguNQM0hw9S1QHazLBi23m61ZDAom141eSdhcvXxjQKn2km+FYBR
         mlX7P0PMnNiKl+N/Mcx6WKxHJ1WnrWVI2LfkmG/igpgLzjWRNcKrgZLgu8nzGletddqa
         l9FUJCQfdJZ4aFCVHhQ+DaVCy2tyr8gnA5tVzrgRopqX0UqpZNtECpHf+bJXb8JDD+J2
         1uIW7Y9i7wb7ez6xxnCyUwoQ8nN/JXZxbBFMB378DC1klR5S5DdCAtiexxcGqSKBBGUp
         MIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877895; x=1794482695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=R064egHAeGsfVXRnFAZdJRQpKcb0tLlXsL28j6omxifIjWNPp4e1FgGNJmXrFXcaP5
         0UOBaIdtLagvHhwHI2tiSHVFeB5lyC0JR6XM83bye7cqwXedQ1YxOCC23VL8iasOZnSq
         xYJtnMAzI+myFDLfb8t7Ble1lrZVHrPu/Y9A8eVloR8vjdKDk+oikFFFRND4JgbcMB+9
         twT7G/d3Jd74eamY7CgqIf4NhmQFw6N2eLBYEK0NkhLntMgUb7MWocG2KRNs21sBdWd/
         s7o0EdCaUzIK1andOzVMln22yKAfDcdgrrf0I9HoxGE4Q1nqXYgtxhkbvUyRCXaW6Vwh
         KFnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiAXU3/oomdW229W8AjdmbscUcQhrAeRpW3INTQhS44f0yKJU0SW35LdtSksHe0xjSfPOg1CMlXxnvaQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Gyr8kQyS0f1ZD93NyGWIVOMo/oS0in5bukw07PcnCdvKvDHX+
	6db9Nfz+i4NzvJSdfL7V6l0zWyNLGBgi9WBXQad21jIPt0gjz3BXZ0JNyFj7l7xiFirM8aSHwoh
	4OuJSwr9qlT/MKVSj8TcCPdelQ08FL6c=
X-Gm-Gg: AYBFou0ZxRwkMjUIBq/969g4pMgAWK6upwZ9kvwlq78jN0QyREP0O0G20nZfSPJfhe5
	MKe19XrUJcyfJdND9kF2oYN9wuwKUivupD/7zZVPnM3FRK2f4HbE2Bz2L9uZza037G0147QQvPP
	5PJxhGruOGXodOMQ7S4Ojy3q3yjmaZQaHG5UyxczOa+MIyzNZnmhcZQVJP+MISA86Pp0askv8HS
	W5myM34HfgnbylkPUL0Z9cdYvmv7XY6pcapWViYZLqCGfF3BoMov6S0hgrerv3/riX6lIRkTqRO
	rzqR8uVRZYeyoRoc/vBc0xt1lTJhWcOXtSp5s6FAY3xZwjsUqG/JYXXbKSAj6aDZmxNKHvu65p+
	8l8OHllDb42M2SYO3KuCw/W6jyq5MMmQXGu9KVhx7Ip9ilgE+Eq5zILTgBVduCN6n+kkUZBBpb5
	VHspNkTlavRzmcQ4I1UuimEwY8UyVGovvUFn+bb4uj3Wvmc+S/Y1GKjcEiv0yjIUlplacBKwfmh
	fZPBkO1jSl96j5/x6Z1JTgucjT2olodRbp+VGi5BXQP/ND1sujkTZOTGjKylg==
X-Received: by 2002:a17:907:6d20:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c4ca7a0dcb0mr1704269766b.11.1793877894389; Thu, 05 Nov 2026
 03:24:54 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org>
In-Reply-To: <cover.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:24:18 +0200
X-Gm-Features: AclHuK8KWMbqNnaK7YSgn2BAcqklpjMSStieDr0-B_LC0DeuPxzb2lhrGJOckGM
Message-ID: <CAHp75VdFH146fNhw1ysUbgCPbpv+K++kWvbyZxU=V7tDh0T88Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add strprefix() and fix a bug with it
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
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> str_has_prefix() is based on sizes and lengths, which means it must
> overload the valid length 0 to mean not found.  This is a typical
> consequence of choosing to design an API around sizes and lengths, and
> vanishes when moving to pointer-based similar APIs.
>
> This patch set adds strprefix(), deprecates str_has_prefix(), and uses
> strprefix() in one place to fix a bug reported by Bartosz.
>
> We can later work on replacing the other uses of str_has_prefix(), which
> might hide similar bugs.
>
> Testing
> ~~~~~~~
>
> I've built this patch set with 'allmodconfig'.  I've not run the
> resulting kernel, though.

No, all lib/ new code should be accompanied with new (Kunit) test
cases. Update the respective lib/tests/* for that or if not yet
converted to Kunit something in lib/*test*.c

--=20
With Best Regards,
Andy Shevchenko
