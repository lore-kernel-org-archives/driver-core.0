Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915318;
	b=MwY2E+BDZIZc57J4DRS+m50tWVTYO4F1aEh2wGpfwPV0zy9RYK5Y9UVmXPn/m9vdJ/zK
	 FqiNrwR3qt4F8J7Jffs9WMSU64KuMrJ4h4FIo0mf6TnVGfNUtBUfwgjEX6ELym/xFslXa
	 bEzg0T4l0FXHwNbGn75QcbY3o95kEpqODYV3A5utkdE4yJ/sOQ+0liCoQDnGuTSM/3sFV
	 C6hScS4EWBRf0/1G5iY1b5ibflJ73VgVVsx8xpS6iGi8By7FJRRuro5JurCa3Fy9s/h1V
	 AG6+yxMpbiRbprdtPcBwGVZmK/jrSQIaDuN2cuSAlpYUz2/uAVw7x1U6hAFNhdbvbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
	b=rOS2J60bGuCOKa+MpY2OmsZBlxo68TsAECZNlmC+fYblU4q/C3jR4bCOz5iXAE5bLAIg
	 tjAjVkGDkmp3iOeGziNd5ovojryr4aKbl/XWs3Do4Ck+RAiSNAwqVIvrzwfry8korFSdY
	 fblL9GwZHZb3IDadHL+GfEemG1DtPdurGJkop3DKTM9pvdmSMDBYoXozoLBdLtiM3ylQw
	 RX70Jhs74OTWCreP0IdBKYc1iLO81mw0bGxSSaKxC7YbxaNPH1iweIMIZWD0+R0W6VeGY
	 d9iVY97EjMoF5HIyTa7sLmIskBxEZS4RfjMJ5gVXLhK2NRJzmMLu4KFxYW1H+PlMz/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eSDX2RyQ;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964D606A329
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 21:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D964D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eSDX2RyQ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso112755366b.3
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 13:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793915315; x=1794520115; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=eSDX2RyQUPtxmJAr8UzyKQ0GOXSGEGo5oBxgxnMp6yUMXnjJbqEaTM7vRXVTxPpzf0
         h1AY1Q4OsKZUbJoR/Slq4wlvcfsL1Ddi9yw0Lsjz9o58ly61OFeq68+/5izk84Noqlsr
         CQtuggFC49B4YFqVdyu1wElwzloktG6KrNSOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915315; x=1794520115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=gt1PaijLpUvqC7T3rcPwqozI3ks+VPWUXWUiSiTxsuEYPLJS/qsLLJq2CDo2grdk4G
         BU95Ah+yVbBqfmWLpO0EAds/RBLxNJn03ucLrvA+DTBoP9/pTwYiTYlMyEU9TH2C5jM/
         pabFcQP+bc/ua3JQybZNsN3RRXDvvHhHWOkevA5G76r/6RKCgSzMJcn9BMX5XLmuOLm9
         jt3Gy4/q+x7PdT+vobW5Muo2E6dXPpI3Xl4pxM7kv5u7oSWTt/qtwbzm5Op/wlw3kyYo
         +9tuUlo8kMSsEvQ9ZLEeGtUyw+HNtSQ/ViHhJEn2u/ad17qJsMhj0QBF36w61R9MKbpw
         HsGg==
X-Forwarded-Encrypted: i=1; AKwUvByhqNH5/Og+0yaSvtEL6ghj0bwiB8P4HR08BjtXhHzrIwscLzeBS0hV/yyWqNoj3ImZf4dfFrsxRmE17A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0wRje1/FElYMY4uc3QaXhWaNAp9MY+gZQlQM8E3OQ14ax3H8d
	a3sy7c4ZveKT4quaHtG6amgHfp8Zmi6as65XNaGbMXkFL82ibLHZg+hVfcOMEIri73dcZECcfAM
	f65ji21xjRA==
