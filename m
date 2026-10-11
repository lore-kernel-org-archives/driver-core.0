Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3750450415
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726820; cv=pass; b=kI5hy7qvXJ7HaOkuCe4ftBBjLRD45UWM8XH51iO/a6tQ+lAXbIaUG/H2YPssqt2hQ5irw8LnUHhY+KHAccV2mo/HK6X5Pzp4G04iQT77OxwXy1/m5UQbZBqe2YygQxal0ELlq3SPxwdDmwN62JJ/F4pjPw7GjmB8RMpnO1XlTuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726820; c=relaxed/simple;
	bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2jGB0V1/j4xC1Pka7aUYohAjsBxbFGH9gqy/GltqhMu9HdRi85L/KmOoewg/gAr/qm61ZlJ9mDM+Vtkjl+gV2joGFkmGxh8vNZNLC6iT7gQ/rergMaW/T52dILT1ecGwI7xbrCBp/ls7rElFsufTAUZvuLYGYAOiIhYiC2RoP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kwx++0uh; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kwx++0uh"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3584f70a5aaso113453eec.1
        for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 06:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726819; cv=none;
        d=google.com; s=arc-20260327;
        b=WEWLdn/S+NFl/0quOPnwj12L/D4sJjgqNja5PSVZA05Jr3HD28hkKpO4sei7t48IV2
         0fIkFNcLWBxAkpwuDT9hezUntVbsJ3kySXHG3GFD7U0qJOKVLZkAT5nIoeF97c0g52lL
         v9pT4n3oeB23KMne+CHwGNhJrYItrwaBGouxVYb0ebGBHv7B0xBEo7JsczddVLB1GGea
         r5t2kpq0g1I9DmAxvrRzIEORO0xyOLNmIDNcXwNyKds9cbjlcLJ4Z5sr8SlVOkFIukkF
         LUdLNYj2AWKiG2xcyJs4fp8quabWV1vEpgwDXr0lEqOkpzjxhx3MboF4Bn2qKtYWmUTS
         b7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        fh=p30s2UU5snj2CaWAHGoYV4YTX3+sVRSECKOiKiZn1gU=;
        b=sWOoTq+QMkcaNAMZEPkqJ0b9EAV7BaqUdswHJy0A7PpU9pd2pCMK+mvJbkJolRY9u6
         F9OfqhLi/ZryHblZx7Es2jzFfVCEneDDMGmbzyzOZcbW4Kzt66xE+DN1AlKVXZluB7iH
         OoqkWV6LgZp0MwHLn8SIi0gUbES8pAd98L0wIZQxL+WR3l0vBz5owa0DGx2OihGO0+dk
         iZwt0pmPDOo9ZASrst3JJWIcypvjFDwRIxC9gEVGqZlHVxg3S0nxOD7KRS8DTR7+nKBn
         KZsA9Oujs7DxyrRz9dWOvR24dHYuGXdJFou79j/FLkJ4TiviW+uC9WazNEOWGlqLYWht
         4ZFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726819; x=1792331619; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=Kwx++0uhZLtyrJXt3aoY9zWmV9/KHfJzkwsIN177xKOaeYDPlv8TDSASex8ipXgpdJ
         b41YnfI9T4MHT/kqBX6piLRlmvCd3aRuHHAfhJuadQqQK7ri5mvjokVMSDGYJn+/D55y
         mQ6qUmiQumm+8Fck6UFvwjyLK5RUZe64dvvWGRxZJB/qpTtdf8XFJvaexNqSzIKANANs
         J5J2FJUWgWy2SLsNFkuz+DlIdVpoMky6uEUAL+mL18JsKct1rccyeY4HbK0ejxM5PsaZ
         e+M3ZYwP2jGrBd7zNaYYKRZNkoKzQMuAQ2iFL41zwJDG7wYAwOOyxpIszEZv9aX2Isvi
         6SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726819; x=1792331619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=H0Nqul5Sf0Tjw/3Qt6a7k/L9VPeTRdfXCJwsVlrM+xqgd1iUXYUyk5azkUrzLVsqDk
         U6uPhlJpkP/tOn0Pa7UQbhkeQinYJMJ882XvWkq8I98I9qKIIeK9u1gZSA372WMXp1HZ
         ETkEhfrW8YrZWiLbCzws6gbz+ISwpG1ObVLQPF5945DEl+0Lz36KKR8ZQoLKo0DHYm2e
         PHnlYbf8foy8zT7WGxl0CE31WotB4XHAmLhJuXSl76WsTYI3Ft+ZI2oZK50QJgs4bVbv
         W76sgHG0Ke1qBrOX/jEzQ0WjItOunstF3tdokz6atT0F4qlzqlf5N3+sQItN5E4WTviP
         VO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxteZER/35E5dG6rBBwB1i6COH035KIKdF687iwtSgAnfMghPs0Ooo85oeconAqvodQ+MfETr1MS6d5IA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhdn0pJhvTTzEN8IIZdaP7Jp5bvq/50o0xFlWpO7gkV5+fDyHC
	Cy3/BvYL/mw4TKiNUM99otNLm91RE/JLomY36nlJZfBSOjGw837dbQ/WOr/FFnRjQa2tCtxasMU
	kOHrQyWZeFH6GnYRYMKzhaklJx3KmIoY=
X-Gm-Gg: AYBFou2wyIRZ2ATi4zPJTda43NoFLIakkr0+vYZzmk9FFN25Z4AbupmmWsscQ74WUzr
	DTC2L6sZVmwGz0cACcDH4BfSseZ6bQPMhLNJqw4itIz0jtr9QLUmlDg9WtKpPLCpK6lNZ/KoJLT
	v1jWjgEybPCGZMjaXmDBs0b+f5tAoRO3Lb3YBWHyDsSi40WZdQuHYOiUR21PEHm6sn2FcEvuKid
	1XSLND+hjPTexZiQGVr+SX8pqpHB/oiII2hVfXPvJedBNSQrNQ30kp5bpHnTZMpgmw8oron+R5O
	B0/ot7cIAwZiNWRvRv1+nFsnjL0cXTEl28Ds7SNIS27TYY6fWBom4/eCe8Z85Rsatorc/Wpw/WK
	Ut9rKWLGJCzaWU3k4B+jsDD3bc+84jG8LAsSZXvMuZlzHGgXvzVlFG60+NsfXTKkUDLth0tProA
	NYdQRVKDiZw1mFabuFJEOmBBFc+Q5XNZMw2M8i69G4Jx3Ik3gxRwA=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr15242775eec.0.1791726818852; Sun, 11 Oct 2026
 06:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-rust-dyndbg-v1-0-832e4039b71f@weissschuh.net> <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
In-Reply-To: <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:53:26 +0200
X-Gm-Features: AclHuK8cVNPlyOorjrRhhdDkOJWkbQbDeGyNyJbJMfzEHu0iyDdJ7u6MM6NTRQ4
Message-ID: <CANiq72nN-X6pZJ8NhUOyLtXNPJWgh7oA7-kU9KaVnvjv-u1gOA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/11] samples: rust_print: add debug messages
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lyude Paul <lyude@redhat.com>, Yury Norov <yury.norov@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:53=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> To make sure they are actually printed, enable debug assertions.

Hmm... why do we want to make sure of that? i.e. users can configure
the debug assertions, and the sample may show them if they are
enabled, just like any other code, no?

I guess you may want this for e.g. a CI, but in that CI one ideally
would test both cases, and assert that the messages both appear and
not appear depending on the case.

Cheers,
Miguel
