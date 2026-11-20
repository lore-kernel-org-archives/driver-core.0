Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176708;
	b=NPBRcIDoMowvA/DasP2KxPBminYoKnkYlB7q3Zl1kpglhsoh0nJLn3Ks2/S1wqiN286s
	 3HQtXd1R2GZhtO9v5O+xLWNKmxNnKH3w4vYCqbUFE8M+P9V3YGO1r+dqJy/ePtLk+mJoN
	 1r11bc26iX+/O2jYxKqzLlNJIyzPgG+ihs51QBvbBnX7wCYb+RHQzh2nQb3PAJKQ0KoAK
	 ZMgpCwnCoEJVDKd7RVgXGdC3BL2j3CabvPrWo8nlPK+w16bznw3yxHvy3Kss/qaux8L+r
	 zydiyVOoNGC1ji/98QdcuaFunICB6MtbyzrszIQoLZl/yORYm72KxuZUxSx5GAZmkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176708;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Npj84u5KtbvSHzJsKcBdTvmxE7ZchjU80UhtR/KP1IM=;
	b=xC2cJCOTXyV8NohUZ0FhnRjY7gXZu8qB6jakZB3JYb1OLRYsDabTi+3pn7DQtKJv5Jvx
	 GPpIVyyqKkmTdYgY5NjiqvcUboeC/jwaQ+p76EDX8WSqFq2alYpyZy8hn4GDlGICXZuvW
	 Ba9eOHD5kDQhhLzXp54oeaJPF1cXogTZHe8YvNikWQwQ+KAY4kEl6rXCnwM1r5ULhuoxF
	 IXjvScq9AEPcW8TF6vdj8yIYwMh5mlLnDGGCU3epoQIKfw+SK3B2KjaeyrDxQy+Ico9AF
	 L+6LidX7GLRlQPphgfpHcJGz2SyuK0vwalhNAOMZWR1UFo6vixijpO3Xg8tvn5tm/fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfOJBDrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D84606A320
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfOJBDrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C02E1F000D0
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795176707;
	bh=Npj84u5KtbvSHzJsKcBdTvmxE7ZchjU80UhtR/KP1IM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NfOJBDrU+8uqBxTCgiWeoBNzzecW/HOJHsMY6JiqTv7/xrxwYu0van0wavFs3f83+
	 IqOb9MJUhcfHFjNsssEE3yrNPKX+AMkJhZ8A6RStW8jCpE95xCy6Mlilw5mIju/IJH
	 +1f+dc9BbuSpPf3t+ZHaBFAEHlw4D4tJTQ34M/aGOpvUUIro09WzcLtERs31stMc1m
	 YXny3l2zEmjl8uA+bFpq7/4IkkBeYG2kZ+kt2hv3yhCRB6aYBwz1O0mtgBjIXxNLb3
	 0zxxbwFZxhHWFqqdKEsC6fAom+navbf7w26+3SrT8A6qKX3SHCGrPWb1sOHhTwdUIM
	 puBJfsfReN7Cw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so19021941fa.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:11:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGMVboN5hZm5SExau9Kinn1drDf4DaINZFlxiBjUOt+Xfw9hOBez0VDSZQp678lL63+4SOgstyF7Ih3wQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8vbPVeLGM7g1ETLby2khQ9LLD3PLuhYYUwMlXH2Gyzy4NQnomT
	ly0A9m6JAi/iOuOsZ0iQJ5ntU05QyvTVwPC/rVpaVwNJ2Sy7idvXm1xENheHU9vb1QlutkG2HUd
	8ARgighHAym89DCxQwV+yFEId4Bvz7UY=
X-Received: by 2002:a2e:b8c7:0:b0:3a9:829e:1def with SMTP id
 38308e7fff4ca-3ae7b7fc01fmr11147741fa.21.1795176706056; Fri, 20 Nov 2026
 04:11:46 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1978814.tdWV9SEqCh@rafael.j.wysocki> <3453847.44csPzL39Z@rafael.j.wysocki>
 <c1a2c90f-c667-4bf2-bbc0-2cb3f840ad97@rowland.harvard.edu>
In-Reply-To: <c1a2c90f-c667-4bf2-bbc0-2cb3f840ad97@rowland.harvard.edu>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 13:11:33 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jX8iR5x2eS1uAf_P12Ke_OBq6kx2FRCiVuSRRRDgMzLQ@mail.gmail.com>
X-Gm-Features: Aa3M54qEyXo2NhJpzQ4sNJz2pWKF95GlSunca3HEglNsNnFA3MTXYEZGVJtG7oQ
Message-ID: <CAJZ5v0jX8iR5x2eS1uAf_P12Ke_OBq6kx2FRCiVuSRRRDgMzLQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] PM: runtime: Drop space characters preceding labels
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:47=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Nov 19, 2026 at 09:17:08PM +0100, Rafael J. Wysocki wrote:
> > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >
> > Drop space characters preceding labels from the core runtime PM code.
> >
> > No functional impact.
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
>
> There actually is a valid reason for keeping the spaces before
> statement labels, although you may not agree with it.  Namely, the space
> prevents "diff -p" from thinking that the label is the start of a new
> function definition.  That's why I put a single space before statement
> labels in the code I write.

But this is not done elsewhere in the kernel and there is already some
inconsistency in that respect in runtime.c.

Since the next patch is adding a new label, I thought it would be
better to make it all consistent first and I chose to follow the
common kernel coding style.
