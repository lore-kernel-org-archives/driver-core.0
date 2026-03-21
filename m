Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C0318B83
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115548; cv=pass; b=W88XiSjndXlpbGFPPPaY5FofxUC2+iV7S+bIFkgJRvNfYykZRGhmHz5Io2dWxV/XRlmCMcbE0un6A1Y83Y2acarLLnVnkBS/un2UsUeRVqh/IWWhIwfRbx6/UIiqy+uXnVo4i1oljqgH0XujOD5STkhYudXRAQQU3Yrt1Vd9n6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115548; c=relaxed/simple;
	bh=xOtivuzC1u7qs0tccX4nAuXpb2S4sLdDIsBXc16+/kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcVYLVD3PQ1Reyl3VGRiNdlD0bDUslOry4wuRPT5jdlrDE9ydrS8B1y8bd+UlP/ErvVh3JBq5y1h6LEcOACgYI7zZrn50d3Cxs1dbe9MST4DAErsrXzOqFdeTy3TdOaDdh/Vi0MD9j0wy5cT1ldhsS8RMpdmkfi28FRKVe+BPV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlnM8DJ1; arc=pass smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlnM8DJ1"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so21088885e9.0
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 10:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774115545; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUaH2GbnWVPJS+3dln1uT3ptCOVgIt2IEv40PLdpG93NjvK4Jxvstwuef1zD7Mbrdx
         xEx8Frp5KxFuzKc8Go/lhHCyA+QpW0DbGpo+tZrwgbAmIK6uKl5asbHqnYD02g8keDpV
         ClLnDlcfSHGAkjPZZ3Z/XQ5DktubBTDP3Mb+Jyi6aEaechyCI6QlkkibmVO5IS0fm2Oc
         X4sROEP8hDsKE70Cu1WL/1R3glsPa3AykBFrlUfuA3674IJFeOMMP4VVrkCCLXdX0gO3
         +wrYFQAiO33iVY9xRYldXOcPG8DtACnsndkbfMbpMkj+wTheyZdKl7Wca38IGqcsK+SS
         CV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VjWmKaEpPmua1A5mJ4thcxD9fgMtwaI7wu9hm2FvvIA=;
        fh=aeoY8kaPGioCIA18rPnFmTDqIHtNStixqSkeakUxCMU=;
        b=S767TwV9J35lo0/t38n+38ybIbIL3N5MiRfMvQUVWdGPlFF6N1jYd5M0UhnNOJnWYs
         YKIdzz71Ot4G1v5bvW+zXvvRRW4J3EigXeDn6wstQOEqJyzRfSSUpHHMk1sdd++JIqkg
         MYL06Z4CA2u4okPOXQvNrr7sJttLn8sLaGVjVHn4zh35BwybyhgJl/y5+M7LbVxEvMMK
         Mt43tmD1Hro0u6A2l2liUnxLc8ZZYvhBYCMEg9trYSypXYWLVDu0V1tPK3SYTukoJeuJ
         ovrmLDGV94ZlYXsmR7dQOMGDcJcElWXbfI5x8vHbjLY2vqsUkDZ/Dyez19/vpdMNBsAc
         vm2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774115545; x=1774720345; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VjWmKaEpPmua1A5mJ4thcxD9fgMtwaI7wu9hm2FvvIA=;
        b=UlnM8DJ1TI9BjIcHKSr+e0l38k6cCzm3zSH4tlKF7Ow0MCXo+1wItMxj7RHHkvr4/H
         uNqb8c2Zjz5g4CNgmuKG4wDmj/hvgbNyYALKPRAaVyjnIJCyfYgUmPWaPilNm+vp4x0E
         AyTp8ySSFwF0Uw1NmOIvKM+DWVwcrjXdJCj8/3/Wy2/xh1Y1eVCZ6uSX7/SDINGnfSRg
         Yau/DNBVDjLTfHX16Ux66ggZXG0tQ+tkFbljkICryX6U1Fn87xY1iNDbMqPwDpxxYIWy
         0M70TnelNSme4JDw5b1N4PWdAPWmw48IRQASpoPTkj0JlfpMukGRmAiqADi/fciAK4em
         BH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774115545; x=1774720345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjWmKaEpPmua1A5mJ4thcxD9fgMtwaI7wu9hm2FvvIA=;
        b=c8Ol6aKyP7p7XAl/6HPB+oOhZe0IwUDz+OqUR4Vvh9FNaSjucv41paVM+kENpQcrrM
         nIE681Gg0KvUG9btQlOlMWbQ/mV7jdiQRovZRqUcJfXUur/zvGmwvGvKGOExajqFgmAC
         0gdqdDXYzQ59yV5rJgU48hoVShkivdNUQh6LZT9XlmsW4ewqUxtg2zuj5tJOT1YHk2k0
         hdI9e4snHBmy0x9Sv9TuZaXDcyskoA5gfVP1m7dN+8VqeKtSRZKT6pefj9nupkhVjAiS
         fbASO2xXJifbs6HHvkrROcSOkF9z9VQKnIx87Yrb5Gul18ayIpWIzEEnVKC05cDpW0z2
         kR6A==
