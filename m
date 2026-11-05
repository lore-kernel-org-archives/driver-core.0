Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920916;
	b=tGg5dt2Bozj9FwvEc6cOTLYendQkJ8jxiWIMNoK+GkwHFfTm8jcXWhY5kQWq8fCnExbd
	 oaYORw5C96gEQlTh1+LabuO2SmX9/sCHuM8EB8f36PffAiS7H7HUj3CQ8OW1VB3U48ewG
	 +XgtJOu6BBS6DyuB1HKczsjrQZgHY1sk1oaRuDL1Xno4JlK8VgbN+o8NVXjZLNdzyZYAq
	 uDJw3Cl0s5Se7S+TKNyujYHulT3LNma3ZFr+jkxQLo8sdXCDUowoAxepcIHFG31xyu45f
	 A/W61tW6Fagowrr/fS2HnRTDQg4uBUdUZQMv3NjSJzqAoRNUIyQocedoDf/DQ/JhqDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
	b=OemDq3QWR26s7hiHsUBRHlmVMZW0eLZzR0U0NviQO0eziEOplQlavVmAE/GwZJu4BjWI
	 RyACqz/x4OnqXD/WswWIGVxzUSgzOcPuN6eNCZBV03lRG4eygEm9I60+ZhgXmPVOU8+LN
	 bDGFHIa2gu5Bs6GOSggW6gdqTWX+EWWxlcy+ViB3+fHnPqExSYo+n9ElkWbnD+Pz3Bi05
	 JY2/liXcex+vfb4nhHGvza8gRNxMzq3kmrCaJNUE0TLK9kKqHTlWffYkcnQwBsr2HpM8l
	 JzpgP6khvesIMmnHEqcJX0D4IHZzk++E8nVMzHUG9Y4Keo6jR19USchWiDPpcUpZkpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=biKwO71z;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63C606A32E
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 23:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B63C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=biKwO71z
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so6310566b.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 15:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793920913; x=1794525713; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=biKwO71zzD8FnvWe0GKIcxifOBcNEJgkG8yoJgIS1MYT99brzZGBQY5TRze4BB0u/o
         i97K4umK4lfFIfe9oRQyjGeCxUN7Fxpp/TvPpkVP4iIOQvY7EIgvDK7136fk2WX+V9F4
         l7XlVM3wBDAkE22wB3r7RqUNjlShcyZMO8WOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920913; x=1794525713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=i8dqQ2sN/NWLdzEmZ/SjLMCGot3836doaDJGOarm14I3gqIF8rd83knz6s5q2BiyDp
         mXop2tv0ii/Ci3qhraIiuUftWF77G+jnGsDSKfL/Miz/3PtpG/iEl+AtZSP/fz1dOUcv
         gLu/g76MQVHS+WgOMydcaC9JRLJ3EiXdKB6YTzkMzmou/lBtz7ZiJMwy9oYfzVuOf6tT
         HnckeO/yDN+f5EO2ogVZftrbw3ra4EDVvAy46F2FEE+xlAYrM0qi4/ZZuT4YZQrzbz6e
         wm21+04H82BQnkRAlZJB9ddzGo6VRLMCsotTfCKAV+8Ub+Tbs/2FIMklA32z3Lj1lG0n
         gdLg==
X-Forwarded-Encrypted: i=1; AKwUvByHWGzpqN3/37aoP5hrVISYx5guMdgb0IzCZfNIvr8raUCb+QX4mwy7nLNG4zhsO7o+Ylv3CEreAXffMw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+G7d0ZpNRpxZqOAxq8BchbKTW9n6ILA+FTHrsTjDtra7Or2tr1
	mRNixS5yXnJ8R+NFR3ypDas2zjpSNjTYwU7v/kRoypI3aZ7fkPEP/gJMTHye6M5f6FPwYwRrB6P
	NW+0+rD8lGA==
