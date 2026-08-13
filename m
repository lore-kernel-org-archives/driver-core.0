Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C54192FC
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613784; cv=pass; b=Y5CZG1Ga4mcfDdfhfNPHsKJZmWGweQ/TqptB9ML4FCv8LpoOG0YKeibu1mSaBtAKvMcGSL89J7uqAafdr1QpY86WMWMtGSRe/fEpZCVwK1cm9TZvOBYfsArpyiwNsxIrcEBd+bHtWg/bLMOsLvGsMh3o4URrr0Kx6DKbD6oC76Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613784; c=relaxed/simple;
	bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgtKF0ZKCSe1O6cn1QW29arzqDxTB9UK9/LmVTbzsZiBHM+D4qYAB/HAfwUwasbg+6U9iGoRJn5nDP10Z8Utn5z7YyXuRpYtPDCNCv+e3+6BmK3JBzeaw0kP3XFccKvwS3irdNM6OrK1mKHI6Go0+paVmcJzJXdH2hNlwbVFp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFMEYCOY; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFMEYCOY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdce28edeso3400865ad.0
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613775; cv=none;
        d=google.com; s=arc-20260327;
        b=oKlfy/v/O3rjRdKWyuLLFxQw3LI7GB4iIAqcyMe0l7uDVlfDwlkgif+9RB4rOvaM65
         NKfGR6AWXId4OniaIZFX77cJyAJi0nr9Qn3ISWDUNxerXL/zUzBWYvAPirtyMfU9bjY2
         mXOUu0g/Fg1mPboACdn8Nhy5sYVudSCkpW3SoeqCkZ4dhvaKUfmij71fnNURvFPz6Vqo
         ktsFER88NHaCVGzsZGYgdlb4KBAxwxWYu6TL+8r1LZ9dtfg2Wwze/jSSM0H/W8Zo8O7V
         IQEE1eVF9+dxI9L+/+XECSFGHlIo3lFn/GhYENUybCUwP13cOf5k+yxWmfDOeUEoELib
         xaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        fh=gAKOajjzfr2qinWtJSA3l1nHBLFAmulo+uLBYCbXWC0=;
        b=BR6DVdYdssJ+DcBC+xe9Us3Ve+MkpjVzeTHw4FNI/yBM7zAk1YMBuYS+k+FPE/QOtN
         HGFHkyWUxJiPlqbluDwG5SstcU2RtKhb0gwbEg4PHnNJaLlgmj1CNmMSNFIqFW+lLveL
         SUOgVDTvHm4wW9bsOxk1dtHKYITFq+Y8B4bqYuPszsrrZvbpga+H9zSuMEjtc+fsZrBp
         Vt39y+ujTvZKgTEPL4yY/vhRa4o5CjmdFSezB2B8fJd8B+/yRZELT4kQHQ9kWfdb56hE
         cfCMP2Svlw7Q0gv/fZT6bOhxEKQr4mtq5pUsxUC7YupDdDb4OeOxotB9pU/jaC7QpC4R
         lupg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613775; x=1787218575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=fFMEYCOYjXix3pa07usucniAF+uYOdXHvXSk0pwssM1Zq3CZSaXwV6dHwrUBPlMj1X
         wMPAPmDeI7n7xK0H+I7xpoEz/Gh//C0QXSYwrtMWLwRA/8xKKyubKyVb4JZikLxWfkmJ
         CJUmVLGXOu48/6mEwwsCayNY7OQrdVyNwp5d5MoczXwW730I7LV3BPVyJXB3KAGW5CZK
         6znZ288p/+NPJ6z8cyOfsgxAUdjdOzltnmM3XW5tseojA83f7u3rPmfz2cmZ7jeWTK55
         SzuPS0Lu6cyZQtZDZigy7+4o1tQL/VQ/xy+Dsuafu25bqdqWdJ9hVBzXhD5c9MBhtBXT
         aofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613775; x=1787218575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=i6A2qDaSTk1chVoR67fMFe47+kqLMH6z5VXhcUClAqQ/tMt81j+ciA4/Izj6Hwfj0E
         xyfciSAI9c5swI4Z68JX94LS38l/KfQeEzzMnDelSTg1LGC9Yy2J6s6HwJWbdqyd82yA
         2u2BWbgW0xq3Kg7QwVWjMJSFi74GOyGw2L94llNLqqo3B/CIiCa7fw9CxKgW2JX3fUJC
         UelPXQiU4CRzwmQYdNywNtNyu7NX8szHObar8FhGFD5q+LUCtK8ZFnUBIsghBlAisMOp
         N/h+f7PpqJWQ68UbRHw11nveOyeRkanJS86D/cWSxEUwieCPzQ15bJCBNa0dQD1O2iOG
         wuiw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy+CUkJVkZE0QCDdUi/NcVNhxHrZsKWfNWAdK7QGZ9XPTXiHQXlCQVkqKpcgoSrmCmuQnBnnOK4tvFQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwL50a9knPdU8m6JcjO86IqSP5Ns//57qDwiT+pmjerU05keWuV
	dNK+8PjVdoBPP829bFitt1wjKoSxKXKXhzvcF+2eNYkr3SBHF7pvO6dO7tSozd1S4prkOfOiVqz
	M0Q+T/58v+h83QGrIpu2QWshh3FN3yEg=
X-Gm-Gg: AR+sD13+bO4Dzrnz9IStfpT1cuFzPcFTnY/zuZ5/sJN7CA60UdGxQ42SZzWcO1RWORa
	/45Tpc2wCYKOa3h8xb2H3S5PEC//J7GFXj6sXq2nqVUNmsTXpjsoRr8uI4xepPwx5YkjrFl4R0n
	GWbRDyjEy1O2tnYVg6UzmyFKKL/u64l9UlidaMHOuXapiKG/z0GJ66w3dZKhhyWjg6Ed/+g4LjV
	ejVfIPN47rrucI6k/6kU4e6bkroWvJ0cAsqB0Fi5zxNXZ6WmGiVIH6nccZIhZr3t2CzUm7GYpgd
	1k0ciatGkSL7eNlef6YGDY4mpvlUoFqJYJ0JtILG7QOr47sZ2TGiNmVxdytUGW3m4Y5Iix4utIE
	YGTFMeylgXoMB2Q9+z/mI+jVkzGgxri6rOiO9EQO07XReVAPu6FjdgbJ4SjBufyi8tqt4/2M=
X-Received: by 2002:a17:902:ea0b:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d389b9107fmr28401875ad.3.1786613775343; Thu, 13 Aug 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
In-Reply-To: <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:36:01 +0200
X-Gm-Features: AUfX_mydrO4nx0TADc_1KF-ELy8K1d4zi4yvOYINpS4bHvyjdnsvoZ1CepMueE4
Message-ID: <CANiq72nR3K9d0Y--FyUm1yAkww2LaAuYQZ3yHXjYxxfztgMMYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Wed, Aug 12, 2026 at 11:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> This series has a semantic conflict with both the driver-core and the drm=
-rust
> tree:
>
> @Mark: When you merge driver-core-next after rust-next (which I think is =
the
> case) then you need to include the diff in [1] into the merge.

Mark: in case it helps to make it clearer and so you don't have to
read much, that [1] diff still needs to be included (i.e. the rest of
the discussion and the commit I added is independent).

Thanks!

Cheers,
Miguel
