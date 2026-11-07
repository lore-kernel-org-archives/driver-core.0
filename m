Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060394;
	b=2RQX21bgmaFE6Iivbi9T/mOjFUcTth1RMfEnH5UYBwV3IcTDeXjJuJojSrpd+h9FRuEP
	 6a7bOBdz4v1Y60ytJNSFhEQx8aKJGWlP0fG+lGwWxlSZKKdvpNy8P/thg0lCUsOGPwMiP
	 Z1mTPMXxuU32OOSsQ1YzBlCicdNS0jB6dJ/dCO1aFSGHGEs/wcLzLH/cipDgONsV5L3VV
	 m1oK30jSzQlJKynkes7C+f7a8GYQbkrjfs1nOu+SjkgyR3JBTf5GM3/D9eveTLL6uCM1Z
	 CdewbYxENvaJWxkf5Iug9AifXliIxb2yuLsApVm/EbDl9ASzuNwt8wf5Jf1wDKM6wyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
	b=mNp/LhJhWLtZktaKbiIoo+/gc0PEF/2WTOzNqnbtJKVItPsADkq83QECARp7jn3eIaZv
	 e2a9sosPOYiwS7K2mtgDuuLfwH4771SuVbED9cJr47a3wJGn6BBjRSkboD6JjmuEjXGkj
	 xkgl20TBI1VUCuVBishWuTNjRE1O3LKyEeSMU6io2ZJMiwUTAb2dvxwtwl0XL3k5rcRSj
	 v201QZyWw7tQip/A5JjPP1y9jJkUb7xG+frncdArzjfCxOcXly7z9mV0hefeBPqRvta58
	 mtKiD66TD791SBhPldiKplO0mOxWp2as19gUZqemO4FwcRB7Y/sYFs1p/AC6/P6gsFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eiuP8eZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6B606D818
	for <driver-core@lists.linux.dev>; Sat,  7 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D6B606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eiuP8eZH
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso1016313b3a.1
        for <driver-core@lists.linux.dev>; Sat, 07 Nov 2026 06:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060393; cv=none;
        d=google.com; s=arc-20260327;
        b=M/Q2gJV6QsJRGU2I2OFXWQ+LBDUtHi41ycZpvyVC2w9PBRezfDbCi6hmazEG4SN2hu
         lYzlGYRcTIwwOq+RzVitOBaefNOPNRUEpIchWddiW2fPgsKfFp+RYB6yb3Ojvkq3rncZ
         tK2xJm8FAoI3VtDVsVP4/bu14SSRVG5NjsWWWgK/1eIQtnryy1qvsJNmxhWN4BKnl7TO
         I7M/A8xFYvbxXMwrlzH7iNWVrNqaVEl8FWtW4OuwMNJEVOUSfzNmhw7WJLlak5ByCjok
         /iYCQmTB7XznZA1FFjKhgD00Ow4tDpmPGYomrWn9wLaKvRmCsAGA8e7ojg8MU/nkCJxs
         Upaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        fh=dUBaA5ELyNyWGpMR/fUe0tkXrqBUwr8JOE2HZhIT7Rk=;
        b=lxB0lOjEM79n0zstN1ppCHtZPiXptJU0H72uU3W6t2SyesedMiZihI/o9xej2CWlNq
         zpQ1bqeLTesw7OUPC9IbNzZlJyVjaEDZ1qob+wAEEcCpfsiz6ZP3tkk6+R0KPd+GPHp7
         41/Ba4uo+gJ4P/cV/7bs7m5lkZF0UHimNiS4OeJ90+cptlYjUhoAMSNRVWs2C7bBEmRF
         l+az/R9KPp4UG1tskB6hK/FrTpk2R2meBYmNyCChXyJxXxmqcyBA1u8Bgxi3BsgY8mz1
         zotgutk1nIKAME2qf1NI1bRF8l6UU4FcL577SwSxpte4KWfEmA7BrJU8SgL9zgUk5u1p
         zgPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060393; x=1794665193; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=eiuP8eZHSyJO6jEE0b5COobDgllbPj2iFV+8MLFkTGBftA2CJo8L2lG5Q7gBhYySMQ
         r705GMXD9d9wn+u4CYBvKph5ttQ7POsUT03tNuUj5hWhukg4djmUZlM6C5sNea+0i6dx
         TImZetzJBVfORo63tgxCjxtWsDmkYgXWPDfSzo+Tl//TcrcJGtK8mwFgeQ/S4+Y7X9Gu
         cCyHk8T8MRfssvR5ggxtGj2TANu723fPe3O0JuafjPVly/0JZ4R1AEELRQMqGdHkRLID
         x2T2Uy0Zu9zp//EX3T9yCAUeiQFE/jq33zQarYAcRSONrCl3uTU0sJGFlY7dNU7bSeMJ
         b2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060393; x=1794665193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=dXrTEPbt92x9r6z/IeKzZOWJbz67AXxFsK5Q0zq8AVr6rs/PoJlyWn30Amp2UJam84
         QJ0LA4YDYpj/qBdaUZUgmgqWGbncUbVWQqScYzF6AREIF/27l9HLRfuIMlcImPC1Au91
         5s53CNcgAoTMBxPtYRG9UfT6vIzepFm8jsknqI4TZO1B0iOWEbdZ4VvzD5DUxpRCxmYG
         Vb1fzHmBUM7euMU0hQ3mFf1Jqv1PEpyO1o44gWqlhKwGXPAc//d7Zq7Tu9TESgMzrgu/
         x/CXkJGCTDV44Yr52PzYOCz3BOxblK88gGytxIZlLgf80+fcPs6k0eBK7IizRRoC4dYA
         eLcA==
