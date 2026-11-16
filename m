Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829984;
	b=U6XlCp2ttvtXlH6yYsSt1fGJu/EFTblQ3dBnsvmCTXqWEzvenqq8FryoIOcnhiFZB4NH
	 s9m7FHe4i2DiUmTvoXIEdN5TLCmFYyqgZhpEOGCG6OYchYNJYNSGB4oxjvmj0NsaNXwcX
	 3TOQo6GNzb59iupcVw2TsYReoc1i9ovJ+XS4l+KzcAK+nclFPDxqRtppQe4ad4eCXtuh4
	 W7Elr1g/nUGHvcSvTsp+IpPUU6yyEMylSLdOiZGLWtOGxTe/kyct5ieeSk4aO4SH30k0m
	 55XViTH74lb4bFOleij9ry+3/YihwcW3iuJWp2hpbHjoqI9g8Inuw87nxyr3IHpa0Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
	b=gfM9K6Z7F9kGhNqGju6705j84saZVO6FCaMNSU5GywwMGWUbcKIDZOhQAVQRlQW8tS+L
	 3Vr9x0AWzPr646uMCzOhklJJ5p3m4Lbnl1iUOAcDrJaAR4wHTCY9VZSau6pbe2KFcsSoz
	 gZIpBryc1prz1KKkicN1qEYyIXrhKdXCwFVwee3tvF9Vub0htWvpeGhRrWbZTO0BX/qMJ
	 ILlPYhCYJk0Kif+YclNa8o9GhyFt+Tgl7J8RNakx1s1N8T8EgqpO4HGuMmsB9iVt2h4VL
	 OzO+DwQGoeZHH9ywCUTcaw8ZWvvxiJayig6FZw/Dy7C8kpHMyiXX+iY9PMBL0eN/T9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uChhfGOs;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E3606A334
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 11:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792E3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uChhfGOs
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1630702f8f.0
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829983; x=1795434783; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=uChhfGOsLEWsbrt9Z2AtqDlnHfs68NpVfjV7K7oThBkdW0AmV/HPKHr5Kjr1o6hwSm
         pOtzBbL/MgMQ6aU5RCcyhf4Etdn/ByqmE/CzzEw3yclksC1MCfN4AViztQE/5+qmUoux
         P+MgEX12vCGyI2nA6p+vs/z8oi483QQW7rBD8MITOjdKtCS8RPpcvOWsYGdVB9YLWHwa
         ykl5JVo41ftM2CBZnkGQ8zhLngaMvMAHw3j4G4QrEVoDF+qsqllSFKdNjrATgfYqt6g0
         aXpiAmgcNO3FFKYIPgLBJQblU8/Uenz5bCCwoDVqlYftNw6k1e/5JuRU2rBHpTmHz1xH
         Nwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829983; x=1795434783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=1vkwtFnnKEVmpanovD7b1VZeJtkZqAeTvQwl7cDdNxI7ngpc3vHDHw7YM9WgqEjog8
         6GU94MxIU/QV2GFJpD+QMRqNT27p6W4vSWCkG8dStfUpef0a/pup51E9mMgccU0tYPa/
         yF0RveDvoGm2c6JVVN7zGOcCdX4apjxjVpZ7/2ekhkWoSoW24mGLAQqGx3TRkCn6qgFG
         71fSFrT7WcAwNlLIohIKuXVyBOU0DZ/I5jY4He5Ewa695QWFZoW6Z06q/prGV6HEOY+2
         LArtQ/mYJ3b6O9nl/0SLWfOWaOG0f+e164kkQeNvfD9COvQ9CpmuAbDg16dsstRkh3x7
         4hkw==
X-Forwarded-Encrypted: i=1; AL+hErEChETrGvTKuEFG1SCZx8JH1UyXxrZeZrUmepojKhUEh5qRIBbF8f7W3NeJa81OUB5Z5DEpwiqaShzm5g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vqMaQ4qvMdn1HnXs3tcvmRt6z9ITJ0GURzw7s/GQCslV2e/fE
	ndF9fwjHLD/MYAnSxObWn2wbajRWtv79HZ4GMQy6FXC68RUF1AuE9nom
