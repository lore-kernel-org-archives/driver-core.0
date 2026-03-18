Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EFC1D88AC;
	Wed, 18 Mar 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837571; cv=none; b=lpydVH/zp8c/UVx0FOJnYCwoA6dJWgMGTsZ3RC4lLYmHYdwEF/+gUKAJcOmw5TbSQrSDs0LxnH/J48tXFNfJYzYfXuzJ7sdMfudhTmK+t4rXHi6XiJTLjg9FiGoCIDT9WXX+Bf0m5dIu2JA2kRSXrcMT62PxAvxwLQs9OOkRPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837571; c=relaxed/simple;
	bh=SaArbS/kc9h6VtTeNHeTHBs5QByRXuDwdXvvnDjhRD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9QT7aDbIq7M5W1Aot5Ccp2AHUX24KQGJoZz/3VnhBrSHNJAauacDVR3mXPX96pReE4wz3lLoPnOWQn/HAXKvK05yTs1o0SHENsjhn2BkZQDmBEKIc6qpoU50AEOQN3cAiDRLHYz4149QeCTqp8lpqrl2sBxmwnlxsBboKIrHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fZMpb3R9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fZMpb3R9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D04C19424;
	Wed, 18 Mar 2026 12:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773837571;
	bh=SaArbS/kc9h6VtTeNHeTHBs5QByRXuDwdXvvnDjhRD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZMpb3R97ONEI28enlDHG6ZRAuJeuqeCEtLNrPnT+Nu0yEZjf98sJJpNneLKpnhHT
	 RcGOZ3nwm82wcMmvPlyeiSBxoXYTTQuJZmNLD5at/EViypM1UNqI3C670whVCY0QzL
	 zMLfGG0xkc6AGshQ1F8nsgBdqXXqUkjJioA4Z90E=
Date: Wed, 18 Mar 2026 13:39:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: allow firmware_class.path to take
 multiple paths
Message-ID: <2026031846-cocoa-unnoticed-6bbb@gregkh>
References: <20260318-fw-path-v1-1-7884d9bf618f@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-fw-path-v1-1-7884d9bf618f@kernel.org>

On Wed, Mar 18, 2026 at 08:25:54AM -0400, Jeff Layton wrote:
> Refactor fw_get_filesystem_firmware() by extracting the per-path
> firmware loading logic into a new fw_try_firmware_path() helper.
> 
> Use this helper to parse fw_path_para for ';'-separated paths,
> trying each one before falling through to the default firmware
> search paths. This allows users to specify multiple custom firmware
> directories via firmware_class.path, e.g.:
> 
>   firmware_class.path=/custom/path1;/custom/path2

Why are you using ';' and not ':' as the traditional path separation
character?  And where is this now documented?

thanks,

greg k-h
