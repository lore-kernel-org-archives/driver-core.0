Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8AB254AFF;
	Tue, 28 Apr 2026 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403347; cv=none; b=cwl5ydFASpgj72AkC2c/jERfjNfbyBkHKZWKizE1aEmHYXUOjv/KeI1Kdd7BzVhNgtVdCRffnVl0Yw4R0Zm5pIxdTMZxlXmGtAEyrg5V+rUmVrWRziGgzs7uOJX8o3CPc3GcAoejhTB6XynJIVZCoNMHAPo5y8JXhHyc+2xQ4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403347; c=relaxed/simple;
	bh=ocJvvASwHJXGqul5EgVMznwfHwqEfsA0HFGUJW80Gbo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BaSjVeECmSf4nplo15ozfINc7TXyCxLJ1GZTovOMdTlOtf/NlgCL7a/GTtTCf7TBrgcAwD6tEEfS5+p1DzHA1FI66Q2Fs2mqYOTtQcfAxDMxuJXH+wt/OkwvBFbpt5N084iX2A6NkQkfXBPMIhyYPYSLD1IfbeXHWt5jH3g9RxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9YdESbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9YdESbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3B1C2BCAF;
	Tue, 28 Apr 2026 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777403347;
	bh=ocJvvASwHJXGqul5EgVMznwfHwqEfsA0HFGUJW80Gbo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=J9YdESbZ8b+YWTUZVJ53AXLW+iid7Zo9EUOeH4lFEPaiCtFI4pdmx/Vt7XTl6z4Ur
	 8tFs8+ozDNaVQkZQyobWuh8qILBC6mk931e2uKV9XvyupSu+3agFdKnn5GGtalrWdr
	 S0MG65LNK5u+dkpR2r53VI1/cDwVGFkVkvolXpuo3AJwhsstgRr+Umhs7CC27h1ZiV
	 6nR67VmX7tlkzhMdyH+hpSqrdZrRbT6j3PLGm7FEwmFDqT99706+Im1A4IxMV6TVKv
	 0ZTvjIdIu1icYbQYuQTbLoIKoCQrKkoXolByum5yC8BT5q2MPpF7q/UEo2D36EZtsq
	 CpO2TZKKrbHwA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 21:09:04 +0200
Message-Id: <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427102852.2174-1-johan@kernel.org>
In-Reply-To: <20260427102852.2174-1-johan@kernel.org>

On Mon Apr 27, 2026 at 12:28 PM CEST, Johan Hovold wrote:
> Trying to register a device on a bus which has not yet been registered
> used to trigger a NULL-pointer dereference, but since the const bus
> structure rework registration instead succeeds without the device being
> added to the bus.
>
> Reject devices with unregistered buses to catch any callers that get
> the ordering wrong and to handle bus registration failures more
> gracefully.
>
> Fixes: 5221b82d46f2 ("driver core: bus: bus_add/probe/remove_device() cle=
anups")
> Cc: stable@vger.kernel.org	# 6.3

Hm...this sounds like hardening and not like a "real" bug fix. Do you have =
a
specific reason why you added Cc: stable?
