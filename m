Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8383AC0EB
	for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570124; cv=pass; b=m4DGCz+1Rnn09fL0oJ5ckM+fxq+SAOMa/dOxBoia+wrAnTbYObbnP4R1L1iLrdQaQ1mLy8xTSm65lkJBrpASnCaL5MGWd3sHoqrTJ6Z2FYp4rLFeiGHF7rPxSm0iocsRFYJztUilRnngK7/CVRXlCwf0fuKDyQ/s1ODy4NH4zzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570124; c=relaxed/simple;
	bh=hgYR+me/WqBHOq1AxI3Al6Lomfd9P4rKWlIodfqB2Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT871sqiobmg2RnPu2OcZfAhSkgMBYHKXYqeMQnR/Gdf/e7fdoMnFri3JgXemg6/XbVW+JNOjNSy3YbVbKRa6Djlb3qYoR5GiUxRM4RUb7JzWyKdsueNHx0L33kK1EsfgOdXBane0WioiaSyJ7sAyzdhhEYzlL1g/I5z51v4gLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEuklj8d; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEuklj8d"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30caa24aeb4so118766eec.1
        for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782570123; cv=none;
        d=google.com; s=arc-20260327;
        b=WDyrC6ZpOgFzc4XwCZCrdqz8F57CpO7+rsx/OoS7AiR6NXU6LvYle0/eLkqcyL/hyt
         MNxzUperCke0spOJHL0ySKibV4sWXuhrJHZ1i0HialqWIXNvtdTnYhq5NVcxY7Ks3swr
         1uidaKjGrpOdgn5M12Uk0HNxZdvkYBUHaEKhzL7CFvPyRu4/4Ga/S3mrA7BQbwuIYx3y
         Ok2ppne4L27dwsHcqRD5CnmhQP1QcCjGhndMyj6OeL5qFeqLME4PB06IFo++6nASfSEK
         socGj3SQfSgKPzRpE7rjK8iWfGid0N2/wszMAHNSQ3rTIgAS+nqQclSawwhmIdCPG3ba
         lICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        fh=mnZEOrjzomD63GQof8W099kFoeKjytGZ/53WHDVQW4E=;
        b=DZR6I6wQMR5OdSOeA15opoYFJK1ITAyr/Ut1JA5QIywz0P3pHWHWDFEJJz+5Y/KABN
         Y0rPsQGYrjEEZYR4F6Sk8kdtRt6xf6FzvArlLqQeRyP817rBLZbHvI8Xv74GTapgWpbK
         gGuVJgwYKl42gcRnAV/UXH/ND32FKMDd+Acdzq3mU0bvobnx8ZGL9edrUbEMXWMZdGWb
         iX552H1+7n85GQGYN+GZ4vgcJK3LwoN5+y1VlkRFZzpnwOuo133qeQCXzKuyH4+BnIRI
         VncSPRWYgOdEai67P1jSyRVDvHhW/f1KVs0xDNQeVM1TjrL/z4S7Xr4JSSa0IziCkzdl
         2Hvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570123; x=1783174923; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=MEuklj8dvAKJ3J9BBDL+tlvMQUgdx2pFUGo3vGiS4h964E4RcjEg85B9hoyc3XXk29
         Srcv8dgxAZ90HT+eJCDDMzY2/b2MixWpPpAJFFxjd9FJ+0KXCB4ZapAAYDnLIdBjhhF5
         30PHSpQOK/ifyyDEo6/s6RMs8ET/o+9dLdrrg8J9Y5P+ocuRctMXA/buiCIeZNjIpEpl
         xYIgPuuy83OlTj/R4PUQltw5+4o1fBRjGQM1CwxEVyurG0GGrETCWaj0OA0L8z9v/P1h
         vz9LapQbSlD05MP4hOR84NzgGFXcI9WAVSbCfeCcM5B+TqFfUpdiONCo4adOkG0iqOrl
         QNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570123; x=1783174923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=BwHSw19KEnx1MmgVDWCRX15FWAuHXqsyGLPJtXRIvidy1MSR+I7geserWjOmpF0x7T
         Gs6HLl5pfEsjvem5jASKufR5Od9/VKVZJR35+tgLFSBQPvi3AaIqMveVOzRfK5vHhKzS
         mEvkiULlIz+v1cHXi12slF8DysgtJ7K7uXr88KdQQN23R8uam9nxA5M6PLFDWo3wDhYA
         Uc/w02Cf7KeFPqtIZE489SIibuA/lmZXKheosr18xbv6Xx7TZ289Eg///+g+rtdl95vG
         GomFMKaHBNAOrxMbxVokJJgDAtMcy6/17S3sJC8yeu5lxZm4CtSr99F5sM0eqLatcVhJ
         zUJw==
