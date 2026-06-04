Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D3409632
	for <driver-core@lists.linux.dev>; Thu,  4 Jun 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571435; cv=pass; b=El90zMoy0X5PpcxsTYeti2r4Xti6Daiq40KMGs2K+rvrA9PdnB/MmYeSPYO4qPA1kdjow3UcooCqkTaTHLkh34eXREiXJk5k0nU2G5JEpLHhs245Q7JWGAaMkxiUm699vTZxmjEuqijMonR57yieb+K6T/yR/8w1y24R/r/IZlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571435; c=relaxed/simple;
	bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apSqJC74jqdlX/S99yjvN3mwUwHHYqm08HQGNfVlTQAR8gxVH+4C2ldzE8s2d2dkHwn2MTAPSd1ElyoZkzA5biWCcq71JPE/MinUDPaq8nSqInby7iZJ1iNI1geCOJhtd3siuq2SmosZakCIXhURKlB53tAaL2BIp83wHl/y8r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnh7j8UP; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnh7j8UP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso7056495e9.3
        for <driver-core@lists.linux.dev>; Thu, 04 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780571432; cv=none;
        d=google.com; s=arc-20240605;
        b=NLF+ki6C5f0R3w/QtOzSJgAn4VX42FwzYZmG+hDDLT/wINFcgClvma4mkDPBdJ1BHq
         s4ftoAn6e/yN1AzAQeZYegFs92i0tZvtmQgpyVjaINqp4F3DGUYzxBgPfJ/m94vNlJOJ
         il4LhEvWUqy5P5ycII2GFkl3tMavCXmnwHXCQYefXpmFQdTt8hHi4QD1AzTSxYSwbW/I
         I8PFqEIIIMHrNbcMxaza+TpoICLztXi9DTIQIf8lAZQvqImL/modM8+yjIkk9kupigtY
         KdUzkJQM2h7MGc48HC7Ly3nLhZEhO2zYzHQcr43pJOmnwzGblg/oZJrkHCLNRtz8wdTC
         ySBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        fh=3tFqAKZCZRERGLn7Q/5zgUgQ29gk5cIEevrkqBFCLpo=;
        b=d8xYi50109UhKK7cJaJtqASvWSrcQ1jvdpFpJ1Tm6DSTzQ4bUll+CaJ0TczBE8NxHA
         Kpci89SN1suVjkyG/Kn8uisqjb/mxEJRsDWB2E5UbIsfQvBZeEH6MzfqqMR5dws6ooof
         Jru8/US9EWzu41xlDcp92RBbkl9jjAZsICa3bYuHGK1MN/MQXW9as2NYUGlyvG71jir6
         HsLgiF4f95jDDO6FsO8hr4C5JzaVShI8/hsWnPNA1ML/14+BD3zQtAt6offZwOynADoL
         2miTRgBlVWLqfkzlkd/0BP30LCqiz6OvIRfXqWj6mUPxi1uz/6pBbjzVeNtnXblCNbHs
         ipPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571432; x=1781176232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=vnh7j8UPGeGFbbktq/h9ySPsOVBE6NrW5Bm6OwDOaAaPT9M4hMozewBXXFedjlnJ0J
         BjReBva4JCru232t8Jn1C7cjMdbVSu8mtCnvxrF6xgcnsFP36UTSjntHvo0FOe5Ywtz+
         nD8TG8y9Lxm60FlBFfa9t/FMOCWPQ0aOzbre6WqSvDwnY7Thfj5ITCDWUX2nCvWm+oQ1
         bOheq0Y5DznCAmC4IvwX2B/6aQHyLIQMHhkdQCvc6U1Y5sC9vprQIQKkVkcEru71DyQN
         kXrnVN9gbfUA/1GczMIeWlEmVKnEfbZ+tElBJIdnI2JEIrM6Xb5TkniDLk5taCxRuy4U
         iXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571432; x=1781176232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=kJxookXSw0+qsgapq0CqV+xWFaMw8gBO/FolF3wFFVg06hqBaqP8eVGARVa7Ap1iVE
         HGwnjIpo1/Fx12bmBsx4G+UJLQtddEmtRpC8fq7xiGiihswNim/989EKPTN6H0dhPHUf
         CfkaIPh7WGdzl9/15uNFJHKVD/cBNN38QsYTnL0XA9j+zXo/z+cFYjYU28owpMjiatgT
         5BCuYxQ36uye1eXSlROV0h8OHvrwpHpPGdkV4khdkhvE57wro8g187htgW8ILZnkuoOY
         ltEzRpF25n5Q/4W8JCqTiqIG/wVgVq2IFMl1qopSQ5L03MZfjuNCFPdnj7LzpAQLRi03
         uKtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uHpfxrpz67Pcy9HTtDkCGvcdAax75hmVmzZZyf/9NRhg2wkw9WDkfJFNNBO14znfOWpmd8KElPsZOtg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6ICz7l2lKVcmUGQzWaFTa8vYNEiOC15B+WRRj0sTGxoQ1t9ek
	UjzZWAJ32OcwMa7/wAcJzJSKDptmNqdx7ak2sy2zDDjP0Fd14X7FhlGqjXQCHlxCGm7NFrXue6k
	jAlV9mZAFYgvJilkqPOY4ksXUaq681s9RIwngmXHE
X-Gm-Gg: Acq92OHU/dxMTk+cLtBbh6/U3apj04nHqPGnIT1+TyzoPIYE20zmfQdfNa+YvgetEpR
	5yBoLzjkXaLGPbbdMbOeiGAvxNqtNs7Tr1iUmhKiQqsyDrbPRxw8ljbftxvUVtwJAI9nUiAYI43
	68ydW9dPGDo1C17PSWAspdtYbW0A1QQoJbo1hCHQncG9G+ywFF7jUQLlatXoN+gkGqh2P5arzov
	La5Ihe52KEPGFQ1my3wAZZJ+OHRbbwbeJimgJM5p+wGoJAQXrTv0oh9Vcg/o5JubTnQiAIL1Dqz
	j5PcqjaEI03Rkru/Y69HmdeTHHdG+Znl+k3KqiLwHKcUPfsW/Xmqm4mcJ1dn3Fc5sB/MsOh2XQu
	5qPY=
X-Received: by 2002:a05:600c:4fc6:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-490b5e95f44mr117890035e9.14.1780571431900; Thu, 04 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jun 2026 13:10:20 +0200
X-Gm-Features: AVHnY4KT0fbb0zrOV-n0xIWvnd6M6oIkQFpOjNPef2gzJpQvDH0c138r3Ikq7Iw
Message-ID: <CAH5fLgh8L0gshrfaHWxdAqQMtXY5XEm=TT2cx6C8W519Pj3+Jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
