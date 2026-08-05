Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A363E559C;
	Wed,  5 Aug 2026 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916825; cv=none; b=VdLyvv5RxJe/4kB4w3fCi1xPk6vF7fQ0nOUWUiAHxjjNJIJQSiwdcjw61mJha4Uu8wW/zkW6ymOMbRrKyott7JLQi8UuiVYGlpcrfUZCI8CAVZe6cQZjPoXjZzpuCOv5mih51Z11rti7MK4Jo1ZaZe0x+avUTNjB3mgg9Cm0nBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916825; c=relaxed/simple;
	bh=pGnroZfpGni6ItJLkS+ANns+XQvd2bl2afF2hLBCi2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeGwmZgaHbxOHOleOXFPpaA9VHSWht4WwzfGTmFFD3z2z4NZ6OOB3MY1hrS1lo0b6biH2I0TNtuWpi6IleFXK9bUuoHnTORrAbnYgUwgNMK776vCOuouGQNBhY8EPTbNeS7cImefnfBGeFubyn3NoLzyXy8K07qZlH+g9730GzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uD0idblF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uD0idblF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720D21F000E9;
	Wed,  5 Aug 2026 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785916823;
	bh=1byFfLL4NPFq1NKmyjeXRFBmMgY30Us5DB9Y1sGimu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uD0idblFSLyXeDuiOPhrdjDzsHzXL01oi2DXaShaqGrYM0KcvJFKiHtfUzXGck5AM
	 8PWDQKPYQPNGpKnLmC8h0EllvBPUpHPGRQRDHZ2tjAisDPtE5QQPOJ+TKl++UH5rrv
	 0tPzzBROuqI7VS6uqxzd99ysLfJKTmL2KYieipi8=
Date: Wed, 5 Aug 2026 10:00:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: dakr@kernel.org, djakov@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	rafael@kernel.org
Subject: Re: [PATCH] debugfs: serialize debugfs_create_str() writers
Message-ID: <2026080522-viper-movie-1c35@gregkh>
References: <2026080349-gristle-underdone-415d@gregkh>
 <20260804055056.877823-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804055056.877823-1-chenyichong@uniontech.com>

On Tue, Aug 04, 2026 at 01:50:56PM +0800, Yichong Chen wrote:
> Hi Greg,
> 
> I tried the direction you suggested and converted the SoundWire
> firmware_file debugfs entry away from debugfs_create_str().
> 
> The draft diff below does two things:
> 
>   1. debugfs_create_str() becomes read-only only.  It drops write
>      permission bits from the requested mode.  If the caller passed only
>      write bits, it creates an owner-readable file instead of a 0000 file.

If the caller passes write bits, the function should fail to create the
file at all, to make it easy to determine what just went wrong :)

>   2. drivers/soundwire/debugfs.c uses debugfs_create_file() with a small
>      local write-only file operation for firmware_file.

Great!

> The SoundWire command path copies firmware_file under a mutex before using
> it for request_firmware(), so a later debugfs write can replace the global
> string without invalidating the name being used by the command.

As this is debugging only, and root only, and loading firmware files
which better only be done by a developer on their own, this should be
fine and not really an issue at all (i.e. if it breaks, they get to keep
the pieces of their broken system...)

> I tested the generic debugfs_create_str() mode handling with a small test
> module:
> 
>   0444 -> 0444, readable, write fails
>   0600 -> 0400, readable, write fails
>   0200 -> 0400, readable, write fails
> 
> I do not have SoundWire hardware in my test VM, so I could only build that
> part.
> 
> Does this match the direction you had in mind?  If so, I can finish the
> conversion for the interconnect writable string users as well and send a
> proper v2.

Sure, but it should be a patch series, first convert the existing write
string usages to local copies, and then change the debugfs code to
refuse to handle writing strings.

thanks,

greg k-h
