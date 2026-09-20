Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE544E675
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938853; cv=pass; b=m6vOUisMzPU+6zbna0kgp7c7jJ0ICXpp4V5tqQGrxAvo/5dHQeEQUoabXXYIBGFEd6PpiiIbhbcPeVscRYczlvJ05QSlHVz+mpGQTMR/N0HP3wQ86sg4u2peL8zsT31SLresgSMxX+ruVtGTSlZllaeTncumTy9VN5ieQSfqZZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938853; c=relaxed/simple;
	bh=ZP2LKBPL0cBLk5dPcCtHOiZGDZ5qkSE7LN4mdOu118g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya1RSY3wUvsqFQzDrCpGjJrhfWyuzokOckuv1x/75wmrYWKSNIZBs2IpI8nzb0FQSSfU1u22w4BsgTf7kxX4tSNp7ugBe0sCZc5EDzrQSyNcAi/KNqZS1j8G5q3FCj3lJIqR7MwhsCoOl0iHIhOVRc1OZCrOqcYXbGH+r0mnMgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=LHPgNSBy; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="LHPgNSBy"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895eaf306cfso17471107b3.1
        for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 14:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938851; cv=none;
        d=google.com; s=arc-20260327;
        b=YTrF4nZiHlBtBw1QQEFUUyH4Ttt84D0y2jIoDGcSpSD2my/3dVm42wry1YLikdVR/H
         tmrMB85pmUYvGua/gklQE9vdJFgh/udA60AzZP+uSsKObo9y2rjU+zWd0g/NxYxkRb9d
         p3edXWPUv/Qvy4K6mQpai5+lQbaEzpwZZOFBCc4/L4NxhyhPgNKx9+KfbELLVazuV+2e
         HExIeB3kC9u3wOZpmv++MGpkGQ0IvdgQ3zb7Dd7YjPvrbezYfkM6mBgkMoQS85bOp959
         aYPClTxFiE9Rxt8rJLHyHI4VatM37g2gPAD9dOyzLst5U7JGo6WjlHca/JThlId3up2I
         7uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        fh=8jV4ldqLkW8ooPBVgISGoS3uyOMH1REzeqgBsfw6jQ4=;
        b=dwTHvA3ncvxuW1jUsYOft7eQayKvQOUgnw4YzhNLJLk6tv2jKDKbNXqWVs0GnbSAzS
         vS7F/r64boY5tX4Tsh5uwsSmVsT5vA+4rbXgoObB7eTEkHNn7x6HT3fOZsLjKhhKgH80
         +NWUxyl8r/c5YCZUDlw0lSgVAuPA23aVmcjoTJ7YDGIa3GRKpNEDBkS3s7jsg0RGtbWX
         7X8dyfeDpdsZQG5xU+2QJlDR4o9IN3gUzyhORSxsHaVc1w6KF1EEU0CS1cNGorJp6Xyy
         Bs8/6QyDFUx+guC5bbyKT5lhsJAqb7y9RDrZLkQTt7DRIPbHi2plmYuYOfxV3g2JMzIJ
         nVfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789938851; x=1790543651; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=LHPgNSByCFttZntD3xq6ZfBgMzKuCaDDjMOvENyp9gujhMbW4vJm7qhSH+uNcCFB+Z
         HSRlxUKQvKB2/pW6MwQPPZVHu9ilwZckE8Ee4m6yh2FQ8Wgv0foDa83tEfQR+Mh6nk06
         7R4i0R27xzsxCvtTKYjdtsSh2nX+wO0JlPCQh0SQwgXDnc8S9rJx+oL2+K9lmamjqO14
         Sgdq6jj2bBt2FU5fPzT+pI5x8Auveq6HNt14O6vi2khPUwdEq66yVSFXfZ0MX6+CpPTw
         8dmIG1rrUxEbJnmGch9F4wcc76ajPKW63iZ9xRrsrs5Xk9R/3JQmb6ENg3HHO5OZpaUw
         d4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938851; x=1790543651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=tP4aLa3/wHUGwIuzkZEm/ft9VNAMhIdyaO9xLuTleYf372UL9gV7eV6lbFOBX75ZUL
         X/f1/TpFmKCBhyAwA72FTJxwjbHmDpMeqa3VHDoAtCzm5RAWpKJMMBa1349fwdphPXTo
         4fWAHUYhv62A0xLPXSMoxtc/mu4sz47TgrJDSxc5qKGo6MFGsA6QAsAQB8OvP5vKEmiI
         oozpdi2LHAvzkW1Mq9RozErvqtEkrTB8UGYoM3c0Lob8uWx2Ojhhy0L9P2cfIGRl+/no
         9/7AJvjILZk4HpXLrxwVo8bxCtpHa5qrzt2KUYr/XQFXVvdpM3gCL3vXpU/0w4q4vIaC
         pa3w==
