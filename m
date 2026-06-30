Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8926E706
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808516; cv=pass; b=QR8gFScOAM/cDAsUCwSDIATKu50oREDPP1KeUxpD5bVSkq0vhf653GLiuAX9OJFIqdNoq0eeOfQTYQZZqJ0SwI1Qt9xwwsSbdglq6a3kIUJ2WmM0xkKZWCyqiPZ3RUQ46iXOzL/iWIkKB43VE2zoNhyi7S1cvg8lLrYyC2XWk2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808516; c=relaxed/simple;
	bh=12uAIaSCl7tiswRNJqqBaN64Jz/2PQBPhlMgm7mCoFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpp0HmRgEYupNqGoeO9JFwF1Z+sSeIRZh7hxQpQnLlKZMiOjl/wGJOJtFFegLTiyTH+QWxTp7NKHNyU0e6uKrCsYzsMRpiTuNRluJTFb/T5hGhniOa3uYOQJEiK3nJWhWWoXqJJW1wYIzrXokMNb9mISz+NTetDTM6/ZS8Jgalc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMkeQR4M; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMkeQR4M"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30caa24aeb4so353252eec.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 01:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782808514; cv=none;
        d=google.com; s=arc-20260327;
        b=rHM4afsz3+4d1fLlNB9lB4g1PYFXTk/RoSxcmCCaKBQs6iBnFnwhOC5Tq0sF8UXFjm
         n4lh3zzfE8FTk219V60+XjqqOGE/+M/ccmsYcriOuRHAWFYnZtPleCFN3b3hQ4+dccM8
         a6g1zhb05LaDs4qDfGVfsNOxR5OgFBEvpDUzI6+1gqbN+/O9v1RInzjKNx9pOMnn9Id+
         KWlkDIRsgdvv5RSrOU00NnUmUwTFYO3KMWxOKJXoiv0A0b7YWVzZ/cm9eWWHgBJrLTQO
         +EaPHtQ+B0jcaMEuRnkF8fVf2kK0q0bmHQZKwHyx1VlxqCNAi9bK0PGcBRp9PDQegblJ
         CdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        fh=Bb+0udtsn79sFFfR9hoM8r0W5AAnx6pHPZIkVNqMSmI=;
        b=RfPd7uB0Z94cF8FlAw76ugE+pI0YG0K2eObLokldQpoyy0L/1SsaRstJC+m+j8jTJT
         usfve6k/j8k1uQk3hSI5SnEap1EWuowyaTCyvVwJkeuKi5Ijyjbpihuzr92+ECr2lHKW
         GA1KX2y+GMY8QaJFPC6ExELn7BgvH6RmPwpvpML38THrUe7J2yZB/+ewQC1st9yFwybz
         RvpgaXofXF/Mv5u/QEYqgfT2WyjeYSUvUeaOawSjlWylABFQj55n+IvRjHY6dNs1/3Hx
         8T3erE+zP35O6GIJorVH9xg18Ppgl4XHnI/zFPTQseBCgXQJtnbt2btBDVIfMpSTdIcc
         tj5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782808514; x=1783413314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=ZMkeQR4MdmM+Kpw3cjhgNiRiTO9dewsPeKpheg/u+EjYLdrQkVxnHDoe74WIgXnAm6
         LXdINdAhMGcdK54PRwsPqKaoyc3ZZqh9RWPIo249ZpcUzhw4zpvOoRwR6c4uEWGk8aJ9
         sH0nXUAgbT+JBluRIGuaZES/vcmuGXpArWC5T0WYss0PB7buyEm7o/Y1dBN/OEJ2XTAN
         emjs4f0Kvl6VvurUOf85OspyAppGjcO4TqGNTZhW7EBC/fpzCv7l1Ec9QWkVTkxmR0Vf
         nZ3NzTW9Z0Uk3plikPwA1E4QXOCzx5aTDF6Bef2uqypNc8Y7uI4+YynNULnxTZOa+YS1
         QzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808514; x=1783413314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=DUpmywxhekAihChhk1FJbyOlW4L7N28gDJRa07XMLRgQjqQzcroT+21dJJR0XN9iUV
         10nRebqZzqq/gn6GPD3IzoV7FJ0fAMGlyFnHAuwMxBsC/aJU/dyf1tAPMzqz2QbX6aRb
         IzYAOF+9MZloR6yDJX2TIf1/2Onvd2agNBlbT4prPdN2av2c00MaMAJbwgt0JDRqIVyg
         d6D7WgKtZ1cMwWrcvN5Ke8lSSwnmzhe9CFg6Li+TiVfWDtsn1GqthixO/bEsLCKvdbyy
         2jcltifKc0X8nOb7XVDNoAMAz+gM4DaHEGzChc++jgHifHbzuEb9Wmtw9MMXtmHG7wmw
         qBog==
X-Forwarded-Encrypted: i=1; AHgh+RolKC2Slr7eWdPpslXf5s/EJMquyuj5sB6DLO5taHZ/32PHheyZenYV9B6g0bP1AmjK3stzilyw1esfOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAEcBZIuIGyG7hXAM1CKy23uRlje4UEvHG48KXYogvFKHyGbfE
	IMkLrMbnJFImC0DePzmVbqqe/ElnpjqoJImxWSduMRqP/IQQhoPR2i5/g9xtL9Bys1pps0PCX+G
	3SmU2Is3aRTa4eXw2QcxfpKiQwSuwDPU=
X-Gm-Gg: AfdE7ckU+//zrP2T2YWevGn1rYOCdFKbUeEtzomqUIINQI4a6MAZOBwaA+JkcHvKtPi
	/d6HK2fovSvo8qVrSloPHv1O3568T+q/nzjoDq3mr/WhS13uTffTLt2fuF07Jo0TkbEErwVYE55
	LM7Lqx1wV4CFmvfwKMgq/+qjE0wYVT3lVYSlZ4aWpKPNlQ/fS4GHQN2SAqieWoJLZ9E1kbTCBBD
	iuVyq8OkrhOxr1xfIjWs2Abstu1bOoOIo3woxr3byS6jbSdlxc3tJOQqqamB/VlpBgu1Lfl2qzE
	FRlUMNqqVgnyZALW59dLrU0Jlsr3MWqTi17UuWzeXUhTYvp7yGYE8nTaDLaLH8us+GNaXUxYzpv
	QLe5ESplSAJ/e
X-Received: by 2002:a05:7300:6ca1:b0:30e:dda8:e0ba with SMTP id
 5a478bee46e88-30ee150954cmr1003565eec.6.1782808513710; Tue, 30 Jun 2026
 01:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev> <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
In-Reply-To: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 10:35:00 +0200
X-Gm-Features: AVVi8CdhtqV-BYuDJ7-_rhOqSdDxdGUExu9BuuQ1x0bjmiH_24JXcG_HI6rxurs
Message-ID: <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 2:43=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> If the preferred style is to place each imported item on its own line,
> shouldn't imports such as
>
>      cpu, cpufreq,
>
> be formatted similarly as well?

Indeed, good eyes.

To do what we want, `rustfmt` needs the `//` at the end of that level
too (in the future, it will be without the `//`), i.e. the patch
probably passes `rustfmtcheck`, but it still needs to split that line
and add the other `//`.

Cheers,
Miguel
