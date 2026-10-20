Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520291;
	b=NYMR95qz72yKhovr/KIf6MZxRIDq3yOFz9cR2vZkegILcSnJSnr0rBiTekwQVePCndy/
	 q7L5f4coSWIV22ZD0poahFmEXWtvRJamve1GDyf7rnIeqJnXMOmeAuuFso15hX4kvSodF
	 h9pTEunpY5iydh69vduZ3QdnFbF+5doGkXl/2Xe/9JJB9CUy4tiqwDLCW8qsHdQKXSgkg
	 Pgh6jTxZNwag19PxCFMZhwhOCixxOnvf3EM1AJ+8lNeZZwIGK4fU0AIi8mya3SyaijKQM
	 dhf67oFHlvkrO4Wmq5GPnoxv/q/VM+ocK8mUHqqm9AXcJ5oljkJAoCc55r4bpjE6heA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
	b=DsatP6GD0DqRxdoIIdi4cItTT36aqv9F1lX+G9a4I3sIaFWM6J+N1ybNlv39I82gEO62
	 a1oqR9qhu+Osf8Osd41yqwnge1lTpaGWIuwgdw5Mp/UEB1L2ES3+jTDTEJ+skxceYzl+X
	 2btdppIopka1v1vhf14vOTCWZkryGjKnz6m0RiDVamHkUsYXyhCcCwfOkkUgOJoswnHmM
	 r73kV3BqDYam1ufk9QT2pf7cENJcZvr2ctSOUSt7BlOT5B2XkLTKdT7UGxtBDhR8AJtvP
	 xMNWP8hCyFRHa+rWBQJjhv0Fqq5rPaE8t1QPjWxwKqW4amro7rp5IHQZtqP8L75kgKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdqgXwaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436B606A321
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 18:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0436B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdqgXwaV
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34c522572bfso371657eec.3
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 11:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520290; cv=none;
        d=google.com; s=arc-20260327;
        b=NRi10u7RtKFDgsx7fKSdYnUywZte2nyJnXlXHTvc34c3Ypd+0UX7znaWqDnmPFFQr0
         2hW+sv6wx+wHllfppowwSsDwt1cPq/j/7qOz1c8btitqNO/bZak6ubaMwV/I3Oz6U4jb
         0+GkVl3TtPqMc/YEtKkbfKvsD6qgRho2qJGNYdaSO4aSw6f4STNhc1k/5Dil8tz53wfG
         GTRCVRuZhmi7dS/wOa0Tszzwyb9wYYkPShHX43Gj8BsCZr2QXPn2Lb1IeLaSPepCS6cJ
         Vdg0HAenw4hzcj29XyXcNUyg2u3rYKkXD9qJDw4A75M/6EPztJtPzdXK/h42gzGFBKZh
         9x8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        fh=OLWDb/9qYKUiHnJot0PhxLrOWoIsYWQMIFPvzTArsE4=;
        b=cFBtNfekW8vRxZuNsR1Z6Nwlh5cNa72qYin1OMC6/VGjhAACjHidYvnR5YlGCjp0G5
         uoNO50ESjHTuWyb5E1ATqJ8b5C/6s8gpB0dCT7Xc0uWjjDjX0Uj/dpGqJ4LFo7VAWhfF
         xI1zTskJlPJxRrdwbkZQMp0vaDUAzqFOOC4Kr62G61lORPVszBVy2cP2YsmCa2oB6Uh+
         f4RfibfWlq8h/4qfVibiWdwhjUL9vU/au+HdYDTcelcb7xP19mBZCutGQa+vnPb6eRXs
         aPjMYjFm87AUdsAQ2mHaNCxGfhHYVtuy92+dl0x57fEAEhIpnEyFi94LysfXB7uERp1g
         AAwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520290; x=1793125090; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=GdqgXwaVTm04YJHXctUYKE5rQmCU+sONwGTh9mKQFNBH/kdUhO463O/T9mrbZhtR8B
         VmrBkOP5+K1iB2HaGd+VFxN2LJedqhr26WRaqghpm/Y9spX+Bu5vX6iXV4A/iomCrWbS
         YFRDlYrOafwzKlMnfp5F2MLq8TWCAG8/qJV+Ip7gi8TE599zVp8RRpvnULjKhR4uTFEX
         yzh9lwP2E825FesefN0JzlVNKSoxBlNa5FkdZIMVSvZ47TCY1oNF9+zgQ8fnLNUq1ALB
         jmZGVyM0HYD9qkmwBGmmF8z8ZhbSmREhJonXD0BS4VLeXcadIxHE56N9aMOCDmC+m3GT
         lhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520290; x=1793125090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=2bsb3Fj75kIG6RHhP38prWOB2hjmqT1CHQeGBoLUz+Kad/YsM4gTYWaRZ1WRlDJOtx
         B6Sf0m0oCpmaEeUnzCErWKHXYTQL/kKm/6/HU/6DamXDwAPjCQhfII91lVcJD5K0lugM
         irRgCY9DQGq3Srz9Lfc8nA/DNbqZ4m0TVUXnyIqn0gdcs2OtfjGYLm3xE+jg+Mi3sKMW
         24wE1jv4gVFI0EAtMKgX70AIwMpSggAF5imqwiOR7O57N4M77LAy7b1omGZtpsZCrdoB
         dxdKqdbQ4XdcB2/C2CMv1SnCl5LIg2s40PWivrIeZCP1z3uDIlzw0zxwpjRptX5Wnnov
         Kadw==
