Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0E1AAE17;
	Tue, 21 Apr 2026 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753079; cv=none; b=Sq3TC9ZlLrJPjQP2gg3IMhgTBUdxXYSgnIDfDCDIFFc9hpL79zlLNUCg7c0pib78wiwYnFyQprbtT32ZEJCscmcL1xQE2ox4fMvF/oKzmScKZ2QVuPG707z/CFHSaLFY2C2cajyI2KavNHfxtQiFUYR4bfhHMxgWLwj3mXT8/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753079; c=relaxed/simple;
	bh=TIJXwtcCmLE0kVFsgy1/dYG6+Vajc5FKa4ZsgklQkck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8BoJ6tDrSEE9/LFpaiWHMWw+0Skuvr3ux1587rBgOlIKEPeTCmFhW/GWnxRJkRz3oq69E9T76fydYKxJPfWE+f7JW67PwDeVplmtOM4rIOT8Lo4MsKtRjD7x5v3Z5PFONfISVYzCL2xppHCAW/7kpZAT49B2bjCL1hzGyQpwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=05d9wSNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="05d9wSNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2670EC2BCB0;
	Tue, 21 Apr 2026 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776753079;
	bh=TIJXwtcCmLE0kVFsgy1/dYG6+Vajc5FKa4ZsgklQkck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05d9wSNNb6ROBpL8AoCE0Jwlf8TGI8KxmBNBZaD2+2UDBqTWB7WMMV+ZCHHyrWNHr
	 rEX053i3uhyPfCmS7wkyaeayjGtWJU6V8YHj9HyXe5pzyMSj2GY6wQmEtY5TYM2Zny
	 abVBL4a/CrA6y/R9tXM/jHNf3mfceBxSxdy0k4Pk=
Date: Tue, 21 Apr 2026 08:30:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: move dev_has_sync_state() to
 drivers/base/base.h
Message-ID: <2026042136-endeared-wharf-53be@gregkh>
References: <20260420234153.2898532-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420234153.2898532-1-dakr@kernel.org>

On Tue, Apr 21, 2026 at 01:40:44AM +0200, Danilo Krummrich wrote:
> All callers of dev_has_sync_state() are in drivers/base/ and any attempt
> to use it outside of driver-core should require good justification, so
> there is no need to have it defined in include/linux/device.h.
> 
> Thus, move it to drivers/base/base.h.
> 
> Suggested-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Link: https://lore.kernel.org/driver-core/CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Goes on top of [1].
> 
> [1] https://lore.kernel.org/driver-core/20260418162221.1121873-1-dakr@kernel.org/
> ---
>  drivers/base/base.h    | 14 ++++++++++++++
>  include/linux/device.h | 14 --------------
>  2 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
