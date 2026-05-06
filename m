Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511D421883
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066068; cv=none; b=AtR6s1BpLTH0EFY0GL01A9v8DV1MScANf8LLJV5iEttuVftI7eaDGBU3cYZh1GqMWWxilUeXhpzIRo1w0OiMOS4X0VAPARzBTgXdx+1oJCe/B9SQZmjidevvGLQkhi2AqTO1E0bKGs4+ENQxcQ2QIQvGAqIh3M4ENCdsbQmu4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066068; c=relaxed/simple;
	bh=LvFxCHbOGRjJ7dpu5UsC9gpZu0+Ci2F3B15Uv+62HLA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ix4iAL/VHLgeWuvAygLErGKhjdKYVVZO9oIgQ2WYooWLxVokhemVS/9Bvm45xjPnRILnHIHkcRm2sVQAfl7q9JlEHpQY0krHCcjsjCic06ELs2lY83qUhe046B8tBsZ9iigqfqe9loFZ0VH76WJl4GbZ2hv1nh6hC1uEVjq8cfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KBCjgcHf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QMwy4HWM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KBCjgcHf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QMwy4HWM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KBCjgcHf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QMwy4HWM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KBCjgcHf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QMwy4HWM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0BE96B7F1;
	Wed,  6 May 2026 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778066065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4XhxgKG4AAWZH0Z2axsmkZ4iCzPZcug/kEaSYRSO4Q=;
	b=KBCjgcHfWRJnxq27EAiOMtwRXoeO23PQD9SgDVW/ARDQtivDaR9AHIXbVL6qWxNm9EFSwU
	5057MeXrqnpVgeSy5ri+xIkpk3leWmYgW3WYeDOji+bCI8FSf91pjSrZDhI86xPv0ltrDV
	UYOxbqg8mOt3no08+v7wmPCORYKXBzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778066065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4XhxgKG4AAWZH0Z2axsmkZ4iCzPZcug/kEaSYRSO4Q=;
	b=QMwy4HWMzI3eMSM7m4snJFPuEgBOxX1t1ISMIqDquiDJmW0UgDmgErB1iljDuIcoEdabyp
	DZ2HkdpOxAPZdtDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778066065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4XhxgKG4AAWZH0Z2axsmkZ4iCzPZcug/kEaSYRSO4Q=;
	b=KBCjgcHfWRJnxq27EAiOMtwRXoeO23PQD9SgDVW/ARDQtivDaR9AHIXbVL6qWxNm9EFSwU
	5057MeXrqnpVgeSy5ri+xIkpk3leWmYgW3WYeDOji+bCI8FSf91pjSrZDhI86xPv0ltrDV
	UYOxbqg8mOt3no08+v7wmPCORYKXBzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778066065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4XhxgKG4AAWZH0Z2axsmkZ4iCzPZcug/kEaSYRSO4Q=;
	b=QMwy4HWMzI3eMSM7m4snJFPuEgBOxX1t1ISMIqDquiDJmW0UgDmgErB1iljDuIcoEdabyp
	DZ2HkdpOxAPZdtDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69B78593A3;
	Wed,  6 May 2026 11:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z2tYGJEi+2k7ZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 11:14:25 +0000
Date: Wed, 06 May 2026 13:14:25 +0200
Message-ID: <87ik90ssby.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Takashi Iwai" <tiwai@suse.de>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	"Luis Chamberlain" <mcgrof@kernel.org>,
	"Russ Weight" <russ.weight@linux.dev>,	"Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Takashi Iwai" <tiwai@suse.com>,	"Shenghao Ding" <shenghao-ding@ti.com>,
	"Kevin Lu" <kevin-lu@ti.com>,	"Baojun Xu" <baojun.xu@ti.com>,
	"Jaroslav Kysela" <perex@perex.cz>,<driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>,<linux-sound@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware teardown
In-Reply-To: <DIBHP03H2703.3GVN744LMKNQ1@kernel.org>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
	<874iklt12t.wl-tiwai@suse.de>
	<DIBHP03H2703.3GVN744LMKNQ1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,linux.dev,linuxfoundation.org,suse.com,ti.com,perex.cz,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 06 May 2026 11:34:39 +0200,
Danilo Krummrich wrote:
> 
> On Wed May 6, 2026 at 10:05 AM CEST, Takashi Iwai wrote:
> > On Tue, 05 May 2026 13:18:15 +0200,
> > Cássio Gabriel wrote:
> >> Cássio Gabriel (2):
> >>       firmware_loader: Add cancel helper for async requests
> >>       ALSA: hda/tas2781: Cancel async firmware request at unbind
> 
> Looks good to me now.
> 
> > I guess this could go via driver tree?  Or I can take both if I get an
> > ack, too.
> 
> Sure, I can pick it up via the driver-core tree, but please also feel free to
> take it through the sounds tree.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks, then I'm going to take this to sound git tree, as it's the
only user so far.


Takashi
