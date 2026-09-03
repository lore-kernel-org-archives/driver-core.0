Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE084EA374
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470131; cv=none; b=lAOZkqHPn8KTr19SOMM46jnkdnASutiKl4bU3lmBy7A68WYVHkOTyjZD1CAkw6hvU6QhwiBCgxr5r36G/M0uqIR2RyGT01ZaRWsyKJofx+2eAPt/Fo/vShFFmpby+fkfyA8KQ+7zHVkJjQd4cf0AyA8FmqtuFQSmJdVq0MLVWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470131; c=relaxed/simple;
	bh=CedytQNxGbmNF46xxKUl3Am9LNsHrHhumNJs4hs2bxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGNUPNuy2wSBK/Q8NRZATbiJ5Df5CiW4h9ttlhE24ysqJgkhnFmPPGsXzcdMJ2VxtMP7BlNtzefU/2sVTt+7oBJjtzvU/bk9eIlrhzKEQipUTE1fm6YsuB7ygfkOIdN1YXe1QNi0LEXhOt4PZOrfvuAYiYlGKaNa8KB8Ed/lr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C5E40Ukc; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C5E40Ukc"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=CedytQNxGbmNF46xxKUl3Am9LNsHrHhumNJs4hs2bxA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788470126; v=1; x=1789074926;
 b=C5E40UkczyMvNcc7Ft1lz3vCWGtHSqV4HrUujEwSde1QTKFwNIx9LhwrQWKqFqcUiMGfgGkO
 DE5nz7D8cTJy8gdszI1q8CJmitadlrei83m5vJ9j8fxyklboES57UvevcAp6QSjgyMT/pNFQ7go
 tMO+7Ir/J+4rRk66TGxywjWE=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 860a21b935749191;
	Thu, 03 Sep 2026 21:15:25 +0000
X-Mizu-Trace-ID: 860a21b935749191
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 14:15:20 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, 
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kernfs: fix up the unlocked attribute reads on the
 creation paths
Message-ID: <apnjQmnNUNmVSggn@linux.dev>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
 <20260903040253.670020-3-shakeel.butt@linux.dev>
 <apnX34sTUnMngU5k@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apnX34sTUnMngU5k@slm.duckdns.org>

On Thu, Sep 03, 2026 at 10:26:07AM -1000, Tejun Heo wrote:
> On Wed, Sep 02, 2026 at 09:02:53PM -0700, Shakeel Butt wrote:
> > Two creation paths read a live node's attributes without holding
> > kernfs_iattr_rwsem, which kernfs_iop_setattr() takes for writing.  They
> > do not want the same fix.
> > 
> > kernfs_create_link() copies the target's ia_uid and then its ia_gid
> > into the new link.  A chown of the target between the two reads leaves
> > the link with the old uid and the new gid, an owner the target never
> > had, when copying the target's owner is the whole point.  Read both
> > fields under the rwsem.
> > 
> > kernfs_new_node() reads the parent's ia_gid for S_ISGID inheritance,
> > and that one does not care which value it gets: the node does not exist
> > yet, so nothing orders a racing chown against the creation either way.
> > Taking the rwsem there would only serialize creation under a set-gid
> > parent against a chown of that parent, to pick between two answers that
> > are both right.  Mark the field read data_race() instead.
> > 
> > The pointer that leads to it is a different matter: __kernfs_iattrs()
> > publishes kernfs_node::iattr with try_cmpxchg(), so there is no
> > unmarked write for that read to pair with, and both sides read it with
> > READ_ONCE() like the rest of fs/kernfs does.
> > 
> > The Fixes tag is for the symlink half.  kernfs_create_link() has read
> > the pair without a lock since it started copying the target's owner at
> > all; only the name of the lock its writer takes has changed since.  The
> > data_race() is a marking rather than a fix.
> > 
> > Fixes: 488dee96bb62 ("kernfs: allow creating kernfs objects with arbitrary uid/gid")
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> > +		if (attrs) {
> > +			/*
> > +			 * Unlocked on purpose: the gid is inherited onto a
> > +			 * node that does not exist yet, so nothing orders a
> > +			 * racing chown against this creation, and either
> > +			 * value is correct.  The pointer above needs no such
> > +			 * marking, __kernfs_iattrs() publishes it with
> > +			 * try_cmpxchg().
> > +			 */
> > +			gid = data_race(attrs->ia_gid);
> 
> Nit: READ_ONCE() is likely the better fit as it's an intentional lockless
> read whose value is used.
> 

Thanks TJ for the review. I will fix this in next version.

