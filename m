Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0E448D01
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764191; cv=none; b=ElXm4/cdKGb7kSPqWblOyJ20Kj3C2eKCIwPUc45XC6oBPy6kycIp8+5oOTNigJm/Nas4ZC5k0pMv1dd9VGnI+7ueNUCF0B5xWXM8NUVds3QS0zNhLtYmANWFvM8Eddn4IIyMqUXX1Do5hFD6N4A9VaairGsxDnMV+ASY3JwdQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764191; c=relaxed/simple;
	bh=HryDV6+5qMbLhZY2KERuGiFp2ZKXAOvyWcXmP57Eq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FbubJplhojU/++6eR1ylahnVJF2mQpgckQorZ7fnQmhh29nHzmWfxxg/b0iKxOX2HkWej8dTlZYi5lGYoqT3fUUhiHo4azD77t6EYfeLS7yyjclWqIZS/7s8F4PaJEQqFmpFzV1gD/wQO9v6wJ5biM+KWqv6eWmY4KuZkkgYfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDPKkyVo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDPKkyVo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5e866bca0so1505326a12.0
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764179; x=1788368979; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=KDPKkyVoJwEOlsQhU/35dxB5L4hUNLP1dX4dbjViVglIgD9bMPAb93MjVXPYd0YDR+
         AxqCURH/LT3TUTqWE8w1dtaPH1CnjpObtiQpd6bTA96J5wMDlLnqV/YeCKaJ7VgN/s5/
         +FDCxfEBkPKTjrVxrAsndWLdFYSzWFamnC4kqPbOeH8kWGrPumctfxDePzzcSrUsgF6P
         7lVkRo5pXW1/Iy8qR7G1rIbyKON7HAkA5U3medl0eVO3SJyDmsnc8kSqWvYaOdyieQUc
         L2p1+DuiRlI3q0fPEhSy9Q2G76i5/5gnu5NtVzfymQ4oIxYO9J9RI2mfCUQr82HMVi4Z
         9gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764179; x=1788368979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=lG8d7n7wIhOhvLAEZS6loxK1h5zPmQtjsHoFQuJvrtKM4UwmcGUVdjd856Y3nhSBeA
         BccHLN1bywmKMQ7qkut5x0hMYgK/+XMNBaQ6/e4Fw2Axbvkbq08tXrts/gTv1B6OLHAB
         Wcnz+MRYWEQ9IE653M3e3CRFChhdIvaiswKPj0kj9DMXF9B1EFVJfQ7cOtX5Y9MGT7jn
         aYMn2x0p9Rj0cL/ckL9FpFsDF2pw+sEgOz0RQwX5hYKh/8tk3QV30XhUq5pRlE9oasUS
         Jpm2ZjXjvKhr9Gzo24szSqIxeyTSC/yJZAwTME30CBaaxoO9rMf65gtZBeXrKFaEhjY/
         q/OA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3hwVsfqrEWh9mxwtMq9WHUHm4khFUaw/0g1mIolV72JR2WFwWU04eGTH8vU6cDDMohU0AHPclMVS/AQ==@lists.linux.dev
X-Gm-Message-State: AFuF++khNmQERsqVp63JOznesgoZpToKJoK4R88RjH4x8MY/0iQDz0bw
	uHewWFbMojb3Luxt0iPKSCOKCEJlDgNeJw1OjUJ9OFzrVAUvQzT5y6gO
X-Gm-Gg: AR+sD130GVrI5D5VkwY5Za8K+G+mYrIpwvJVz00nxbDLP2tXZNkAL7sUAq505iwcxrz
	yvhBgSZqBBmrDjseq2sy6xMOMXILEA31V6kKg2NYiNyJjX2lBB5yqzyHOYmMBMi+lZD5vWJ9AKx
	NJiwMvMR0ppB8nIKlmPl3UB8hHvM/0pxcDNqh0Pl77tGHl56TDtYJ6R6+y+sbLDH8BMjKaOV9ki
	RECSYlX0WLrjrLvx9iKIhEFAzMs0vrx53Gb/oaufICDmgOByOww2p8djK35P8uw2NBFiXtGE8er
	MtJmNs79PY+ebOQsHc6eEOB9vfljAdbBuQMl2l8cmw00hJeta8XWDmk6QI9RP5+7IUQpPnssFIb
	QmBoXobTcDkMzJmBhX4GD6vmFtmwOFUGez3M13SXZRfoCH6deUffWZZY57rkAnNfjy1+ekNiFRv
	XWeo6NpoV+g1CZU+pNlkMqebnbkKd+H54oHzop4pG6V7Yfzb1t9HJM6m6GVed2W5dJcHA=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:f092:3c1e with SMTP id 4fb4d7f45d1cf-6a5df6410cemr9897163a12.13.1787764179194;
        Wed, 26 Aug 2026 10:09:39 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm2563163a12.17.2026.08.26.10.09.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 10:09:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:09:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826190934.5042b344.michal.pecio@gmail.com>
In-Reply-To: <2026082634-cloak-ambush-3861@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
	<20260826173549.18c8a89c.michal.pecio@gmail.com>
	<2026082634-cloak-ambush-3861@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 17:44:06 +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:35:49PM +0200, Michal Pecio wrote:
> > You can't bind random drivers to random devices out of the box,
> > you need ID overrides. And then you don't need to bind manually,
> > the kernel will happily select the wrong driver by default.
> > 
> > Authors of the recent xhci and thunderbolt patches admitted that
> > 'driver_override' was involved in both cases.  
> 
> I'll be glad to taint if driver_override is also written to, but it's
> bind() that triggers the actual action happening.  Or so the traces
> show.

Well, I suppose probe() is the first victim to crash in such cases.

But if Syzbot is binding random drivers to random devices, the obvious
solution is to ban 'driver_override'. Using that is just cheating.

If it still manages to crash drivers by binding them to appropriate
devices then I would say it will finally be doing its job right :)

> > Meanwhile, Syzbot also found a stupid write to freed memory in USB
> > core when HCs are unbound. You may say it doesn't matter, but:
> > 
> > * USB HCs are hotpluggable thunderbolt "gadgets" these days  
> 
> We support PCI devices being removed, but that falls under the PCI
> hotplug rules/requirements, right?  Anyway, sure, we can fix those bugs
> when found, but that's not the majority of what we are seeing at the
> moment.  Look at all of the dumb platform drivers that are getting hit
> with this on the syzbot reports...
> 
> > * there were plans to alter this code so that UAF is triggered by
> >   hot removal of the USB device, not its parent HC  
> 
> I don't understand what you mean by this.

There are ideas to change some code to use per-device data instead of
per-HCD data. Coincidentally, Syzbot found that this use races with
freeing the HCD and it would also race with freeing the device, making
the UAF easier to trigger after proposed changes.

I gave it as an example of Syzbot doing something useful with 'unbind'
when it isn't wasting time on driver overrides.

Regards,
Michal
