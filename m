Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1103C0604;
	Mon, 27 Jul 2026 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130944; cv=none; b=a33KZE7X3N/XxVeMifoVUoQO42NcVsSdJUkLITXhEx3IkMMlFPhfNMDBdIc4ZsSsie3LmwLYLofrFybACzIiGUqKXTF4e86Mowukk0lX6yviO2v3k9i2qrvY3QUTjloAWZHRLjyCi78s+jJtMobNAlqhi78WWICZzJuS3q00hBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130944; c=relaxed/simple;
	bh=51t5vxEMDVj8nQTP6Sr4u0a15YnGCLCIKZEWA9l1EFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkF+3AboN00xlePLXlBkYElgXuA9t6dS1/KFJQ5cIRapHohQ+GrcILjwWn++XfCaU5RogiHniQFT2IGerGUFo0mHEjAL4ny9NLGlv6G3Yp2KfijHyPan0D22SFUnVfN885SWG1gh/ikgVW6VlmWEQ3gX6XOPykvIv43MeJ37Aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m4v4fwI7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m4v4fwI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F6B1F000E9;
	Mon, 27 Jul 2026 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785130943;
	bh=sw5c3zEWmNLiFwyC5EpyUwsQK+18O21cg2u/HuS1E3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4v4fwI7HLnf3cF6GTv2aBAiY67mbciXxTwp74icp6oR8H3pRLyVOXj/LtBkpw3AE
	 qZGk62rfdSRkomFPrCbGfzzxqBgcp2iwUcfDWsyHxBRC70o5jP/LODe9o8wW4n+Spg
	 X+darfUhN9bONK5c0oatfZLSbMp6Id/xnrIkDR60=
Date: Mon, 27 Jul 2026 07:40:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <2026072729-driller-leggings-e530@gregkh>
References: <ambsuv_6mCK8U9IP@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ambsuv_6mCK8U9IP@google.com>

On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> driver_allows_async_probing() to allow asynchronous probing for drivers
> marked with this type.
> 
> While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> preference. Subsystems that require asynchronous probing (such as slow
> legacy buses) need a dedicated probe type to guarantee asynchronous
> execution.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> I am planning to rework serio and gameport subsystems to rely on
> asynchronous probing instead of rolling their own implementations.

What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
you for those subsystems?

thanks,

greg k-h
