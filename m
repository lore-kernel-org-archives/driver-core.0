Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BB3845BD;
	Fri, 12 Jun 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273759; cv=none; b=Wxca4LMSS1mevl8x9fUx21vzHXJb+SCuOkJx3Ua9ltIAd5l7Fwg7nfOwszxSYgizVoX1M0Kg4qJLuQjljXR4/CGpSHlePU3KhFwEuggRqryqiIdGM6hyoQ7bejGU0JpvxmHjVSnbjJrrh82zRgWjAvSEL+6X9/LpOgwCR4LiwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273759; c=relaxed/simple;
	bh=7WrGj9Ot3Kv51pZt16UvgNjBtfPeJcypa074pec/2ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up2Wlg9xopttoYJTcpJzfs3Cv6DtwvHivjaleXw1SHl6t6LhihfGRtJX4ouQNbur4bbHwg2tEmol/1WMkr3LvSRu3GsARcXVpF8IYJxAP5wabDMpK+QFqGNDv/xMDpkcrP6resvRv2BCf+HWmdsi9igKZZY/oRfA/Ew/d4c2ooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PHhq9MJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PHhq9MJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531BB1F00A3A;
	Fri, 12 Jun 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781273756;
	bh=s+zWxmK5UGGVohQu1ESNRAkjBpSf3y7JMXY3mtzctCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PHhq9MJK3/fyTLjL/sI7P/r4JtuodVvPg7w6JnLFiGxyNKx+oT3L2uIlSjMaCUsju
	 lyxceSXPRGsIRYVLp2i9CAylrKh/tPa3r6ewNg/MmEswt5bRljBsm4nbCjURj5bAS9
	 O3jmdvQFxdCJFJCSvfpY8PPSQfQfTHqzkF6GZqKM=
Date: Fri, 12 Jun 2026 16:14:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Message-ID: <2026061242-riverbed-drench-1e2a@gregkh>
References: <20260611-cacheinfo-v2-1-6069ef066cf3@debian.org>
 <20260612-jumping-spaniel-of-expertise-cbadcd@sudeepholla>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-jumping-spaniel-of-expertise-cbadcd@sudeepholla>

On Fri, Jun 12, 2026 at 01:48:36PM +0100, Sudeep Holla wrote:
> On Thu, Jun 11, 2026 at 04:55:13AM -0700, Breno Leitao wrote:
> > cache_setup_properties() sets use_arch_info = true when DT/ACPI
> > provide no cache nodes and the arch can derive the topology from
> > CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
> > original -ENOENT. cache_shared_cpu_map_setup() bails on that error
> > before the new flag can take effect, so the first CPU brought online
> > always trips a misleading warning:
> > 
> >   cacheinfo: Unable to detect cache hierarchy for CPU 0
> > 
> > Subsequent CPUs skip cache_setup_properties() entirely because
> > use_arch_info is now true, which is why only CPU0 hits it. This is
> > reproducible on arm64 with the QEMU 'virt' machine, whose default DT
> > has no cache nodes.
> > 
> > Clear ret after setting use_arch_info so the caller proceeds and
> > populates the shared cpu map via the arch-supplied leaves.
> > 
> 
> LGTM,
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Greg,
> 
> Can you pick up this one as part of your next round of fixes if any or
> for v7.2 ?

I'll get to it after 7.2-rc1 is out, thanks.

greg k-h