X-Forwarded-Encrypted: i=1; AL+hErGBGUA7pz/Fx78bZY5KA60GCKmSfb5DoBJ8Yoc8cnBbKI3hV6rJVYLNi1xMo6dUIM8Y3ki20//65O7Rgg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/IXJGWaF3CribU/wMu7q8aUBt55RL9T50ro+q+3nbxHAnAfzKM
	GLK9bolEtDbzrg6esdonOIa4+I89mw4e5s8F4J8N3IF8KFkLm2db++xPvt4nP3QuVl6NqFNvdMU
	RzQjVJuTmkXbh1N3IOQziamhxJ+cTRHw=
X-Gm-Gg: AYBFou27ip/dBd6qQ3p1jBvyVl9u/6eBmkSg55KP2uIKqU7q4adAvECA2Ral2NoRJHl
	BamgHTQNkAcU6asHj6788r721sLyqJJqNs7rXPz1x38A75/tid4mIsrUyTHELkjZ3Vxs/FfKubZ
	Qsi0WZ6UXLMR1uK9jghIawlSFlIJeyODfI00sEyGmwz9jC2apa6meegN0PL9vYa7Gx4PKk4NrMr
	l1RhvldQSjYPxeSUbT3RqMgx2jywzUO2o7oEK+hX2esY3yO6v39vhZ72UgQ1IzheAj4YQwMYLus
	U2RKj3oGete4pmOhdCuI2/xENS8uBMDIMlQe5RwkD9QwBMOYeAilKmNByi1hT2sKrgBxw6r6Tnd
	6TwhsaIudgpTZnfSXVqbFqNFK1EULwNyMUvaoZ/TB58I2df6frLB8wKJNvkZsmrq2vLQVwM8ki9
	cFrjPhLwloFx6jAy3hE7kDgoPR+T8OrZWdK88GTSw5dq2psEimIIHSclIy6qd33B0wlpAONq0zz
	gNhg6dQ5cmyWhazsY1Bm6owoNXK2CZ1ZY9axMy/eoPXlHvl1T9O90TtYP3mjw==
X-Received: by 2002:a05:6a00:13a4:b0:8a0:21b2:7c7d with SMTP id
 d2e1a72fcca58-8b37525709bmr5141902b3a.0.1794060392907; Sat, 07 Nov 2026
 06:06:32 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <cover.1793882260.git.alx@kernel.org>
 <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
 <auyOkL1Vb1iKicS9@devuan> <auyV47xUCr1EJ7A3@ashevche-desk.local> <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 16:05:54 +0200
X-Gm-Features: AclHuK-WBq_EIF1I_SsYN7csCkMj3s3jbsrjUQ08xBHpkztbklIxJpPZrjAee2s
Message-ID: <CAHp75VcVT2kQO+URZbrH_3-A=4DMZU1KfcQsjDf6bNdtjf=t+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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

On Sat, Nov 7, 2026 at 4:42=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
> On Thu, 5 Nov 2026, Andy Shevchenko wrote:
>
> > > But yeah, I can send them as separate threads, if that's the preferen=
ce
> > > here.
> >
> > Yes, in Linux kernel majority of the maintainers (a bit of speculation,
> > I haven't counted, but it feels like this to me) do want separate threa=
ds.
>
>  Cf. Documentation/process/submitting-patches.rst, section "Explicit
> In-Reply-To headers".

Even better! Thanks, Maciej, for the pointer!

--=20
With Best Regards,
Andy Shevchenko
