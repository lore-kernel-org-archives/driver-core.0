Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5A28CF6F
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 20:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530006; cv=pass; b=piKK/PWXgpUQ4e/LfFp9siExLfqfc681mnwWpudoWtnGqQY5cf9CDcU2a4IL3rl79YfH8af986Hu3WS9nDJJLRYGex2YfBPYZnkdmjbF0xcbLASVpx5UIbi2lS1HKGptoUYCYj+kQUG0FMyFjB0evJupezISGGbYrIvF87ZW7FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530006; c=relaxed/simple;
	bh=yO/EmkVIHkBBMRUcngEKNItvEXSsSe+RskyQw5Jk4BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/7yIgPqOVyqnO0gOvbwsdygya7bsIVcA1b5+vq+XWBcX9pYktKKRyfOwzjT5Wyx0mo0dM58pZBRsRwHs3k5tmNV3U8R4tvG4kydYgzUYytL8W3T2MHJGtjhS6TFNOee8RrCGusvc4Wp0/e0sKotceetiCTlWEeRnYbY3/cf0VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j1zkW9ij; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j1zkW9ij"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bcb5370bb0dso606699066b.1
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778530003; cv=none;
        d=google.com; s=arc-20240605;
        b=Mx4AUpCi4oM6tkh4nh/86Ii05eO3fCBN0frn3sM14OoQ8qmJDlWm+3eBogNcUbJEfp
         6v/4YTxGwB4tMUx4g7xoej5nkqesAJdgIMaJBJ9sav4H2T7m3x94X2/Wdo0qVEoHroDU
         3MfPfKX/zGKP03q/YbwMdS/7d+jxLkzTWuJ+7vvT9/kO/EzxKanUZLMvBqLf0pUVkDK+
         4G/rCjzxsGqp6CRQf/xuqEROIH1GjePcog75wdW4vkS2v1ufN3CAYpkVko6Xx4g0pArt
         qzV36rV9J7FIPMSOLshYunF7cFuu1ry6ciIVJ/cQP1XbBG9l2LH3VJNvOSisTru+kspf
         10YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        fh=1oAmT979b4xinY2oggnnT2IFGENqaBzo00yoIJlnSps=;
        b=iihH90wSKUFQkuWMAZSkFu1IVCUUayb9SYoiI2eLHVZB6ZZJHaRxEZvyXWc274tTkR
         svdnyGST4wtW8BgtOKdPGe27cR1uJch8izLMx+Xj7BeHOJDdhwbBp9dWzaIXV1I8rXaV
         sBaysk0M+ZrX89G8YxT744jRLDV8QcHR8zCLfkLpMdK5aHYeH279Pb0agDw4fdJ5Bdio
         82mK0jtSqOd5iKk87dOSAFrkTQaIP2BkdAtjJLSdvccg4lKlsMlcesjlE/GNgNWR1gOg
         hLlgwrvb8XHwaykI60DuIuBBgxMm/DbbGYa8YrdCCgQSD6jzhNN9X2xwTDHoAnPlR62o
         n4Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778530003; x=1779134803; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        b=j1zkW9ijgBJeoz0/hYl++VQKLLRvW/VLxVVx2DILx+0dzdIik696kgiT6oX8ZRjZhF
         pF6eu6MKoXqrA3kl/OAFAWVDgI/LG8Bj+nturueRYXrbKQTMNmp5kXflrBCiCQZaPZFZ
         jIRHl2zYqWBEtMDkNLd+2REzOt7Ta8DIKaFp4PrFeVSItXvTy8rz1SMEAYmRnfSY03F6
         GAxIlD0Yw7AB1pkUJT66kaztLfTq6637BCxd8UXCdEZiVYz2zxuw20h4pLWXkikQHoue
         E9IUKmbJMGn27Z3ttYv/DRRzmSJ9xbAta3MF8vDMmaRk+50JBiN44gSvCJapvvGwL4/b
         pYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530003; x=1779134803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        b=W1bUcv6QG/t1GLGxgsrnU6m7k1VOVbdZux8GV4ywd8ZewzbnWGWKkuuPe8rSDcHbTn
         cT7Hq8Jd4IHwW1ANUDKPk3Hbm6BZsx04dJ6CHCSlJXovep93h9JmB5foQxQ7OILmFUpP
         w9ihDQ+OPFORtL/iPUMpfpoaT4dM6ulQrvwh/W1RPGseA0/aKTKeMCGqoGfRfWGGcqJK
         NC/ZMoSqf5eZhqyQrJNdczE6uvIcaKmCWt93ycdnfG56kt6UHwKgEmEHJHY5uYe0lrel
         QAStmiIt1u/hfetABVn3Q3HQCy8zBLkLqbWEL2e28Bt1WWLA+ejEEMTF2ehBjslGdMJI
         3rpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+O6WVInOHgK5HiyftMR1/qlxGPf2snE5ve0NkCBqOvb/c4z63wxXVveEe0NHSzw164sfalHh2WYVqY+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxADSxyvT9lL8w74SBxSQuR4XkUkz4a7wONSBww6sj+LuXWMiZO
	uXX6c+qAp+0QWqBlt4jHAXLF09bx3uWc/QLABGExplGHlrVlGGkZZ3cSVGAX9jTWDOVDLeuI+bA
	tzZQeleltKkBfwVb3p8Mmok2arH1PmC6gGta49tRA