X-Forwarded-Encrypted: i=1; AKwUvByqRsDy7uzB6RBvM72Bs6tqj6Qv+4hOKXbdxP9Z83mimirqF77YM/+86SfiuD4tpC7rJByiLKtCuaD09Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKTMnuu0+RuXLey4FTwsvO/nhLZkv86JwIlAH2nG523UzpE/KrD
	4KQUWvVMBkLS2b6mTvGb79H7kEmHJ5wYYCA9yiWcFXgtQ8y8OsySMiBpPph9WjYv1Ng9VSgVgMm
	jY0gekPN4vkDHy6ABJ0+fVeVG8pd9mw8=
X-Gm-Gg: AYBFou28TnQFSaqYQkUR/rcvJvUw2dH0Nb1VU/FSrbrN7HrGnHUnXI9D/1sLRF0CMLX
	xCEDu44jHD7z3KxkL1d16LH3BbDk+cP0KqEjpc50jruA+Wm8HFHhFidNZf2qjMV3t5lZ0ov0Awa
	TY9iYQHftExpGySNtKaaDFoaBfB7l+l58gvzgLYvWeZlRWA4O+2tsEM4mfn7ZiFlJohzrIjWNKI
	WBPW2hCXKcPUKyCHjddOceMe+kHLfgKtYSSZlnDKdDEzce/6pojBEFPDf+awT9hwWaZMm2bfbsH
	HG+o45ep1eFSD+UCCNa56sOZ6FVtFC0U4bsreGeCxjUB2A3rdzkLN3+yo9XZ+MNjhE732P3hzZZ
	PQjhkkp12rhaYLyyTwRQaNVg9HiUwwAoHU/O7QP0N0M/tNwQDWQWA24QsIvUGKMHhXPXAodAONg
	orOlad8khpgr7pKCSturHixQQWnnQZlLDDuVz3KNQub/U9cax+5ojBY/QsObkRa2++Z9zdlJEFH
	px+ojijmiYU7LM5JGXt2w1P9Q1hJ8vX85JNbRkDThJxF+sUBSIvz14BDA==
X-Received: by 2002:a05:693c:2a18:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-3674d349c2amr90750eec.1.1792520290085; Tue, 20 Oct 2026
 11:18:10 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 20:17:57 +0200
X-Gm-Features: AclHuK8Pt7FrY_kqpDoLQTxwm1rIv4S-Fph5tTJSHjNrWvcTVOiO4UpxaONIOSc
Message-ID: <CANiq72=-rg_nYHCn_DPczQ0tNZN-27TVyvoC_QvYbMZkAgAQOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
To: Sami Tolvanen <samitolvanen@google.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
>
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
>
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Andreas: with your Acked-by I can take this into `rust-fixes`.

Cheers,
Miguel
