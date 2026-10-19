Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17C4E80B0
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412916; cv=pass; b=HbYtESZDikbWle0FPhzqd53yh0OM18bc+DcQrxINotpRrmhGWGOA4POJLLU/LlaiUenRCFSInh+TtvmxftRbp4hQcwezrm4jqY1k1fXhvwZ02e0TauhcVOU5o/j4vJ+pvWGjasELtaezd2PMgFkMq2ibVtBo+Lpczbv0LhnLrNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412916; c=relaxed/simple;
	bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoDGfE02kPNmU5TkevPlU8CH0i3mXl/KBmjKETvN7Ishzd4maE+vHqj4158d2d/IQrYKZaPmiJrYFIiGgDcD8iu6pt+AaCo2hAveEbh8u5lXa8QknEdKNkMyzkb+QDlehOmjwwJJ4oIyIq4gdEIBZQK5A2QRGxx6q9KhKl4qji4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoKcOHd0; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoKcOHd0"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso214300eec.2
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412906; cv=none;
        d=google.com; s=arc-20260327;
        b=oqdf45+cvLNg0W5C74B5eqqY72/8MWJzq33sKeIpdZUBKHPaMntwkdwXx8OM5oGctd
         TF4DXOmoBhp/+QHGIiDLpk64+Xn5XP5633OXp24ALCc/lkZNV/4IDon46D+pZK6Q8Psn
         M9bJ4NDm6LSyMEyZ5Y61toHHtFyx83PvIaWRFTUeQjJoi60V238iOMDX8Mhxh7tmYbCq
         zg3hoLW5hEUwchyIgDV5BOmXXq59Pih1HB9LHEJNTLqvhS8ZJVetyxHiKKKJ8WSCYmGG
         7MzHslWQdAWGABophpy9wrD5LvchRHJ754+RLG6Ck57ScaMAO30izTxh4JOmAUqjpFzH
         /b/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        fh=6fTTXZC7mQZAyHmpoReG0ldx+/zWsAUyplBnrT0JM+M=;
        b=joGpcpmEPrW7M/MoUASG5lr508O5jgnQD9TrzLstEwdxIz7FKolouGSlgs5vfbgeL3
         mrLSpW4juYzBZXIg0FRWejChyceZq1ER6doaaDL9tWlNKS4shZ0UMrnTYQZ5baVvnLJn
         H9zp3G26HYiKszpbIig0v9aneUDZVzkEedem12uVubDDuSy9yc2EuK9AjjGsZgz7VD8d
         +aEIfzVhoV5prgQzOdDawgr5C1irDDGm2HbQxerbUblE2NHwDuhQE4m1WA0O1JvszgJI
         A00N89T+a1naZe7EXmuNxFcMSF68glof83UiwzjfRB9+T18a6yFSUTHvzriT5roA33NX
         6+2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412906; x=1793017706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=DoKcOHd0Lvyz2TkRQ5fnjY/xFJPNBxbt8snOOJ2W2wgfbIXVzC3l+c/rvHS/FITqnM
         sZWoCvVhzqFnDTDEz0Cn0NAYorsPyqAGUXYWtSIzz0lUObQzlHBW1WJz6TC2PYojr032
         U3EdAmYaFb6UCbAwYQE/XxOQbwSEJ7Pj+pvVujNP33MfAGBJ5hqPDk8Zul0vM7VBS8HG
         QW4l3fU3ZrtlVGmaLECG52KjB2p3D/wz+Oba1z3MdAXDCSQz0tMVVOLyXkJJHFbKZbpR
         u82zTARkbgLbOSiYoI1YAoHiLx8kWWnlyZX+hgZ0AVSSM+RmmjEhyvoV+1XKQjLS1YIb
         mL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412906; x=1793017706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=Y1K+C99UYJNAS1aixnfX4+PkVzRM0vyhKd0P6hSQtTRovac9E703j446zg68hIlOAG
         HZai4cTuuJZaCdn9oCSt8dbNdl6HezKy3YCRq1tp8LQb11bmLnqT/jCprsGfCRmQPpjS
         rl6fFFZdiHMOO9CbpQBd3TFQJAiJXx5kqNqSQNjoWd4Y7xze9YJfuD4GvEgLKAwHuD3+
         zbMZrm17jbEVoC8DEs2ZVW3uxoJV30DP0aAITi9dwYNwtfoE0MR5pKCy7tdJmTEMxflk
         pplzqjOoD901X2bZrtj5jqHxR+yXTf9HNxBuEOYKxf+JJS/pEpvC8nY/5bfHhc0cKCzf
         kmSg==
X-Forwarded-Encrypted: i=1; AKwUvByURzygjSW1NeWWs/PfeszOHMEds7+Eje8B9qEYN8xqKRIH93h+1KcFkaPEK57p4Qhjr3LoDD43u6NgVw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLJYV2kvEfKzLnd3zcA/GaCcXzGyX0/SAow1Bi402Wis3d6kvyx
	BWA2+g7cMUfbTyX/q+K1hsmGY3cAt/vchqsTgmQAZxKbx62ldtBsf9Vw1LQoaue1VN8seVFvE9G
	AKl4TIoqDxMPT7mKSDAeg6x4UL7C2t2Q=
X-Gm-Gg: AYBFou16Sh1uWMGw4Jlmhv/Wg7AVQAFh9gmUR5rHSq6CqxRAlAvE/dMNBXftbNZBgme
	W81t81kXsBiWMmI4Ye8STvshJReF94Q6+DvVDHUhpM5Z6/CD8WlVn2j/vuawKbxIUjH7RnjMzsG
	Xq4fE/KoH0MqlBY5oHJmqbh0CNUVmF4TQiZuwKBZ/juBhE5PHhLk/WF4sBjtxrfmwhi8koDRPv3
	xgZnFha2HV88NHxKNn+Teu0CcSqft8p8Dyv0oRmH1PWgG301QtAluH7rbe4JxRXnv7d7AE3AnNe
	jVB/+DLY3uFpX6rNPaLFVAzUH1GBs9mr2ydlboReX/Ki5n7tGoPIRxIR+sbCuX9P42nuq6x5TOy
	lw4BzOXjhi8+n2V+jQSANBcd+5ILciWndAB+1sKmbL1W7PZDZOw1NV6hxXNFtligulUwnnLPy0t
	sDJRdPIPjDzCPNqJRCyVRyz/sLl+fTyTPvhDnpRXiNmWpw9MrMb7c=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr16547289eec.2.1792412905593; Mon, 19 Oct 2026
 05:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org>
In-Reply-To: <20261019114811.1105192-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:28:10 +0200
X-Gm-Features: AclHuK9vRqGefEm-YOizNzCmm-q741mpOyzFUsHDlEPJyQMscn_rCkwuXTkP7bk
Message-ID: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> `Io` trait is the primary way of interacting with a bunch of types, e.g.
> `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is no=
t
> very discoverable.
>
> Use nightly feature to mark `Io` as a notable trait, so it is highlighted
> at the top of the rustdoc page.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

The attribute has been there under that name since 1.53, so it should
be fine, and we can always rename it or remove it.

Having said that, let's mention it in this week's call with upstream
Rust. Cc'ing Guillaume so that he is aware too.

Unless they say they really want us to not use it at all:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