X-Forwarded-Encrypted: i=1; AKwUvBzh5U4qOLir3SmecUOJiC8mq45ApEwVQfo/qS3a3PHhtN3T91aPsgmjgcHnGEfADPH+71ahXXAUHUiskA==@lists.linux.dev
X-Gm-Message-State: AFuF++mpuWOIPGwHJMaDuqxKzJCoDe89ntpPKfAttdSZSGc1SsTLNq4s
	IkePW1NvF1eSgsVlNF0iZVoWT8N/TYYZioCvxhBFQg6y6QViEmF1JMVs4TT9/F+OUVbdTHErC6n
	vTEZEjUnzu1a7xrVMR06a0S2E0cPV8+UzQWd9juR+4/U=
X-Gm-Gg: AYBFou21KBsR7YrCUmdnn2KwcTmrHS99s/m1q+7MnnMwf2qod6Eggbhpj4hwikL/XKU
	JGlgg/6ZPL28egmTLqdxDyxiJkMMq479FiXuKYxSvWKqwVOyBJOHM0s+x8GSJnnvox79Xb3FVfS
	U04aGRvay41BeeP2+4LNOeJPMbUxYXuaVry52vZPtRCgnyJKbE6P1TJ/y7YAbio1u6oJ5kVdQIT
	hYMMcAFyQgR1IlhD5BavYzI1T8cbu2LdZlWcuaD1h2VJdsRuJwRiC2B6qK9HAqk/Y5SPTrn0cjJ
	rYs7qbuyzzkVD3055TbausAECtoYX+lFSumKPduVE0YG7yXcrTlBiYXnXMStjpRltCbZKd34JFi
	oe7hCKiiSr8uN0J2twPctMxabLDkTVdfbWN4UEmqUuRroXpD1aTVaTd+a8GOGUApvuopgw6P9wK
	vrsYs7dHJ15Ad4dg==
X-Received: by 2002:a05:690c:e681:10b0:863:e8cb:7773 with SMTP id
 00721157ae682-897346e315dmr20106047b3.32.1789938851178; Sun, 20 Sep 2026
 14:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
 <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com> <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
In-Reply-To: <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 02:43:56 +0530
X-Gm-Features: AcwNN1WbQLG4glywQGVIDhxD1uJUtzAMcMfTWSPukcrARUaPtDIjPzyQr6Yayyo
Message-ID: <CAE2Bdm1zFXr7UErCUR5KR-aGj=baCh--gaiDzZhjepF-_6H6ZA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
> ...
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.

I have encountered some bugs with the sashiko bot. So, this gives me
the perfect opportunity to
re-design with your inputs and propose an RFC-style doc including a
bigger patch within the next
day.

Regards,
- Chris

"But how could you live and have no story to tell?"

On Mon, 21 Sept 2026 at 02:39, Richard Weinberger <richard@nod.at> wrote:
>
> Am Sat, Sep 19, 2026, 16:44 schrieb Chris Roy <iam@thechris.in>:
>
> > On Sat, Sep 19, 2026, Richard Weinberger wrote:
> > > While we're here, maybe it's time to add a decent configfs interface to
> > > this driver instead of configuring through module parameters.
> > > That way also multiple instances are possible.
> > >
> > > IMHO testing is the only use case. I use it regularly.
> >
> > I would love to look at this if you think it's worth the added
> > complexity. A couple of design questions before I start
> > on anything:
> >
> > - Does configfs coexist with the existing block2mtd= module param
> >   (for early-boot/cmdline compatibility), or replace it outright?
>
> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
>
> > - For multiple instances, would a configfs group per device (backing
> >   path, erase size, label) match what you had in mind?
> >
>
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.
>
> > Can sketch an RFC-style doc once I have a sense of the above.
>
> Sounds good.
>
> Thanks,
> //richard
