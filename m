Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62124071FE
	for <driver-core@lists.linux.dev>; Sun,  7 Jun 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831837; cv=pass; b=uTAS5k4msVnQs+TvfzWZLAdMaXGw+3WfZqkDNnokt1mQ2k/AqKuZRVhboThGQ711ptkDL6eCJG528Z5VVNA2DRxtlJbEiHGPtAcyoUVLt+2S3Nz+yjPoemn5dy1uDIEpACn/tk58Edm9/C/l7ODirmL6QmA+Zsv1t4g9oEIhzsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831837; c=relaxed/simple;
	bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4Ks/f2PI6fLbSrBbzeJCFVspavRQzsov3o4t6gLh+lvvYsMDnQ9w+wAhT1D8f3nh3A9zthvkY0ogR0uXmhf/sqk59r85zeh/ofxGg36hqwIPyLJ7gI18gHqqnnsaQFcm5y5i+cYhyB2ZGXzybunDoKQvmf4FO64hOJv7efYxVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVTemsUf; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVTemsUf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304da3b4508so333517eec.2
        for <driver-core@lists.linux.dev>; Sun, 07 Jun 2026 04:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780831836; cv=none;
        d=google.com; s=arc-20240605;
        b=ACK4v+Cc3bEyFjkSFaMNvYueCLUczGYqwl9C+LvhaOPhrBzjGSP9D7dECiJ8ucyyDc
         wbw8dAo2zQB7WLYYlGFJLr+N0YEFMZZMuhu4iIsKhlDYk+SXJyeaYnF6dmldfHohBTZU
         QflSxXLwV412CdV9sadNDLJuasBfbjigJX35U4yiFF6YDGF+mp+7JS6r1dkK8gQmo3eO
         5qaVasFavwxMaBkIiPKRvCs7nv0r6sYQoD4uY6ey3VpFpkSlFx+Hr3famQfMArST8m9p
         oG8MX/ahgPdUkpx0lLrkrauuZ3uNB/2Xdgqks1A94bAAfI1YuIskCBBCph0Am+q3v6jK
         Sv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        fh=LX6heCEh1sxhqc96aWDU8TBozmjzJuN/fThGHMQ/OiY=;
        b=RVToa7RpDFgu1lrtLpT6of14ryrRg34q684WUuD4zb43gZUxtxS7zWAgXb0i+ImAXO
         nVvnhOhifRTjCPFGaS6WgZSky4tDFLJ3J25Y/dCdLYe4tPI959lEL0V299JKrmw6KEZk
         fZdrH/g3hj32viSdNqiA4kXDY1URQQfBsnsYZGBVSLCad+HqiAPMQns/3qn8rkaZz1iY
         nsjCyNGwbD0UbKx5W4wMGCx2rXGjeH5D/sxmA1MC/OHj9CnobVbTa2wqpqrI+Vlxw1Rg
         Y9qJOyOVt1MKFPTUOed3ZlAywTZGYYEU4Kw3oVq3Jdm8G/gfH3GHk+LS5RlxkYchywdN
         b2Rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831836; x=1781436636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=JVTemsUfQQjb1NloyQ2fU2aluneXOMMj5S1hoh+cIKNN/GoMvRIpqi4xSVB9g5L3/C
         jYGNY42KrSPtsrlLujEyEE6TF16bMlSr03oV6+9OBUSV+ySrQaWAru+V0vUhcG4guGxD
         ovJyluy6qstGP+RVbDzLEN+assBQBlAn3g6M7f80Utq1GkDYV5NKrbKDeskR+gJoXPGu
         gj+CkHUVwg579HWs/kHjiUtSh5JcP/P9WO0X/S5sul91RdCfDNnSxL0FwcaGAor7KO/k
         8JVINPvB5a2nDQn/3hJwkQlflFjMQ8B7vjBUAGMnTZ0TBLeYa+xCopYifSHSAyd3SLH7
         8alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831836; x=1781436636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=TI6JQlemRqlu95PJlJwI5ZNJuvtYshg4w+Y6HF3WWg8XoknCa0cV6TlAzEeqp09Pob
         4LftUukTycyFRjAOhLhgrrCWsyJoRZDzm1Nwacr07hgH9CwYHfXFP0SYeUyzdOmRDaUV
         Uj6ivg+VX/paKijmhnMp5Xiof9IF1FOIAhFe7G0DyO/8ONXj8Opvw3FlMTAGyPknKvWS
         64R7IRJQeXOVqY+czrQbw/MZwHyQL6RNbIyAeFKQ/yX2V6QYDbn7OohSQw24B0eb+lv+
         UxRstwuYq+GkDnmm9ADodfjlQPE29vCvhSZdTqdqhrqH3IR8i6ZdlPu+tJlejKznFNNT
         Mh+g==
X-Forwarded-Encrypted: i=1; AFNElJ9HJcJjLp53gtM2oiZdxi2ik1TTHm0QQgOhUJPlpYxQvPHigMN3od7Tq7wcmFg94cXWe+QYGjv/zzpsyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgawTzgYmvJ0ylh7xrpUSQfuR4bhKCJLai/lwLNT2Ld1wPP/It
	BSWcLE5cRAouvaVgqScccAuPOgJl4VhLOGWjlGyQVojEi0SuwPzmszhz8edRPC9WDncHCMXJeD4
	lLzv0/5BEFxh1Fi8YRM5RwXjmLZHf0hA=
X-Gm-Gg: Acq92OECw4svV9qdb7QBzVmZ3uy1XDfEKwIXTsUdHGzLu4nDc74j4dscrZD8/qrwmgK
	9H1WKROHup08MkVoN8jAjKdNYyPUNfOgVTzDQ4HNbWuI3aYnSevwN6iropddTGWZa6Fi4Z1vtn7
	PZMnpBLFBZTeWpP30hI5jV5OCt+LRHsfbMXATAbXoPWs9FvGLKa4MZv2A8Jaymk7vNugBfwr4RK
	49dKKfAhbJ7RkzQGlHigyTdHrDFCTxmBn/BJA6RJfltwDNkGxqJDJjsZ+5DiyJpc0FOPYLPAf4G
	puePX817sG0mgwfjrVe9D4+JWnzEkUBWRz1sIuuEy2gcT5JTcjJR7ZOp2Izjn/rTCDs9ooCPp76
	AqcBpbAIov1DpYF7D54rRadd8Sjs1XbG3AA==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr2921241eec.2.1780831835929; Sun, 07 Jun 2026
 04:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
In-Reply-To: <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 13:30:23 +0200
X-Gm-Features: AVVi8CdeC5gDKTC7duruJvRpgjli4FYxW2S1H8-VJsB3l-jVir5nc-87EthTwdQ
Message-ID: <CANiq72==HqQnNdemJOrDwP6dCzz1KBs977MmgjLbssDstAG-Sg@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 4:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is fixed by [1]. Maybe we should merge that one patch separately
> and before the rest? I seem to be seeing these long symbol problems more
> often recently.
>
> [1] https://lore.kernel.org/all/20260605-nova-exports-v4-1-e948c287407c@n=
vidia.com/

I can take that one via `rust-next` unless someone shouts -- Ack's apprecia=
ted.

Cheers,
Miguel
