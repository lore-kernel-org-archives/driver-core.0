Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD552264BB
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398928; cv=none; b=Jfb0OOow5Zle1nCp/NdqvJb2qaPpmrJsE8b9kScoMs9b4kZfqoIv4nut5TRj6lADlJFWKLfrhjtJ1gcQfv0+WG5XTw5BoZERKuyGjUPltqx5YJhnC7aTEMv5v/GIJXnw2AQq7S7BQ6rU935GB3lB6WdD+XbnLg4STQns/utV+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398928; c=relaxed/simple;
	bh=pyzRCOD1UmU2geAXFDx/ZeUikbKuoCXAHdKTbQBsFF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gmnlv7mEhu+ogA6RnpkFfnX69HQP+Jw7kBf02sr9fDLO911qOGMvJ9hB/+65cgMXUt+K8WoTIQDmeKcfXI1tJf8HYpoaxnR/bUwzr9UF+JhZ4bC1TdbRbZHAGTyN6U8vpJqQ/yuAsk9bCU2SEmDyqLm+ZYtRKNA78SAGOMd73BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bpPtdkTU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bpPtdkTU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65f92a597a1so5261045a12.0
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 13:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772398926; x=1773003726; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mezHDVLpKDYbfdxOWPZQ4Kx1amzQes9ySZ/VWutVgTQ=;
        b=bpPtdkTUpfui+ruZZmEe4LERx+pgvQDaoK6WfnSMXfY5+YKcr55xbtc42sHuwvc12C
         Gcw6AMclmQXupx8XLoiUuovu9BW1NHJFxFYdLD7J2gT6hLnLNZOx/beXchAS28/NLqwN
         UfTuc8vMgANAA/CnyOIb5jZ2N0kGWWbual6pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398926; x=1773003726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mezHDVLpKDYbfdxOWPZQ4Kx1amzQes9ySZ/VWutVgTQ=;
        b=RKk4V82jj8Y8mt85CMBpGsIwfmsmmUT9s4TruGQy3kKJ91PGzltQZiD020DBImXYdx
         cFOQUUnsbMWGCXlPTgdbJEWHUC8+1HW72jsVeFwTtzThylsgSptsDSX3urSZ3YDMBWcq
         9hRy/l81KcaMcGuO54PlGIeHJlfHuCS7KckSy+okEUUcyTj2t9tX8lPXWHqeUIojLNaj
         XA7WXOMqIv8l64j4vdTy5ytSPPSA8JnRvDlXMyuKeIyVfKyCDiJgjMOSudAvUT6T/mF+
         OgdqjWrYy45NOJ98CldWXJn1F4C4W7ofGHwrco9ZGWizuTyBH6ENT3Tzp8WTGhKNMJhi
         Or9A==
X-Forwarded-Encrypted: i=1; AJvYcCX+rXpfjZDrODkX/X1k5o9n4phMTHQbrdiNJcTNhzJUgqCCsYMhMnDOomeLLp16exjr7KlhdBx9UAqJew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyibStBXOkC/WMr+iaghpWg5hq2Bv6ESnS0pGl9fPX1BZk2EvUz
	qt22BXVPwHqradl0hVMqGOb8DJ+TBoWNb0KPrJ9NT+EU4+vrwXnX9r6uXYDfM+Ua2xpmyw38ZOe
	xBFsWCccJjQ==
X-Gm-Gg: ATEYQzyjR9G4kVxnpNe76gvAQJDFGyKIa79SMK1IYhoT/oUiA8VsjfPYFMTwWw/LOpz
	hqngvKeo/fLzVGKU3WH62AvWhwxfKHf/rK6aC5AGIH/IGHJFmQtwJaAwLfmZIB//nk+8WKQfB7c
	AYRZXp+n9nhVWwBE02DkeKcFtmoirAjZPVD5zSjDi5N/CCejElsimEhSfet36LntPHnPR2II3Pt
	lys7foHmQyUWazf6WmultDgUCX7RjoqspOQGaesBUtWXHbndta7UqS4P05y3Jidocz/HaT0x8pU
	tQWXeP+c8m0cP6y+i9RLFdcvCjqlmp9XagTKkC8uaNStRIA6sOxcnGF11sHo9N2MJlLIoNskZJf
	9f8q5pnJrVfy0fLJRq3PNDj98n1/gsl/B0qt+fWNyrqsBJDUgKAzn+0DuSAhoDTZ9M+kGwNuC4o
	stZNGGDy97+j6K7wt0nT6yE9zD9RuFUN4Sn0Yx3X7r6FeILN4pCX/nLAlxWYGta+dHb6iu4FwQx
	jptR5Er/CE=
X-Received: by 2002:a05:6402:234c:b0:658:cc59:161c with SMTP id 4fb4d7f45d1cf-65fdd6c3526mr6443002a12.12.1772398925710;
        Sun, 01 Mar 2026 13:02:05 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d068sm2871975a12.21.2026.03.01.13.02.05
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:02:05 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8fa449e618so536764366b.0
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 13:02:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVz2+hrytnH6A/0B0lZaTdDHLx/Wd90AtGwEAZ4wF1tbv4g2gdewG9RwQtan5bg2BUqmb/NcLqygMNdSQ==@lists.linux.dev
X-Received: by 2002:a17:907:3d50:b0:b8f:a8bc:a081 with SMTP id
 a640c23a62f3a-b9376385cccmr645983866b.19.1772398924758; Sun, 01 Mar 2026
 13:02:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org> <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
 <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
In-Reply-To: <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 13:01:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>
X-Gm-Features: AaiRm521b_BDFdXtKKGw-6vzQShQzqlQVJfesicPtfpZkTxitLHg1Ed9dzI-ArE
Message-ID: <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2026 at 12:21, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Otherwise, since you asked, the string length is currently limited to
> PAGE_SIZE - 1 as it will be copied with sysfs_emit().

Well, the string length from /proc itself might be long, but do we *care*?

It's only meaningful when it matches a driver name, so anything longer
than the longest driver name is irrelevant - it's not going to match.

So the thing that would matter is the longest actual real driver name.
Aren't those typically just a few bytes (eg "regulator-bus-drv" or
"__typec_altmode_driver" being long ones I find with a bad grep
pattern that might miss millions of other cases)

IOW, it looks like it would be fine to just say "use just a 32-byte
buffer" if a buffer is needed.

Of course, if no buffer is needed that's even better.

             Linus
