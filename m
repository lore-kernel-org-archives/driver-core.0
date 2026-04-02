Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB1346A0A
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 19:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158647; cv=pass; b=P3IfVRog3F89NvVDBQzP9aWMHKzJlXxy/DARdKvfZcLL7MyS8KR/BbtqrpZwzfQjlYz2jnk0ZD6/qXX6HJyoB/jfbBZrnGIo0fdRE4pB70emx/iuO1Dt1xyD1hlcy88//qdIfaT4JO3nnlPLsmJGPKR67aFqu/AzZB4H8bwBvQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158647; c=relaxed/simple;
	bh=doMwYSTuXe/JETZRl1N7Raoz/ERAK0foPnDNZyFizSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXF0CLscuJxHHdKHaeC2WuPdSfLTFJTfDCeMu/o8Nr7XiWQr2PjyGbmJb5HFjgpac8kuZmswG4WJfsaeypwejAMoaKu4VPNDNp9bFLvQ4ZLF8A5tVCpVEn33VHz/4bXyNyF/COWF43aXRq2WMjKO0Zn3yGWKeW5VgDv2xysPD2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKYvuPww; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKYvuPww"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso170037066b.3
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 12:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158644; cv=none;
        d=google.com; s=arc-20240605;
        b=Son7BF58oVsPC9OiQbK/SO5gsX6Bv5J7vInLGSNl5zAcgy75XU3S+59gbxRecjLnxm
         K2W/WAX+QWbAgT71Q2BH+KwZ80Xg/sxMN7Ue0cWq60iP0Qdk0OON3RDztclLADjKpJ50
         g7ZbKaOrI6pPr0b8mNpfXAyMuwe7j+d0358at9tVGY6C8B0IiWSxcFvSqqQp/LgFPPa3
         fREmX759my8zsnp6wIQiN032RpnORD3oVERVuOWfeiOA0jP6D2X5atAfy/MbsrPLefo9
         nLX6bo7AlXgBJA+v/gNuBllST1b5bWN+3BiwlJDwEkWalPoeAa4v3bzBJeonjaRDWusP
         ubXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        fh=olm8p4pnOf0TlLMFD9sGYqq8ul4j8oQp8o8oHCDcJLo=;
        b=Oxmw21HpvSIiO3YmFdWJB4N3jwqyAr7xlBYciBgnsO+XXZ7sg9jsNF/aDcJzmUG748
         UbPNhCNYhE5xIo02yjxwIq9Jop0DmvPYZ61upJTh3w5eMSsN6s7I1P5fj7AhM/GQwpvB
         DgEJvZPVtqt0m4eqfKFmQelJTnYDiT16CFDx8fG5pLMuOkGjVZluZRC79iVMlksxDtne
         jK3zoTjsNHpyLyGrlsKXpWgsi5UNabl0sS7QbFz5x3UhCc3kq67j8ao+Ym+tik96W5QO
         0siSwnBYNsu/nqU9AsB9bK4mZE47GmoLVR2n1oBM9YZih4s3LhUaZVQp+LGgzprx+o5f
         VCNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775158644; x=1775763444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        b=jKYvuPwwClFgg4dyJETij+dU/gv2JKBouMKGzopCljW5gULtIK6wEKLIAzD0fnnM6b
         1y/KeClgRnWOkoesapMY2nl8aq9KDG7Nlymef0moovGM/rOLchpy1RNJ79RJ/yLB7gvv
         EbH37kbsKWQkezUog9s8xpwyTYcze9zTXqvtkffojUmphg6CEz0+3ECS6IOShU6b24Tb
         YsDSs/kCsmlxBq47qknVK1lEaSChedui+M6/9yspzMKP/OjTrOogv/BC3QKkxXPt/7r5
         UOXy+LEPlgxkhpM0cRymVjIazNmJr++Q3LK9k6ukIHHM15F6ztM9Hefc5RYpIo/O6XPK
         T34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158644; x=1775763444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        b=X0mykMJnZGrsixfJ3NGOYVT2TGwjJvkYd6gPyx2ykJLWfKZZniWBv5wlhpRW0btbO/
         9BAYqcRUnxQ7Bh0/rVlqOB0I96/i877F2skUbdZHiA2TpTdEjs2mrrSenXbB0ik/+T+u
         yOZuOuKuNsfgjFLtYL889vVFrRXYzz6tqUd10N2X5XoJ/IDQQL2kU8/3cgTzhpFTiIZF
         91m7nCI6DEAq0M6imBE6WqUClxM51tp1oJEshMZ+jV45+oQOxlSo9It4WEj4p7MJr/1r
         EayQmFOfliw/7yPgSCY7hzroMF97YFNgFGeO8QJbF8vSlQNChVIO8Q7jYJ1PJ4b+8NCg
         0D2A==
