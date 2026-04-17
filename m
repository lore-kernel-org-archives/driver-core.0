Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4133557D
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423174; cv=none; b=RUZ3A9fWXddSFZpuFq0jno+usDiTZr3VdwxYh55san0pczyr2c/slYLOh2MjIh6bGdRruyQVceX+HZEkJqOqSFC2fym4XRfe6zN1AbSdXIfMYw5L7R0L5p8TqFh0eszwflYbonMi4y0ORqDdQ7LHnqnWejRfm9xKqhCSRCHDChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423174; c=relaxed/simple;
	bh=KiwRwUvqQR9oLTxky9e4dNX6t6FZCZZWSpKrwn8NIE0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLi1vkelJAyvvlME0CfdygpM3bi9iclujnm+Ff5QUnchrzwT7D/Yk3qshzvec8Zy6uVSAj7EjbpdE4ngzxKcRzJrME72epbv4RLmFt5QW3iMd53kB9TzVGSf+NMsIzj/6OdDI7OU3i04rTn41SXFWiGM9Y+kGl/uMBn6qqekmrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J5tGAxbX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1xb3NMxe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J5tGAxbX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1xb3NMxe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J5tGAxbX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1xb3NMxe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J5tGAxbX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1xb3NMxe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E7CC5BD59;
	Fri, 17 Apr 2026 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776423171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIKxxDo/c+6ZbU+DSeD8wScv93/8W88+FKVC7kSVog=;
	b=J5tGAxbX+GiX8pIAZ8IiHwQpOERfYaivs6I6mFn1UiZQDPXm4w2OVg8Y26gQIRDrqhrEB7
	6kJDdH9JHBJHsQCVbPW43Lr8ADB5kUlVhYHAZofKt/EXJyhKVzcfYoM/reUQm3yNU9BXES
	o5BBaGrIfJd7e5RhvkJpqF289SnE4j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776423171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIKxxDo/c+6ZbU+DSeD8wScv93/8W88+FKVC7kSVog=;
	b=1xb3NMxeLcm53HvjZvR2l0DN23QmUUCu6oZvwZ26KKgeMv5lbn+rU1GLcVjJfWaCANm8C3
	oolY2TdqPYiGnfCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776423171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIKxxDo/c+6ZbU+DSeD8wScv93/8W88+FKVC7kSVog=;
	b=J5tGAxbX+GiX8pIAZ8IiHwQpOERfYaivs6I6mFn1UiZQDPXm4w2OVg8Y26gQIRDrqhrEB7
	6kJDdH9JHBJHsQCVbPW43Lr8ADB5kUlVhYHAZofKt/EXJyhKVzcfYoM/reUQm3yNU9BXES
	o5BBaGrIfJd7e5RhvkJpqF289SnE4j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776423171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIKxxDo/c+6ZbU+DSeD8wScv93/8W88+FKVC7kSVog=;
	b=1xb3NMxeLcm53HvjZvR2l0DN23QmUUCu6oZvwZ26KKgeMv5lbn+rU1GLcVjJfWaCANm8C3
	oolY2TdqPYiGnfCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68241593AE;
	Fri, 17 Apr 2026 10:52:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OSYoGAMR4mn6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 10:52:51 +0000
Date: Fri, 17 Apr 2026 12:52:51 +0200
Message-ID: <874il9eu4c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    "Rafael J. Wysocki" <rafael@kernel.org>,
    Danilo Krummrich <dakr@kernel.org>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] ALSA: pcmtest: fix reference leak on failed device registration
In-Reply-To: <87h5padnof.wl-tiwai@suse.de>
References: <20260415193138.3861297-1-lgs201920130244@gmail.com>
	<87h5padnof.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 17 Apr 2026 09:57:20 +0200,
Takashi Iwai wrote:
> 
> On Wed, 15 Apr 2026 21:31:38 +0200,
> Guangshuo Li wrote:
> > 
> > When platform_device_register() fails in mod_init(), the embedded struct
> > device in pcmtst_pdev has already been initialized by
> > device_initialize(), but the failure path returns the error without
> > dropping the device reference for the current platform device:
> > 
> >   mod_init()
> >     -> platform_device_register(&pcmtst_pdev)
> >        -> device_initialize(&pcmtst_pdev.dev)
> >        -> setup_pdev_dma_masks(&pcmtst_pdev)
> >        -> platform_device_add(&pcmtst_pdev)
> > 
> > This leads to a reference leak when platform_device_register() fails.
> > Fix this by calling platform_device_put() before returning the error.
> > 
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> > 
> > Fixes: 315a3d57c64c5 ("ALSA: Implement the new Virtual PCM Test Driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> 
> Thanks, applied now.

... and now I looked through the whole tree, and noticed that the
majority of callers of platform_device_register() don't care the error
cases without calling platform_device_put().  There are over a hundred
callers of platform_device_register() while only 5 or so are doing the
proper cleanup at the error.

Judging from the numbers above, it might be better to change the
behavior of platform_device_register() itself to call *_put() at the
error case internally.  Or, if we keep the current behavior, at least
we should properly document it.

Greg, Rafael, Danilo, what do you think?


thanks,

Takashi
