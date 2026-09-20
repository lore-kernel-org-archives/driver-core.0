Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596B370D63
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938553; cv=none; b=dkPhUIMrAnrSQrqSrJJnG8CgNcI6idpomI4d1DkWYZnZPRdKTfjvJtcpiT39mz0UdeG3DnyFvbW13rvSPCmjCYKQjX71zCJXSriwt9pO7jnE4aDfhj6FszxvxlXeYB+JKN+TY8PTqGRjFHQtPVzrZbKYbcEqM/xsnEeRqw6jyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938553; c=relaxed/simple;
	bh=Jx6GLE1okRJrOrd+7U5aGLbk3fTLygkWECnNtu20Fjg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=hIb4ApNy4WBiB9dDWJMc0/lG9hX95Tug/oDkfRFbFjhAXZ3bn4LCO3Z5Uu/URBnUQl8rVC5LLLGVDw8mhmHa5yjGjoFr6xMW2MYCOMX26E1yJ/PxWjb++AQ/W/7t+CKuo23+BoddF2y2sugnIjCCMCr1NzCUXvG6amFelfpjgCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=duy9tcqO; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=Mee3cxQN; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="duy9tcqO";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="Mee3cxQN"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789938548; bh=7Owhjo1ECLMiH1zOqdk1V3g
	VQhCw/Iw6xOoJ8dUCtB0=; b=duy9tcqOaX5fg9dXjBaxzEgXY9e/YX5aRrv8VcuqMoMWpGlpal
	f1Unx4Hqfq1bAar0kCrWGKauu3r1ZciWlLDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789938548; bh=7Owhjo1ECLMiH1zOqdk1V3g
	VQhCw/Iw6xOoJ8dUCtB0=; b=Mee3cxQNVitki65Um3KOTaTmK4S/YY+UZfcX5CUrV68zVzJ2dK
	slcCnRCQBFsA083s+qiBJGHixtUprH9Y9OW8RuPQteSYSK9xFEpp1T59+OAIyangp/jnKK82TDs
	yqD19SFCqvWuNnZFImUf05E006yKcYVQQq9MlFfipBZ/+yT+inmlvci42BMeJ+wdOPNFcz8bQ7O
	c1nwPusxdJzGa/Od3sWoar/zDzoGY9t0uSQPE680OR/eDFYKJku6OjBfYU5kHKawYo9gnne6Ysq
	DFJyFsl4nNKGBdr2PDMzcBoZxqUZzHk1jcnKCGyouajZmlSpTaO5+tNtQA7e95q5Y9g==;
From: "Richard Weinberger" <richard@nod.at>
To: "Chris Roy" <iam@thechris.in>
Cc: =?utf-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, "Greg KH"
 <gregkh@linuxfoundation.org>, "syzbot"
 <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, <dakr@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rafael@kernel.org>,
 <syzkaller-bugs@googlegroups.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, "Adarsh Das"
 <adarshdas950@gmail.com>
Subject: AW: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
In-Reply-To: <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org>
 <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
 <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
Date: Sun, 20 Sep 2026 21:09:08 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Sat, Sep 19, 2026, 16:44 schrieb Chris Roy <iam@thechris.in>:

> On Sat, Sep 19, 2026, Richard Weinberger wrote:
> > While we're here, maybe it's time to add a decent configfs interface to
> > this driver instead of configuring through module parameters.
> > That way also multiple instances are possible.
> >
> > IMHO testing is the only use case. I use it regularly.
>=20
> I would love to look at this if you think it's worth the added
> complexity. A couple of design questions before I start
> on anything:
>=20
> - Does configfs coexist with the existing block2mtd=3D module param
>   (for early-boot/cmdline compatibility), or replace it outright?

Keeping the module parameters is not a hard requirement but would be nice.
Ideally, the module parameters prove an initial configfs setting.=20

> - For multiple instances, would a configfs group per device (backing
>   path, erase size, label) match what you had in mind?
>

Yes. See how nvmet uses configfs. A similar, but simpler, approach
will do it for block2mtd too.

> Can sketch an RFC-style doc once I have a sense of the above.

Sounds good.

Thanks,
//richard
