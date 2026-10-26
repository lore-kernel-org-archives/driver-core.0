Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040195;
	b=gu+ytRANZQ8m7kJkHqpTuj0dYO0lGfVkud13jI0mnF5W9Jqaw7mLjE7baBvey+GY7jZh
	 2Zl1TtCvf6JwwLKLqHl6Th61mxcfH4aeT116up1acO5L8slCC2QciRf3yxdydfavCeZe1
	 BYcogrhYgxfPeGBByFWx5utPHx3qQQijAZLYVqUFKTeS5Q2tNpzbxHVFQxijexQS+OQXB
	 vD6R8vkeQHAoGH0GqrUeXlPD6sfLR2uD+KXplgyK4FTqLnRVOO4eZxY/m+08wyFSwuZQG
	 j9ZIBxzV0E6xTid9xrFbUCE13EBUzwX3yrXi8CpJmzste6xZPwHGVyRrn5QdN5i2RDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
	b=UCi5JFDPOehGxyGpBlM95Klo4D1mygoVHyltt1EYhCFdHPqiOt/12y1geqJOmzNFoZDb
	 mvyEtPIAG3lmjf9Kc3jBOHGjWGFjcXGozzzVYvpg0gzoV31xR4KWTKzYCmURYFxKCP2/Q
	 VGQGWdVzI0Pc4A0uqkW6JFbP01cYwRN/8vK/MtcrJyaZMuItf2VHx0vQ0Exx6r/Sov9yg
	 /eV+VkPdYUGVNyoDKJZvMxjUOP1sXUYa82PKsWBLmtzRmJy7kzrN2sIhbkVTIeFbqil9Y
	 1i/H/hCOTuR8MycFbAX1AfLhF9/7y6yaJeAFXyiuf7U6GBx/p5YLjRxyP5SzIzvWlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB44606A31F
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 18:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB44606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917a707f37eso33782696d6.0
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793040194; x=1793644994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=eTYoRzYH6kmgiE6CTMg4wt1hu4dSYBvV2QrGizrMXe82pU543G54ZjVzjqKabaX5kj
         kK5OVjXJ9FQLJkvN2z7Fm6dzejaSWf7XVAF7R1VbnOqrNZDNTGZQq4G+SnhTH2ZZlLex
         fqcJnjlrsrb82JK30Nyb4AaFL255x2arln21BhC+LcJ/FmkHSQdDFQFSEQ2+LSg7tUrR
         8e/0XAc1zwQosVqIawKVdc1X7xKoWhLsqVvlRcrAnpAh4fKKkLg0QOQiQrTH7pKIq2Hq
         a3NwMkp6tTK4ZYcoIRVwuRqsm2sCBdNUtIjQxdrdTGbr15LeARpYH5uNix7svO96+74k
         NQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040194; x=1793644994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=ctYxyJZpyxivWzK+GD/EIsmorTeLTWlLiNyOT4IKdhUB38Pj7pdlRBA37d+zMs0eI2
         OmsB+IIuV4A0QfdsG1kQ9MFgs/57RDFQiVLti+NkUXHa+moM0Z4dIDrTHWislw8S+wcH
         zG7MYAZdiKS6RNemalGUNmwIoxROrEmrHhaR/TfV701+PDdd6x1QAclVcdKQt3eVjfLJ
         d8N1wBWAkm5T8B/I3/OAohmBejy4RYehZquxmWBKmVrN81kOsRAURhdwLyDqp8k8pYe9
         tpQZN0I4NUSwCP/43hVRDpF9PL2OISxDRkcMSLBMV0XtIICr06EV0Qx0N9G1De7AA+UM
         Y1Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxyHD8kRSDuiP0XmT4QUbQEnWlZqmLGvBr4KC8M/WCBrWAioqRU8G1dcON2YwIV2424n5wpP163oD9+Jw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLTp9TfeMeQX13K5CuKilV4Y1UXAiD1gX+rCCQPTOLgA6XU75f9
	QhO/alZ0nOhp1sScCjzI+tRFxGgj560D6Gl3fH9qqCo6SqH1bIrNdJvo0zUCjt10Ing=
X-Gm-Gg: AYBFou1kSZdgOpv4t8cR1BMwOi/coPeIPJ/lUTiLPhNVWCD11T00sWzEgtqo4kY+aN/
	3QNtHq/u9Ow7Ro78awFqOOUXfGr6NN83MyX+yLv4BoWaYpN8Qr2tGH53OCh0st/U9pZPHwqbiEw
	7CilKh+IYb/CT9MaLbJxLDBJpScCUCcJkA0swV9cQMToGQpIaURcCKc2m2xFzG84iefKKBIDrR+
	hx79uSj26PupX3xUAvO3mUXThavctFv7tqbpkZZZbf/B+WqQWMVl55JF88cLBATeLelq0FxTadp
	lEkR0NxamyhUFB6Z9vAJ5zuRXKTTYfLTRjCh9QgansxyMZKKDYBsXL3P8xLtFYVgDO1tUhdbbUx
	4Dz+/VYsWw435sM50S5rWjGi5TkhVa1BCiRvjNFIJ13xf3/TT7YjX8eZ2/ngjKhlPH6rf1wztuF
	B7SxSibVmobGSYt28TxWJBPHq+NX0+hHkACSK7vZ8IIQQLl77XCKTNnrezuG1fe30TJy9wBC+uM
	TrFYEpNZrOGjmZvAVqyu6jdx8MD+lrhDoemHwjsB2itLKeW7uQX4uWvRuiu9njrdCjnjjxl2RDe
	/uP4zyN0kjVcH8p1ZYPY2twCemel7deX2//hb0Rg3NrmNRdsNX0lgJCJXB58pDXiabV06q2mqGP
	tosoMDU95Kc4=
X-Received: by 2002:a05:620a:172a:b0:939:6c31:2318 with SMTP id af79cd13be357-940ef8d8389mr1233127985a.34.1793040193950;
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067c879sm758709385a.16.2026.10.26.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLPf6-00000007foP-2hO4;
	Mon, 26 Oct 2026 15:43:12 -0300
Date: Mon, 26 Oct 2026 15:43:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026184312.GA1685504@ziepe.ca>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026122243.GA28851@unreal>

On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:

> This is needed for two reasons: to save hardware and software resources
> when creating a large number of VFs, and to allow the PCI config space to
> be configured *before* the driver starts using it.
> 
> There is no in-kernel alternative.

Having userspace involved in driver binding has also always been the
plan for confidential computing needs. We cannot have a device driver
bound across some of the HW transitions like TDISP shared/private, so
there has always been an expectation of bind/unbind.

For this case the existing sysf drivers_probe is good enough for bind,
but we must have taint-free unbind for PCI devices too.

I think this patch should be reverted ASAP, it is a pretty major
regression for a lot of users.

Jason
