Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843F3A5448
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054736; cv=none; b=hAdR8TQBk03okBiiTUnOTZE8d97FHKJZs5eTzMlBteGvsVG1dMsyb8rN5394pUkyP8OnnDIfbH3b6q9fAtURF8IZ4hKeyeLz7vUFiPVLpaO6taoccKzJcuw+EOPwja9XVDgb/L0c3r0v2OWAnSZWuWx5jo0MdTsD3Sz+dqoSP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054736; c=relaxed/simple;
	bh=0ps8bJK6DcNXN0UOauIdpXg3SPcwwpcGNr3Dnt/+Txw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AoolndH5F6v/hVFCbhcywoZcqnbDZ7HiuDfpImy8CfLuT9F5k0NXD6V8rY+mxPS05IHEdr/vMbktA2e/N5ils/6jnkeplUC+Cs4h7ZAgbXtl6DNb0tmnPjdzVDfiM3dTNXcubnIbD7qrQa7Uo5pN7e/7ghbx3MSxuKKH3EAwqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UneSjBEe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AkQAKAIS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gI8q1zrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zTiqIwJa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UneSjBEe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AkQAKAIS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gI8q1zrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zTiqIwJa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E75AA5CE13;
	Wed,  6 May 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAg/SWP8vgBEMcklkvAaUbpWAr2r4ID1DcmDiUQam6Q=;
	b=UneSjBEeqssb5G9KiZdL/0WbXYGPS4UZiMNBNLVEM29BJOT2AmupjC8cktgQ1HeSj50+Of
	BYt1jnc2lcKyusERiGqPktQQSrSe3xAG5MzUSA3kbfWsPYWv4HFVmM8a7o+ZXmHuEShRlV
	BA8J/kTGfOZi46v4Epw2HebNlssPwWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAg/SWP8vgBEMcklkvAaUbpWAr2r4ID1DcmDiUQam6Q=;
	b=AkQAKAISuUeV6L5FdICJdt2Nd/u5jcCdo90huU+qnyYpq1qPDoeQeE0lFzvI3Bg8KTO7J0
	IOh2VNONW4UnM4CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAg/SWP8vgBEMcklkvAaUbpWAr2r4ID1DcmDiUQam6Q=;
	b=gI8q1zrS0FOrv6OoworiuBinhk6LR9Z3zoB0232KguX+GVtuFA8/zj/X+BX6sA8Vwd7qUv
	KYs4S/GYNiFTSWXsCOIMZwQKnaD4ZKf80IQc85qnW7JkNQm/cFWQ2h0lpuI7E/S7K3FDyo
	mt7zPDVi3yVUTVFlH4e2AMwb7nwAQCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAg/SWP8vgBEMcklkvAaUbpWAr2r4ID1DcmDiUQam6Q=;
	b=zTiqIwJa6uM1gfXDlLzG6ckGt6OEu+6tSpkgNGbZ7qkziT+pSLry8XHYG1TW3Kn3/kLAjs
	Uk/FE2L2BBXFstBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A62E593A3;
	Wed,  6 May 2026 08:05:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RfZ6HEr2+mnEKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 08:05:30 +0000
Date: Wed, 06 May 2026 10:05:30 +0200
Message-ID: <874iklt12t.wl-tiwai@suse.de>
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
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware teardown
In-Reply-To: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 05 May 2026 13:18:15 +0200,
Cássio Gabriel wrote:
> 
> TAS2781 HDA I2C and SPI queue RCA firmware loading with
> request_firmware_nowait() during component bind. The firmware loader
> keeps the callback module pinned and holds a device reference, but it
> does not provide a way for drivers to cancel or synchronize the queued
> callback before tearing down driver-private state.
> 
> Add a small firmware-loader helper to cancel or synchronize async firmware
> requests, then use it from TAS2781 HDA unbind before controls and DSP state
> are removed.
> 
> No hardware runtime test was available.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v4:
> - Use spin_lock_irq() in the worker and cancel paths, which run from
>   sleepable contexts.
> - Fold kfree(fw_work) into firmware_work_free().
> - Keep irqsave in the request path so GFP_ATOMIC callers do not depend on
>   IRQ state assumptions.
> - Link to v3: https://patch.msgid.link/20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com
> 
> Changes in v3:
> - Keep request_firmware_nowait() manually managed instead of making the
>   existing API implicitly devres-managed.
> - Track scheduled async firmware work in an internal list protected by a
>   spinlock so request_firmware_nowait_cancel() can find and synchronize a
>   pending request without weakening the GFP_ATOMIC caller contract.
> - Match pending requests by device, callback context and callback function
>   instead of matching by callback alone.
> - Avoid the devres_add() / schedule_work() ordering race pointed out in
>   review.
> - Leave devres-managed support for a separate devm_request_firmware_nowait()
>   API if needed.
> - Link to v2: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com
> 
> Changes in v2:
> - Add request_firmware_nowait_cancel() in the firmware loader instead of
>   tracking the callback lifetime locally in the TAS2781 HDA driver.
> - Keep the TAS2781 change to a cancel/sync call in I2C and SPI unbind.
> - Drop the unrelated cached kcontrol pointer cleanup from the previous
>   local-driver version.
> - Link to v1: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com
> 
> ---
> Cássio Gabriel (2):
>       firmware_loader: Add cancel helper for async requests
>       ALSA: hda/tas2781: Cancel async firmware request at unbind

I guess this could go via driver tree?  Or I can take both if I get an
ack, too.

In anyway, for the series:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