X-Gm-Gg: Acq92OH2tw2GkfototIHLiMMweYZoIr0EVj8GyH+l4D5uSK3oJHKiazhTZXLIMXHDRq
	8s7pSWj/Gol2BTkeJkxJRYqBfoeOJueSulXRI5wvev9mu1M6lrNRKwe/GQAGrbj0vdfT93/BsVR
	11kc5XMKuzUQFoX85zcvJtfRn5T8eTYx4ea2fWCdpLYkn9RLk4TxAdHm82NgUFUPDQK5l9tNA5d
	5Lsck1Dnq16uBu92xzcceLFe/rIdfJdiYKeCbsouWxGZ5Ul0fbGHmvFxHpEEI2DHRa8FSd33a10
	tXIncE65ZzsSVQFn6jzmmm0d/ScBxdpFND/30R4uWg874kb330wc
X-Received: by 2002:a17:906:7944:b0:bc4:c901:20fc with SMTP id
 a640c23a62f3a-bc56e5fea09mr1393779066b.30.1778530002409; Mon, 11 May 2026
 13:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511174559.659782-2-wusamuel@google.com> <8ca6f748be9913a2ced3e9f821153bfa914c206e089626e37e32d7d27c83be09@mail.kernel.org>
In-Reply-To: <8ca6f748be9913a2ced3e9f821153bfa914c206e089626e37e32d7d27c83be09@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 11 May 2026 13:06:30 -0700
X-Gm-Features: AVHnY4KeO5w6YEpmsSlgr9DnnAi-F6xgJF0AMvkGoo5f5Q_Eg8n5b2_v89jUAVM
Message-ID: <CAG2KctqDYmVORfikxr=NJbyMS-RVq_ZRhStJ00Y8vioXCSmUxw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] PM: wakeup: Add kfuncs to traverse over wakeup_sources
To: bot+bpf-ci@kernel.org
Cc: rafael@kernel.org, pavel@kernel.org, lenb@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, shuah@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:27=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:

 [ ... ]

> > +/**
> > + * bpf_wakeup_sources_get_head - Get the head of the wakeup sources li=
st
> > + *
> > + * Return: The head of the wakeup sources list.
> > + */
> > +__bpf_kfunc void *bpf_wakeup_sources_get_head(void)
> > +{
> > +     return &wakeup_sources;
> > +}
>
> What stops a BPF program from using bpf_wakeup_sources_get_head() to get
> the wakeup_sources pointer and iterating this list without taking the SRC=
U
> lock?
>
> The current API design requires BPF programs to manually call the lock/un=
lock
> functions, but there's no enforcement that they must do so before accessi=
ng
> the list. A program could call bpf_wakeup_sources_get_head() and directly
> iterate the list without proper SRCU protection, which could lead to race
> conditions or crashes.
>
> An open-coded iterator would solve this by internalizing the lock:
>
>   Iterator new() acquires SRCU lock
>   Iterator next() returns next wakeup_source
>   Iterator destroy() releases SRCU lock
>
> This design pattern ensures that the list can never be traversed without
> proper locking. Puranjay Mohan raised this concern in v2, but it was not
> addressed in v3 or v4.
>
> Reference: https://lore.kernel.org/all/m2y0jeg5sg.fsf@kernel.org/

This was already discussed; the response is at [1] and the BPF
iterator attempt is at [2]. In short, BPF iterators and their
tradeoffs were explored, but the current form was chosen as the best
option.

[1]: https://lore.kernel.org/all/CAP01T74KNVT2SVRR+XPbFb1vy85W=3DJkp4_yD6xv=
TSg2avQo8AQ@mail.gmail.com/
[2]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.co=
m/

> > +
> > +__bpf_kfunc_end_defs();
> > +
> > +BTF_KFUNCS_START(wakeup_source_kfunc_ids)
> > +BTF_ID_FLAGS(func, bpf_wakeup_sources_read_lock, KF_ACQUIRE)
> > +BTF_ID_FLAGS(func, bpf_wakeup_sources_read_unlock, KF_RELEASE)
>
> Should bpf_wakeup_sources_read_lock have the KF_RET_NULL flag?
>
> The function returns an SRCU index cast to a pointer (incremented by 1).
> If wakeup_sources_read_lock() were to fail, the result would need to be
> checked for null. Without KF_RET_NULL, the BPF verifier won't require
> null checks on the returned pointer.
>
> Looking at bpf_wakeup_sources_read_lock():
>
> __bpf_kfunc struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void)
> {
>     return (struct bpf_ws_lock *)(long)(wakeup_sources_read_lock() + 1);
> }
>
> If the underlying wakeup_sources_read_lock() could return a value that,
> when incremented, equals zero, or if there's any error path, BPF programs
> would need to check for NULL before using the lock pointer.
>
> Puranjay Mohan raised this in v2, but it was not addressed in v3 or v4.
>
> Reference: https://lore.kernel.org/all/m2y0jeg5sg.fsf@kernel.org/
>

This is fine, the underlying srcu index return value is guaranteed to
be non-negative, so the return value of bpf_wakeup_sources_read_lock()
will be positive and not need the NULL check.
