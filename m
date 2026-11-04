Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832089;
	b=pOAgpoVn2k5i3sC/44nBCHXWNvaN8R55DHoVGMhN7cbQq+vXqezu0jzOQdsGvKl+HpJn
	 LcZTMcutIEvbdzNQP5awfJGy2XsfFVui4XWJsakoGfY6/w2X92ND421DeomqTQ78q2jox
	 FIzmDdA0VNL/EbL6DP0oCK/biZtaBViwy0eii4WhErXuuT65cKjO9SMQTUmsKMETqGpg2
	 uL1yiH6RVSb3tTDwj0f2Yq9PreTN8A/IhYOW8eF2e6e/9PtCWIPUHKF82PZOV4/OV/jT3
	 I7K8z4dB03bGRbJ7svYY7al1NiEkCTyOyoUVZB7f7YAGgdwFXI0PMKKVW7jTP95lzSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832089;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7qZpWURka/+lx/7Wneimm/Vla9SjK0znRO6n7QU8y1A=;
	b=WZHyX/76A66WTx8ggMjPah0L/MUAvBT9wyRDQ5JV87wsrfLWBWN7h+VfGbZirjIRr/II
	 5kl77OCrx5LmrEKLk43UIROAYC4c+evS+6DEVMa4JrX3cgQTay2H2sWk73WJazpLCfvpq
	 i30zK3zdnJ4yR4BVf0nBCJ9UTJpj4HIn6g/ahLcvGb5VNuWbZ49SAQfQJ6Jpe+fwkzQhg
	 Ev1INuc8+a5EAPFqh2uuxuFQUnAZHtqWhc8gObIVrbA9qNxvra/kwocbwKqF8NqjTTy+K
	 YJbWWfRNX0Qn0GPYeuMN2F6+c2IaIyRLx6ZGRwyFwyLaCrEB/iaq91Wl/uBsu580HHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rOqIZS4t;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1A606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D1A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rOqIZS4t
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 230F84DC;
	Wed,  4 Nov 2026 23:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793831948;
	bh=l0IK2/uBObwwwOOvN1QlNu1hSSuVNS6zujcv8abfYJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOqIZS4txSf/h63rLdjLG/LuplpnE5uhWks5TqjbN9vprraQnjmaG7bwLJOSj6eVs
	 xdQedBICWzlFs5wmS9BlFTY2y1xhNvfZD9feZDjar4rNO3wxLvKGrYpj8WHeczlukE
	 wQF8GmsShvC++n4FfU78qc7YewZteuLFStwrNR1o=
Date: Thu, 5 Nov 2026 00:41:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chad Aldreda <ca@modelmiser.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nick Faro <yux50000@hotmail.com>
Subject: Re: [RFC PATCH 0/4] devres: warn about managed memory still held by
 open files at unbind
Message-ID: <20261104224125.GB3976471@killaraus.ideasonboard.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
 <20261104220749.GA3976471@killaraus.ideasonboard.com>
 <20261104223146.4012287-1-ca@modelmiser.com>
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
In-Reply-To: <20261104223146.4012287-1-ca@modelmiser.com>

On Wed, Nov 04, 2026 at 10:31:51PM +0000, Chad Aldreda wrote:
> > Are you really expecting anyone to read all that ?
> 
> Fair enough. The short version:

I think you forgot about the second part of my reply.

> A struct cdev, miscdevice or video_device embedded in devm_kzalloc()'d
> driver state outlives the unbind through any open file, and the next
> operation on that file, usually close(), is a use-after-free. It keeps
> getting fixed one driver at a time (44f3468a0aef, 7d6358ab0286), and
> cx231xx in 7.4-rc1 still has the shape.
> 
> CONFIG_DEBUG_DEVRES_REFS, off by default: in device_unbind_cleanup(),
> before devres_release_all(), walk every task's fd table once and WARN
> when a file's private_data, i_private or i_cdev, or an object a
> subsystem names (patch 3: V4L2's video_device), points into an
> allocation about to be freed. A debugfs file still live during the walk
> is judged after release, since drivers often remove those through a
> devres action. Cost: one walk per unbind or failed probe.
> 
> Patch 4 is a test driver: unbind with its nodes open gives two WARNs,
> and KASAN then reports the use-after-frees on close. vivid, as a
> control, is silent.
> 
> The open problem (question 5 in the cover): the walk holds a reference
> on each file it inspects, so a racing close can leave it the last
> holder. It runs on a kthread so that release goes to delayed_fput
> rather than task work queued behind the unbind, but the delayed-fput
> worker is serialized, so a release there that needs a lock unbind
> holds stalls the ones behind it.

-- 
Regards,

Laurent Pinchart
