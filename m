Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E593CA497
	for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349497; cv=none; b=NvkvqJZ+uvPEhpOTag0bWj+1j9cMnEKC3T4zNusPpiBY/GfsHgeoP41ZbKEnAQRpVfsj7ujqDnsd6N8ybWuJ9Z+Vbt6UkRYfBKYgs7SzizrxGGSUI66z3KCw1nD0k0HlNDHNf8Oa5bAq12oficKsmgvQ2+fNeS3dpuvxZ8VOPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349497; c=relaxed/simple;
	bh=zTNi7xN0VsEGLO29yAIGRQnfnEVLmxUXYOvil0odhJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmSdqNvjX+fGAU/J+HOgmjd/H5M22soeXfLcTK2M12elsU6htsIQytzxVLscrIe4+Z8A3exbxxCX4V66GHSP6VzVgKC0AHB3VEDayCOvEZDuiDi1wHQo8FbAp9sh1uUq5iVcTDkwVBv+A2KU3CDijcaxq7MmfP15pURdpEQVOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By83TXjn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By83TXjn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce7d2adef4so19358185ad.3
        for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785349492; x=1785954292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWyzhX8fQoAGYKV2tJCLm4P0gv3V6AUTTFTMKZQoknQ=;
        b=By83TXjngjbP/yWzc/eKRIGsEEmzv/Zig1+JrDG+GNmOSCTTn+XFkA47R0fv64oG4r
         CxGWM4QQRh32NNN0cj+347eWlT/IESwhz1+XNv6zQMJc7+pMf2JAVC3Q6jjZHSSDjL72
         ZEv0eMsP/yHFhQou7RJ7MXf87bIRLnTq95kU3vmRTa7she9Xzf7abANk4pRPFw40JGsW
         Bu1I0N/E3UB8EUYvs9xhIOpwmJKk+WnSFenDAGKaWgrvnf3OcxoG6kQAXkT0MpBlgv8p
         obZ9Q2oVgCRV0OFg3qvi44rH4qiaech7LxiVc0Ju3tAGORdPtCshEmuc7WRbCue2b2DU
         /lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349492; x=1785954292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWyzhX8fQoAGYKV2tJCLm4P0gv3V6AUTTFTMKZQoknQ=;
        b=DYcQSDhOfw/943qvdIqBL9WI6NZ9V2X+1XQjeAgIiptzSkIQY8JAr+NIasAqGGw4iU
         PvLXdfeKM920t1es09kGsV6SA02HKci9axeu+5Yb0WUZH9cj9QWyRjA+Db0i4+nytY7l
         QljFLC1hSEvwjAbW2UIGjOFyKZTr+Ms2Pf2KB9+pFLecg6wp2DBLYqUBmMXu+Y+L09lV
         I66Ykag0gZci6S1nbBR4vGNGRFLRGD7kxGk3fdtguPjLaisMFq/F5qG5aaKaLY9AyHuk
         TwA4/w3O8xGc/kaDMfoB0IpWw1ezApnEzmBJe/1Eksti8dkDvmaI6CPd/eR909jPq7s9
         LtAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1VuwotYJmFzP08mBLnuHuIyGCjstiMbVlyEvR+XH40kL7lImNPAnMQVFk2iRw6iosrKwThGqh8KC9vA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYToUkVJkb7ffAlhhbhMirNFAWu+p9HwtHK8xoYoL2Bpchg3VC
	mZhUysSli+w97k7SbVQd5M59B5QgbKiWOmbA+RKGdC4eLhM3J/FyGx76