X-Gm-Gg: AZFdTZcClGhJXuVfIAhNReBjuJD2knjwhzbXt9QYvK/KCPYpRM/qY3hFdSzFl7Menv2
	UEGtGDeJZRRhcjmttOb97qTbB/0q9nHTBra/Vw8dnUYIS5+sLRrM2lEyr/1/W0MhcT8TSKzJBX/
	jZWG0DT7ozP2E2F+NdBpiTaMJw5dmRPcb7xqFiymPq8E7PoSLFG4fUIWoEOQ/q737memfoXqP9F
	4I5ZjvBmBXZ6r5bm963D2lZStPsf/4P8RGAowDhBee0A5ywZFx2LlwwFgxo1ntiC8m9TtimDb5L
	L2eccfDtsglR0biVrlzOsN7qreqNig8jsNTWqYoeuLw83zC+lTH/budlXtc3ruPcmp9m6ijCWbY
	ybHW6hIi94s9Lp5AKzQ9g6s7RHTSvmEmBL8SEMWQ1HwA05kAnjDHb5Esh1+4sayFDXRAkqK3Ovv
	Dty58KYpRjNh5qQJ1XDyK90vgDRNdw92tVmd7FUPXVkfgm5oTtbm2U3/7ZXtZa9NngrU1ljWXcR
	PGGlPFAybWZS5Vx59NXPkA62/iqFdTkvvmuH5F/5vErFUihdlwJnbzQBMT9jpP0pl57igxiW/dH
	S5rmqNkDXBF42cDfAvmqnYW8pbq+VnF5sHxEwlt8SLQBLlcTygGMPQocEzB/eV3UnQ==
X-Received: by 2002:a05:6000:2c01:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-49c741b14a0mr24577066f8f.48.1794829982872;
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm23686370f8f.0.2026.11.16.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Date: Mon, 16 Nov 2026 11:53:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, linux-mips@linux-mips.org, Ralf Baechle
 <ralf@linux-mips.org>, Joe Perches <joe@perches.com>, Alejandro Colomar
 <alx@kernel.org>, linux-hardening@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Johan Hovold
 <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: Off-by-one in arch/mips/bcm47xx/time.c (was: [PATCH v6 02/19]
 string: Add strprefix())
Message-ID: <20261116115300.544a33ec@pumpkin>
In-Reply-To: <avriaVSTl4jL0OEo@ashevche-desk.local>
References: <cover.1794667407.git.alx@kernel.org>
	<0eaa4ce73a2b164fd49e3a9f71244a2e3f45b7bb.1794667407.git.alx@kernel.org>
	<c113f651d1ce1b2d42ab9d0c59ae5a0cd17ddb6a.camel@perches.com>
	<avi54hgKgovNHfKy@devuan>
	<avriaVSTl4jL0OEo@ashevche-desk.local>
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

On Mon, 16 Nov 2026 13:00:57 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Nov 14, 2026 at 08:49:21PM +0100, Alejandro Colomar wrote:
> 
> [...]
> 
> > > And these are all candidates for converted uses to
> > > whatever is the function name or steq:
> > > 
> > > $ git grep -P '[^w]strncmp\s*\(\s*[\w\.\-\>\s]*,\s*\"\w*"\s*,\s*\d+\s*\)' -- '*.[ch]' | wc -l
> > > 946  
> > 
> > Looking at those, I've seen a bug in BCM47XX, introduced in 2224de9d152b
> > (2013-10-29; "MIPS: BCM47XX: Fix clock detection for BCM5354 with 200MHz
> >  clock").
> > 
> > Look at this line of code:
> > 
> > 	$ grep strncmp arch/mips/bcm47xx/time.c
> > 			if (len >= 0 && !strncmp(buf, "200", 4))
> > 
> > That strncmp(3) call is wrong, as it's really behaving as strcmp(3),
> > since the 4 is off-by-one.  I'd like to know what was the intention.
> > Was it meant to be !strncmp(buf, "200", 3)?  Or was it meant to be just
> > !strcmp(buf, "200")?  
> 
> When in doubts, preserve current behaviour over refactoring.
> 

That entire function is strange...

David
