Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F42727FD;
	Wed, 29 Apr 2026 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474331; cv=none; b=cErV9uBH1FwRPH4/3X70wqLlyDNkhMpkG5n0kHZTDISuorBWB+vTGP/hdGtwq/h375LSUqewKYo8tSnUXY0Q2G8WBcCi9m3STcQNj1Ecn3du5Xt6gd8y/E0gEFgAkXnLEjahW6JPICXnO5LcX1KdTaWzu2uN0BD+lUN9r3M2LuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474331; c=relaxed/simple;
	bh=aRZ9Zlne/5aUbQXvGNjewxA024+sqHWPF2yMItjn92A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q0vG8eaIXRZu0Uj8qyqyj7iKEA9DCoWjPBWK7A1PV6+ZG35jhJdROHQI08QjGr5C+4wsRko9bmQWSiIQBqT07tXkjAeLGxKdc6FH9YeThY/+9XVH+aFFHoTFnXmQS2hs2HPGh1jc+HleaBP0PKdRguV28hv7/i5QD3EdOn2Go2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o23adduu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o23adduu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F029EC19425;
	Wed, 29 Apr 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777474331;
	bh=aRZ9Zlne/5aUbQXvGNjewxA024+sqHWPF2yMItjn92A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=o23adduuagYBfTSwKJra5OE2eZO58EDlZcmA4C8G1QMrMfnnyrtzMezFgrSniluJs
	 a84vz6FloT1jECCOXmp+5a56arcWSXh2pZe2cBEBGUcMEi/iRBM7XoxBdFc9fChJ/b
	 xBAnGpJsyNGQ9MiNa/QGXLPmmXI/O2NrRLu8z7FGjx6/g9qzQykbeTuP0gx0Ntn8vf
	 EkKrsmwDGIHxn44589WGj5WesEZ28rzR6QsJhBsJyHvGJ0xHdzsOCJMNxvTO9XPIHc
	 QccQ9HrNx6e15P2KX8W+uqD6ZQJrGqU4b7OCNTmev4GNMMzooue6MrqsyNfOcUl9hH
	 WT59nNI11jf1w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 16:52:08 +0200
Message-Id: <DI5Q29QMNVNH.1B2N4VBA2ZVQW@kernel.org>
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427102852.2174-1-johan@kernel.org>
 <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
 <afHZWasOhRaeBCnt@hovoldconsulting.com>
 <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>
 <afHsgv9SUqfn-G1x@hovoldconsulting.com>
In-Reply-To: <afHsgv9SUqfn-G1x@hovoldconsulting.com>

On Wed Apr 29, 2026 at 1:33 PM CEST, Johan Hovold wrote:
> It seems we have differing definitions of "bug", but to me this is
> clearly a bug in driver core.

I think we do -- you are saying it is a bug that the driver core does not p=
rint
a warning when a caller introduces a bug on its own due to an ordering
violation.

While it clearly is an improvement, I indeed do not consider this a bug.
