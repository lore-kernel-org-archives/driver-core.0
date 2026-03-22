Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC045039
	for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774138104; cv=none; b=KYRFzKUQEWJDotFJ7IwQHfOeLs+PtJIt7HwjzUVUa0SOjyKb3yO2g+PAgZaQJXKsEZ/C4EXYA2SISg3vXd6txTlBeUvshNZo4vTb9+5xzIa6bJOUnDIIjdUgu5BBu1VH6dLzPzdJLB7W6MCNj71dwbOZptkJEZlC0c3h+qk2jLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774138104; c=relaxed/simple;
	bh=TuWcUmDyaBjwtbfDOhGgL+CldTk9DOO4/WJ+HK3pfL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F19zkFtW7YBO3XPqiUewaqYb2VBGYat5azQ1+j9Df3z4cf9ldnDL6g1AiMTCvdCW36zhArPGsTkW0JoG05lkWA66ELTQ1LRX5+XMtAQKg5NjzOTX2MbHU11UrGtEIdEOKlbzy7xBFVmozdSvJFdlrL7XNkm80h2u7MFleuOwQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hGhFPNZ+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hGhFPNZ+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso4400545a12.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 17:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774138101; x=1774742901; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIHi/rtedwS5kgXEYJglLohUmohpmToRP3VRHLB96Dw=;
        b=hGhFPNZ+99x5b+mK/VIoCA+ACwBFVnkk941DNFVV6FsP2f724fbFOvK7UsFUIOPgzL
         cDV0OAG6RpPYfJWFzcpn2/i5l5p/IALhPQIm1lqAm7Vazp+2zJD6c9Q7FHDz/zdAG96u
         kN7Z93qutXvnb5z0Q7214Co5Bb/HkfO8uuMOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774138101; x=1774742901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIHi/rtedwS5kgXEYJglLohUmohpmToRP3VRHLB96Dw=;
        b=JwlYy1xk7w4WzRX3oAwjeYXXwlpSr0boUmUnf3tY9ovHuHLubdn/4e7mvx2X4gvnnr
         +CADtAbqehUjEO8wvxRLQrm1Am0dZdcwDhdxnN/onnYsyI0Aumx2B6/BJYKQUA7FqD5g
         HZZhZoxnbr0Q0CwrmHt5Ye19h2+xqiTSU1oyzj/qGRpgEJ0gJEZ/aU6y3CkgsMhA0HaK
         U6TQB5j2xyLuwwK1Hve2DS6yj94oGqxSGHuK2QMzOogRgOIPvNnu9P4J/FiPMfh3aE8a
         sL0L4TTH18GpR8nUKI7eNOvw83KjHs3XJb+P8EvJLaFbbkl7nP3KMpG5eDbBWUpJ/Hv5
         jJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUFxpZP1tcUHkI7bxC6YY7HonrS+I0lTTt3Sm0cwYPm1MWIMH6kPNz8Xzw/fs73LmCZnW6lulWxfB8elQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzBrDifHe8TI1/HlpvNJo1EnagZLFUEKO6KQv8+D68RRgJJ/Gi
	m3gzCOqVGp5zqcUJSqi30n15pNEutqJAB/GEBBPfkIPR2+hhCuNjMyZnnilVmciftn0IHDgIrWP
	c/HRH6Qk=
X-Gm-Gg: ATEYQzzgfqldBzpOEa2jJuyZn1Mb2Gaeplz3+AqRygiLrplb1yaXWQkbOlJwYgLrAAo
	qEUMwUiguzVnzFiFeR++BoKYyCnw5PTfdgxgD31R8Oz3ebeFMNCLV1YmMWoc8pac20Xn5h9KqUm
	r5lnJOrllof3UMsRoG8KHX0RYoWzlpCTkxI7iaR09vWgkPImhb80IY4hxJo92NQoaQZNfua2Wc3
	YPhFhO8A6xjwWutTWC8GbxD6L6lGlFuj5pjLYryjFfER2z7DD0n2rsTKs0BfHpsDo6GnKCn58Ks
	OQlSmVLgDcUGEZhfdV9/c7D9u97t9gHPYFND2uiNow0VPdJkbeEvb290d2QktL4Ku73k9LOezbp
	kv6momz/3EcRuIuav1Z6bjN0XPC9qLaUn3oNgmVhi9zVnwVcbaSW3jdB5jKqzaQAE6HfQ46Ogul
	FgDDHLfiARXfoBRaNVdO0yBTRGafDcq4CQbysYJPWa1pmGOK6V0QVj/ROTWxCS90WeasiBaIV9
X-Received: by 2002:a17:906:a2d8:b0:b98:50b:e94a with SMTP id a640c23a62f3a-b982f244b9fmr436829266b.16.1774138101285;
        Sat, 21 Mar 2026 17:08:21 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm307484466b.9.2026.03.21.17.08.20
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 17:08:20 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so5461281a12.2
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 17:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrJOS/K715QgL6N7SAG532CBfbl8BwzZ7U+x3Df2ekHvrf6h9FP+BFOGB6QwXBPELhs7fsWoGEssQQSQ==@lists.linux.dev
X-Received: by 2002:a17:906:c3a5:b0:b97:1d24:bfd7 with SMTP id
 a640c23a62f3a-b982f1ed74bmr379165766b.6.1774138099842; Sat, 21 Mar 2026
 17:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
In-Reply-To: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Mar 2026 17:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>
X-Gm-Features: AaiRm51soCXnGU_aRbVUfhugrP3yYxGTYz4MnUj8rH_f3S9jQUe-5gA2enuHVm8
Message-ID: <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc5
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Mar 2026 at 15:46, Danilo Krummrich <dakr@kernel.org> wrote:
>
> (I will send out fixes for the remaining busses subsequently, so they can reach
> you through the corresponding subsystem trees -- treewide commit [1] for
> reference.)

I'm not convinced there are advantages to going through individual
trees - these are just buses working around driver core interface
issues, not some "bus X does bus X things".

That said, I'm also not convinced this is all really -rc material in
the first place. This issue is neither new nor does the UAF seem to be
triggerable in any actual realistic scenario, and requires root
privileges to trigger even in the unrealistic case.

IOW, why isn't this just left until the next merge window? And then
done as a "just clean everything up" instead of trying to push things
through individual driver trees that almost certainly don't care about
this anyway?

                 Linus
