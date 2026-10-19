Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452865;
	b=1+xex0GVHyQttdRH7qQkgaV1z36HLG9f2WZFSKMOaHShc5trk+H3epJXPTixkWiuG6h9
	 A+jmtLbyoHw39X0YOjv0Ccjf1RIX94D3UfaPhHefWAoo14nSKgCzi9u7rhsJAvMzd6/tv
	 uABMKe0tHKaDNTE/Sytn4Xmz8hi6zG7f0w0j4wO66ySoxDeY8HV/oUaLiTx+JQSKRUoZ2
	 dVSQRojROQ4YfOmH9oZgUl+6V9793waMeiqfhkux3F5kp5GVQpbkVxZeHkgw6Z+k0/Urw
	 z7jHr06Kw+YYjswZFGFcI5YeABxKdDxXpT+Cvu9Ua56YR8GwvYqj4VSOdvP4p0TP39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452865;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YLCzEt34deTzd8GzZtmkJa4LKNaOg+tNl9krAgeHoCg=;
	b=qgnGQswep/V5ZZzDN0CF5Ksi2DjLev+PzgWybLeWtwqo3gQNiyusTzmnHhVOYRIVjt2K
	 N+p5DuJlwwSePfs8bhgcEf7NIYKD5FKIWAeP5h9efcYw9FzUnCvGIC5pjktBlH3dtPVsb
	 8ASNfqig5MDsX1navloEo+ZVn6aNMAKHreZ7MpZMPaN43DuKvtfFySVamOy+3O8QPyXBx
	 cEps9EAC2wFOsWrgMIo7RvvcdWb2KZtE9wPaUFPKARMU+9pVzMZMcGNSUAcpZcnlBZ48T
	 FxWloYbwYbqARORgkbHmKXHlLcZI4yaDmI9vMv5XvBx+pKiE0mJhw+wNR9Kll47P79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6lMNBWx;
	arc=none smtp.remote-ip=95.215.58.148
Received: from mta1.migadu.com (out-148.mta1.migadu.com [95.215.58.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6B606A31B
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 23:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F6B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6lMNBWx
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aMMF/FAUJVnlFGwhOFiS9QB+HqFAXSJzpM6RCa2uQ48=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792452860; v=1; x=1793057660;
 b=a6lMNBWx5t+x03VTq8o4kVThGnP9qrzQ/o13HKQbtbyQwHE07Y2/1yEec8GWokSCASpVhr/l
 5WqWA5ZUDLMrIqKOC7ruILh3DlqlPv9OPGVe/z0R75DaMJeS/qebi2gKQf2ipqNKvg8dPO4buZy
 svIcJ9iG8C7F/BVGc2TXlzg4=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6b338b86b22b178a;
	Mon, 19 Oct 2026 23:34:20 +0000
X-Mizu-Trace-ID: 6b338b86b22b178a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 16:34:19 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kernfs: allocate inodes and dentry outside
 kernfs_rwsem
Message-ID: <ataWrUkD-rqeoFcV@linux.dev>
References: <20261016220029.3276154-1-shakeel.butt@linux.dev>
 <atUkrrdfu_ihfmZ8@daedalus>
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
In-Reply-To: <atUkrrdfu_ihfmZ8@daedalus>

Hi Jori and thanks a lot for taking a look.

On Sun, Oct 18, 2026 at 10:47:56PM +0200, Jori Koolstra wrote:
> On Fri, Oct 16, 2026 at 03:00:29PM -0700, Shakeel Butt wrote:
[...]
> > +/**
> > + * kernfs_get_inode_locked - get the inode of @kn under kernfs_rwsem
> > + * @sb: super block
> > + * @kn: kernfs_node to get the inode for
> > + * @new: points to an inode from new_inode(@sb), or to %NULL if that failed
> > + *
> > + * The caller allocates *@new before taking kernfs_rwsem, as the allocation
> > + * can stall in memcg reclaim.  If @kn needs a new inode, *@new is used and
> 
> I wouldn't mention memcg here per se, it is not relevant to grasp its
> use. In another series I have implemented almost the same thing (but you
> did it better!).

Ack, will remove memcg here.

> 
> > + * set to %NULL.  Otherwise the caller frees it with iput() after dropping
> > + * the lock.
> > + *
> > + * A new inode is added only with kernfs_rwsem held and @kn active, so
> > + * __kernfs_remove() always finds it to clear i_nlink.
> > + *
> > + * Context: kernfs_rwsem held for read.
> > + *
> > + * Return: the inode, %NULL if @kn is inactive and has no inode, or
> > + * ERR_PTR(-ENOMEM) if @kn needs an inode and *@new is %NULL.
> > + */
> > +struct inode *kernfs_get_inode_locked(struct super_block *sb,
> > +				      struct kernfs_node *kn,
> > +				      struct inode **new)
> 
> I understand this is intended to have some kind of ownership semantics,
> but I must say for such a simple function, I find the contract quite
> complex to check. Do we really need an out parameter here?

Not really. I just used it simply call iput(new) without a check. I can change
it and make it more like inode_insert5() and let caller do check before calling
iput().

> 
[...]
> > @@ -294,7 +298,7 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
> >  {
> >  	struct kernfs_super_info *info = kernfs_info(sb);
> >  	struct kernfs_root *kf_root = kfc->root;
> > -	struct inode *inode;
> > +	struct inode *inode, *new;
> >  	struct dentry *root;
> >  
> >  	info->sb = sb;
> > @@ -314,10 +318,12 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
> >  	sb->s_shrink->seeks = 0;
> >  
> >  	/* get root inode, initialize and unlock it */
> > +	new = new_inode(sb);
> >  	down_read(&kf_root->kernfs_rwsem);
> > -	inode = kernfs_get_inode(sb, info->root->kn);
> > +	inode = kernfs_get_inode_locked(sb, info->root->kn, &new);
> 
> What are you serializing against here? I've been looking at this as well
> recently, and I thought we could just get rid of the locking here. But
> on second look, I am not so sure what is correct.
> 
> Is there anything that serializes kernfs_get_tree() with root node
> removal?

That is a good question and honestly I didn't know the answer. After digging a
bit, I think 07/12 patch [1] of your series is right.

Superblock is still private here and it is added to the supers list after
kernfs_fill_super. Root removal is not serialized by kernfs and kernfs users
keep the root alive across the mount.

I can drop the kernfs_fill_super change from my patch and I think your patch
will cover it better.

[1] https://lore.kernel.org/20261016143806.2946578-8-jkoolstra@xs4all.nl
