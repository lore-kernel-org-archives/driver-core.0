Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FF1391;
	Sun,  1 Mar 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370259; cv=none; b=G+Milmx9WkCnUwOQrM9F9Wvmn3rO9M1gaHa4WFvWFhsuU8EjFdxwmwzUBaqUaHIk24cvJ97wBPcvCrd09V93vh5dDgjYu3IK0Rv8mP3dMBnADbhVzJVFzzgGOXICvE/KdNAykFvM2nmVHBAuwNQvPuvVwbkeHf6hJ1pUOE4WPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370259; c=relaxed/simple;
	bh=Dsgt8dOkpgyu50Kn6IiMtxi64oO98KmKDY6v6hWO/Cg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=djGryqlXCgW8NwW4rpCdtNdMZjiyLpiFJLFF1NFOPyQtIyJ0D4ajDhVI4hYRBY2asDKIigCxpN/eAk+cPSOFCmhNaZ7ljYjlf1RE3tTb5Q/ytwT7MZG//dcW6FTeJSkkPWP6XNRRZHyGcffbA+1qAebrLPFtHPlEmMzcyhyWp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmBvhzpL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmBvhzpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FA1C116C6;
	Sun,  1 Mar 2026 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772370258;
	bh=Dsgt8dOkpgyu50Kn6IiMtxi64oO98KmKDY6v6hWO/Cg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lmBvhzpLpZJL/bjVtRR2+0mdlLWt+EMXHSAv5vO99DNHO8BoHk+1Cv/vSu01M82Vc
	 96RJxxfjbLwgYWN5ErcYj7MhC9r3ORK4GXxijlx/oyUqxB2RvUcmH//sM+cgmfzS+9
	 rPtt+p51ezEIZYDrFVLRs+MJ7yBem5MHqphtiBhognGeJmtVhTAPXWwsv/ehHmLs5n
	 V6lv8U/BRTFZo7WMB72pb+WbsTbrqKA0/JOlqe7d9gojKGY4YzG0U9JSUOVtoa+AfO
	 maGzpVF/oH8qRS7vRGypGRnb/RP19sJ/AGeaDXlA8Sj26vAcONbv71viVrixPjZgPv
	 jYs5jGjkQouag==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 14:04:14 +0100
Message-Id: <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>

On Sun Mar 1, 2026 at 8:44 AM CET, Linus Torvalds wrote:
> So I'm coming back to this, because it turns out this sounds like a
> horrible mistake in the end.

I came to the same conclusion following the discussion around the firewire =
oops.

> You document it as being about consistent locking

It happens that quite a few busses rely on this, and there is a possible ra=
ce
condition that can lead to UAF bugs in the context of driver_override.

I think it is rather unlikely to happen though, as it would require a user =
to
change a device's driver_override field through sysfs while the device is
matched with a driver.

In any case, this can easily be solved with a separate lock.

> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.

Yes, the problem is that when a device is already present in the system and=
 a
driver is registered on the same bus, we iterate over all devices registere=
d on
this bus to see if one of them matches. If we come across an already bound =
one
where the corresponding driver crashed while holding the device lock (e.g. =
in
probe()) we can't make any progress anymore.

Obviously, this is not an issue the other way around, i.e. when the driver =
is
present in the system first and the device is added subsequently.

> And yes, this obviously only happens for buggy driver and doesn't
> matter for _correct_ code, but about half of the kernel code is
> drivers, and that half of the kernel code is also the typically the
> most badly tested and often questionably implemented half.

I agree, it is a case that will happen regularly, and besides hurting devel=
oper
ergonomics, it potentially decreases chances of shutting things down cleanl=
y and
obtaining logs in a production environment as well.

> I really think this should be re-thought. Perhaps just reverted
> outright.

Yes, I agree and in fact I already have a few local changes to move
driver_override to struct device, provide corresponding accessors for busse=
s and
handle locking with a separate lock.

(Technically, the "move driver_override to struct device" part is orthogona=
l,
but doing it right away results in less (and much cleaner) changes.)

I do not consider those changes to be complicated and risky, but I'm not su=
re
you want to see those for one of the upcoming -rc releases (probably -rc4/5=
).

Independently, I can send a revert for -rc3.

Thanks,
Danilo
