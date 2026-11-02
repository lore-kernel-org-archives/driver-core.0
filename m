Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638738;
	b=Hs76i5WQ12kB9J82mmmxV9IzYCV+jx9i1yOCYrPOmHAw/YSOAsn5pRJmJNHjQbgpKPy1
	 wOxnuF7fPqQQyunK87/0evSARMRHzvg3O9kfdM5gtbALGLpyCLjVFnucO4GGL276F+rKU
	 t+fy8X2W220I1kneWwuNF0zKfzQVs108DokXVtxFRvmWZna57mhfDI8yxfIoLG57e1PpB
	 V9ZPrBnSD5SHzruwvOQeFac6wfvCD8zuN504ABzR76klO/tGTfVJepXNVAmxqSUYP5gA+
	 NX9bYAUl4OXrShWjZ1YGX7Pp12XYF8TZUHM6UVA/YCz6vi/mZUgVx7X7+yczCWdlTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638738;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jvlnmkcKG0dJPEmZQtzeUz0YXTyf9zopZ1vDLA4pyAs=;
	b=M9vejef3ZjBDuQEz2DqVQYg0iBdErLsdF+KvrjJEmhNWzr6NWAZZqCWBgckCQf6qslM7
	 eMNBUjJLL9AI1Jtk7yLMEjiM1EFAuFFamjCoOsoDVok4hSoY52bq7uYE89cRHWaTCLT50
	 HSZXVNHtnImU5xGxnhZwsp/1ymO76DMiB/Dyl7qIAtH4ngplACXnzuzRjFKg9vdbNynGE
	 py9VMn/zYkMCGpYFLFiTb/eMGaKGAru+PE88i4ZcqmDsmR9q4gnjK07cyJkflAwlLgNgD
	 M6wPajD+iALOc4vPrVmoE++bmbSQ6j7uKvqUXleBrBCvoCia65M8Lz0T05vjknKvJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=i6xRhUjn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21749606EE9B;
	Mon,  2 Nov 2026 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=i6xRhUjn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410A41F00A16;
	Mon,  2 Nov 2026 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793638737;
	bh=jvlnmkcKG0dJPEmZQtzeUz0YXTyf9zopZ1vDLA4pyAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6xRhUjnYc3QKqs9KrGeV8OTdH425YsBd2O3bfLQHnzdQo3H5S/E2GJNfb93ob+eX
	 vy9QtehYFvbfadBibiWzV9BL6iO5XaiprPbBFb6ODTbxSD9pxKCbitx98GliMu1g1X
	 ufI0BgM2TndsSvo+JDgZR1MUUvVGn5bx48Qtaf8o=
Date: Mon, 2 Nov 2026 17:31:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jack <jacktangsc@icloud.com>
Cc: Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: fix stale comment referencing old @sd
Message-ID: <2026110207-everglade-stretch-4ef2@gregkh>
References: <20261102155715.6633-1-jacktangsc@icloud.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102155715.6633-1-jacktangsc@icloud.com>

On Mon, Nov 02, 2026 at 11:57:15PM +0800, Jack wrote:
> The comment still refers to old @sd which was a sysfs_dirent.
> Update it to @kn to match the current function argument.
> 
> No functional change.
> 
> Signed-off-by: Jack <jacktangsc@icloud.com>

Full name please.

thanks,

greg k-h