X-Gm-Gg: AYBFou0TMP8LImFHmkHnV44RBNx/03YH3HOpkqAeM7bSkrx4ppv3xFNlgTU+MbnmDRh
	/SmArEpFy/zrpLmrgvmpt0ERHc+qv5O3G1vfvU/VU68YwOajn42QA9fBj1jBHTycOhZuEjLiXe6
	b2e1waDsmYyUTS5L+qAuTp+dtsy1uuVvJoLe4iS/cLUP6EJwMUYuNrisDZywxe3ZVbCHM1HpjH+
	EcdEIvrmiSTzFvPRn+jPvu6/KTAMHmBE5D8aXKv7Ey1toqwBoGp5sQb6D7S72MCnEJjCyOMssQL
	L/Wd4ze8dkU04nuTeckuy4hNPFy/j6/yZBHCeSY12py9t8D3U6dKNGiGLMK7+oaYL5HI2PRw6XZ
	rSNw/unVNPQBIuUtSH7lZwHxKM7DTHXG38+vwajGsVo6iVz+sn115hQSuD3GMuy1uVlE35c1UE1
	5YUdpxmMzM9pvwrhrFQ+ppXU3Xxc0d7Ew7fUeszdv59kLY9RjGEMd8PvF1al6MMdZs4oLXkkHPC
	npnBPz8bOHidWZQ/M2aawZm1KfcDc6r+SmnTz5Y24eqGKP0E9bdDpswCJOm6HmPGPwXtAaDXHDa
	uclNE9hZJp4vS1MgRAlHNbLaRGkVkBU9nBuOAhbzjTmnZ0UDTTAGsDVIyI8cr8TOajQnvlwJuD0
	ubw==
X-Received: by 2002:a17:906:c156:b0:c2d:bae5:27d9 with SMTP id a640c23a62f3a-c4d34d3cf5dmr65930466b.46.1793915315284;
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac22dsm21328466b.2.2026.11.05.13.48.35
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c34bff61551so113701566b.2
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 13:48:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxWvT575CQ1dJZfJIKdjJgjziatLPTfACXrGi0/LDkCJY83f7HzOdbPHG+r2DKG7qzojg/rHWRQOqEqUQ==@lists.linux.dev
X-Received: by 2002:a17:907:2da2:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4d34d39a58mr58567866b.44.1793915314942; Thu, 05 Nov 2026
 13:48:34 -0800 (PST)
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
 <20261105111423.360f4ba8@gandalf.local.home> <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home> <auy0O467UqOzqYub@devuan>
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local> <auzxXyAU6zyHtMtn@devuan>
In-Reply-To: <auzxXyAU6zyHtMtn@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 13:48:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
X-Gm-Features: AclHuK9v-o21t8pmiI4INk2NQJoSrOcmPCpk8IDpuzUs81f6KLpwaM7gxXogW80
Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 13:24, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I think it might indeed be that find(1) is slow at filtering, because
> using git-ls-files(1) is faster without piping to grep(1):

No. Your find | grep" speedup is because you use two cores for this.
So it's slower, but does it in parallel, which is faster on a machine
with idle cores.

The reason git ls-files is faster is different: it's because git
ls-files is just that fast.

And it's so fast that now the pipe overhead is much much more
expensive than git itself, and so doing "git ls-files | grep" is
slower and only adds overhead even if you have idle cores.

And the reason git ls-files is so fast is because it doesn't do any
directory searches. It just looks at the git index file.

So git ls-files really does something very different from 'find'. It
just looks at the files that git already knows about, and it basically
only opens '.git/index' and parses it.

You can *make* git ls-files do a directory read: if you ask for "other
files" (with the -o option) then git ls-files will basically do that
whole directory traversal that 'find' does.

Anyway, if you search sources and don't want to care about object
files or other generated files etc, I'd heavily suggest using "git
ls-files" and "git grep" exactly because it's much faster.

(Ok, "git grep" isn't always faster, the whole regex algorithm issue
can go both ways, but 'git grep' does do the same "just look at files
that are actually known to git" thing, and obviously it can look at
different revisions etc too, so it's really *good* at greapping the
actual committed history, although if you go back in history you'll
obviously be paying a much higher price because now the cost is often
not the regex, but the unpacking of the objects etc)

            Linus