X-Forwarded-Encrypted: i=1; AJvYcCVAruCob4L6ltY+O8GkLxSmFArLijJtkmdIXbuAI7Un5A4ysfzuqkiGVl3D6kvWq+ZFacxrEhGNJ5ei5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaROfGKscR+krvxBaqRGWHXN+xzMK/+HSAuOcGgYoJ8SnBma9t
	+CONgaMlILt/OzcLz/Ncj6LUbmh5oYKD6EgEhwv3lRxC6zxlzjHi0fFelO6TRF5kk/sCvoDDqgu
	u+yQX/cgRln0gdPIM4TFRlqzDZNv59c0=
X-Gm-Gg: ATEYQzwVLUknI/3E5zJ9axvb0CPMCPSMW82Vy7hVG+RXviL43DRU5SNSvN6RhCth1g9
	5Yk0B0yO9il4K7aRUJ7uanA1evxU98VbPsF9eAUwLPoRkBagOAaXftAbLQG9VQGUvsRsBUoOAyW
	1nOxdBHuZVCgcVeHq7aIWGG7jkt8d4wO/TzsNYjMbVUMTRsq8Y4tdBW6Gkj9AMYhNzQl9936gTP
	kyuA/37UqT6aqtwPyId7EHDw/Cxa+Goe5THU6VIqMbumf4C2dAMh7V37Ai6i6ZHEAq0Mp4kB4N/
	3s4xuduNb8x7qZ2plm7qmkWKPEN9xQ38whd0JG31cvZE5wNH/UZ9ti622a8=
X-Received: by 2002:a05:600c:8483:b0:485:531d:28b9 with SMTP id
 5b1f17b1804b1-486fedc0070mr99667325e9.14.1774115544902; Sat, 21 Mar 2026
 10:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320160055.4114055-1-wusamuel@google.com>
In-Reply-To: <20260320160055.4114055-1-wusamuel@google.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 21 Mar 2026 18:51:48 +0100
X-Gm-Features: AaiRm53hX-S7iTWxzgANdr9Lu-L4x_TBCFGlJa3VypmZ-mBcKZAol4lCVpxhFIo
Message-ID: <CAP01T77hy3j5BZMBcYdadLfPe7dYb3zEGDF9daUxJHYy=+fcgA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] *** Support BPF traversal of wakeup sources ***
To: Samuel Wu <wusamuel@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, andrii@kernel.org, 
	bpf@vger.kernel.org, kernel-team@android.com, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Mar 2026 at 17:01, Samuel Wu <wusamuel@google.com> wrote:
>
> This patchset adds requisite kfuncs for BPF programs to safely traverse
> wakeup_sources, and puts a config flag around the sysfs interface.
>
> Currently, a traversal of wakeup sources require going through
> /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
> sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
> wakeup source also having multiple attributes. debugfs is unstable and
> insecure.
>
> Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
> traverse the wakeup sources list. The head address of wakeup_sources can
> safely be resolved through BPF helper functions or variable attributes.
>
> On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> speedup (sampled 75 times in table below). For a device under load, the
> speedup is greater.
> +-------+----+----------+----------+
> |       | n  | AVG (ms) | STD (ms) |
> +-------+----+----------+----------+
> | sysfs | 75 | 44.9     | 12.6     |
> +-------+----+----------+----------+
> | BPF   | 75 | 1.3      | 0.7      |
> +-------+----+----------+----------+
>
> On the memory side, between kernfs, dentry, and kmalloc, each wakeup source
> removed from sysfs saves at least 10kB.
>
> The initial attempts for BPF traversal of wakeup_sources was with BPF
> iterators [1]. However, BPF already allows for traversing of a simple list
> with bpf_for(), and this current patchset has the added benefit of being
> ~2-3x more performant than BPF iterators.

See, it ended up being faster ;-).

That said, I didn't understand why you dropped the test. We still need
unit tests that ensure the verifier causes the bpf_ws_lock to be
released before exit, and an example program (like the one you
benchmarked with) to demonstrate usage. Both are mandatory. See
various *_fail.c files in progs/ and RUN_TESTS() macro for running
negative tests easily. I doubt we will have any wakeup_sources in the
CI environment, but the example has value nonetheless.

pw-bot: cr

>
> [1]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.com/
>
> Samuel Wu (2):
>   PM: wakeup: Add kfuncs to lock/unlock wakeup_sources
>   PM: Add config flag to gate sysfs wakeup_sources
>
>  drivers/base/power/Makefile |  3 +-
>  drivers/base/power/power.h  | 14 +++++++++
>  drivers/base/power/wakeup.c | 63 +++++++++++++++++++++++++++++++++++--
>  kernel/power/Kconfig        | 13 ++++++++
>  4 files changed, 90 insertions(+), 3 deletions(-)
>
> --
> 2.53.0.959.g497ff81fa9-goog
>
