Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2232C302
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479405; cv=pass; b=tX/r11YH8oetReANiU/i1grupiHWZBb0epLzmoFG0FDJWEWbCfKMG4QcHKeKGrO5ALrv523TmYm/K5VJKnSVOAYEEdK2qeHdwsyxSzLEO1VSVpEJZs8dYoKk2y5oUYDkGWIZXKWM7XkM0hnxgLp94B2s2UnNUvEHUCAt3keIY08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479405; c=relaxed/simple;
	bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL8kNlFe/7kANx7N4BNJfUU+si4YsR6d+spJGz+nTaAW6NL6Dl7GJDZi8+vtPjm+OXN5ZM3Z0oDNU9U3u/dBtiOQVzfogSmEAm5K9HYfTsrLy4J3ncyAlnmR1oM0Bt3hRSz3HESk1y1RUTUJhJoMHcAOZ0JRkWMbQsfH2q5WF6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5PxaE5y; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5PxaE5y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf49dc28ccso869385ad.0
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 23:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785479403; cv=none;
        d=google.com; s=arc-20260327;
        b=GOPkAI8mDpWEfXc/0l1XuJBxVzqLAuNAQqRpR+I7R6npJjdy36FfTp7lPHJLFtUd5M
         KtnJqbMz/piPQJ+rfVjCRHLExOW0rb59vR5Z5XdpydvUVvP5xx3Ui52yY9fivpbv0lVQ
         LWIPM6kllvy6MRf+ekwzHJyb9J7QaJDuzWZdeaiHJGIcV/lp1LNWbK7whz+JdohRSE0M
         tUGoNKjpLUuveLzYM8t4jSCnETcQvDJpVL/CpkjpWwU/y9xVoob9GTfbdAOPSKLAor6c
         xdUnB4KXv9mS/zQYpsVzt7NcJMKsAV5srqc2a5MSuNiWsqoJAPbc5NLLpevvzaKonUbr
         eqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        fh=mJfU+uBgjkHjbwAgJuYsIYh9AZEzYuDilCo085cHfRA=;
        b=L8rJqnPghw/d5Kz1TNIsq499AYM+pOFprT7YpVYTzgrfr51X+uFU7kaPca6LoqLbwJ
         6HpD6RgbU5mHjtrDICfXYBXBjoJ+Gj7xzSysuZB37ui/CgA8owoPqA6qoshAtYWXJ/H4
         9dMKA1NdhlhLTSvR8eIGHoLVW4j+U8JZb71rMUQyQHe2IVkktdYGIpU9dyOhPLE3O4+A
         TUyrEPPJDsNeG1GHzV2vIDXRzJhwgNZCWEX/C1m6g0mXrg250ZlzyEUHhim02UYppPTY
         PvD3SvnJO9wOdWiFkofpr7GL2ljXs/LVt3sRnwAyNI+whCAYoln9KvZHLiCgtmWTO5xM
         vsgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785479403; x=1786084203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=l5PxaE5ylQ8VdYHV/Otfn/4nzvIT93fmj0whG3vNHWrY7Ur+XXYdr1vYIi4OEGApAu
         n7VXw43GqKhyjtOqfQEpR8ulswGrW8jXnx5iOnf4F4H+owRrIlg2Pg9JwHm0UMlu/IoW
         6EJi2FM+xh0RrdHHg3v8C6l5R+Ktt5JszSWgsMcDHYmigUteEi4dTavwFwdXaUjVtSQ0
         x87uFj5jWco6ctb/JqZFn1pJIEjfR4vdxNwWU1M0uyLY/CIegN/xv+zyRvf10nKZpiGQ
         el3wwt6CZHVAT324TnTZz7nRlIzslgZYH8XvjhKtFypAAio4Oi515HLEvisNmgqKH+2j
         Mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479403; x=1786084203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=jrEmRAueY7lY/uHZ+TnH47WioElnR6m9wE4rT7uVBmcM+J3Pg350IuPzJQvua3GeBj
         DXlscLRUFvyntfV7W9RVbkMd/dxfOqTnGN60qw1uuXyCdTbMdJZ2zF68hr0MxA5aP/zj
         s5Avw0e0QPq1kdthAO34sBVhep/TyKgM4Vv/shpo7iNcCmKJ9tkjl0rXKKY07WDvrzjy
         KwArpgwlNzvpPktFK/xcYMNnrN4XcwCm/ajRmBa9DRNQCCNy8oy6KiEmRTNRd66YKA9X
         wOMJkdii10JrWG0aHQNNtBQidMmlePfjZAYZPfNXXX0apajrGJT0LSjc75mPYF9fF//c
         3xJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9on8gHtaE8ncL1rREhPBmveiKf9LITy7x8GB7tCn0GcnrpqwJK7OG+gY+tfXCs0+ujdUOfqHEIJu6xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO80aJ8aM/4vixrbTiFWoFEcpE4AN9/jtuTPiGAx/YpGq0fkrZ
	bJby27hpFIaQgTPfmV5zLPM3ffx79sO0L0iLSd0zMj0Cu4joVBFOuDgdkhXpTqOdAqUQTyz46lt
	m88tSPCugyoFDCqqTA8lgTIGMx2L/1qA=
X-Gm-Gg: AR+sD108Qa629QW7GUkHQvSuLsKmpDQpe6EC5WggmFwWfkpezpH+u5htaGrvw1o1v7y
	vwM9jcowRqMBYwEdmPlYqf4INiIY+QHYwu7261LwJLinhG0aFGSUEJzaXCwS9Nmvxs0RD/hA+2J
	RdsdeH/Rp9VvdB7Zv0m0Lf591EjiJPRUQFcdIugK+hglQ80BbmG3n+IbNAe70YO6/e3gFE5ulb7
	D0C4V33rXlTIDvhmIOUVkWNhJ69ae4sEgBseL1mF3vQnVn0YlJU9ygi49a3mHDY5yL/CN5/YwID
	s+r/f+pUoUcbt151AY0Fk+CFPlT0slHVA/F5uED3EO+0Jo4Q7X0sAYjlYEoOmrGhlEJTwV/ze6F
	6D/P2ewRvCZCVDJvQrQ1SyIRhn00C00OTLrRaXCTP6KQRBjtC/NayVgxVQrIM
X-Received: by 2002:a17:902:ceca:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d046ef0048mr13066585ad.4.1785479403240; Thu, 30 Jul 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev> <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
In-Reply-To: <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:29:50 +0200
X-Gm-Features: AUfX_mxTwoRg7YuTGPUdUHKCs3gSMN4l-jXSn1vTLDoexparxESqmVPaSYuvKs8
Message-ID: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
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
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:39=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Back in v3, Gary suggested this series go via the rust tree.
> Would you be happy with that, or would you prefer a different
> path? If so, is there anything else needed from my side?

That is fine with me, but let's see what the modules maintainers think...

Luis, Petr, Daniel, Sami: what would you like to do? This touches your
entry, so it would be nice to know what your thoughts are /
Acked-by's.

Thanks!

Cheers,
Miguel
