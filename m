Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCD224F3
	for <driver-core@lists.linux.dev>; Sat, 16 May 2026 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963731; cv=pass; b=atCZQMaKemZbnTDBnVAr4lqjDjoUFQQvqtrm1jZFMTY3HGjsF/fPZJIseI1yVq/UMf4ocfFjNG3aQ904Lsqo544bNy4mJT9MqPdxzTAF7Fy0Vlw/X1NHkxo9FUQa7nhEiMNaPadR/+oC83628OLMgIR+DHeQsfZItC2Lg7CFdzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963731; c=relaxed/simple;
	bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyoAOVn8UTtitlLTvIqjw/t9jMsEkt7UUtD7RtK0TkPtpefKJWAIXtvVUrE77CXtHPNiWRJiR+D6/GzQJCMqo3QFGIUdrXq/DUb5S3Y1tnMJ1QQ7YIcZa/XRzlYZaIkM/Qg0ITeF7Mbc5DQ/e1rB9+RBAbJAb7G9nRh4BlkP4Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+s1ohvw; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+s1ohvw"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-303bbf3f16dso15007eec.3
        for <driver-core@lists.linux.dev>; Sat, 16 May 2026 13:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778963730; cv=none;
        d=google.com; s=arc-20240605;
        b=DlgWHDdQzCfOE7fhkdYaReRzEtbb103z0+ZJQo5SswvvDmj6tTDYXXWD+gfDp8CK05
         ClHxqR8DTma9daJhGDmaaqw9SXxQm13+7Ae7wde9sa7ifC43HD6vDu/i5jjjsN3I9H1Q
         6ZZQsVSO8WV8LssxOcbncvrGPeFXneApnpuiSv1eBVH/A619AH0JdT1HGjX2GpXXe2Ys
         Obl6pHGkRmsNQDgEcL+2bn7vIIDBQf87ZDfW2+ymx5bpwlnT/21DiVqviKwWjdrdenOg
         PDqKaj1H9z9D6ApqYo8581+C6I02BR+iI0qXGaSwGZ1dBIqZkc6NNeKZ4x33D3gHAlHa
         FSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        fh=exY5a/DgmP7H7OGdBWWIgx+1IK6jAl2pgIVgoCS9RwI=;
        b=OGMNTgaoBbMk77uxjtw88XAzEcGdcx/fILsL9H6Eacmi6KmsqZG/vxAOSEBv4iVarc
         NQ6o2HO7pFc5rFwS5y+clcYpRYriGq0l4CZCc/mRpznkhMQHMk5CXKNVs/h4vu+rYNQP
         qy95gOcdTdo9guQWbwqE7Hmrk1VKgj3Cyz+MnqpXn2Abfl+MNyK2qJ46zO8GIOqTWnIi
         Okd24IoVzTrEPW0vWriYrAySpBQEc2U+IuIKJPWbBKcByr13ke0ZiG8HAasLra8r8Y3+
         CZ+T5rhPdzT6bOeHw4Tqr9VoWGAyEY12ook6xl+infJmCjhUKOBL3XLhzwkh+kepoaUG
         z01w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778963730; x=1779568530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        b=Z+s1ohvwZ7UnRDH0fGX0ekUgrEb/Fl8WmPz/Hi/UCgx6ZtUFRykiA38CsrXcFKmVeN
         5JCtOoHDTlkG0GNg8Dawh1qgF8H/HUgg8c3i0+AldpEJpEYnHifteIyV0sdvr9fn2si7
         4ocr82aQuyx7+6tN1BAIQJWbQZ4wf+KrvbpYGlQJqsVWAIaFLxYObyyLXw8fna8MLFP5
         OjbzKyXR8DH3RDyOIiuUKa5HVOWfE/yUM+DDK5YBmVa7UA84fVvLMPgUMsz9zfJJwY80
         uuXrj6divVqmMxT1TiOnh2yhh3UoqmgdvA2eRKJtllxR5chbWbji4jd5dMGhHfmA8HLG
         hngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778963730; x=1779568530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        b=fquaUG+zY3HY0zPQrCU5nv9EACCaMmamTn6INFfpcIOrPsxQ6RDiYvoKANlzS+NoHJ
         /L6L9sqZTI+72M0i35OUOI1exvcHtjpzo2uZV9k1Hzxf2S8LtG9wExuQ8FmTy4b6Y19y
         ZKyHohzoQemUgpItFIXyfDPfm71MQH/IoFqOwgMB+PhIn7JtmJW4iiQkHveDJK2bAZiI
         7nzxKF0NNNt0W0gR27AO9Fk3i/3dccubaeplJIJiDdPIjq/qtzl2EKrsdhCLV9kv/M1n
         4QDnIK2eTaVfk4hacDvRMB/HRgclQdy7JiQ29oxNU3/fbOsH+S2nuL0iO8YRvcUisIbS
         +5Cg==
X-Forwarded-Encrypted: i=1; AFNElJ8zMP6YGhF6IFcSjUNFFrQ8LW8FmjtcacpzNc9ZvjiOqtBgXOOCRtq7o8+mHTIfQKWC8RVyCMOmE6m73A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRxVjRdnnVJoOz7F1Ngfr636uacHXuiJKenHeNkfHTSl2RirAh
	ngLODbj2AuqtMVxziqOHpKX4ihhosaXXwkbvrmAifsqFQe1WCTD7yFl/3pi26C00bPtDR2AiJN3
	rhX9r8hQVNTu3MFFIjZvmiSwlxuxbsec=
X-Gm-Gg: Acq92OFA181kk5hSeuN2LBjaZSum4Gl0la7tWs3Uio/bpMeu3OndST83YrU1dZkfCzN
	oeg289mNz576jyZ3IcGBYsD43qWTjqHqqSbebCIv1Q7p3nUKZHDo4v1PrcI33F2yYWZRC98gbVn
	Z1i77qbCS+VMZt4AOLi3VWVJgGf5AxRfvJCsJJLfjlHiAlo2kzCcRfFIhm1KKA8YU5l/CmwA10b
	jhZFiAiUB2tRVChrmNkwEl5QyYYExemrYCO5CixHU2HF3+rci96t7iX9YGY/QsY31APfyHpDy41
	t+wzMO9XaoMu7cWe+soSrsCjuofgH81hDQ+0DyaKk4AlOVd2Id7QvTMuCtQBKZPq+X9D9ZAYm7/
	6LB7BzCZoloiJnDyw/ogutEg=
X-Received: by 2002:a05:7301:644b:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30398652434mr2017744eec.5.1778963729561; Sat, 16 May 2026
 13:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514150957.3501924-1-beata.michalska@arm.com>
In-Reply-To: <20260514150957.3501924-1-beata.michalska@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 May 2026 22:35:16 +0200
X-Gm-Features: AVHnY4KpNKN-noX8erOoZUiIm6VUAJi1ESwJPjMqr1-JwtwRZb1wnwHRagz7hhA
Message-ID: <CANiq72kQ5=4-5whthbyTZ1VrdwHoZjUOKY8h3MCTRFUymBKD1A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Rust: add runtime PM support
To: Beata Michalska <beata.michalska@arm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 5:10=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> This series adds initial runtime PM support for Rust drivers.

Cc'ing the linux-pm list as well.

Cheers,
Miguel
