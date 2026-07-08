Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A62401497
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506874; cv=pass; b=nUCCU2reqWrri7tr17g+KWOEqY51ZHInnxcRauLqeGOVp7vjK0F0pPearcuvatxZ5FLvrsUe29ht4lxZjktTmQLZSzgGmz299D8vAaNrJQR6nxK5Gvp1oAcphFn66bu0G3E3qYgoJ5AZouQqWtkSYGnyYaL6rh6MwQc5kglePyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506874; c=relaxed/simple;
	bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdFIQpIyLoC/7KPSuLFGvyYKKQlQ8N533yOucIYIky/9JFyC3T470+yjx1zUw1sJit0PeqwLfQyjpO4/oAvdSakICfc7k5bczH3ksF2PzV12k92pq7DnQLahJe1iAM7kYaWFWs99Ba35z7NHCkKWfceidm62AUimyXRUVdWqzmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOSWIQCg; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOSWIQCg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e132d3eso840625ad.3
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 03:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783506860; cv=none;
        d=google.com; s=arc-20260327;
        b=sXRV55qjrN235//9wZ+BNrmLag8WHlBgIN+3dnGgWpx+o5A8X8q3J/5kJiFyhHpl++
         Wi/xaJhG0kN5Lf4cj2+jL+hKO3G4Lkm9n84RCM1l/M8A/jpK1JbZGvGOs4t0SRaDR9Do
         Ck7AO7bSXuOxe7g8HPt/nvKGeq0AweCxMGwemsXAgh6z7GPUEvbDF8cHIFWXYydnGiXU
         YviSDGl84WXWEWu8/GgRs32EIr6Z9bc8UZjjwb5KpW/KzEGI6djxfAL1Tmb44SOiL3K+
         XtEjyBgAmhhsWYcmogo6Addu6kavjvh6TJUceOoIButOHPLsicysiRGR0CwV+oxBGNcQ
         9hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        fh=fJ1h+a1hB8oOFB1brF9HoqyjGPFJZUVdzE4/1C6SyvA=;
        b=OXk53SO10HWOD+RpU5/Ue+v9ueKnh8zGuIitirJ70EudKVpd0t1P+rysk7xmJHrAHH
         C12obZEZ4jMF0gtrNW4f2cVQUASJ2lLUqh4qZqEBsMrdfoHu2KXi6AWj+bectU4AgLi/
         DkQTvZnxxV5DPyOOpgS1nBKUpXN5YK/MB08//lM58yDdt+rQZ9Jii5qBNJRJ4Q7oedEM
         G5sBeY9rw3ViNSRETsy7xmx2rWplh9tvOMGRdKYWdI+uJPObvgp9DW9guqgRkDKZ+T77
         AlMpAOpszVUg/SrkH3cvV/1ZvLqJtpykfI7Ih5WnpPPF0+YP2qaKpUwKQzcAnurHjDGp
         C+Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506860; x=1784111660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=YOSWIQCg6TbGaFlULdSPHglwG1OxMzyrj5vx8go8Pn+guEv+DY89hr2gCiPvafaS0l
         rjfcQ6JJ+bOpLClQFPbPsQ95OII5RvjiN3mVGZw5d+M7hIe/hhx57325CRI8Q/lmNDjd
         xeupKVd4+B06aSqRP9s4KfCCAUoiHUPuHQqY8i1FZkHY5Hu3co/Lt7aSgIrRY+23ctsx
         PCov0I+BcmkQcGgV1JGbjzwg2AOE4iQX/sddD3kYbAPjOEVAdd2yLZ4OAQAz0vFNfam0
         zlQClnWFayfLqYNsDduky3GueHN0tokU8RNa6/Guz1L/CunzEE0x0a1U9cKN6bqgPuyT
         yPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506860; x=1784111660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=TPEYlvtJa0y8qqphOL3gQnH2e2xQdcAqK48YMAv9B9rE2ZWpu1FAYRieSjOGBqCeuF
         MyJ5ifk7HddwwjNwJQLbWRhEms0WCRGldWe2eb67lj7r78olFxhqUKsEB4gGj6GT/CEQ
         YfYWpMmbkhuCH8GXv2PIOwhxwUTaof1DHaZbEncd5woHioJl+FkmNDPBnnOr1lPgU7Hz
         0r8yl8XfgW3xc/M+mjqR64FFhFkI26umO7swlggmsXly40sy4v86hodnyGaMLF9cj9cz
         LoDr4hefCdp7EvTx04M333/sehClKqkr0m2qgJ6G/0yK6yyIhpzCB8gdhUnzwfOGkmVM
         J+tA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf6dOmW4rc72BP5rrPe0JK9fq3wstsM/TRj49a4yBFjMjmE/kE6428LFkwKkhBKzrlIztUK/1OvQV0Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcHMGinTLUdeddZF2UKubqeWTp1GAgJy+lVqCE5Rwi2jv19lfF
	U9badkBEOUiVCLl0ZAa4DtD61j09kdDqqVR4z3m0N41T7ZSzk+EVENIkVa8cfHrLWudIrpSUnSo
	Fa0FsmkeH0lILFlE3GIGUIWwat5uqop8=
X-Gm-Gg: AfdE7ckrBFIaq9ukyIyUYK5BqAH5AWwauqI/KFwwqYoOIOd6vqW3tzQ5M0zM7PeOXCQ
	BUOHgJM4pMOTWbdUfTyt8U+VaMYAmpswuWXcoMvX+x9y6jKzRYaFg1aSwGV5DWNvSuJHGkn8PXx
	zzisSCx5Hqu+HpheGRquUD+V3Ge3mNVPcF7eYoR01bw6UgNzNqAiw7PpKE5bCDhVUQwSZk+Ka5p
	DNy5JBFFrrREgi/gQOSWdjmfpEQ5vAbXHenNtoGw4GUlMP3BZjp76BLU6GfkrDnbwU65gcylKyv
	4s6EgzoUqtxZpP/4fUy8czYLR1/QBC2zz82z6d7rUhfIEeFl0yET80kKw7UNgJ0Z6NmYw83JnW7
	V7S28Ljc5Lg85
X-Received: by 2002:a17:90b:57cd:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-389417e436cmr1662657a91.4.1783506859636; Wed, 08 Jul 2026
 03:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-1-72cd5d055d54@garyguo.net> <9AC77170-279D-4C0A-89F7-8D07F418AADF@collabora.com>
 <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
In-Reply-To: <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:34:06 +0200
X-Gm-Features: AVVi8CerPf3D12GiMfvLd9xxakdPl4vxt6Mk91TDYQmPEW-zWuPFQaL-PCqilw4
Message-ID: <CANiq72=8V967CuH92AJBAob6YaygXtCYY1GAr=qGuF8JzQfZ3A@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 10:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It does, but if the alignment is 8 then it breaks a lot of platform devic=
es. 4
> is the most common alignment needed so it is chosen. Different base types=
 can be
> added subsequently when needs arise.

Maybe a two-line comment/doc would be worth it?

Cheers,
Miguel
