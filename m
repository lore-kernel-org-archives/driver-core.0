Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1853C81B4
	for <driver-core@lists.linux.dev>; Sat, 11 Jul 2026 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776340; cv=pass; b=XuyD8Dktpm4XHj7mtktv+QkynRpebJbydCQLgl0SfX2adGcQg4ZDLCS4y/dbB72V8/KeSBBgAeb6LhuTDfB99BJMQ6w0T6kUREpEEML5tdqO8irck6oQBQwOl9f0CBOhp+zfe9HrPjSyr4zjvwwWy4X5+WZ07b8xwuaM8HCFae0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776340; c=relaxed/simple;
	bh=pEkxSRr2EbnFXPQ2EdilqMHjAbry4RBOsxKbRLH+d5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6GUXz7VP1kZHQUSpeEQ0RYN2BDapr7M+BzqdKJPXN2HJ4EV5IJKdZ4fkJ3BFpsjD88F/3n8SjXu2IQUcBXN1YU7io/zGheuJjM2qd7nFCyiUOtzzL2EEK+815PRXDMi8XHBFFF74DnsLcKck9WtFOxWxI5QRTp1EByoju5PmD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkndY5IZ; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkndY5IZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso158510a91.3
        for <driver-core@lists.linux.dev>; Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783776337; cv=none;
        d=google.com; s=arc-20260327;
        b=HwVgvtld5ZkTmF2jwSUf4awWQps204imOXUFh3aNfKVjQwGe7VqHvus0nzUf3W1C8f
         EJT3P3eMEUgpUxS1Lrvv/dhjYBS0AslnXMng0TS/Aiw8qjxWYTi/TWmycFT18CXkG9p+
         dZxDdCyZBf55jHY8Dgxu/g+2EEusP4ebRNxl0TXIvzh4+WBv7dX8L0/aSUUQN/HDrpaE
         pw/F5DzlDG3yiB1pCGVlAi+haVi0fBVQvRS3hx70eD2p4HsDmZKo8oc/vzgE/rgMhdwW
         FWCzVTf/hVfj8Wziyveaxr0+Wit/P79l64D8a1O2wLKp09F7Hc1HPGcJJe0it2rr5YnE
         vJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        fh=BMQKEzfcNbX2M2t2wyx3n7ZPXlQ/bgXsA8oZPGhUxU0=;
        b=bci6aD3ltsSqklAN/z9EKb2IVGgLl3z4KZPFRLGhACYWmfz0QeDeZGICrlcRBpb4a2
         H2Uwi1H/DwxGMRUhP6hfGfwcUTl6yTvkXsyZXG48s1f0lVmhZ8hK5Mg0OGO9jE/vnE6m
         yE4nyMkREkEOYJIdAms/TBlEk+QmLU99vRDRIXaqg1NTkIv9amMh5W6+pPh8B2SMMTvw
         GnoGbzjtt/n1fhMFoxxwoA5v7ta7NyWGEWd/VBG3+rwvxeHrJePw+x1xndaUIDUd5qed
         Ktg5YMvhDF6molDO4y4/hHSLh+2NB3QLb9IMingdHGd/pBNjGPG/IG0uQ91LzarGfBtF
         8ZJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783776337; x=1784381137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=gkndY5IZDHC+dwtgqKD9ddEnfLx25HGWR9ArowyK2GxOnjkjqbAWVn7OFIIyQj4nvo
         MOGjX5mli6Evehco5bzOS9XR0BIdODbDPbA93u6SkQll4ERihG92gzGJ/kIpzBNHK3om
         ydU6Ukb2DimVKRLS9wXXNLeHZeKbOdu2xNVOtAeUv8xsLlg/gFUiCXWM5Sw8PXco+XZJ
         d1PWyFdCOax0NT6LX9RB/Pge1yRRuNeAblfyNxA/a9+GiO5JV9FxwAZ9DjuyhTsgnscp
         uG+FlMca8j1Eix8DCFnftSlXFBVK1UTeS9+6z7d/MZjhUNWO/GoyRtHpx408Ui6rfiPy
         hFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776337; x=1784381137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=pyrcwPkUOrNS2fSYLSLIQZrU8BbQq0eoneDAycs1eErbGEFTuY42NMH9yDCBPqXJG9
         E/iX1U7VfBkRxCvZ5NC+Nmr6LWYxtsxf0YkvLY9kHMvTZVevLD1NyEIv88kMD1lwLiXJ
         ei+GypOBn9ERq9UtJKAvhdFjx6kIy8XJQN2d7LPyAvlxIrhXDEhBal2flXAS8nLBhRHz
         g5+URgmT4LprdHJTm3aYwF2eqAAFNck/Zu4llFAPW3ugjoP1xRmdPre8aspMRRTTXqCs
         njOzpiP3/CFeFhKvCWorJMwL1tvRi+Yehb1Oz2NlxZFzECBK7tfN0CtzLH53+7k3Jm6w
         IrIA==
X-Forwarded-Encrypted: i=1; AHgh+RogtmlLiIHeS6WbI0e4w8SmlN20+INAoVnwrpuo7vu+EvWP2hRTUNMHTczlhcDpnJSPozrXC+3XpUh3uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRIZVYFwO9CZRb9wKR3JUPPu0AjKg/0Q1418tfjKTMs3W6XiGY
	y5asJidaSQBoh3vnLm19hDqBp5POnFgzxNOyViq3X+jHYajY3Cujfs0n/1ALX5kB4p2ioB2L5Qd
	KkX+tT5cQQETrMvY/MqbYoo0ufZ2kpHQ=
X-Gm-Gg: AfdE7cnhKGmDonyLnEyc31pvM7rlORbQoA6u8b6w5FO8dOBnBVhVSvgRRgC7C/FR4mf
	5ojY/p0vnnwmSm/5WDNyEUdONKl168GuQsObumvKeJyXnLx4qc0fT5Zl3Wwc9rVAZROWfyWLJmI
	qUemEnaSMGSnXpOnxyk12f1c5v1yfw+diI5bHlDtKvV5wxTrwwGaw9PWwIWKudaaQG/YUvBiwIb
	nBKRDDmS7D8QnX0SQzsG1p0ec4N30WDJhGiGoNtd3YQqpr2ga9CIZsMYnixOvsJLoGw/T5kySmN
	dyS7WqW7VEhiEt5//sqcJZfwsAPTImJpQGlOrHizaRsKcbkB/mw52j0dOPVwWshXA+JW/sVsE93
	23Ko6QvJM3pjY
X-Received: by 2002:a17:90b:3e48:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-38dc7849860mr2213763a91.8.1783776337508; Sat, 11 Jul 2026
 06:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710230428.865447-1-ttabi@nvidia.com> <20260710230428.865447-2-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-2-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 15:25:25 +0200
X-Gm-Features: AUfX_mzK6nA89X8Ey2KmSvtSrtpGimxdsinkTI-BJ3XZkqZKpbmpJcngPawWU44
Message-ID: <CANiq72nENzJejiO3pmV9FhRA+H+zvCtfzWY0=wbTERToceiu3g@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	Gary Guo <gary@garyguo.net>, nova-gpu@lists.linux.dev, 
	Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 1:05=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +    /// Creates a new [`Vec`] with `n` zero-initialized elements.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag.

This may be obvious since we pass `flags` and the function only does
this, but the sentence (here and in the commit message) sounds a bit
like only that flag is used.

Cheers,
Miguel
