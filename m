Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392920;
	b=FcTgpIvc0CIve7k3UaHUYEV1Gsanupq9K4i/dXsVnDd3C7JpXKMXWIuCrj1baYN7RFar
	 1wEGXldE7gTTp8v/OinJqbWsBTXrGoBW1D7xtU4a6PhsPhDw1M1F/nxOek632GBCI8wS3
	 thsW0v8t2OGU+FQaSU1QV79cZDOMrfLmSkohfUgv7fpx5kraJKs5hlJSEW7pEYno7Q3DK
	 r7qd6bGb0d6XBzxCFUagLUnuUS4halaHnV2PTvFwTTySuK3reJ0wy/nrAatw7vj2QBsp3
	 BNPD1zekPTJDkxz00YMHpENzBuRjRmp5HhTrnAOQZyCFzfR5CTMwfLtdUG8AEGNmNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
	b=30ejy0T0oGYD65MsIIwE8gNHMUeTI2aRha/rc6MOluCrL45BG6vuaziAVETAGqLqcVOx
	 yRbTjxbldXyitNFMgRSYbLn/yXAXwRTVOhy9MOMqpzM1Q+089hZZ2c3P6EyqVmvso/A/e
	 7R+c4w8iS+psVh4OsEoSglBad/hCPKdJsJbo/HLdSKRWPbjAYlDca2SWz683iGs/UH+co
	 QtKVueAbRWV2mc07y3VQFn5ZmRdz1TeGXU2FdGgNCIZ+4v02VT7GdLQvb3E8lLP2ulHz2
	 uMo7GRGFUdPaMHM9FEN4iIF3JQjzjnP4IRO8Dv3S4ZgGGI6ai0KB+6B+Bq5GGKNpTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToHwQ3Wm;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A0606A330
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToHwQ3Wm
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so801207f8f.2
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392918; x=1794997718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=ToHwQ3WmCGihBDJFNt0Dq1fszy29SEWBcSLjTB98ARINSgeaO6jLKx/NH5h2cwdP+5
         zieVkaKFYVqHZZW8U1RLe+qcWmVBLXW20i3AgCIruYkPfjlIMAW6twKIFg2kDog+ZLtj
         tUxyIjvMXsWJdwQP3rs2LpgFEij7nq9AumAOS81sFtMvlIBH1F7dgq+WvIRh4B8EfS/j
         PKLfP9ZXeDmDqHJMDunZjYZ2XmcuIr8/6GQ1SaYpZJ6Fp4moHNgsuDjl1bbH4O3Rkx57
         EjiI22sYzonJp8EHk3QFuGixfE8ROHbz0XotxsZLBEYWMFSFoUN/Ac5u59dPURIIvFys
         ZL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392918; x=1794997718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=ZA8EOjH7qo5oWUUcIGyrfHWf7J+UaQL441Xky68/TY+47Gx5TXBY20tZ5aybPTb0bN
         MnN0lF98Z8ZQoOKh5ZUgiZ49FBWceBwyVDGpQs4Vm0fl6Wd/qvqOJKTfiQ2MHpr7iHNK
         WMl0bqaNjuLwE+4vJ0W0CVBAndQrXYMHACsR62MHAN/XUwWI47dtBkG73HZn+lm/VHdY
         UJVoMpcnTtnqF5kqXUKErYbse4lKqmMoharYDjtJPaOAG3Rx9D2tO4kMp5ba2kfuKRyx
         RAzyJw46DPrtyq8+TWvWe1VMBktTWGIvKRtifwwb8LYvwKZsPXcPXOFNzmIh2OnFTz68
         l3mw==
X-Forwarded-Encrypted: i=1; AL+hErGb0dRVEbAzvjJGwiLpgXoCxawCjzZr0GlODvOrnA4tste/Z5fSdSB5lQGUj6Rh0kuAK5miWNN751AoAQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+BVYrHgVC9U91Y85ZdSk6jsRvxr8qX/WqeGjXVJvK04ejVWMhM
	eUQT44eddc9VtzLaNl1jYoiEQ7gp50y1kGoknevRD7r7sjcv9dmsLud+
X-Gm-Gg: AYBFou17I8uOZ1Twctij8+nGbgw6GjH3e8oYioxWt1DXNJ/2OH3S3vkwC60501w5XXM
	ug8ydgR7g9ClIKrk+N8Ddp5A/d+Mt8+heeuOwzacjs28tjD/PKFJtCmssGtNC3yoyNC1WrlZ7bA
	Xa/Qea5KxeuE3Lt68ZclEg3Qp10ES2ej0Expgyb7PFd7vw2voTuiEapiK/hcrKfHVrYgQEgsHS6
	kJPT1skc0pQ9FJpo8o4MegxA49bShxFR2IbRWpXNCzArWbjFpgd6gvCuRvNvS2m8CkX3qpuQm70
	n8YWav7Gmp7pw6rusQy+ILPZVlS6BaeKeW/bpVoEKpQE73cz8QPotiKGPMFKapmqlJcyaYYwqcq
	kUuHH1WFdwrGauzI2RpM03zzZUzpLhi5R8IYxsvsyn4/olF3fQrAJlXYfRHlY7BqSCo7TIantPl
	Mqcar1lq7qWPyXg+3+2fDKBifrMT/yKaym0vXy2vbrnW1bm/N3cUEvYomipV0gQ65n3A5WUwgvP
	kHQ0OVpZEjr22IebHRFPK/wMjFdomtvkcIRRCGCrlXBlpDzLKa9AhZH6V8id+/OQo11zUsJZDlw
	MAOHyxMfJQ70+zzAfKQbu9JGelmRk2T4Tfd8e9XmvVV660orYhAXfg/dE5PTbSFnfg==
X-Received: by 2002:a5d:5f47:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-499c75528cdmr3034821f8f.17.1794392918442;
        Wed, 11 Nov 2026 02:28:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm10337668f8f.33.2026.11.11.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:28:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:28:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Joe Perches <joe@perches.com>, Alejandro Colomar <alx@kernel.org>,
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Johan Hovold <johan@kernel.org>, Kees
 Cook <kees@kernel.org>, Laurent Pinchart
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
Message-ID: <20261111102836.759ec121@pumpkin>
In-Reply-To: <avOn57pfHntiwcaD@devuan>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
	<64aa89daf23821f95780813fe96882ff61688578.camel@perches.com>
	<avOn57pfHntiwcaD@devuan>
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

On Wed, 11 Nov 2026 00:27:28 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Joe,
> 
> > Date: 2026-11-10 08:32:41-0800
> > From: Joe Perches <joe@perches.com>
> >
> > On Tue, 2026-11-10 at 16:33 +0100, Alejandro Colomar wrote:
> > 
> > no commit description on proposed patch  
> 
> There isn't much to say, but I'll add something (the explanation of why
> the parentheses are needed around the function name, for example).
> 
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >  include/linux/string.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index 9e59f9697c9e..55ca4cb5122c 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > >   * *  @s+strlen(@prefix) if @s starts with @prefix
> > >   * *  NULL if @s does not start with @prefix
> > >   */
> > > -static inline char *strprefix(const char *s, const char *prefix)
> > > +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> > > +
> > > +static inline char *(strprefix)(const char *s, const char *prefix)  
> > 
> > Why introduce a new coding style?  
> 
> It's not style; the parentheses are technically needed to avoid macro
> expansion, since the macro has the same name as the function.
> 
> Alternatively, I could rename the function to __strprefix().

Or put the #define after the function definition.

David

> 
> 
> Have a lovely night!
> Alex
> 

