Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D0272803
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636274; cv=pass; b=cYGySgFVkndzBR5mkCUtO6MJebnQg71ry7rgUTWrMR0PEiyUkI7RLSJHxyMh1dx8Ms1Chuh+/Uwqa2BEYQcS0LFha0TuirV1TVjM/WDgxsOAzYFcKwTUdaE/15aBqAiFtamceShgjikVCY/lcth0iZw4HS8PjxLSzqWPSkteoik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636274; c=relaxed/simple;
	bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3Lcs7S4MsiVRxVRojff+Fw1jSzr9UkKle9Ig5fS1qF/dSmJDK8DDklWC6pYd5Dd79V9VS+oguG3QIQ6teBOzas8Giey1iH1XGkdxQ1iHX5D2qNRR6dt/KdAjBsJGp3Y+GkkmELXtc7zzQ1xr71Qd7D03G1D93Lla05FnM/Kcls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIZkNvkl; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIZkNvkl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so145266a91.3
        for <driver-core@lists.linux.dev>; Sat, 05 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636272; cv=none;
        d=google.com; s=arc-20260327;
        b=SJ2vARaiKfozuVPrehRMBFANM7a8rvz+5PQn8ZvUsQ/a2wG/ApxyZfX4H9YcMWomMy
         t40GmYB9dJSzKRxkdgDlDruZoj+/wkSlFOE2U3e53MYMJkCoCIxKL8wgNf7Yfdy62E/L
         dpLXkjnm96kc692LnHCRiZPZlDBCn24AeC5cAIwOyy5rIBceHAfTx1yfYjjHvQOf6LUF
         GncBWjoESiVHyuYrXBeShUZCiMbGZUf90QaNwS/RN6Xyy3iqzgkF8H+adFAfruQINHIj
         PeLRiZEM7ZGmrrCdg2fECme3P/2D2BemfGQpduzRkQks72uBC7xmCejkplqE9yh7xqZh
         XGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        fh=K2TxeSwUQvH6DQKKS0ArmfLPbl0wD4mCxYKeTrelbPY=;
        b=dEreTAZUYqL0Gp7FxNSMzCMIoZpV5Qg0H6rsriYoSztMNpbLq3G+KsNHrAtPa0ZTa6
         9UPrB/hu0GiAFyv20qI5LU0DOe8gaTQFASHTnCkcdEBKyPai1CwMoY7p9/PJP4m9QgEN
         L6TtQ86EOxemdk5/51XZ9CBsZdYXeuJXbc6MojivtXAou0SPnH+89J/z1fmkDUtNR0MM
         iilckNE1B+9ar7ZgdP09KSyUmrPjUufB9ZX1CQCfRnNrSOgJwDGSFh3YwEBnPlG/ruAa
         dwAlOblZAbU6o5Q63i7x5qUk0qyp17w87TR+kQ2yuEMrS4g6mlbwjhxTxuv5jNQF9RCb
         3opg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636272; x=1789241072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=UIZkNvklRXOiw9dBGugRwIbwgf5SP2T08jNMCga2H4iJTEJuNE1XEVUxyNleTcfsq6
         ofU889c73wtHaUm0xuIK0kw5IqopXJnqKFG5qfxFqM2k8xK4VI1CKIB4LhMy2c28zzi8
         4nvuQkSFZjLGJeVhTEYRK8Kq2Ff3fc+QMiVbklcjOqWyjaJn866RagzIWH91YZ8c2oN0
         jhyAQYqr20gBvWzLonPONI99k2LsmXR2g1KCVy8/An5VjOxYhFl85MzAxXK6s8Arx7b+
         RwNqWmEGHv/gIb1GfiycTwKqu/kscfKB6U/jjQXglCDoQv1jOhk+irXDnoddp/dOo7iJ
         cltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636272; x=1789241072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=q9as1lps/y+M6gpfsckn09/abZADXE/BnSjCgNOGINq8i1aiXLVQNfT7Y+9EyipBV1
         DfNpEPZ8So7J31Li05f/IL/pDUfWyZYOGhJB7pMcGJBNz5m2svZyK/zoidHWKXjuB9ag
         hAb+/EFdP83KLIvMgPlal1pmnYSow1l9k4vyppPrRJ6vQeChx3g5eL4d53NK7tW85iJI
         oX3kzzBQIl9jBPpDrkuPSB30QqOBEm/pQMxBCPlSIIAPs61tjyNCkF31yGb7hnsTYtcL
         e+s6aDnIO98OHipu4dZZQGGcscKe1Urx6KY7LohZoZ5G9ktaUBJJR1nfPuBbUJ+KrHe8
         3IKA==
X-Forwarded-Encrypted: i=1; AKwUvByokyfjTtt5wZBQh6jAncFd79VwEXRkFzhDnBZn/Xxca+BbswI+9+PMtg08R3MtHaR1NVToyPk9X8LgDg==@lists.linux.dev
X-Gm-Message-State: AFuF++mFjQfxYPBeZVLqXMz7a6GRgmNLqII7iMO2iGU8qwNWTan7nC/d
	EsAMGqncl+WdODlkwivW4UOMN2OCNoB9EEMnfYSjbPEmnYBe8KF5Ta3cF7v0FKATOetzeGiGHAB
	QL3Bru0+2pkd9upghOpzEyqNs5245JHM=
X-Gm-Gg: AYBFou3QwLmcJZzweHt/b1SY0OZuXCN961ztEEH+Z1+hwW+JfTELHkhkXR/pB2Q114z
	VtoI7o4J1MBwKZZnA/bQZj5WCVvS+kYI8wXAlHPz9f6Zp2VabuYBfk0ofC5mQkuYHNIPCO9YDHo
	3GUZLsnco43X2KrkLyine7e/5+nEgXKQ0nZu6HNQI2vA7DGvFzwyR3qV48Zn1pcW+aQziPSLZ0h
	MpsQt5l6uvcdypKGvwKa4hP35QFvvaHbAi5u52FXEfczDdbv2ItcxouVhlOvQj+fbyQskT7BzpP
	BYiCSLSicKc9S3bcEoKJcn3RJ2cUjGPWAoJF54kd5LS6Iuk9NznUPbbyfDrhht+YYNPC2peyY7m
	5bA8oVzeUlFGI75CiT5Dirh5Bfc/VFCWUFeiKhYpcCwpY0jMXaHMF1JKQkLGB
X-Received: by 2002:a17:902:ce90:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2db2776adbbmr63554785ad.2.1788636272311; Sat, 05 Sep 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260903192248.2248560-1-dakr@kernel.org> <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
In-Reply-To: <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:24:19 +0200
X-Gm-Features: AcwNN1VrVIX1rn-ymHE6KZVlOZK2RCfm_y-i_dbObCbOpleHp8K2ryo0MaspaGI
Message-ID: <CANiq72m1ZxFtQjm4fUAt6Y1MFE=ww6jx+dEg3F4Bqbki=ndO=g@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] rust: io: support register projections and
 remove relative registers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Miguel, Boqun: Please let me know if you are fine with the two
> rust/kernel/mem.rs patches.

I see you fixed a few nits -- I pointed a few others in a couple replies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

It is nice to get a slice of the future of the standard library a bit soone=
r :)

Thanks!

Cheers,
Miguel
