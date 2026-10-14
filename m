Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA4560AA8
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996274; cv=pass; b=Go6ddmEbXYoWtW1PL0Lnb4NJb8EUHCaCXLOnhs8h29vVkA9RVF2XRePcr4Ta1lSN38OJsiZUPXoQeu6Q3f7uMffBerpD3THip5aDi8tzwRU9h2LbJA+/CQwZXkHypo6xsooZbbtNyU+DSVWPWkLZqsbddQ/n3Vt5D8l3P/d1YNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996274; c=relaxed/simple;
	bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBDomy56JEj/XYTvkoab6gapc5MTyaHl2+H8UD3EJi86JVzxmOxNMAUYGAqrBlhaj30CNaDYcwv2RTJXSJE0j/11xITf9XmsZsVBOMZF1hmkMXXe2gK+rBg7mZFjGrFZ5uOnb0ZICl+iJIdITfWrG8xtxYaLB3vwPEmisJSk0LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBS4jdS5; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBS4jdS5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33e623bd651so514494eec.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=B36rpaxNe6TS/3U3VNjZ1NQcnJ4VsUjN3p8UUakFD95PY3oBUUNENmtafy78yJtbR1
         Hd6Zx5SEOD3rbZD5XtTpgHkMlJf5VOR59PFwzLML9RREFMPc3vyGj/aIfhjSZtDiGbU8
         D3tndHZh+j1kpVW713uCL6j7LGIeSzy0xMFym4uTUmeOOGd7GpI7qLV4zbGiLRraeGH9
         91vu6sY4ra0U8PjhASyp+m+fZkTOLqfd9bYarsGpl30EKnr/i+RrWk3IvkuDm3T8ULjQ
         zEZ4DAAQoHdu/IrKSBrC8SfvTScp5XnN4rEckOK75BdRvTjtm5YIiJLjNAnVWa9FO1NX
         /i0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=BPTZ4HtsnKpisz6/9b/wus0ykHhC2vi4iJaTtg1DmY0=;
        b=ZZHe2XRjHBUShLVBG0hk8t0ZK8yHx5exctbt3zGpUWfFkePADRZaZxeRS6SsIm5oZT
         EXCge7aHMj2UrP8yAIgB+Pq1vbEpcwR2taSVSQKHPU7RLupZjAf6a62EnckPsbMmMCp4
         Xa5MQ89xUsn/yosQZMzPfGmu4H1ZFXKAuZX/JjpAnL38do2/OyLpOzNtagJgWa4wdrgN
         3CmO29CAI850yarbT2Ski8my7jkdR5ZVqudnR01Sxg5crZxSfPZeT2xGK9Ko5lFD3h8l
         M+4AkPgXn7pk54iMal2lTU8dkFpTPDMiPK4+1y+IQ+PVPsvWFii5n4+6FAspvy5oMVVN
         kQag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=VBS4jdS5WV9790zJVyEB8TzU8ZrMJfWBiLp2perKzjibEIRElf2PVgFKxBoWwkE1Tr
         27FPX8tZDhOTxCKppFz28Z8JIQb8PCiQWJNMWrZrKt7bCIj2a83pUxT5fmw1A9bQl6yH
         gu0emcSoJdxQ3pCdzmMYyxw5ehsbV6OYL6ac9/dSUIEUb0hQBys28MvZfV+HrrNvwBDr
         aBw/eBi6vRxFl26eH3stZ0PpclqWzDkVc8kbAvKiFkKVg6xjKCv7UbFlfdh7/etwxY8j
         m3ifU41cSiLL6+6wT6CHtBo/p18D87qZ7R4Ko0TOj3RiPFB0y2oOkOxadlZmbRSSgAws
         +EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=RR/RL+kgpDVCZXlvZsi2BtwLB+ddYQBR2R66bUXipkET18uIm31EnBEps9/IDy5Q9t
         dVm/L2mzMtpr1a6gwlD7mum+zQFiGDI3DtmaTbs8eVW4yu3IuQOKlnYPH5p4z0hL+XlH
         2Z93WP/kS59KBsBFo4Tdi1C/TlNIZ2+lGSTIjnwaPXd7z00+VRIB06Oolmhy+QlQJXme
         gkItuwZKupP0f6MGtqjHOUi1Gtl+JVtjtILHZD2P/NroXxDiXbRxMbQMZpWT1g0PIsid
         phM5yTS7VbnFBIHriBqKvLZ6XED/BOyQWR+GFqx3dhWLvaH8rWBTfCZtUsTATwZtyxdP
         EqlA==
X-Forwarded-Encrypted: i=1; AKwUvBxU00MYiNqmstmOg1i3Yv+Bqk218PK/1qxjFn78YAG3wjeXXLO/Bik1o6Jju8rHQRBYxYzUi66cSmvKnA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK6W6dYUE/ZWdxuYEw/kCHlV36NQyVOzEiudbuYvCfwdYnhOK5s
	esbypfgOI/Fwd8dqB88G+qJP2ivnAP95zTkFSIe7wCmFnu3QY1g+c/Hlh4ynSyHm2g8NZn/bHr3
	fT2RuhSRvNixDegX1GDfBsZvz4+hot5M=
X-Gm-Gg: AYBFou0I56RCqCDCznyhsJAp85GgRw3aoy1MSsm1VO/rkNWmROwDOzUnP04aTpe8xdy
	8h2Hax0gn67mUIe0bPpIU9vG8nbSwOjM/j1MrBGABHZN3D0PWHYrEndqBCn48qa1ihs78ZZFE0A
	jIfKbl5LlHsheWGs0l330HnFPFSJI4GaeS1aW9DCh4zAHIrhat5mXYNoBscepTs9FkdJLRSRge2
	uvMS1KU4GuOCG11/FJ+N27w5TFxILFsLHZHfEIEzuXxNLbddR58n7BF8zm9F8VF2uDtYnPHzq4C
	tXVTmYHRNirtKMbCoLZCtY5YXyCTNlrtfql9X8Bc0ZaJrybfogs6Zm+r9RxwPh7h0CR9pNZVn+n
	90L33DmaAvgxhT97NPsSyhDgnFXWzU2Ie1tFksgT/SYAl3UjW2whfVSnWjXZjI/Q5UlygjTx5Q5
	GkB4y/VvpGrvbbMaWK2ja9QWQIzVPMtam/dyQArQNsaO/sM4jHbW0=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

Of course, please feel free to pick it up (with the small tweak I
requested) if you have a user.

And if you don't pick the user, I could still pick the first patch up
through the compiler attributes tree if you and other folks want to
use it after -rc1.

Greg: adding the attribute itself should be safe and would unblock
others that may want to "protect" themselves, without having to wait
for every potential user to get fixed (but of course I agree they
should get fixed -- we should not forget about them, if that is your
concern).

Cheers,
Miguel
