Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DDA32B9A2
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772351086; cv=none; b=gdY49FDIuODSlx+xRlGiAvo2eLQCVL4VN8fWZ/ZsFQDFrn+9BxI2USufllPqjb+akF6zmCIsX6b2iwSQKL7DhDa6FsT+YoOavDLjoPOGf7fSCqDBb7C5vydHIyqGGcZ8QEiDOQNq8Azv3DiugvEbE4RPaDGwykNHvbnjt4XMqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772351086; c=relaxed/simple;
	bh=J9z9bh9c06iWNDRF5OCoQ6ZSl5Mj8OBKTYo+DFzcsmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeA6OJYRnB8CtA257ge0nBrSOtlIxwyWLdrIMz0Togn9u68C4K9l7ygRZ4PA9TJvF8UVMTgBmowMM9kKVREqILkC1IDV+F5oSO1CJA+mom0wa/RxgI7nxRmjAjBLDH7QQxi1a4wCOPHb6SPgqgW0UORXt5VsdY1NodmjDqPVRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XVvXh2wU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XVvXh2wU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so417810966b.2
        for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 23:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772351082; x=1772955882; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HBu57SPUbDu82uKzpzyoVii6f3eIGOPB5czImSZMDC4=;
        b=XVvXh2wUhuTToGuuFAgdb0h1GJtZbtlLF72HVFKylUCXce+N5e+bLHWtcQ3P7bLrV2
         XBiO/EUOxhGhh/bzQmqEEhRdt/UCvQ/J3PNVg6lF5nCNxxbh4YRG4c+qTei+y4rTHWWu
         CBp/d3rZp3dEyfxb9LNQg4ZaqNz0E72oERTl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772351082; x=1772955882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBu57SPUbDu82uKzpzyoVii6f3eIGOPB5czImSZMDC4=;
        b=FhDd8HQcLc+0zHlgxo/DpzZTgOhTr+ijbIX2DTHTJ5cnuOSKg2YdWmAXTcY5AuQrtV
         /BBFzX+hRYv+WFbz6wCCmc0xSk5XduTqQGtOIJSZzilUyOUOjzGmW0uYXfs8U30/EGqr
         SA5XxFoCEB/qbWp2hKkdTdPi65WknD72i0Q6BJotE0tgQU8kZsUnzRRW10Ngese6T8ls
         BTNviXlOdKuQUs4a1AB+Pn1mveCLb3DEBEQ0Mf7zE2ev3jqaj/dJ5/ddFJI4f/YfkJZB
         xwMPKEGVHF+62JFJIrZXxa59Q26z/BZ6Tse4+1bIF95Kl+FCPXXatXxk1s70zhE0/jAv
         fCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXR7rUvU4QOUC+SCr5X05vA9bh5B3NzmUb9nRCiRZKA6wYYnTnx9T42DyAMHbSLnplKT1wsBrDjF03HyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXFdx27OCAhHRPGeHnQYssvHqpDUoT2jLPnG14fKprfj8QzNj1
	mm7C0EoWervV2J7j5GSwug18wzmoHUWkcMBGRIXPbyUjWhhYO4b4ovcjNRFsC8dCN/OpPmxu2qy
	3OMAdH34=
X-Gm-Gg: ATEYQzx2vj8EWqrCyB/tZKsXmXUGSfk5jAOpIb1vMX4BG8BMLNqeqdQAjM4P2rx12Be
	DFqxIUAlfjcAj4d46WhUxh5FXXaSj+c1MZSsKEUE4U2vLVktXcjyZsDvSHOPU+mlj6kMmsLnoM/
	V5K5JE40RY7D7QBuJKrzUM2FLlLKRVqnHun/IoTQCGWuNbsLMOJckM4k7FOvZHcxm46LTvLWbYI
	7Gg0KCwLoKTkHOtqYLonPIMdr/QfifsSBMcz1BG9qOzAZi3vR8Dn6uB8B5900gFKPgHesSamO4O
	wpHR5k5k2QxvgbZ+1holE9xGVKSgudCKWOARxrEIImiDJNaYiJE+6YonNMYVqeJDRB2VQy6hlrw
	6igajNpZinahAcsjxBWnq+gSHRBRQI3PUSheHVu5XvFPWhJtC8fzpVO99ANo6cTdhM8v2ghWSrp
	B+wTYvB6Rky8c9QUrLzfCXWpBd++ZKydnAlR2Zg9+Z2ImVG7gSPkuEjj4uMHPGM3FrZh+xhQFR
X-Received: by 2002:a17:906:99c2:b0:b8f:7c0a:f942 with SMTP id a640c23a62f3a-b93763cbec0mr528367366b.25.1772351082459;
        Sat, 28 Feb 2026 23:44:42 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm334786966b.44.2026.02.28.23.44.41
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 23:44:42 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b939cfc1e83so63571866b.0
        for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 23:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwXPpTkbHvPG1rlOqinzg7EjIKx/ZcH7bL+vyOMx/zlDMpQ7aKtQbbc1AhPr442e/hxq8UW3fBgzMBQw==@lists.linux.dev
X-Received: by 2002:a17:907:6d03:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b93763b709bmr502876266b.24.1772351081725; Sat, 28 Feb 2026
 23:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
In-Reply-To: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Feb 2026 23:44:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
X-Gm-Features: AaiRm51AXIo-CzgV1FfzAgAuXtJDcOCQPj10yj93D5oHz1MjThSp6lmu827woIY
Message-ID: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Feb 2026 at 15:04, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Driver core changes for 7.0-rc1
>
> - Bus:
>   - Ensure bus->match() is consistently called with the device lock held

So I'm coming back to this, because it turns out this sounds like a
horrible mistake in the end.

You document it as being about consistent locking, but it appears this
change is what made the "firewire oops at driver attach" turn an oops
into just a silently dead machine.

In other words, it makes fragile drivers go from "you get an oops" to
something much worse. The oops becomes unrecoverable - with typically
a black screen at boot - because the probe is holding a lock that then
makes everything else come to a grinding halt when the driver fails.

And yes, this obviously only happens for buggy driver and doesn't
matter for _correct_ code, but about half of the kernel code is
drivers, and that half of the kernel code is also the typically the
most badly tested and often questionably implemented half.

No, not all drivers a bad, but there are a lot of drivers, and some of
them have problems.

So if a driver problem causes problems for the whole machine, the
driver core design is bad.

I really think this should be re-thought. Perhaps just reverted
outright. Instead of saying

  "This inconsistency means that
    bus match() callbacks are not guaranteed to be called with the lock
    held"

as if it's automatically a bad thing, just don't depend on the device
match having to be called with a lock held if that lock has this
problem.

It's not clear why anybody should *care* about the lock at driver
attach time, when nothing else can access the device that hasn't been
brought up yet.

Put another way: the downsides seem worse than the upsides.
"Consistency" is not an upside if it causes problems.

             Linus
