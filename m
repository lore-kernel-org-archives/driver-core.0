Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615DF443A94;
	Thu, 30 Jul 2026 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428478; cv=none; b=hFt9xoRMyGjuitIOnH8gTd+pozAS0SmMIbOlj3H+/9IEptx9Y5lT7uk5SHwwTuXL/gV6yLKcCSNIz5sywdRE9Q5qz2Ceiq1dCDhvozR/42WUdBOsa3Y3tmgIAs8kub2L6qg3aFpasURjoudWoDX8zUxyDCj8wn6b0PRHttEuLgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428478; c=relaxed/simple;
	bh=vgAaEDYnEiyIcw8WvXb+LJM4O/djtYS0hbJLAP6qGBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8xxlNiAiI7HME1F8FvBWtpUCdMCJxXen5ol/z5F1DuWPrxcuZTl9i3Z3jpK9lVZGFU2YTfNylaR/ejRsyhAT9KJGaOvAoVyQNNJUmAoLCxnZIq0xiKCSCw1LfjT2m5RJHs11FUni196GPa49ALLv/lIXImkoUHTMC9NxNyb4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vPJ9CUUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vPJ9CUUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B676F1F000E9;
	Thu, 30 Jul 2026 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785428477;
	bh=f9wvIaksClS1jB3hklR/Msv5qmQ/ojOlrqo8+jkn6vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vPJ9CUUgL/+A/2/2zFeWe0+jlEx+O/0w5vk71RJ4KmWGMLkGVfZ81vi9T7l3eZ3L9
	 qWCIHptjOhjv+lJAcRjYraoe8LMZG7BeICluw2kWTgPa7AE8ntWWVP6BNuPA4B6gfq
	 XhaYe0CCG9+da8wV1G5HwWOW7S2tOZVR7N/7duT0=
Date: Thu, 30 Jul 2026 17:05:13 +0200
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
Message-ID: <2026073008-crane-jolly-2204@gregkh>
References: <20260730004759.3089449-1-neal@gompa.dev>
 <2026073019-emoticon-decidable-200e@gregkh>
 <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>

On Thu, Jul 30, 2026 at 10:55:00AM -0400, Neal Gompa wrote:
> On Thu, Jul 30, 2026 at 2:01 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > > On Apple ARM machines (branded Apple Silicon Macs), there is
> > > non-redistributable firmware provided in macOS that is required
> > > for Linux to leverage the hardware to run properly.
> > >
> > > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > > touchscreen, and the trackpad.
> > >
> > > In order to ensure this firmware can be installed without messing
> > > with firmware provided by linux-firmware and other packages that
> > > put things in the tree, the empty "vendor" subdirectory was created
> > > to serve this purpose. This directory is used by the asahi dracut
> > > module as part of the Asahi Linux installation process to transfer
> > > firmware from macOS to the newly installed Linux system.
> >
> > Why is this needed when there is the ability for userspace to add their
> > own firmware search path to the list today?
> >
> > We aren't going to keep adding random paths here, please use the option
> > that is designed specifically for this:
> >
> > >  * fw_path_para - module parameter - default is empty so this is ignored
> >
> > Right there.
> 
> I was not familiar with this feature, and I had inherited the patch as
> part of our cleanup effort to upstream the Asahi work. Sorry about
> that!
> 
> Based on the documentation, this is the patch I've created for our
> dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72
> 
> Is this how it is supposed to be used?

If it works, yes :)
