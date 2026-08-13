Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441DB375F69
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615460; cv=pass; b=MYezZelghfQyt9W1K1+p7DKfGlTOV0KJwwPL5YUrhJwhW3HqFPW/uG+5lqlhl7bf+3CCpXD7vzxf+yhm2IHQtwGS6QucEzQyzQWaSIeYvOMWluHzeNUM66pNERmJQF4pLUAEkHEshiX0HB+Xj3klPhb0GbZDMnnJjwgeHJ/1ILk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615460; c=relaxed/simple;
	bh=izncAFina5udvh82qhiR9A/Ymo2QgJMmGzIkcJM+wME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPt/JDmOpuphN+WdZ5bULvCYWwAgrywjveQ/15n4mqr/efTmS6RoSggsZpOZtDkhxVHjOFYzzWQqx5eJD3hqN8zMW0zPicgqE1L6/l3fR6/vrA1ndW02N6wgw5ama0hzQhP7KLGugne6a7seEikluhcUaYPHjdNhKnW6unPJyPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5vY6kTo; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5vY6kTo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d027b7c8easo4319745ad.3
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 03:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615457; cv=none;
        d=google.com; s=arc-20260327;
        b=Ck9JIq4bCwaR9pVUkRc3UAv1fX/ehoFDLTOji9d7Qd++RLrGzVi9HI4i0Xy8GrvYkT
         GsOSGbeaIdG7Djmmg54ja3OmeqlXGvd6asGZZiwZfSva4nX4bSFCYBv/T+MvGANZ7Ilj
         xRpHBlp3h/wGlCXSo+tabu1xvVDLQA2gW4iRucPB0hufAgldKCbWMTfvvP6b7gM6Ro3/
         CeBhyiI14NEbJ7T/MB/tgW/Ev5xyZW3Pj2WRRugKmjZj5rbhgHtXCeSLs5PzfDQdDrFP
         XeO6N9HMFlunqinMzjo/DHqaxcNKIVW/JxjItKEJAs9wujhMcePh8RrZwL+pBO7EsmCC
         7Opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        fh=+vFdVMW/6nmdF74PbUqCm+c6jEiBVG9vRThNfz/tTho=;
        b=LGh6fLx1vwpGp2cmZPgkTM2vi+PfpwRMw4CoFX9y9wIAY+w827LEECKJy0ETHWmcsg
         kZHBcPIiuBW29V2+3kb9CQD95TsiP5J/uL8oQ1xbb4+h33nus0EmbFg2bKRFlMk8mgJx
         LUDHXLUVTVOK+OIR2OlLpdza3hw7d9fZqgixLtdLxOmzfq+vhRBg6xFukMoUvcR+k1AP
         zYLQSnTxVWnnncWMT1QxT40kg/LiuEVLEj3EkvkCneQ1w6k4LY63GV5U1hY3ZD7UnLsF
         Zl2kKE95m3+n2Pc2X8s1zNA/tvF2bRdi4DccVXmGhJgAomTD4N8NY64IaGlWiuy/6rLH
         2l4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615457; x=1787220257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=d5vY6kTo0yC5982dRWXyfhAlkZRqvIkldUCA7tJB0Ro4ikfexyGJ0i00FsanHC7WFQ
         nSP4qR/JhNQ8tsqKmb+2+4ow7Wqa4QGQGcaOBXVxh/3xGiZ9J+gXwqmThJUTUBmc6KZU
         Rw/puK7/WLDWoWw+WTsp91zL4qPis6FcfghSR6eYYe/1OwuXvLejlnxoDvpPxvJnuYVu
         k1md90GAiHLByHqUzMiLBV7HU28s1Jd1dRf8Ou3lh5kudN+PSD6NRX+I6eQHI0N3gMFX
         F2FkuzHzDkgFQI/imtfcWNb/2HhYUeSpngMtriAxh38ouOeoV7nXcnRaPAXawFb22IRk
         fI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615457; x=1787220257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=qYi73Q3TPAikdaINhovnsTBSgTp13dlYr4II6LvLxEdkQxllFos++0YzdWnNzrG1vz
         30ufJjOrt8Z7/8ffEnEHOzU3rDErRAn+UpE7uZb7LcAM/LdYohYjUdrT9Jy6usscFRJ+
         VtNm2JZjUXqtW7xX+xy3MCL+xbdVcfQaVpEDhFUpePDTKkYufi+iN4ps9uT5oeDRuH1u
         ILDHJRrmvVhkvHYKZmOlKEDc+WNXk6kPjoc6j2hrILhgfw1e57BzALV8P/p2IjG4xfjp
         Vxf2qGkjjM5Oh2zKxH6pR+wx75Ch5UWA6XTU90/YyLt0whACMyO+9HMGACVoGm4cDdDh
         AWRA==
X-Forwarded-Encrypted: i=1; AHgh+Roy1NsDZKfGTxSG3uj3vc2GwFF02RNuqViOtA3Q1T6f9Jf5TVnPXwzoS+nXEZgcMAJnSrXN0pXNsQzAzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGsqPK69nSMAGojtfqqD5H/gnacz8/zUDHCGd0UIjwoNzjwG1k
	2sRGN7naf1N5zc2PNWEk1srmJ20Y7kB2ziwW4/hY/1stgsEumIun9M+WklSNrrV7mZMz4Iwa7go
	Vb3jNKfwcGMIllKG4kBifpnRxR6mhKS0=
X-Gm-Gg: AR+sD10TLUtaqAVb9UACb8bMEWEVWPlAwDjeFD9o2aX0tGxueLPs6WZzRfKMOjnbKig
	CkoQENdVOItqykbdRx41Ftx0DHLT1znOOms41Z3jkBV4jea7NA/DXeIFI108upLh6OzXJSdj8HT
	jy/V2R6in5+QlKzdqLjKlc6A07QjrSmBMOZc/DHhqoN4lCu2JSVjPmwjp/pO7QdT51WL+WRXPsQ
	DJDz8nF6ali3P/ibzBNxp3H6CHsSVbdefWpkOXBF3P0WFimY1L1GvTFhBdiZ8QclZOsxWqWfP9u
	qg9aYsq71m1sbTFa6AahzgDGCJEnKW15RIZ0vxvE5NcdsNF53jeLxu5FI+mrtAwMPP2Oei9/ReP
	6bVUOfUihuqt8WMW3ntkMapiuFZm0nWeWDuW8LBtQCzLvAWnNHGZRkfNapVxg
X-Received: by 2002:a17:903:19e6:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d389b61bdemr35547795ad.3.1786615457444; Thu, 13 Aug 2026
 03:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
 <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
In-Reply-To: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 12:04:04 +0200
X-Gm-Features: AUfX_mxe0Lg9da-FioFXEgvJltaWUVJqtXi0b-R5y4sq5pbip1KqobICrYsDddk
Message-ID: <CANiq72=Whd+u0cA88++KyeOQQrsBK+NqK-586jNX7L=_Ocixrw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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

On Thu, Aug 13, 2026 at 11:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, done -- Danilo, I took your diff and converted it into a proper
> commit, please double-check you are OK with the Signed-off-by:
>
>   ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
> `#[vtable]` `impl`s")

We also need an `allow(dead_code)` until we actually use it
unconditionally: a2595ed13816 instead.

Cheers,
Miguel
