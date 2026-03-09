Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB8389459
	for <driver-core@lists.linux.dev>; Mon,  9 Mar 2026 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096019; cv=pass; b=IlRqnRpsj7lYqRNt8JWiFgKEg6iwQntmSqBn11x6VaPcvd0pzqvrX4zqgc/mek7x2GbthKmYA/DBY+DnVyh/RaXYCuEvTB7SvQbgTD+A5+VEr2lo2nlEh9fIK5wNGeIKtsRRAGBHXCK7HeZwhH5z0Vvy4YR+jLHswQDNZUMMB94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096019; c=relaxed/simple;
	bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOL7eW1+mXF4e5vK1pB/AtGJzjzAHWROTIlBt7Yusd7tUjBw4y5+8X/gZ9mm5Ts3Fa5cWLWGVptOZZ7Cqv5DK1j9+D4PihWUFX63h34qiKSfPTD2GTq354ftNkAL0+MJuj4uBBQN00I0R/uLSWhzAndzpELZnyoLYMeIujju04k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+9pLSqX; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+9pLSqX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124713e4244so739782c88.2
        for <driver-core@lists.linux.dev>; Mon, 09 Mar 2026 15:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773096017; cv=none;
        d=google.com; s=arc-20240605;
        b=IdAwzaBMroSLFyNRMItIinQdsl3EH3lePfPCVicwcI9NT6obvcjfjmsThPeRBDepOa
         BQPXsjI9JPvaF48joNFv6i08y9kMdfsXuzLbBO2V5DGJxOaFmKdgJbDNPmd4VtvnKdOY
         bCVQWEWfs07kyUAKHRL9e5CuHBQRSSVcSJx8bE9gR62dNK43VYni/0RI7I1tITOGEzqP
         t2oly4f24reJSVZvX+cjAxW1IUxoXww/6lwG/djyl4yNlMctUhvHsqzNOuh+94xEOKZ0
         gYLir8nptPcLikjn7Sd6y6pAMmdasHSL8x6aSUIx5it+5huJddvpUsAlx6Xc5kZICZ2I
         WqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        fh=1m5AGCz0LOO+RauvXYrKxjJBlzrh9wtvHTA44a5FTDI=;
        b=ICgivvE5UyqXnqal+jBaHtog/426bFEfETW/CLSSe/5IjrtjNY8gKXjxfiJLW+f509
         J2c4ZsTR/GW8Jk/VSHhxi5nrAqpZfK7AyPC6A9Js6qlzARjWzEo1bEriE0YksuLJNmbR
         /9zBrUshgnpxb9czNkpPbbeCJSwxwA9EIw2ogeJOMqBHR2zRpj8zb00uI3JLHD2v4iP0
         YBi7WuQmCXf7AiY98ltEnn+5mCGwzV8DgKRK5HsJcfYL318pPmu1q6ed0Cf0elcWrxTf
         WX7HLk4/fNMwUFm/Bzw8VvyHMO0bg4hGf0M2wW+vuNk/JnbEjZEbkGKyep1BPnh5mBci
         4cSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773096017; x=1773700817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=P+9pLSqX2dRY+8cb1THu09jTDf/mGExv2Yo2e/GgVtM5RQxV1b2TVhI+WyKJa82b3E
         OdN+48Ks+cHbOpuxRQVpw8lfZ7JFCpkR/lYSkhLOqVdQ6WKOU7JKoL9zaXSaZsCBzvWK
         YVR/FpMba+K5Xjaepy7iIDO8VRg758Mq0bHdj+Ywh4FDRij4/O3ETgW4k47rtSYyIxbC
         CfRsubZFFdokyikf0x+bQNXmztWiePKvW19FIS5n6WKVCx2wu2sA13cub1MvaFbgbGAw
         tMY9Ygz+FKyzkxVUF51E07r6fuO4x/D6q6NtzKs/99Qd4QJwjXOnzXMNOnLKk/O4GTkg
         Zb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773096017; x=1773700817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=CaW6GKHegPQ5H68Nl9I2ArGlBfM7KPfnIBi8D4mWU5Q+ouRAfRb9C3225CVHpV/adg
         z2GeMs/5yZlhM9YrtX0zc8beti2t46/ikJTYpfr+uS+4i0mKz+Ua7L5uBCm4zSZXbt1L
         lo+DIsaCNikjqtX16axUqnWh1IpZRMUhvzEaXZykMk4CeiBrhZNx909WgQ4Uf88L1TNc
         FoWuLqafrea3DrnQ76e0ssT3XGI+ahR/oN9wfhYRk7UV5AJiez9c2s3tVxKVGVP9cR7A
         NM3/cCZ2mY2JxBGFAWarxOa7LR7NscKCXZXrsSAsLA4sHQNMgPw1rbPMRfsEmxSx8nWo
         2acg==
X-Forwarded-Encrypted: i=1; AJvYcCX3kCz17+eirpPR+IcUya8bHt/9eC+nM2XAP95llXefa9wWKdKfkeGYYUohYjZD4D8EvjONyb2txql0NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+dNwsUil9klzl78Q+1aDr1npNePehM9YApUMOmbWivDcTMlxH
	U41MvUsKj47A/CmxKMH1xBFp95UokDsggCj8JE9yp28o1KSwGQYg6/4szYeZVaNdnZymg+IRf7w
	TKbd47ZSOwIlbaj71neAf3aGPCalKzEA=
X-Gm-Gg: ATEYQzzZF4TZu8w94lLD3RCS9Ahqtc7a5S9jJu524c1vVlobivmeSpB3IRA5SENCIE3
	L8HxaGOjwul399dmFVwLYdDTFUjZJ6jM1EA5apEKHIBU9kC0AbC2AB18egdlhLPX/3XxbUpu47I
	ZhSQtNer+f4PdF0YIqcEDtjHO6glLQ0yXQD2UMfFAiT6vY/AfeaVXMWse/xmXN+gpZ8rVVB+nbk
	5Hz6MCkPyFQ3ASJJYMWhnSFdICRJHcRLJqnfWBQv1JqkR1SqfIBLMxsj5leJ2wov/k5p1nt9Zrb
	DbCOF3HbmOVzW2V8BvxiL8XnOsZmqdV+I7ChSVGXJVpHSwMumBgK7PGnR3Crd1XQgDT4Q7uvgh0
	pcOC0o2uP05NDlfbS1xZPM5M=
X-Received: by 2002:a05:7300:148e:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2be4e055899mr2839234eec.3.1773096017354; Mon, 09 Mar 2026
 15:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me> <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
In-Reply-To: <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Mar 2026 23:40:05 +0100
X-Gm-Features: AaiRm51i63wiK9zFG4xNzbBEqTFq-Q0BP2B6Ia2Eg8BVDjn1989Ch1oIVRSK_CU
Message-ID: <CANiq72nRZhJV3d33h++jYp1iEO3a=+pqrzZXf690Bbafs84qbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory allocation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>, tim.kovalenko@proton.me, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 8:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/=
topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570375549
> Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")

`objtool` also complains about it because it doesn't handle certain
instructions, so probably:

Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4phvFwP=
A01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/

Cheers,
Miguel