X-Forwarded-Encrypted: i=1; AHgh+RqzkC3+u8Tfm+kEHFihaLpO51VFRsP8MtcdLIpoExhq0VgXr+elV2uEAOFpgpn7TPkP01wBhqJ20VtU2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+VM46s0PuEj8tt3O+tZHF4F/X9F5ZR5jSCS1haLDxTWRXzn0C
	81KwG6kRb7FpGQ5AzwxQwwraILJ9pLYAJS1jlj1YJydBgw21hPwqa6sSWwugzg9Zv8TVtBS8y1C
	OFYTz3K69CT/iUEV58xulXGdsiItyixQ=
X-Gm-Gg: AfdE7clo/+Ydz3J8IVoPH55+i4rb89InriVkV+Po2R2kfUX+YwlmxLE1OIJgK5X1DV6
	h40Xosxw2Ak6q2bAUtEBCDZacerS60tdWkt+fPoikm2MeMyBc8umAgOiZriT7fmu6/Xh7noQXWK
	96Ul+9J0DvFPkn5pJX/aDevBM1axMVxQsRgbQMEI4HYYwFgP78/jLi5ljjchB5MFlafRvBs7iyh
	pwIP9WGT5w7qM715mK0Xe/WQO3cE/jWMbNk/J7rTcUNosk69Iimt8MlA96+ccsMV+kTr4biMH2s
	2WScL3VK5Cd6nZlsIFn5+MkrLf6QrRugEv/5YPPKlOD9WPTCSW0AU7AUIgi8R8OcLnh/hQTaDaQ
	nTgnrI6mHnDc5
X-Received: by 2002:a05:7300:ec01:b0:30b:e157:2641 with SMTP id
 5a478bee46e88-30c84d6411amr4636635eec.6.1782570122681; Sat, 27 Jun 2026
 07:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
 <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com> <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
In-Reply-To: <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 16:21:50 +0200
X-Gm-Features: AVVi8CctSDh_S_EW23arFCE2Q437EiWrwvRaI2YwlTvVdF9BNVV6NJ35O27uGtM
Message-ID: <CANiq72nr6UD=W6oFsJQaGrSFCRqyWnY80=SyNR7u6=eVQ7ci=Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 3:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The only way this could silently break would be to use ForLt!(), but then=
 don't
> use the explicitly provided safe cast_ref() method, and instead open-code=
 it
> with an unsafe transmute() assuming covariance from ForLt!().

Yeah, that is the not-compile-error case I was considering.

i.e. I was trying to think if there could be an issue with the name
reuse, since it can always be a pitfall. For in-tree I agree it isn't
a problem. For out-of-tree users, given it is very new and it is
unlikely they had that case, I think it is also fine.

(But e.g. if it were something that had been there for a long time,
e.g. in an LTS already, then I would say it would have been better to
pick another name).

> I can add them on apply, or we leave them as good first issue, as you pre=
fer.

Up to you! I didn't want to add noise/nit work, but if it is fixed
already, then that is great.

[ I also saw some non-Markdown comments in the other commits, e.g.

    // Invariant ForLt types (e.g. containing a Mutex)

  in the sample. ]

Thanks!

Cheers,
Miguel
