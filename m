Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633D3BB9F9;
	Thu, 12 Mar 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328348; cv=none; b=bYIgMArR5V55NfEh73j0E7v6gvcUposToHAvnV/T3bbsM+I9e/BxAvpAgwCXYvxI/qMfQDkn273f3ypvgFEhdDjqCBlLsGLHDc0QJ0Xyqy+9RiQZpVz6TegW8+37615fAgcnm5srYfiL+6V/cZ2Ek34vICdR26TfQu+fQjwgyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328348; c=relaxed/simple;
	bh=tUwAGIZmse7FuYmZfe+nQ5jEykWKewsr62HzUQfTTuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A14Bw4FCduQSdPmtN7Dh0n8qEoJ3whhQ2CRavtnWdFpxuARVch3X9GcLv2HYALFro9MzPHsm8r7ZBvT78PXDRS+hksPcw/IwaGppV6me95s7A0v5UZvH0lStUfY+QgB6+5pLigzp4a47ToSBilHIdxaNL0RRHdQ+H/pC1g1VrZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pMY6gViI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pMY6gViI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EA9C4CEF7;
	Thu, 12 Mar 2026 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328347;
	bh=tUwAGIZmse7FuYmZfe+nQ5jEykWKewsr62HzUQfTTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMY6gViIXd9OB0NGAC1PrH4otyQcfIfcnfi0dJi4gOuC9KcctlWAxz0+fBEcqNl8C
	 u4fa9NohFErKvS4I3ZN9az+vSU/0ECQMgVIcRKAx6tzgxwSoaYdcjK7SRZO/In2Awx
	 IJDQDc3qOd46Od6ajJDjmPQjB3r9QRaB7llAn8lI=
Date: Thu, 12 Mar 2026 16:12:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Use struct devres_node in Devres<T>
Message-ID: <2026031213-appendage-procedure-0dab@gregkh>
References: <20260213220718.82835-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213220718.82835-1-dakr@kernel.org>

On Fri, Feb 13, 2026 at 11:07:10PM +0100, Danilo Krummrich wrote:
> Currently, the Devres<T> container uses devm_add_action() to register a
> devres callback.
> 
> devm_add_action() allocates a struct action_devres, which on top of
> struct devres_node, just keeps a data pointer and release function
> pointer.
> 
> This is an unnecessary indirection, given that analogous to struct
> devres, the Devres<T> container can just embed a struct devres_node
> directly without an additional allocation.
> 
> In contrast to struct devres, we don't need to force an alignment of
> ARCH_DMA_MINALIGN (as struct devres does to account for the worst case)
> since we have generics in Rust. I.e. the compiler already ensures
> correct alignment of the embedded T in Devres<T>.
> 
> Thus, get rid of devm_add_action() and instead embed a struct
> devres_node directly.
> 
> This patch series is based on [1].
> 
> [1] https://lore.kernel.org/lkml/20260202235210.55176-1-dakr@kernel.org/
> 
> Changes in v2:
>   - Prevent driver-core internal C APIs from potentially being called directly
>     from driver modules due to monomorphisation, to prevent unnecessary symbol
>     exports.
> 
> Danilo Krummrich (5):
>   devres: move struct devres_node into base.h
>   devres: export devres_node_init() and devres_node_add()
>   devres: add devres_node_remove()
>   devres: rename and export set_node_dbginfo()
>   rust: devres: embed struct devres_node directly
> 
>  drivers/base/base.h   |  18 +++++
>  drivers/base/devres.c |  50 ++++++------
>  rust/kernel/devres.rs | 182 +++++++++++++++++++++++++++++++-----------
>  3 files changed, 180 insertions(+), 70 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
