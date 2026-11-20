Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191104;
	b=pfmHMWXYEVs0vUhdgs06UwIjzPWtifHRLqf0Y48CHD3edSHjmUdAe68dLDdoDdJfSpAp
	 JlC+bqemZnw7x/SF8rjPz+k41wakFXELlVrnwIaabZDdSko+/OIfPatpyAeruPJ5buD65
	 jWXpwCsxnTzRF9XsEWRk5MTCQ7yTo1Cqol/Adnuwy4kVqnD6pUyUC52vxYu2EIcf6hAT7
	 RX+1jeRzV7Sw1e16iTs3weoX5RO0f1xSfafuv7ZicxQ2lfLCyN6WJEGkFiEWvAaAXohbe
	 IiNMNUvy3Y2zeen06eFtZSHlqFzIdHXFW0t3TT/VnpV3L6Cte1CXZvCGbzsYjQxOSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ACIXcHO1wQS5t52irVr/vPmSpLKY1T/AIbYzAIeE1Fg=;
	b=OnAGLkzjsfZsH8EaXTYzNpRm7qVWhYBiE2qKEotHqNhHaZXLTmMk0kZqWZn+do2XQv+i
	 +Kqm2UqF5c+5T5P+pFYUi/J2c9XlYHr26/UoClezIKLDQhdTtI9oapPzpnks0/uPWuY3m
	 FDkf7X3G9cOdE2CD0sVQJ4N/NaECOH13Rgi0FHOHDArsIxfuleO0kySJPRWxfyWe9nT+W
	 Q4qEdRMh/QQAt2PCM+R6uIQBfB3h+4/EHNVa459n5RepBoDykAAlbuSklDm8l70QWUmRL
	 Q4s6nKvrr+PeGVlZeZoYL+0xJF+Cq04iPBkyImjijMQIn5o6XuzCiLhWfMnP1KraeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Nl+5shfq;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA1606A320
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 16:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DA1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Nl+5shfq
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94999a08973so108629385a.0
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 08:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795191102; x=1795795902; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACIXcHO1wQS5t52irVr/vPmSpLKY1T/AIbYzAIeE1Fg=;
        b=Nl+5shfqKFWD77cD45kX4/hWrY7UyU8+ESbvhGDctOhqOFAu6W8XFlOJeid5+C2tVo
         tLiL6u48BZMhZf6qykJc7kPRVkGKSmW6WO94ZQanfh7faKBVWk9IjBlN55hlrZWF6KAn
         wHGq3o2cX1jTw5+po1IACmrnltBU0eGgplm7dFAnfJKLFONoL51oTWXKV8F4rzsyABEs
         /RisM1eNMSgxjLh0pgnU28AECB1n7lDHtWNYYLCpWu00c9Xtycer2xBwGem/KPTDN+H5
         V0F6z3YeoNdFOKG6sP76Tt30Z3+PU23+4iHbEzZsX+n6iA+Li3y71wmI3bhhUraC6w1O
         ctpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191102; x=1795795902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ACIXcHO1wQS5t52irVr/vPmSpLKY1T/AIbYzAIeE1Fg=;
        b=mySbq0y1Iz5a/vZawPlt/5+84EhB/T8K5MSiLCYWplvo8QXd3lmLsDfifbfYqI4Dvf
         OkoPjvHWrTDTDVUMWkLkxG6qXFbMNLrxxkvl4zZucisGwol4I06LVdWUBMFmC1TLwRmo
         j7EYFxPPG/+Qzyk2Ppy3uJlVYjfh5knUo2zV8eBLaG5AMfZllYozuWE5MI65/K9QpvUd
         JTJ8KvLL94DcYfPvxry3r4gl4hWuqDZnsICCuRKTk6d9c18vOUvmI0ACmYXXpiZOKthS
         2+v9f90aNGe+8EubNPPDpfu7A1Fo+tVwLthSjCPoVfRzXe7mZG+43Z9GL2draag8XXdb
         tXKA==
X-Forwarded-Encrypted: i=1; AL+hErFQhnbVzzY8di/QkmhmXU1e2iMo6DlfeQjs9OEGgD4uu0UyPISAY0c8GYrQEiwwxoOSSpa1aqBjFklZ1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KLLwvu1iNdo58Ve8gLY01Pic2C02XrUAlD9QLPSPK/Kn5P3MN
	bTfd6AhUA+MXBCva0sHsAhXa02Z5JaEyjGiBuhE0XLBOKSDUhY2fYF/oAtIrtuzkBw==
