Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9A4854F1
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040012; cv=none; b=jyyn4K1A1cEkM77kq7aP9/sngc2xVQ4PCJGIKrUhsRHrnKLYnPFlBuRolbpGPxFezmYwAwx1By/t1AF+qhMpU5+q1QDojnr101tYEnbgY2zP2ek0Aa2wfJiErqLGQXQY8AeIFiVa3Xbr97RSAKWpeeUnjX2MJJL6CLPGNm9CdXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040012; c=relaxed/simple;
	bh=xav01cWb7UfRw+/zADMlupD2mv8vBFYf13jNjGCM9nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVYZiVasfj0JTFwg4s7d0V3J6qutTbasf4cUmwK2Kwz/AO6EfWUECmVIrb1QvO2l2gW8Ncar7ZcVg4AMAjsPfY09ND9fTZuKiWonpHsi4jrGoYa/WNh141yMpHJbLkoRMd32rabdGEEmIpy0tGb3fgpLnzuleGrW3fx8kZy0urA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UJixB0Xn; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UJixB0Xn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789040003; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/i3q1wLaYdF92QzBpwkFRgnN8pGiovO2LZPbzL46DOA=;
	b=UJixB0XniyO1hWB5CTy4e07k1XsZtwLeTN4WwUmyKTYBq1dW4OXxfrHt2DauBLLa4rgcBCh/kiTN7FQGEUGFb3M0thXfmDruf1+p/KPdm+H270Yp64aH1olsOwrRKsE9x6fdiUO+l3a6kxJRtgph425kNB9l/ZRJuoq9ZqlqLik=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XAhUml._1789039684;
Received: from 30.178.66.249(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XAhUml._1789039684 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 19:28:05 +0800
Message-ID: <ea74384f-714a-495a-8d78-d47a9657e05e@linux.alibaba.com>
Date: Thu, 10 Sep 2026 19:28:03 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cxl/memdev: Fix deadlock between poison debugfs
 and cxl_mem unbind
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Shaikh Kamaluddin <shaikhkamal2012@gmail.com>,
 linux-cxl@vger.kernel.org, driver-core@lists.linux.dev
References: <20260910094017.4032170-1-kanie@linux.alibaba.com>
 <20260910094017.4032170-3-kanie@linux.alibaba.com>
 <2026091013-deepness-astronaut-471a@gregkh>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <2026091013-deepness-astronaut-471a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/10 17:52, Greg Kroah-Hartman 写道:
> On Thu, Sep 10, 2026 at 05:40:17PM +0800, Guixin Liu wrote:
>> The poison debugfs handlers take the memdev device lock so that the
>> region lookup sees a stable cxlmd->dev.driver. debugfs holds a reference
>> on the file across the handler, and cxl_mem unbind removes that file
>> while holding the very same device lock, so a handler that waits for the
>> lock deadlocks against a concurrent unbind.
>>
>> Both tasks then hang. The unbind side is uninterruptible, and it also
>> blocks the memdev detach work, which runs on an ordered workqueue and so
>> stalls every other CXL bus work item.
>>
>> Take the lock with the trylock guard and return -EBUSY instead of
>> waiting. An unbind that wins the race removes the file first and the
>> write fails with -ENOENT.
>>
>> Found by code inspection. Reproduced by writing inject_poison in a loop
>> while unbinding and rebinding cxl_mem, and confirmed fixed by the same
>> test.
> Why would anyone normally "unbind" cxl_mem at all?  That will taint
> kernels soon, so you don't normally want to do that, right?
>
> And debugfs is root-only, so this is a "root did something bad, and gets
> to keep the mess", right?  This should not ever be a normal operation.
Agreed, nobody should unbind cxl_mem in production. The sysfs unbind is
in the reproducer only because it's the cheapest trigger.

The window itself is not sysfs-unbind specific.
The debugfs directory is torn down from a devm action, so every path 
that ends
in device_release_driver_internal() hits the same wait: rmmod cxl_mem, 
and the
memdev detach work that PCI hot-remove schedules. That detach path is 
the third
task in the reproducer stack, the one wedged on cxl_bus_wq.
A poison write racing an rmmod or a hot-remove is not root misbehaving,
and no taint flags it either.

Best Regards,
Guixin Liu
> thanks,
>
> greg k-h