X-Gm-Gg: AR+sD11lPvSX6a6Nj18opFjb6cs3YLt4+d0YfvW3wv94jsaiZcYaCPpfTlo3+PM0yzo
	5vPEZuGAqilAiOLEg4MQ4cbkpMxun9ThyYBvq2T9yS8cCAuh+GWoENBpAY8QoCfdFyY7E2zTecU
	KOHnq8dNSO8IeMEugYoYLT7i7NyUI7WYuCezb9KkGOnL+xywk2bmYSQ8PmMnYbQKNgg2UiCuhyA
	amCDteZIMOOrpM3SAj3d8VMydTpEc69yWzP6PArCdh8lm8tCJiQlUy3SXz65w1T5rIFyF2wehZd
	+Qs79E/N6yhZl2KFKzT7dLv6UBxwn/Ex581UrnWk/YTAiP4oIDhtHJ/OCS8K673YRp5hu+iiyYe
	hse117Zg838ZM/Kya3uRWf19jqpJ/iizrX8y3z4VRlQ1hVHcmXWYJ68taOkmQ2Y1EDlVZvTzf3v
	8d3fc7aX/Aq/SSv3huSXkPQ8tX2WnYtX7i4VULrqJo3ETWEr3gA8/kXOz5JzY2ESfMMkw3kxdE6
	S2/aZ5I3vhr6T4xDE8mFg+CUqitXw==
X-Received: by 2002:a05:6a21:7014:b0:3c3:ab31:3d1e with SMTP id adf61e73a8af0-3c8ba615352mr8727032637.56.1785349492297;
        Wed, 29 Jul 2026 11:24:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3062:3727:f62a:314c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265547bsm10684490c88.7.2026.07.29.11.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:24:51 -0700 (PDT)
Date: Wed, 29 Jul 2026 11:24:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <ampBe9RgNYpvTENJ@google.com>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
 <ambyXEGt8-f44dJD@google.com>
 <2026072717-amicably-tray-4a8b@gregkh>
 <ammQvUcOF4S_VrgO@google.com>
 <2026072921-approve-halves-6f4c@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072921-approve-halves-6f4c@gregkh>

On Wed, Jul 29, 2026 at 10:49:16AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 28, 2026 at 10:40:29PM -0700, Dmitry Torokhov wrote:
> > On Mon, Jul 27, 2026 at 08:25:51AM +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Jul 26, 2026 at 10:54:54PM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > > > > > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > > > > > driver_allows_async_probing() to allow asynchronous probing for drivers
> > > > > > marked with this type.
> > > > > > 
> > > > > > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > > > > > preference. Subsystems that require asynchronous probing (such as slow
> > > > > > legacy buses) need a dedicated probe type to guarantee asynchronous
> > > > > > execution.
> > > > > > 
> > > > > > Assisted-by: Antigravity:gemini-3.5-flash
> > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > > I am planning to rework serio and gameport subsystems to rely on
> > > > > > asynchronous probing instead of rolling their own implementations.
> > > > > 
> > > > > What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> > > > > you for those subsystems?
> > > > 
> > > > It shows the intent. It is not "preference" anymore, it is a "must". If
> > > > we ever introduce switch to make probing synchronous for some reason it
> > > > should not affect drivers that must be probed asynchronously.
> > > 
> > > I'm sorry, but I don't understand.
> > 
> > PROBE_PREFER_ASYNCHRONOUS says that the driver prefers to be probe
> > asynchronously but it can also be probed synchronously if needed.
> > 
> > PROBE_FORCE_ASYNCHRONOUS indicates that the driver *must* be probed
> > asynchronously, or the kernel will break.
> > 
> > Currently there is no difference in behavior, but it documents the
> > intent.
> > 
> > > And as there's no users for this, we
> > > really can't take it until we see those users at the same time :)
> > 
> > I am planning to use it in serio and gameport bus implementations that
> > currently roll their own asynchronous registration which is quite ugly.
> > Because we have nested serio ports probing *must* be done asynchronously
> > or it will deadlock.
> > 
> > I would like to merge the new constant early so that I do not have
> > dependency when I am ready to merge input changes.
> > 
> > Below is how it will look like (just a small part of a WIP series).
> 
> Ok, this makes sense, but you need to also add documentation for this
> new value to the comment block right above where you defined it :)
> 
> 
> Wait, in looking at the tree, I don't see how this differs from
> "prefer".  I don't see how "prefer" can be overloaded to NOT do async
> probing.  Am I just missing the logic somewhere?

As I mentioned, the current behavior for "prefer" and "force" is the
same. It is more about documenting expectations/requirements than
behavior of the current implementation.

Thanks.

-- 
Dmitry