X-Gm-Gg: AYBFou2Gvy6yIIhh9dXhEeRMlgR0qyFWpzD0rnOHZOtrZJHeBJ4n6WDux+Hj/PzcYMG
	OdqR1NHb6E9iXYt7vJiwBHkAAE7C1MvVhfIs8avQPuBIMPTryXvCi392hnw5lkK5PTpmv9S4bo9
	pNSQH+wYrZsGC1OvlFU6XYXMKsC4r5XE/sbvmwqEIKoM2miZfDcd7fqIDQiv3D+2rKU42ufmZuM
	BpRG/mWNfHeNFFJ9LVDlh4ifehu/dtV46mR1f4G+tUgEZVw28H8HokUWPt6K4E4QwusMhf6fCar
	xNQSfrwAb1sGAxKJp0g0AdgqlStRsTmgTiUZE9ODsgr1mzjkR42FVDJUx/Fn1YgEhXMNz3RO4jq
	xmydtYpEql5RHygWKyTCMsc8xSGKDB9HES9yy26XZ4Tz+JYMP6yk2KV7oYSprWGzBiWmnu1QKyn
	Th19p/iyK50QCesgHNZyHiu2wCC6AT4aJttXqkbwgrytboTkPQupgigLhTuffP31E8x2vAcUg5V
	hssefyRJSRkQXqmuc4Ox3ovpA+EUNcwkg0RKIZgbD9+uP1Pzvm6bOWQTdATNrlmVp8Z1pYhqQ7c
	4L8EgjQbaru3JnB5la0kSeY/wdlrlg==
X-Received: by 2002:a05:620a:46a3:b0:949:7069:3fab with SMTP id af79cd13be357-949bab3e9aemr621786085a.83.1795191102506;
        Fri, 20 Nov 2026 08:11:42 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm213666785a.42.2026.11.20.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:11:41 -0800 (PST)
Date: Fri, 20 Nov 2026 11:11:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1 2/4] PM: runtime: Drop space characters preceding
 labels
Message-ID: <2edb9ce7-8ea7-44ff-b5fa-38e9880510fc@rowland.harvard.edu>
References: <1978814.tdWV9SEqCh@rafael.j.wysocki>
 <3453847.44csPzL39Z@rafael.j.wysocki>
 <c1a2c90f-c667-4bf2-bbc0-2cb3f840ad97@rowland.harvard.edu>
 <CAJZ5v0jX8iR5x2eS1uAf_P12Ke_OBq6kx2FRCiVuSRRRDgMzLQ@mail.gmail.com>
 <CAJZ5v0j39Wzb3F+ACHC+KM49oruUuekN3fDzJFcfHTtnDXqk+g@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0j39Wzb3F+ACHC+KM49oruUuekN3fDzJFcfHTtnDXqk+g@mail.gmail.com>

On Fri, Nov 20, 2026 at 01:30:14PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Fri, Nov 20, 2026 at 1:11 PM Rafael J. Wysocki (Intel)
> <rafael@kernel.org> wrote:
> >
> > On Fri, Nov 20, 2026 at 3:47 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, Nov 19, 2026 at 09:17:08PM +0100, Rafael J. Wysocki wrote:
> > > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > > >
> > > > Drop space characters preceding labels from the core runtime PM code.
> > > >
> > > > No functional impact.
> > > >
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > >
> > > There actually is a valid reason for keeping the spaces before
> > > statement labels, although you may not agree with it.  Namely, the space
> > > prevents "diff -p" from thinking that the label is the start of a new
> > > function definition.  That's why I put a single space before statement
> > > labels in the code I write.
> >
> > But this is not done elsewhere in the kernel and there is already some
> > inconsistency in that respect in runtime.c.
> >
> > Since the next patch is adding a new label, I thought it would be
> > better to make it all consistent first and I chose to follow the
> > common kernel coding style.
> 
> I can drop the $subject patch though if this is an issue and make the
> next one put a space in front of the new label.

Oh, it's not a problem.  I just wanted to point out that putting a space 
before statement labels is not a completely senseless thing to do.  
After you've read a few diff listings with statement labels where the 
function names should be, so you have to match the diff against the 
original source to know where a particular hunk belongs, you understand 
why.

This is your subsystem; you can solve formatting issues however you 
like.

Alan Stern
