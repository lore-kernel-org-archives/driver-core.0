Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCF30595C
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 07:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929980; cv=none; b=EHLfL+AY6/JugAi3kyIoVpzgjs2mc9zKoY99IT8sXYvL0IrzXxK3XyfZBY9PzVKWJKQFHVfoEaSqdIDREiTXM338OOYAyCDgGrUzLoB+1DYv1h9qsyu91ruGYTTUK2n369leZ8i4NjTVMWIEdPOp7Cut1gsBjMyl7CxTXNVMrbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929980; c=relaxed/simple;
	bh=n4yYn/PkMKvg1aqyokQfze2qKWylOghxCqf0OSzRS8g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6qEukITesH/uVACXE65erURQ891fZj6IozvTMWa+iotxLv8E9T9USkTPeFwsoW73X0bok0uF6pX18adNtjsPOjYIXEcgKNB+NJL+J4tQrxwLtpH0m/B1B50WwWx8NMdiGMQo14GgFSIs9xnIGeGVa0IGprQgx8NjCvbVNJ5I94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HmUD4Qm/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ffWzPFQH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HmUD4Qm/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ffWzPFQH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HmUD4Qm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ffWzPFQH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HmUD4Qm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ffWzPFQH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1395E6A7E7;
	Thu, 23 Apr 2026 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776929977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9e3lz+J2o2xLZ0LnrWFXIgZUuRvX3PTkFnFfLNem0s=;
	b=HmUD4Qm/j8IGRUQV9eWDwkeY4tLUaeM75gdiVVrdSBBZUexbn/HmvmVY3hGhocfgqH1nft
	grdoyySkWT4REAl15ZD9izU+5kDTPXIf62Cg2Ga5IcMhnsXRNxbEr9DelNoIZ/6evoSGIh
	5RWZSOxm+2nd1Pfe/673he74Qw0keV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776929977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9e3lz+J2o2xLZ0LnrWFXIgZUuRvX3PTkFnFfLNem0s=;
	b=ffWzPFQHK47dPu2PryG7pjny/6cjf0ESgaTVeZIibh0GCZuY/6UB0mrMfsG4troFAOe/ks
	V+MRPazVDsY/9IAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776929977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9e3lz+J2o2xLZ0LnrWFXIgZUuRvX3PTkFnFfLNem0s=;
	b=HmUD4Qm/j8IGRUQV9eWDwkeY4tLUaeM75gdiVVrdSBBZUexbn/HmvmVY3hGhocfgqH1nft
	grdoyySkWT4REAl15ZD9izU+5kDTPXIf62Cg2Ga5IcMhnsXRNxbEr9DelNoIZ/6evoSGIh
	5RWZSOxm+2nd1Pfe/673he74Qw0keV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776929977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9e3lz+J2o2xLZ0LnrWFXIgZUuRvX3PTkFnFfLNem0s=;
	b=ffWzPFQHK47dPu2PryG7pjny/6cjf0ESgaTVeZIibh0GCZuY/6UB0mrMfsG4troFAOe/ks
	V+MRPazVDsY/9IAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD9B8593A3;
	Thu, 23 Apr 2026 07:39:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7KbOMLjM6WmbQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Apr 2026 07:39:36 +0000
Date: Thu, 23 Apr 2026 09:39:36 +0200
Message-ID: <875x5i3z2f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] ALSA: pcmtest: fix reference leak on failed device registration
In-Reply-To: <d25b3ecd-9941-4b3b-9480-4f8f16a8ecd7@kernel.org>
References: <20260415193138.3861297-1-lgs201920130244@gmail.com>
	<87h5padnof.wl-tiwai@suse.de>
	<874il9eu4c.wl-tiwai@suse.de>
	<d25b3ecd-9941-4b3b-9480-4f8f16a8ecd7@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 23 Apr 2026 07:19:20 +0200,
Jiri Slaby wrote:
> 
> On 17. 04. 26, 12:52, Takashi Iwai wrote:
> > On Fri, 17 Apr 2026 09:57:20 +0200,
> > Takashi Iwai wrote:
> >> 
> >> On Wed, 15 Apr 2026 21:31:38 +0200,
> >> Guangshuo Li wrote:
> >>> 
> >>> When platform_device_register() fails in mod_init(), the embedded struct
> >>> device in pcmtst_pdev has already been initialized by
> >>> device_initialize(), but the failure path returns the error without
> >>> dropping the device reference for the current platform device:
> >>> 
> >>>    mod_init()
> >>>      -> platform_device_register(&pcmtst_pdev)
> >>>         -> device_initialize(&pcmtst_pdev.dev)
> >>>         -> setup_pdev_dma_masks(&pcmtst_pdev)
> >>>         -> platform_device_add(&pcmtst_pdev)
> >>> 
> >>> This leads to a reference leak when platform_device_register() fails.
> >>> Fix this by calling platform_device_put() before returning the error.
> >>> 
> >>> The issue was identified by a static analysis tool I developed and
> >>> confirmed by manual review.
> >>> 
> >>> Fixes: 315a3d57c64c5 ("ALSA: Implement the new Virtual PCM Test Driver")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >> 
> >> Thanks, applied now.
> > 
> > ... and now I looked through the whole tree, and noticed that the
> > majority of callers of platform_device_register() don't care the error
> > cases without calling platform_device_put().  There are over a hundred
> > callers of platform_device_register() while only 5 or so are doing the
> > proper cleanup at the error.
> 
> Moreover, unless the static pcmtst_pdev has ->type->release or
> ->release set, the patch triggers a warning upon put().

Ah a good point, the call should be conditional.

> > Judging from the numbers above, it might be better to change the
> > behavior of platform_device_register() itself to call *_put() at the
> > error case internally.
> 
> Yes, that's what should be done instead.

OK, I'm going to revert this patch for pcmtest.c for now (so back to
the upstream state again), so that we can work on the
platform_device_register() side.


thanks,

Takashi
