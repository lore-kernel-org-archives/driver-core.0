Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3804F7993
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371172; cv=none; b=Ig5b+1VVUg3Q8uJjgGg7nTgvQeh6V3+/WuQaXPUaIlytdwZGHnAVeUeWoVgWHkU622N4XswsTUu2WCKIo/YVY5FlQ1tG47OY/8DNeXqUn3nR37DzoxOMscfKR02AcJA+Uptuv9A4ATywkRi1avyntk31PN8Kv9+906gEQyBTzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371172; c=relaxed/simple;
	bh=+ycUu4Lrfdhzd9jKGwQrR5OBQYug2brCLTLBMKycAlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufOiQe4OwWhSrsksj8iU/xCqGlUeyy0XMKmN1kS9TM3Hpcy5vrV3p0svEtCE8w6CXXW3U+2o19wKnQuRh5eUUDo+d7+ib6TcR86Li8WcdHSBkHyelCDCOqH8nB/el0v1UNpUHyKtvPKve+diRbfKFg9gNk1yUiEyxOyCpxna78w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuMeVvmN; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuMeVvmN"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bb1a50f6fso730543eec.2
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371170; x=1790975970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BSFDJmV96PMiREIfL8Vp0Pof+pF3vE7NpaMcF3TO54=;
        b=GuMeVvmN9YupdhYPuwuEGH/FN5+OMJPv+B7YsI0NYzbPG1lh2EqhaWjUpSXBftAxNK
         n/PaqD4wLi+zuA/pqZkl1KFp4E5ED3qwCpcSqy2KUFfuUbaofySO6gb4VL1nzEqvZADK
         MC+qDv5LchtMINOzWGlSQXwnvYhWmL1C3Td+PnANXlvn75C1GJe2isCjwRKk9zHEK8p/
         xSrQ2C/zDuIUzSxxkDNFQzODjWnY622wRW4P1N+/W+ngiYJ7tj1qCKqrVCmsYfUrnFPU
         x8Yk6hpgAA+ZaWytrnAH6OrSV3lZRuOAt8TFXeKE8YN2NbRqUO6m2Zm+zM/PQCoHVUUR
         d+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371170; x=1790975970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BSFDJmV96PMiREIfL8Vp0Pof+pF3vE7NpaMcF3TO54=;
        b=o5w4yzm3vtbIsClfSxgsCWKEUy6TEj0MAgfkPX6dAyvGQrEFHgbR5QFC6/jmlvLPJL
         w9Ylhi5/e7fkmQQe5db8bmROs91dRDgmHJ7DEF+XS5AmhucsqNx71H+jCb9Wclg7jWUD
         z3vpN2b+Kgk7W+qFfFCMFbnoNj6U0ZeUEobmSPRev6ZqrtBhpo3L1geG23pZNDGm42Fe
         QYOeima63CbB5rjs8xcQs444PZX2DapDVImrBqXbKhTHirPs9dGwcqp2T5sjEtJF7oJL
         8dYh9SNHElXhuBJAtXZ2PhnAeWSKwrh9TWfc4F1g+LdtKrzWET5USIlWW8STfkrRvmJw
         C0vA==
X-Forwarded-Encrypted: i=1; AKwUvByPLPawteAyoxhABabwoQQlqjrMTimN10YIE7h9LgFlRgaqTt/2RDM8jU4ESCyEY+hX0QSM9Ftq1D70Iw==@lists.linux.dev
X-Gm-Message-State: AFuF++nCS41PcNhozyFyUZ1GFM69n1LYpI29fNGPZXStI5gplThCBqCs
	02doWclOpPLTBuxrU5iSgv1iMeow33iLBXfvC3or3VP37vx+kjR9V0JOpFePVEcb
X-Gm-Gg: AYBFou1sjz2c1L0kPg3n9tXJT4Sgqm6OuZQkYV+vg9OCkUiGoXDaZHQTAO83rs4Z+Mu
	plEkHIQfmjzO8kAaW37AVLEZX5PUJeBfGrrsCYCYKeq1foMakgX98CAM/8PqSq1nB9whgyiow7J
	dfQueXsxb5ThxtJqHD+kVFIdt48fFo3hjADCtOkLyrIO1pRzrFN58sidxLDC9in7x0f5cQcxDW3
	lvecsgvruY37tRGzkR7bnxp58vt3WFSEvXFxjbSXpYPcTizOEKrzfabUYH5UxqhqmSV6K/2yP0M
	IRyYNJj2Qarq9VUUnEEWIylOzkn+vnbELyD8pO6H9lhwhAjHMitDosaf3LKYcXSk9t2FuubQ52x
	m2FlDdFuq/Vi82S1TqyGdwIWYKMrNrp5RLNaE8jKWnC4BTZclwGFvjMN0FidnHJStl8cd4ex3vw
	/mDbcItIwwu1NUgo4nh/F2oAFHshMUW9uSvyWLDQnC5ND7bdS+nLUXciqvbRgn1erMIP152JHkn
	hDRMthhvSuANTqRuM6tGG4p221xqrwadwjLkNA=
X-Received: by 2002:a05:7300:dd48:b0:33b:eb33:9f70 with SMTP id 5a478bee46e88-34272a41d89mr1027757eec.37.1790371169410;
        Fri, 25 Sep 2026 14:19:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm8029385eec.27.2026.09.25.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:19:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:19:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <arbkvK54vT7SIyjV@google.com>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
 <20260826-bind_taint-v1-2-52b05f4a965c@linuxfoundation.org>
 <apA8n524yIn-g6ep@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apA8n524yIn-g6ep@hovoldconsulting.com>

On Thu, Aug 27, 2026 at 03:33:19PM +0200, Johan Hovold wrote:
> On Wed, Aug 26, 2026 at 11:19:33AM +0200, Greg Kroah-Hartman wrote:
> > The ability to add and remove devices from a driver through the sysfs
> > "bind" and "unbind" files was created all those decades ago as a way
> > that kernel developers can iterate faster, and provide a debugging way
> > for users to attempt to add a new device to a driver without having to
> > rebuild their kernel.
> > 
> > This api over the years has been abused and recently come under a major
> > fuzzing "attack" through tools like syzbot which decided that it would
> > attempt to just randomly bind any driver to any type of device, causing
> > loads of unneeded errors and pointless kernel patches to be generated by
> > unsuspecting new developers.
> > 
> > Handle all of this by adding a new taint flag, TAINT_FORCED_BIND, which
> > will be set on the driver if the bind/unbind sysfs files are ever
> > successfully written to.  This lets kernel developers "know" that a user
> > is attempting to do something that is not normal, and as such, if the
> > kernel breaks they get to keep the shiny pieces laying around on the
> > floor.
> > 
> > Note, the taint flag gets set _BEFORE_ the bind/unbind callback happens,
> > as many times crashes/oops/warnings/failures happen within the callback,
> > and the taint flag needs to be there to show what was being attempted.
> > If it were to be set after the callback happens, the oops report would
> > not properly reflect what foolishness was being attempted.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> This makes it clear that this is a development tool, and it is a good
> compromise preferable to adding unnecessary complexity or suppressing
> the attributes completely just to prevent root from shooting themselves
> in the foot:
> 
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Tested-by: Johan Hovold <johan@kernel.org>

bind/unbind without overrides should not necessarily be treated as a
development tool. For example with I2C devices you may want to unbind
the functional driver, perform firmware update from userspace, and bind
the device again. This will ensure that driver is not confused and at
the same time you do not need to put into the kernel code that is
dormant 99.9999 percent of the time.

Thanks.

-- 
Dmitry
