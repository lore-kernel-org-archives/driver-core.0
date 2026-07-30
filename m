Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13C363C75;
	Thu, 30 Jul 2026 06:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391306; cv=none; b=mH61ELyrztLxIz6+yTfa+nTFwO+8cJkuuhZG8kIzfatyPp0W/5itZL1jgfcZOTDv8qqLE1QEG0XwKHOb8ajzb4bjCYvKnd2O5H0QOQnh7H4jOpZxgvf2qi8Lj8OkPOwAQuqqYxmUf1UyH8juYGH+Up1ifA/JHZRiUT4HbeJFKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391306; c=relaxed/simple;
	bh=eoi15omz+OGIPbC5NnBafJqEOHAXSwDA46F4zFLC0TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs9btXzi96D3Mc7PrTQSjys+k4GX3gmtmgWZLxopNcAavVy7dvqjROrCeczAgGnDViG6OZNzNcgZrsq3fI+6tsoJnQ1kRajO4348tGAHOJbExi4XJhiRnOWuYn7S0TSOWThUzwTZott2a3PA4lROm1MExC9a5+fjTA4otHeq4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T32GjTBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T32GjTBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A4B1F000E9;
	Thu, 30 Jul 2026 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785391302;
	bh=JnBP3MozLqB78h8Vck0oTx7eKSL7wBDDqu2AWcK27iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T32GjTBodZ9btouiLBlZdPBy/C4hYgkSgYPQxjc97tzXgEjrIaKsNW8kjg9sd08w+
	 hM0rJL6pxpOwpHo8tl4DzCKAIRtLnp+WqivpY26rARytw3DyC90kFzF4e7EcnXEhue
	 9m+/vYUB92uhPFepVsDTxM5trc5+FDz1uwarKa6U=
Date: Thu, 30 Jul 2026 08:01:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Gompa <neal@gompa.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for
 Apple ARM platforms
Message-ID: <2026073019-emoticon-decidable-200e@gregkh>
References: <20260730004759.3089449-1-neal@gompa.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730004759.3089449-1-neal@gompa.dev>

On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> On Apple ARM machines (branded Apple Silicon Macs), there is
> non-redistributable firmware provided in macOS that is required
> for Linux to leverage the hardware to run properly.
> 
> The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> touchscreen, and the trackpad.
> 
> In order to ensure this firmware can be installed without messing
> with firmware provided by linux-firmware and other packages that
> put things in the tree, the empty "vendor" subdirectory was created
> to serve this purpose. This directory is used by the asahi dracut
> module as part of the Asahi Linux installation process to transfer
> firmware from macOS to the newly installed Linux system.

Why is this needed when there is the ability for userspace to add their
own firmware search path to the list today?

We aren't going to keep adding random paths here, please use the option
that is designed specifically for this:

>  * fw_path_para - module parameter - default is empty so this is ignored

Right there.

thanks,

greg k-h
