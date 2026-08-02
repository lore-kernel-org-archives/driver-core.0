Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20E1C861D;
	Sun,  2 Aug 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785699750; cv=none; b=uFYszUFPuuMH8ETCEqK21b5m+mkyJKQfRl8A+M/2boB+8RCbJOACVtNN80CYeUlhZw2elPtRbFaP0sdkn0TDGA1lH/NEvkDTpeK+Jm5TAogGh68N8/GSEk3ZKzzZ1TdXfxiaTLxelRCzrcFOJMQsGMiPGpJWE/TFbVCghMEt10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785699750; c=relaxed/simple;
	bh=V9EktQLP9GIh/wWANh3HK8+9a2RLwzeLdNyddL9I9LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVi8HZf+RwfdnOH0BL85oNey7poyirVX2lwpanCuakSrrcLRdywVGyaJLb+2hT+mqAJumSXE3zRu7nTCRF45J19wdiWg77IG2hkEcp+IbDZfyJJZwnxBrCB+dvJ1zbtyInaEkIJEfdC8FIK+i0MdTVw5qsXTJv6WHO1gPd8iNBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSfUUzhS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSfUUzhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259A81F000E9;
	Sun,  2 Aug 2026 19:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785699749;
	bh=MBg8Qt8Le5Rilaj52TjAWsiHdVJJpkjGd0StKRaBJ4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZSfUUzhSY9VNxnCcNGm8/0NZOnVxqWMPU+7gMaqgLw/4PB9GAQpePjSyn+GSFovI8
	 ic3y5iVZ+ocPY2PRUBndQYFWugH8Lyd7zWELjSuSMLxxAuvBkiJIHOHe4NBL1CkzGj
	 8bLWf0dA0ilB0MqnJJ4ro9yI8kE1jVb7hCMrXV7ODJe3jdqW1TnhoFB9p057qKh7X0
	 3Mc+4VmoRPRNi6sznyF5CwH9O/d4Lbzd3Lm7cWbC1YexRC6I5JdZLa29nxeN1/mrbz
	 7NcwZ9oaE5bzBF36JeKkYfxlQntMimoDgq5n7SWrYO9uFXZPzal+6PlPG1yqJBrrgk
	 /3g07KnM5K1Cw==
Date: Sun, 2 Aug 2026 09:42:28 -1000
From: Tejun Heo <tj@kernel.org>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: gregkh@linuxfoundation.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: avoid iattr allocation in listxattr
Message-ID: <am-dpITJWlNLIWRB@slm.duckdns.org>
References: <20260731120554.630147-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731120554.630147-1-chenyichong@uniontech.com>

On Fri, Jul 31, 2026 at 08:05:54PM +0800, Yichong Chen wrote:
> kernfs_iop_listxattr() only needs to report existing xattrs, but it uses
> kernfs_iattrs(), which allocates kernfs_iattrs when the node does not
> have one yet.
> 
> This makes a query operation create persistent per-node metadata even
> when the xattr list is empty.
> 
> Use kernfs_iattrs_noalloc() instead and return an empty list when no
> iattrs exist.
> 
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
