Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B84481FCE
	for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239859; cv=none; b=JBVWusa/6LchQ2UTYyprmvvoVWiK0A2Jv42HBJDNUcFcvp+JgB/9bRIKZNAWSneubYm1AlGmVxwrCUC9ur/R2F3pGkNHiJ07K/yMAsWVbPnXiDUbZ7WTqT0IcClvHX4c1Fzfxoscr5V3fJZAeoBNoys5Z8h/iulY8seOHj1BGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239859; c=relaxed/simple;
	bh=iIAFp9XLLpWBg1VBc2h/xbYWjU/67rR5/frCRJudeDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEfoH/kug4+sY18kqh3s/NrtRIDRqAFZZaHZra0Qw1Ah7G/23HPmZfNn8YDgjfrpk0U5Nsd9W5vHjZ8g5Q2UMVf9RNwLvi7RfpCCvOxQWiNK3Llvx8Yt0p9+OoVvCf7gKdfe5h9SjjVF4k6VpdAbWtfxzgMs4JCDOpP+qdycVCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=AYk3Erz6; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="AYk3Erz6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=llVt+F8HaFCu44DBrdXSlZ8OVlshoVuRrPSCHUpQ4Ew=; t=1792239857; x=1793103857; 
	b=AYk3Erz6HyEj7oBCX+Wm/Ivp+GncmxsjaVOqWn/GFvAFzpSKF9ENfK4+MRB3gF8hH6JyvasN2Va
	hNXn4EAauzpyVjZvYTFTLGATAL3+MsW/xploLJSLKwUEB54vNkwpl6rVxdO17A8tmNoLFYPwibziI
	4IB10saokCOn4sdHnFuj4/ShTfpGUzFl1CREc2uL1Qd8kA8viMcZfE64W/NkJLTZv+DG8NanWC6DG
	Na2a02qrjWpXPCAJBsNgrSz3fDfrv13B26BgxG9e7wPMJbrIMZfuJoqFe8R6TU/hB3F1bu7mc7uA6
	3bqIclMGkMP6O07Hv6fJZYgfrCdMswkpGoOg==;
Received: from mail-dy1-f174.google.com ([74.125.82.174])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xI3SS-001jAW-Jz
	for driver-core@lists.linux.dev;
	Sat, 17 Oct 2026 08:24:16 -0400
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so629954eec.0
        for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 05:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWhgnGQevDm7wPslwjrrrniwBEe+d8cPCeLsvUjVhE9VuvS+UCodI6DUoiouZvGu+fFta2OJcKa/QMoA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLmpOpb85nXTjvczgwfFQGkrP68Wk2INc/6qySRakxVps9CpVxU
	UgQubenVX2XfVpVoqoOJFemCHlvufhCj8AsyHDxz5jYRamK50/eC0TXifmlNRB7liKALuwmGM/B
	NmjpsITlm5QndMRH1iBpE6q/PH87epK0=
X-Received: by 2002:a05:7023:88d:b0:13b:2f26:6881 with SMTP id
 a92af1059eb24-1850c8da5d9mr4120200c88.4.1792239855579; Sat, 17 Oct 2026
 05:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261017020935.792500-1-nickolai@csail.mit.edu> <2026101755-mangy-flatterer-3d87@gregkh>
In-Reply-To: <2026101755-mangy-flatterer-3d87@gregkh>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 17 Oct 2026 08:24:03 -0400
X-Gmail-Original-Message-ID: <CADGQE7EpdbtkzzH53Jh1yZ+nv6oCQsLiH6FDN=DxyFCwTjFE=Q@mail.gmail.com>
X-Gm-Features: AclHuK8iZfBvAYDQEDzkzDSxhtneAJiFsBHTblh6rHaf5sfiqiIVGrNdarvADIw
Message-ID: <CADGQE7EpdbtkzzH53Jh1yZ+nv6oCQsLiH6FDN=DxyFCwTjFE=Q@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: unbind only the driver whose unbind file
 was written
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 5:49=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > The pattern is as old as the unbind file: the check was never under the
> > lock and the release never named the driver.  The locked variant has
> > existed since commit 4bdb35506b89 ("driver core: Add a wrapper around
> > __device_release_driver()") added the drv argument to
> > device_release_driver_internal() for driver_detach(), which has the
> > same requirement.
>
> Because this has always been present, and no one has actually reported
> this, perhaps it is not really a problem at all?  In other words, what
> real-life-use requires this?  Again, bind/unbind is for developers only.

The goal was to pin down a precise spec of what should happen when
writing a device name A to /sys/bus/B/drivers/D/unbind.  I think the
intended effect is that it should unbind driver D from device A.  The
code already has a check that tries to ensure this.  However, the
check isn't technically enough to achieve this precise effect, in the
presence of concurrent operations on other cores (like
binding/unbinding other drivers to the same device).

It sounds like this level of precise specification under weird
concurrent operations isn't useful for developer-facing interfaces.
I'll stick to more clear-cut bugs.

> ...
> > Found by formal verification of drivers/base/bus.c.
>
> Where is the formal verification proof?  Please don't have your LLM
> claim this without that as it's pointless.

The intended point was to give some indication of where this patch is
coming from: it aims to formally prove something about the behavior of
the kernel, rather than fix any specific issue encountered by a Linux
user.  There isn't a formal spec for the Linux user-kernel boundary,
though (as in the above example: what exactly should happen in this
weird concurrent scenario?), so for many cases I'm trying to infer
what the expected spec is.

Happy to describe it in more detail once I have a coherent checkpoint.
The current proofs aren't complete for Linux yet; we'll see if it's
possible to get there.  We verified a smaller OS kernel
(https://arxiv.org/abs/2609.04043) and now I'm trying to do the same
for Linux, roughly speaking.

Nickolai.
