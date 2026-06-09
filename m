Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB13D34B3
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002005; cv=pass; b=YUZzZ5mGEuC6uGZnKXf8Zie/ZTtBjgQg9AGFKJ7h4bgh6euujQltnyYqF4qgvpWcUF74FW0os0kwpPSO7ty4WWeprHFRT4IAPmP/WN/+6kT1YJsyy5H48MUu5x5JNIpcucLhfGpnLLTneoKz9SaSWhL2mQI/y1CKcvCO0lJ86jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002005; c=relaxed/simple;
	bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVICeL/RNlnGV6r1YM+0K9ThoUIRZhjkEr2pgnmX8siCEWgxZPMlfMdHg4L8JFjqXGmfuhP/2nh01n5UXjuQnKHuv9PD/uANRjavUEgrymkZ9KqIYTFrsB4UF58AwFGzUKnYW7uhKPC2h155PBNJmBOXlkpjb0xrlAJ82vrpE84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBY5Oagm; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBY5Oagm"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dc707bfbso293854eec.2
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 03:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002002; cv=none;
        d=google.com; s=arc-20240605;
        b=A/MTZMRjg5l3VvN8UVp78JvFsTsHTWodgTtwD4F6B7Juuaz1N//NEKlHbADew5aCfg
         C/ggMuIY/VZzmnrpw9FAkv7KoH2IYUSBC+Grrirr3bwp0t+niIAJOB6dW0pIZn6CCk2g
         XJ/QRoqYmZovgQz0i0zW6dd3S6K+9fQ7aNiV85CCK6sfuARoSkd8stQS4+tMftH5dbmt
         dVo8qJWDEPLQMJqWnNYM5urLqS+OVsHGUF+ibXMYqS4RQeSWpD0QRaGht9IEn5+piLaM
         FhYTeGGBJDO0U2Tw57a/DA2MiUM9OAZjGIbt4hEBNkiAvYVX20wnCrK9viKIgVr1kx7d
         vqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        fh=REuhWBOg2N3DcV723rgtoJhEr0ZSULiBKOBUAwe/mrU=;
        b=LnXgvmLiySKNWg4UBemLiOlNs8i+obhtPe/1cAfBhr1Zg3zFpvFGVm8tEH/u/wIm6z
         d50toxnvcpGuM5ln/tdZLCIbEvZtf6WPlIwiBmlU36eXeWkB08w90nehzpf1PpOcVVYP
         co3A/ruSMdsZGdtvGzivUr3ZCYVsKeaDlxpmYF9Zgq9HfJ2JUkhpfA99tsWAjQglzPpx
         dIHbEEIc8zztfBFzdhLba0B/safM4we+xJelkmNesYiTbL6Xxiivyq8kCB7WnIcl7Owv
         YJ0YB/2JSrPpSEcg5QFHPNRdeMxuh/2WRiKGR2zUlbl5jYLXye7efr+PCIGbRI8krvHi
         dTaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002002; x=1781606802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=YBY5Oagmlr7ZCwzZl9Iukfq1FGkTyNaZuAlijtxkbNO9IC4ADvFU8iNoY3c2Ua/WKn
         2eDIi8R6TygcMETjkAHd5RboNFqAtOlFf4MLQwx+2THl8Ls61JED5JK4zuC9ni1bvHzU
         WzfBK/ukhmoiQ5FB3721T5DxZRtn+gT/vYn2eRWN0b0GLGENz3viPl860xrXPBa8B5Wo
         Ambz2/IR05ekle0G/VGvhhXBzqJn7aNMbtSY8+3+YYe+OkwSHurrTj2X1kFkbZwjejuk
         6j/lN3ewdIwjXmsi72XAwsdid0xDAM0VUV6xx9vqQqy56Goxqjr/3ONXXkEpdxwgRL7N
         5Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002002; x=1781606802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=pWg3d9i80cf/k9gfgBs36IOeBsMiajvWn9jAeiQwkwdCvCFzSswqNVjkypKPGcx5TM
         39NrKZDtdLc6+l6y90MIKb1Xd1hIzKmu9XIOap13kl2soQvkUcoN+o2PYhnGK5tOuzn6
         y2NDDmTR3VqtKzSGPdfmxpSUef0VQGKablw+HQhToaikzGlhf4dY5noJQ1Q9wRoHqgMm
         4MQ40OylVqI/beul+BIOYInKqI+6QJP8AoVvXObnJMyC+drW4CBz/8AKz1OW/ccL800/
         c+jEwdctgoxrcmrzgWy/kWqxdyDH3vjuk170L9jJdGmkzZIFmqjTwF3ddEfhmt2sb4T9
         ZdlQ==
X-Forwarded-Encrypted: i=1; AFNElJ88NBbb88lybGKt/0r/n3CuPdKEryZ9ZXGVfIYKhYodG3amqRTHZTZZMNvCv/jBOxSLnFq0fKb6JGy5ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YztTClVTuFnrX6JI/DszywsIhQETv1um9aEEErKWwlhMC/KufYP
	/GU6DBkgeGhfeMgJSagbTJnC0X0kWr/LfULvzZSpeWu+caLY1YC/I/tpBtclH/3IF5DywBeeZ0f
	skv+235dkAazfTPaRcHui1QvYuUt4s+A=
X-Gm-Gg: Acq92OGxNyQzHs3TpBKwYEfryP4lvOJ0WXVgPRvR9HTwaRr8vtzywhthXx9pjwxxuJ/
	NFSPY5wmSyCBFAIDW7lmWyccW1OhHUMCi8N/DAqCUQvnGRiewDnrRFE/U4esMepyJY3ngxU99xs
	zHqagGw1cp+u9tl/S3BFiPIGzeGkDgPdit1oHhVLW5ZA5sxGlOurpm5LInf3SwNm8lu7yW8OyYA
	ZC5lTLfhwg2YTwkUty9gRs1MFarZ0Fk9jTSVysWr1mXiroNWV72w6ho5mcE/qxYi/m13oWFWRmC
	qlBs30/54qDuUh5ypktiuQQouFmH803DhY4xRa0mZoww7xoE8Lv6r7C+Lu4EjzneqEi0BZOkh0y
	VJVykmt97RQ8pvK0oKr/2+w1pOeV7n3hfbA==
X-Received: by 2002:a05:693c:25c1:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-307d5fed73fmr773935eec.3.1781002002406; Tue, 09 Jun 2026
 03:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com> <aibq0WVkvey9C4_W@yury>
In-Reply-To: <aibq0WVkvey9C4_W@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 12:46:30 +0200
X-Gm-Features: AVVi8CcWK268E6b32_9RGqxCdLYA5s3NWf2-go00cNlkmk7E_5xxbpCtVF0SRiA
Message-ID: <CANiq72k_Ge=AgwqNTi8w3CoSX4s6TTbJMe9X0x6MCYXep2oKCw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:16=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Thanks for the work!
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

Given you are the `R:` and it was just a day in next, I decided to
rebase to add the tag.

Thanks for taking a look!

Cheers,
Miguel