X-Gm-Gg: AYBFou1hxia3oGuOxaO9Au1ih2eA92tUkAHzQe1K4KIBKQ1lTYtcnFjy+9oo2UN2LUE
	pcA7PjAOAZAz2rDhaYLkW98rnbb+T9ap0BHBZXLJKwLXRbYF1mgSlHJYqQDYrWqAbXbUUcOsEsM
	N6PMXhxmgYuLXQ+aLz/pKtLL8kouL/29RESbm4ydkfEgQhOW1HQlw3d0NFKKNSX7FJsPFDrB1bI
	yIHKnRTKCXqzc1Kig73k6ERAxsOfbKCKrMp9a2GmCZU9uIOkLDPQvmNrvLa+fXq/vSGuoSc4d6v
	C5wzXlT9I8Q43iIGnNfzEdHYCcLxejsQ5q71xyMme3GYUEj3/Q3PXTw4ZWJcgm/6lN5XR4Wj532
	NLNseE9r9ji24fmen2GuSrDhjiyvuvINsK9sWdM08otQe26/jkUR7KkoOXiECl++Al/WurId3NR
	zl6EFULhPByJ11KYUA67DnAsdz7ifnWk6Lggn7JQWTHVDSHTc6Jw5JHItKjuYMsHgVENi8rHgpS
	AWfgXncmskTlAKUqH0oyyx0n7VoDUkRey1SLo4MQ1yb26+OFa1DAC/u8TODwkYoxzkQcbECsqs7
	1z3EH3UgAgMlEy6buYVAnCDtCaGnogAzTdqqydoEAXJPXWgCZmenyqfLIhcjKiHqGrBNXiM2bXz
	1618iIAByxbTpD/Y3SBMK91s=
X-Received: by 2002:a17:907:9811:b0:c49:cf38:3baf with SMTP id a640c23a62f3a-c4d344a8d11mr89586366b.5.1793920913428;
        Thu, 05 Nov 2026 15:21:53 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c58absm26062066b.71.2026.11.05.15.21.52
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:21:52 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c445c95d553so7018366b.1
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 15:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzQkCVtSlvw7hkNwe4AqzM8i0cDBo0QF5nGU6y5v3Scq/2l+s32AfTYPAs45gsF/1C+UFVj9/y9U2RSHw==@lists.linux.dev
X-Received: by 2002:a17:907:9c05:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c4d34c42700mr81823766b.32.1793920911855; Thu, 05 Nov 2026
 15:21:51 -0800 (PST)
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
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local>
 <auzxXyAU6zyHtMtn@devuan> <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
 <auz79Izf6Q5qOQPi@devuan>
In-Reply-To: <auz79Izf6Q5qOQPi@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 15:21:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
X-Gm-Features: AclHuK-tRyoIoIlVqV1ObINoCwGUeXX8nUrj1waZW-FHLSpz23irfQuKt09nDLk
Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
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

On Thu, 5 Nov 2026 at 14:25, Alejandro Colomar <alx@kernel.org> wrote:
>
> I'm not a fan of git-grep(1), because it's easier to remember grep(1),
> as I already need to remember it for other stuff.

Why?

"git grep" is *literally* the exact same thing as "git ls-files |
xargs grep" that you apparently find so natural. It takes all the same
arguments as "grep" does.

Except "git grep" is way more capable if you ever go "Oh, but I'd like
to go back to an older version".

That makes no sense.

> I'm finding some issues with git-ls-files(1), though: it's listing
> symlinks, which grep(1) complains about.  I wish I could discard those
> with something like '-type f'.

Christ.

"Doctor, doctor, it hurts when I hit myself in the face with a spiky object".

Stop doing that. You're just being silly for no reason.

>         $ time git ls-files | xargs grep ARRAY_SIZE | wc -l

Just do the sane thing. Look:

   git grep ARRAY_SIZE | wc -l

Trust me. Just learn to write "git grep". After five minutes of doing
that, you'll realize that you should always have done it, and you were
silly thinking anything else.

And it's faster too:

  $ time git ls-files | xargs grep ARRAY_SIZE 2&>1 > /dev/null

  real 0m0.636s
  user 0m0.367s
  sys 0m0.307s

  $ time git grep ARRAY_SIZE > /dev/null

  real 0m0.519s
  user 0m1.837s
  sys 0m1.719s

(I used that "2&>1" to obviously remove the errors from the stupid
mis-used of xargs).

And it's *safer* too, because if you have filenames with spaces, "git
grep" does the right thing. Your xargs thing now needs to start using
"-z" to git ls-files and "-0" to grep to actually be safe.

So just embrace "git grep". I can pretty much guarantee that if you
use it a while you'll never go back.

            Linus
