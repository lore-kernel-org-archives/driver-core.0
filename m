Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1593469FC
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480383; cv=pass; b=P2gq0Arp5V4lakHrnqD/9Vn+Sxt9yAJOUWcqmlmgIU/1vxJI+VVAd+cgs+z/mZyZEsde0lgsFB1hkTvmBajFKJTR+4Cq3Mpu7q0aLjJtJ0F9jimzOEjnrlk0cFXRZlLPnUe+gZWSVugK9xXypTuzB6zCW0oxXFzeb9RDBjFaJhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480383; c=relaxed/simple;
	bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbERnLClxch1xZQTvW90dSX/wjL1buglF35wn7xuj5XDx8sgwP6O/5IhnE9MxQj6uAFPvK3Ng1pYNz8x2fMqmS59Pn2XWBcten8ZQtovmGtnOLvJaXfD+ye51v1amvvS0LPZD/s5ooXYgVlVzo1W/oy/NV34w1bs4j+XiUrvDTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpyNAIGn; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpyNAIGn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e2061eed9so94263b3a.2
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 23:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785480380; cv=none;
        d=google.com; s=arc-20260327;
        b=U24nJNxUzC+TlkTV7GeAZ1mxo4MVE1Cca2XkJbSODNu63uaw5eLthJstu+wG+4jd79
         +MceaRVQAtd48WnqS50StOB80OS/d5tOE6PdtfXxns9iJ8hYitd/17DjU/yBYve20xpZ
         3gV6OeFWnZ6AtxBLh7MvDLuoV7k1G6FnbWJ764xTIJ3p7ZGPGesJ6LnjaHYbrJ5FCcmR
         CUZjt453GLDV1u1/9zGpQAONistzPdkuar6fG/nqIy/l6TShbIxT2fEfTupQ6ESeEnRL
         LApk5Zr7vaDnXHDVl8hLzs6gTyLCTM/VpUhctElxdkvd5XlfY//H0fq1r5ZcfBzTVTWg
         SsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        fh=ZV2XCkNcjPyyuTECrdkWKvAdlXGCxjz5f8B71TbU7rM=;
        b=kSRWg7w23ZbL+COBbPiQIivFnt5hxU/LsoD6nTwstxYRsnuYbI9iWNz+tVgEC9mfla
         sXz0s2DBpEHnl6Rqm6tHA49QatSDFVrGqly1jQmNTAJwsMCDxJ2smMAXP4PwuYsAMXsq
         EmB5eNhwL4g1VfDXTXcydUVZmgciv6BD1vEu0qU8HYtzlPIpSrz2BZo1XKGCk7Nh8dpE
         Rne1YERkKtI9q60N5fzi5EOZm24FhsDQwmjfXXoxe1VVpMdeAGbOpJSuQ10Kelb9zgez
         ItP49ZsiwHUL3kkbRE5IdeFzuqkP9Qk/ca0QudFvVoeytkcmRpXbXc5Y/JbgGYjvfK1Z
         RTlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480380; x=1786085180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=DpyNAIGnL3HHQWCY3lq2mBt+B7PwKaJ2Fe9UKhRYySc6IUC0fXQyJLnA29tDZQQeDC
         ovZcN2chXdGH6Py0JhyerFsnblc7ZzgD2AOk7OYkXjZlPw5AR2n+U7gi58XNzch5SDeo
         iAnCh9IMLJ7ZD4BXZwg9ND8n1RvBySBUmRxsG8c61Jj+Qqg/cwrD8NdqXDcA9P3qJfvw
         AhmJ4Mw81uYuwgd3Le7FAll3fQxYpf0DDaR1S5bKDVnM2z/lpMbYTQu71rm0J+kDG50O
         JR4bfmj2pPPKTf99jRwOrNM7Bp/QlvDsHoZPTQpCe0rbAd6xYcptGbpPtIyC2pNcvUaB
         T9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480380; x=1786085180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=LSrBtLZs/E3djjH2YwMRJAoP2szgsQ8nzKlOEpyMGxHg4Ty68To13v8PHem1o30AOF
         AlKyjSjpUND9L7tAO1wYoOn5OxaiqtOPk19UNvEVzoChZhIMXosIVqVqCWSyg3G9Y/x5
         U1HEdpPt0oLwLrqlf2BN7LHgM5Qo6JBv241NPp3YxG/KAJZHIxrMe1kidWmtNExD0+Sw
         yz2ElimOR4fFmfwotExZD9JopJW3b8CaWn7L938fqVteHdOChXOWCiAPHPw1IQ7PnjOf
         I92a1lJ8eM2cGbzjBUWH3lPIBnXGr8TvXDDtM74kOBqjX2kyn1kUWwBx7vJYYkEyDNGQ
         Z4bA==
