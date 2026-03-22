Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB31A267;
	Sun, 22 Mar 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182653; cv=none; b=K2NmGUrmuh5r5oBe4dLGvNkoVaoHlTI4fBYGiX0nct7XIiFyjhX/Bm9A3uxAGTQoekmqgIvDxbHshotaLwn0ren0H1AMKcNfApe2VTQQDzoEltW+DigJKrGI/gEGCaq/MYbt0mJcrFexfoNmorb7lYMurHbMJ0NyfYmH/p6WDus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182653; c=relaxed/simple;
	bh=IIERk74rwbVYxnAmOkvl+HZg7GaA2Vf/XUpDG/BQz7U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=jFuQnpEZyrwZ6lJz0bsI1pSb2tQwEZq3t/M/n07hHkpZP1R8vVJeZmKZeD1MLd62aAnmDHUiJRl4/8MP1O2qJQGseP45yRMkNj4eb3Y5WjgCI8JZNh8VCTGaLMoKqg0ZsLmTgh9wyGELvTxzLz1m6CqSrwBhH4P23zlErPypE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5LUB+hz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5LUB+hz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F6DC19424;
	Sun, 22 Mar 2026 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774182653;
	bh=IIERk74rwbVYxnAmOkvl+HZg7GaA2Vf/XUpDG/BQz7U=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=V5LUB+hzy3e1isOhgJ3KDTN9SB7kfg84zczcMBmJceOhzOMZzuorktTGztVMd/B1G
	 rzFBLsFAf43mCROvwhfCVCBtvkbKEWSXNeu46gnyArGY4bbNXNDsn0CZ9IGf/ZARz7
	 XhGabyJsBGaAYfv4Vnh2Gnn1hA5HiXY2KaknPv5SJp+vQGBxgd3Hg0XM3peG/BZIik
	 GGzt4JiNc5FimktgrdFbiMO8iP8cIR2RiPEyvQ2+CJAhe2zI3gC72O17TRKEu3wVUx
	 Y/Jp7QrDfwABCrwdKtX16Expo9abEzEGLec+i1XZe/BAR4F2iCfX7iW5wAzYNLZ+Xv
	 b6/T4fU3NbjPA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 13:30:49 +0100
Message-Id: <DH9B9DJ5EPIE.2019ZR2OA8ZR9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc5
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
References: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
 <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>
In-Reply-To: <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>

On Sun Mar 22, 2026 at 1:08 AM CET, Linus Torvalds wrote:
> I'm not convinced there are advantages to going through individual
> trees - these are just buses working around driver core interface
> issues, not some "bus X does bus X things".

I figured it could be a bit safer to let subsystems pick things up themselv=
es at
their own pace, as two of those stand out a bit.

SPI and AP explicitly print "\n" when driver_override is not set, whereas a=
ll
other buses always pass the pointer directly to sysfs_emit(), which results=
 in
"(null)\n" instead.

AP also has a custom driver_override counter, which is updated in the sysfs
store() callback.

> That said, I'm also not convinced this is all really -rc material in
> the first place. This issue is neither new nor does the UAF seem to be
> triggerable in any actual realistic scenario, and requires root
> privileges to trigger even in the unrealistic case.

I don't disagree; the reason I sent this regardless is that we already had =
a
(simpler) fix in place that we reverted in -rc3, so I figured it is not
unreasonable to follow this up right away.

I think none of the above are strong reasons though (i.e. the fact we alrea=
dy
had a fix in place does not make the underlying issue any more urgent).

That said, deferring until the merge window seems fair.

- Danilo
