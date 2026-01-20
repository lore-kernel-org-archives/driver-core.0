Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5042E004;
	Tue, 20 Jan 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920999; cv=none; b=H3d1BOMjJMHIcHxLUXbkh6ift595UrxY4sciw/A68NN1Ij+H4nclir8HfZa/nWA7Miz5HncuQ9tURdwt4/VUzgxITKZXjrq8HYVvh7fSseSRlZ5pwLif5RyQcyC7oXfy5cJpUJiKf6PD+SaEW1bWcJbVRynrhdY+cmaUIu1C6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920999; c=relaxed/simple;
	bh=hYBxrKwlGFESwgv/D3uZHn65HlUs2A0S20/ytl6lbBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEeEJm8nvoLTMf3mdAVCo5i0sLu7JXawv/LTZQPcfl+Ge3gHzX3PDMUcpcQR6b2dNnsjW7j3IffVmwf6gVSj4F0/XBgBa2kz6w9LqenP6/Qan9nF9m4FQAXUlNL0DK4Q4dDJsDQBFHLwVS9pCrSk38T5bTibU4BoKwRGVjcG7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NL3FWvR9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NL3FWvR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FEAC16AAE;
	Tue, 20 Jan 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768920998;
	bh=hYBxrKwlGFESwgv/D3uZHn65HlUs2A0S20/ytl6lbBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL3FWvR9F0aav65DQbu0FXI2YUmoTB7Q99pVvq2b5Mbya8Jv+BgdMwd6sQsPbt+Sf
	 ZU1sMc7STb4/wacVHW7g6BNyrgf6DHBILtJbYdYIOokpVU1Jxu4ZaTXm12ZkYs3P/y
	 aR/hN2rFhuRiwgEZf+YYxVllJb+01TvRI69g2ms0=
Date: Tue, 20 Jan 2026 15:56:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com,
	leon@kernel.org, aliceryhl@google.com, daniel.almeida@collabora.com,
	abdiel.janulgue@gmail.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, russ.weight@linux.dev, mcgrof@kernel.org,
	tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: Add missing T: entry for FIRMWARE LOADER
Message-ID: <2026012030-contently-viewpoint-8a9b@gregkh>
References: <20260120123925.28267-1-dakr@kernel.org>
 <20260120123925.28267-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120123925.28267-2-dakr@kernel.org>

On Tue, Jan 20, 2026 at 01:38:53PM +0100, Danilo Krummrich wrote:
> The firmware loader is maintained through the driver-core tree, hence
> add a corresponding T: entry.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f15d4a5b9a5..7faf04cc4278 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9830,6 +9830,7 @@ M:	Russ Weight <russ.weight@linux.dev>
>  M:	Danilo Krummrich <dakr@kernel.org>
>  L:	driver-core@lists.linux.dev
>  S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
>  F:	Documentation/firmware_class/
>  F:	drivers/base/firmware_loader/
>  F:	rust/kernel/firmware.rs
> -- 
> 2.52.0
> 
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
