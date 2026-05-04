Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7433DFC83
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908312; cv=none; b=T/4l8+mbjvowAzrCJMEcWi5akSYSyBsbbaUsa1/8g8toJ/WPyeAKcw1iHeFvT5BTxBIRIwTu7dlr5xfCZfidlO++bl7MgCrxpLiQAh3ArUxuq3BNAFMjy72uXKWOOKclUMpoF5AhPmGe4IXpMt5fOgULQUM1zSkEnADr276I01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908312; c=relaxed/simple;
	bh=WTttH7EilVB42FXttHGWpNmaVuaYhqJL4ZVyMCXetyU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlTQNXiRsffXK9Vw/zBjDjgORD7nYVzEnMBRtYkiKwYjmNKfjBjb9X6rNsUGXqY+nJZAVspHKpwDXq6/bbery670+o0RZccJ0EQhNr96rDiTSjcse9EJvlzN1XzHCUo1Skhly+8xPpfxsATjGUDXaYsmnm9a8XuZphAwB0DcCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1S2hefqt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n3E1N9xK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lO9XOheC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QPnVOEbR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1S2hefqt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n3E1N9xK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lO9XOheC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QPnVOEbR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0D9E6B385;
	Mon,  4 May 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777908309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5bGrC7bzwLqHWoJahkcAwKUupDAAlH1SWOz7FCM9M=;
	b=1S2hefqttJhYyoq3HWi2wIfrnXaJ2+jB4zPeXKjps1bva7TMuYFCy6jKJu/Q2Q+N1uueRv
	g4dT4iN8f6ffqiWR/lfpTq7w2xk33Fum18Si1+l1rHy30EWfW0ZmgfaJremk3+mLaZvlto
	3w8JVA5INHbFL8pB7tjU8EWiVyT5Fug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777908309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5bGrC7bzwLqHWoJahkcAwKUupDAAlH1SWOz7FCM9M=;
	b=n3E1N9xKKf77A/hyPbtER8I1AXhVGPkY8yS/iyMQ+wqFniaV/yBsRVngBzGVhHmZWQ0wCm
	AJeSTi9/48D5RnDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lO9XOheC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QPnVOEbR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777908308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5bGrC7bzwLqHWoJahkcAwKUupDAAlH1SWOz7FCM9M=;
	b=lO9XOheCWPzetSSv9MwQ4ZHwArg4IOPxR0kyuIinh6YumCybbvARGh0dIj85Hqx7gIzBcq
	j8dfdObRzQ+DQuwLD7UzQmqlLb6NllxvR1XiUN/cXBnkVtaZwf4WfitaO5NHf5p8GxNfgi
	EcY6GLCoDnlNW1kgdqnWs91/DD2qywY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777908308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5bGrC7bzwLqHWoJahkcAwKUupDAAlH1SWOz7FCM9M=;
	b=QPnVOEbRzABPwJkSIZb8m2XZ0dWBgUhurPYvhXGdqO+gedi7YIw5KYisc158PPXHqMD6Y+
	rur0PvFRV7ISZ3BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7215E593A3;
	Mon,  4 May 2026 15:25:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T8ioGlS6+GleEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:25:08 +0000
Date: Mon, 04 May 2026 17:25:08 +0200
Message-ID: <871pfrxkmj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/2] firmware_loader: Add cancel helper for async requests
In-Reply-To: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
	<20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: D0D9E6B385
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 01 May 2026 12:22:12 +0200,
Cássio Gabriel wrote:
> +static void firmware_work_free(struct firmware_work *fw_work)
> +{
> +	put_device(fw_work->device); /* taken in request_firmware_nowait() */
> +	module_put(fw_work->module);
> +	kfree_const(fw_work->name);
> +}
> +
>  static void request_firmware_work_func(struct work_struct *work)
>  {
>  	struct firmware_work *fw_work;
>  	const struct firmware *fw;
> +	unsigned long flags;
>  
>  	fw_work = container_of(work, struct firmware_work, work);
>  
>  	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
>  			  fw_work->opt_flags);
>  	fw_work->cont(fw, fw_work->context);
> -	put_device(fw_work->device); /* taken in request_firmware_nowait() */
>  
> -	module_put(fw_work->module);
> -	kfree_const(fw_work->name);
> -	kfree(fw_work);
> +	spin_lock_irqsave(&firmware_work_lock, flags);

This is a sleepable context, so you can use spin_lock_irq().

> +	if (!list_empty(&fw_work->list)) {
> +		list_del_init(&fw_work->list);
> +		spin_unlock_irqrestore(&firmware_work_lock, flags);
> +		firmware_work_free(fw_work);
> +		kfree(fw_work);

Can kfree(fw_work) be in firmware_work_free(), too?  All callers free
it in anyway.

(snip)
> +void request_firmware_nowait_cancel(struct device *device, void *context,
> +				    void (*cont)(const struct firmware *fw,
> +						 void *context))
> +{
> +	struct firmware_work *fw_work = NULL;
> +	struct firmware_work *tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&firmware_work_lock, flags);

Here you can use spin_lock_irq() as well.


thanks,

Takashi