X-Forwarded-Encrypted: i=1; AHgh+RrZ8Ih+4tltAm8UiNM7dcRAQQNNppkAT/CDXHzUbetkzg2GU6bxRVkft834Bf2s51OdnBVeIWkRV7z9+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmhod/hgWpyVQJ9PSTOhOp2CFvIdciASoQURPSJNodcv00VR/t
	1aurkSbt7o2JNWRoQt1opW6nAxUYULGZmPGHc/6AxeRgmos8+ln50HHmsPadg8vu+0Q7fy4c5CC
	x03MrRyoSecl4yi9yTBkWYgvQS3eRVko=
X-Gm-Gg: AR+sD13ANeEYsmp0FxYkKICGGbDt2nq1kthjAnU5SinC8ZMYx7T06PBsGdObBVetv5h
	/bm8UpH4QkpcewHZL5fDm1UCVfNvPxvRlCeRZDWS3+3DggZnv+ppXxtFFLI+HVxeRNHxXxl34bD
	FqLrQEJoC34aS+Dy4g++RooqiSrqkf9e4+O3TfdK/LirzTOYLmjZ1U+wFA91Z4kwMq7iRvUf4Ev
	xPos26lAWHQKchekqrIJFLOqyjxHf/1ITbYOUXNCUK6XAJBjOqt5fN2F+OqX72RzkGwYoMtEtwx
	/ad+9rzwk9qCTCC9LDhYY14XCEZkl6+/bXq9WPho7A4FSafcWH78ZUo+3q++xB7XqgMmoW4oCtB
	XOJsYt7pkxS74VSLagU4aI27pJz4PqnmbGGX0V2xp084kMtT4sbzydmjdNOpf
X-Received: by 2002:a17:902:ce08:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2d046b459b3mr15748155ad.0.1785480380480; Thu, 30 Jul 2026
 23:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
In-Reply-To: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:46:07 +0200
X-Gm-Features: AUfX_my5gmBTyBxP6uEcBbaVDtTCrtAGlQbEryzjfR6FoeX2UBUc_vHFPgNtGlo
Message-ID: <CANiq72m59O-ruHUvUcZC7yCvu0KV0w_m5vMO4e0rxyHdRmihJw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 4:11=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> base-commit: b7e5ac83cb16f7ffd11dc23736f84276602100ed

Was this old tag used for some reason?

> prerequisite-change-id: 20260519-miscdev-use-format-9ab7e83b1c11:v3
> prerequisite-patch-id: 405b334ff0d48ad350014f05a2321bdbaa025400
> prerequisite-patch-id: 604b631c81d5423f4ebb2e12ba2d22e9ce371bfc
> prerequisite-patch-id: cb550d94cefe01920e0d3ced2b2bcbecd76f3907
> prerequisite-patch-id: 3bc830839742591460cb86d9472c04f4686dc600
> prerequisite-patch-id: 571058244bc8c7088638d2e3225713011246c7e9
> prerequisite-patch-id: 347c5a3c6dbef9832bfce8419fc23e6e08ba477f
> prerequisite-patch-id: 3e202d988b56b88446f7535e90d3f00cf5f15701

Are all these actually needed? Some seem unrelated (some were already
applied too). The only one that seems needed has Andreas' Acked-by, so
I guess it is fine.

(By the way, I will use this second message to take this chance to
move the modules maintainers in the To: in case it helps, since I
didn't do it in my previous message)

Thanks!

Cheers,
Miguel
