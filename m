Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494627;
	b=mPO0hFybrg4KBbLqH54weIGZiFpMjvtNeMqsWVn+uofUhC8pnvqjeUURwEd6D1tydc3C
	 8KyrZcvzH01PtIbG2mby7SiFzCE+SM1NInGwWoE9SbwK3KliA94z8+Yy/FRx5eneRXxKb
	 OLo3m+Njt+HMHcqNhdxuQiT+dKzaZiHa1I/e13GX+0uIeRDO8FYaioTl32ff07p6twJL9
	 kZ/vuCpO5KwiKh8Kh7Ro7GXudIBccdf5UVY3E6I8C3RLEGNN1TNv5VHf+ERtRx/a5pr+2
	 DcoJcBOApUU4ztou8jWOgJMNQJwGI49zRbzcF8lXJYKn7o1uqkhPvCDY+RoJ7YSwX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494627;
	h=DMARC-Filter:X-KPN-MessageId:Received:Received:DKIM-Signature:
	 X-KPN-MID:X-CMASSUN:X-KPN-VerifiedSender:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Originating-IP;
	bh=od0sDb61Vyxn7jJRWeS+kkhSMP4jrGQol+QTMNRF7m0=;
	b=BZ+On1moO1burE8c109MbVD9YTt/xCXbcnu10d2AEuJ9IhX6Mvh4ihY1rnqxUR7RHEYq
	 +hgPUCDrynQhsEZrDK7+DXOGIkGzGw4Q31hn3MKI0Mj9J/VvtEaZwB1R6vvnDD3PCIt6Z
	 kDIUhG0Mqtx4j8yFUNFM13yb2Qyh7kTDRgmFr+w+AO2dcH1eQHvoA1Eh7AY/ppV5OM5Sm
	 BVf5C85lK1MaMNu94+v7eGLeUMNvsK2y4enyjFn0TCZ95hmjavKSbcOzI8GjUW9PdIahR
	 Rqo3+yQ9w2YGti/ypFsLOGImYXXhFRc+BYKyAuZHfk0V7jgqAY8655v1I1ed2dfFwNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=YfRkTgqQ;
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DFD606A330
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DFD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=YfRkTgqQ
X-KPN-MessageId: 709a0b30-dea7-11f1-b91f-005056992ed3
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 709a0b30-dea7-11f1-b91f-005056992ed3;
	Thu, 12 Nov 2026 15:43:35 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 70af84d2-dea7-11f1-b812-00505699693e;
	Thu, 12 Nov 2026 15:43:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=od0sDb61Vyxn7jJRWeS+kkhSMP4jrGQol+QTMNRF7m0=;
	b=YfRkTgqQnxqO/91/hesLveZ2fxSQYJIVkiuLMlFK1lFxqTncAH8zPh0DrbgwooXF7fNBiy7rGuYho
	 6PITkBDfNSHF4N0a3OkYGKHAC6Q6o5efJ1GtFoEDxennrNFbU3Xc++kI4msAnUrANP9QbE8tF5wg7g
	 vucwqAsKttr2stkKZdIAY7FfhNVv0gPafvaL06ahN6HIzxZfyFnEM2m/5T+ltrIlPCfZAz1MBdjQwn
	 MZizqm4RKr5CcZuRUGO8UTFpNo/SSgHR6Kwt9g4XnTQMc4VQgDmYqtCibj6SsfrRz7REssiPwZDkVw
	 lhH0irhvOC5FPT2IDuqlwsThcbEvO3g==
X-KPN-MID: 33|Z4TXQhp2FhjmyMaCgy2XBZaHAdldqYiNjPl9y4mPDO44gTKe8JIT2wnKoKoBYPN
 GwIUJyoYWnRjmhD2gg/+EX1KhFsn1F10Qsp5rVZCSvx0=
X-CMASSUN: 33|TYSEE/PoiuTVLIcD3FbHwsz030mnYA/ltY768Pm9Tl8kBX5hGQ2AKg2dW7NwY36
 impqVpoWNsqdJIrmumzrJhA==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh04 (cpxoxapps-mh04.personalcloud.so.kpn.org [10.128.135.210])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 70a4d10a-dea7-11f1-aa48-005056995d6c;
	Thu, 12 Nov 2026 15:43:35 +0100 (CET)
Date: Thu, 12 Nov 2026 15:43:35 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <186109292.1132834.1794494615590@kpc.webmail.kpnmail.nl>
In-Reply-To: <avW_E0stwo6e-y58@linux.dev>
References: <20261111215058.1837351-1-shakeel.butt@linux.dev>
 <1984940723.1098701.1794483492769@kpc.webmail.kpnmail.nl>
 <avW_E0stwo6e-y58@linux.dev>
Subject: Re: [PATCH v4] kernfs: allocate inodes and dentry outside
 kernfs_rwsem
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 12-11-2026 08:29 EST schreef Shakeel Butt <shakeel.butt@linux.dev>:
> 
>  
> On Thu, Nov 12, 2026 at 12:38:12PM +0100, Jori Koolstra wrote:
> > 
> > > Op 11-11-2026 16:50 EST schreef Shakeel Butt <shakeel.butt@linux.dev>:
> > > 
> > >  
> [...]
> > > +	new = new_inode(sb);
> > > +	if (!new)
> > > +		return -ENOMEM;
> > >  	down_read(&kf_root->kernfs_rwsem);
> > > -	inode = kernfs_get_inode(sb, info->root->kn);
> > > +	inode = kernfs_get_inode_locked(new, info->root->kn);
> > >  	up_read(&kf_root->kernfs_rwsem);
> > >  	if (!inode) {
> > >  		pr_debug("kernfs: could not get root inode\n");
> > > 
> > > base-commit: ecdfc51a6a78aaf1c4ac1d8b6ea199cc2ed020ac
> > > -- 
> > > 2.53.0-Meta
> > 
> > Does this compile? I added a bool parameter to kernfs_get_inode_locked(),
> > for this patch to be able to do a lookup first, but you haven't added that.
> > I think you want to set lookup=true everywhere, right?
> > 
> 
> Yes, it builds on vfs-7.5.directory (base-commit ecdfc51a6a78).
> Christian's fixup there dropped @lookup, so kernfs_get_inode_locked()
> now takes just (inode, kn).

Ah, I didn't notice that.

> 
> I don't think this patch needs @lookup.  inode_insert5() already
> returns an inode that is already hashed, so an ilookup() first only
> changes things for an inactive node.

Fair enough, I was thinking you added it on purpose becasue ilookup() does
not get the inode_hash_lock lock. But if you see no regression by always
taking the lock, it's cleaner to get rid of the lookup flag.

At any rate, feel free to add:

Reviewed-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
