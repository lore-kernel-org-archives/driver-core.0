Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345B40756D;
	Wed, 29 Apr 2026 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479486; cv=none; b=MvG/FV55kjLUr0pSZGdYhullbAeNA68A89mGTtHPR3GsI3iFMUC/J8XD0VNdk52EGCtPk8iR3bnP37g70olmRfuWyG3htv/HkzUGkq5VFctVRSc/pVf3MehpsUEfLuZiQM/MCIEUWn4hYBY3kFxovd463LfIvavXPxwyrvTnexs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479486; c=relaxed/simple;
	bh=7fONDqNyo/LJDMc44vVtEzOc7fJ2y7pveDW55Yz+9zc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=pTfb8jVsGZssyKFh4+aFQ5ekwB6LJdo12e/9QdbEpDaCfxsWidCYPcHaZkXKoVJkLEvm4VehJZ6rw1uYNSFdwc2UFBZad74VBCGzSML1PNx8B/xQ25AmXr6JRKtCfa0rPCThMTwviGUMFh+Uy9nS0qbSDcEigk3aTUZBFykVyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajauS0IW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajauS0IW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B19FC19425;
	Wed, 29 Apr 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777479485;
	bh=7fONDqNyo/LJDMc44vVtEzOc7fJ2y7pveDW55Yz+9zc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=ajauS0IWMXt34EtZsGSM5hp5OXOTR3jrCduB0RXBO07iB3JmU0z+8FeRagCBbKWcc
	 LpSYcNp16nKLxb4eTyGWBDrCjtSkt1K7nWUih1MDH5TODZCnKSUkX5IqbWUUirCvnw
	 twxc/B74V0Qd/C6ug+RAy+xVm8a1SlJGLFEa6MsdWY8OLbilasQWmi/GtuEQZDTJ9R
	 Rm66VNxDXR4+ktRWqhjrSQdPD/qkpmf4lJW5aQ7u+teZJPPypV4oaRVJVnW97nZ90z
	 gLgMIKPJNb9G93k+zq/ENpYC6XJlYMRExaXxu16D38CzGDv9x9tBSyAVjKnslf0foP
	 XyzlSJiTV2FZg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 18:18:01 +0200
Message-Id: <DI5RW1116MXY.3C53BWGR52Q0L@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
References: <20260427102852.2174-1-johan@kernel.org>
 <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
 <afHZWasOhRaeBCnt@hovoldconsulting.com>
 <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>
 <afHsgv9SUqfn-G1x@hovoldconsulting.com>
 <DI5Q29QMNVNH.1B2N4VBA2ZVQW@kernel.org>
 <afIe495IbAe7EeDt@hovoldconsulting.com>
 <DI5QUINEJC6U.32I161SD0KU76@kernel.org>
 <afIrCO3QSL3hx10S@hovoldconsulting.com>
In-Reply-To: <afIrCO3QSL3hx10S@hovoldconsulting.com>

On Wed Apr 29, 2026 at 6:00 PM CEST, Johan Hovold wrote:
> namely that
>
> 	 registration [...] succeeds [but] without the device being
> 	 added to the bus.

[...]

> Perhaps I can add "(i.e. as if it were a bus-less device)" to stress it
> more but I'm not sure it's needed.

I think that would be good, thanks!

Your above quote only vaguely implies that and I think it is pretty hard to
infer that without already being aware of this implication.

It even deserves more emphasis; the current commit message reads as if it's=
 only
about adding an additional warning.

Thanks,
Danilo