X-Forwarded-Encrypted: i=1; AJvYcCWPrC7yKfUniG1n29lJNqWVWv3sLWhZqWo3ujBxS0NHtO7k9orOcPTJfE+iAck8N+7lOw3sPuK+o6HQiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGt3FX7r4ZHD4OYYrL7PElhPU+2EVnkX/11sgz/8QCuBLqP965
	bGmy/kApxI/TZRv4hv2j6L2yDpOBwCksn4pNWuqEspp1KMfaGvYjEDULrOLe0CEMoKQ3qSq7BTf
	y9hnAr/ijQcrkcjNknf7yKDWQq6LE+039NNYWVTBH
X-Gm-Gg: ATEYQzyMc4udkj7AVJ9qIb1Cks68rvbKQAPxxStj6XfjySvvA16fI4oKnO7J5+C66l2
	KpVJukQFcI9guHbVVQh4YBwP/9BUFmfBbP5N1eYjPFv/yJxNvKzVRtiOLvaH9U8hZkByzTsxecH
	ggxCujWdhhKCu/ZZ/qeuufephz5r3GaFQ97kgkrdt4Eh/i+tIVV/t6EI259sBomBER+skfBETcX
	djTPCwOL+W0rubdo7Ukma4yf5NWP99vb/DRQ2gqlGh2Eob5t/nSGeZUd0iFBQmm3a/GlTn8mQpP
	tS0EavyoEYSvZVYdQR82tC1owZ8fGUcqF+rHTb+CcfK7JQGr
X-Received: by 2002:a17:906:9fc5:b0:b94:cfd:f37b with SMTP id
 a640c23a62f3a-b9c67b99e79mr7310666b.45.1775158643949; Thu, 02 Apr 2026
 12:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com> <2026040236-kiln-carat-bb6d@gregkh>
In-Reply-To: <2026040236-kiln-carat-bb6d@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 2 Apr 2026 12:37:12 -0700
X-Gm-Features: AQROBzBlWCEOhUiKVBdAOMQhIYruKxtYmNT9c2ETd_EsKRwXfwQK638DgBnNr5M
Message-ID: <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
> > > > This patchset adds requisite kfuncs for BPF programs to safely trav=
erse
> > > > wakeup_sources, and puts a config flag around the sysfs interface.
> > > >
> > > > Currently, a traversal of wakeup sources require going through
> > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls t=
o query
> > > > sysfs is inefficient, as there can be hundreds of wakeup_sources, w=
ith each
> > > > wakeup source also having multiple attributes. debugfs is unstable =
and
> > > > insecure.
> > >
> > > Describe "inefficient" please?
> >
> > Ack; I=E2=80=99ll provide a more detailed breakdown in the v4 cover let=
ter. To
> > summarize: the "inefficiency" isn't just the number of sources (150),
> > but the fact that each source has 10 attributes. We are looking at
> > 1,500+ sysfs nodes to get a full snapshot of the system.
>
> Wait, no, something is wrong here.  You should NEVER be wanting to
> combine multiple sysfs files at the same time into a "snapshot" of the
> system because by virtue of how this works, it's going to change while
> you are actually traversing all of those files!

Agree, the current approach with sysfs might have stale values. The
BPF approach holds a lock while traversing the list. It's not a
perfect snapshot, but it's internally consistent and arguably better
than the current sysfs implementation.

> Why are you trying to read 1500+ sysfs files at once, and what are you
> doing with that information?  And if you really need it "all at once",
> why can't we provide it for you in a sane manner, instead of being
> forced to either walk the whole sysfs tree, or rely on a bpf script?

The data is fundamental for debugging and improving power at scale.
The original discussion and patch [1] provide more context of the
intent. To summarize the history, debugfs was unstable and insecure,
leading to the current sysfs implementation. However, sysfs has the
constraint of one attribute per node, requiring 10 sysfs accesses per
wakeup source.

That said, I completely agree that reading 1500+ sysfs files at once
is unreasonable. Perhaps the sysfs approach was manageable at the time
of [1], but moving forward we need a more scalable solution. This is
the main motivator and makes BPF the sane approach, as it improves
traversal in nearly every aspect (e.g. cycles, memory, simplicity,
scalability).

[1]: https://lore.kernel.org/all/20190715214348.81865-1-trong@android.com/

Thanks!
Sam
