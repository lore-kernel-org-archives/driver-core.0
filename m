Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B472DCF55
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525467; cv=none; b=tdcAd2VhTGCR/Iy/GUFSXXVrm2pbwk5mnwK7of7nb+01qQRLf6rzXHgDVFi8ZQHLyXHI7Rn29826Va2Ow2aOkDOLEpHzUd3c0HPjIsb3RDRPNW03TCQ4ng6s/8yVNiaB8Qa8qCW3rCr051UJeI8M7UwQ5/JxuW7oIJ/CYhpvGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525467; c=relaxed/simple;
	bh=KgSYAySU8KghqF/HSUK+quIlXTMo3VgkcLXUL0jwpYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0qAQXnoy/iFpnwdtKf+z80dV1A3nA2RdO1v5sj2PtN4Hd9Htm+aalWcBZkdAxFAqTbKq+2qrUapnz1ifTR/hSghruF33tceGmR3bmaQ5nbbcm4ed9zFR/GpfD4UfKP13OBA1ganeamrjQdQV2iSkkBejRAwggHzmCzJvk8KaVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Y71zZTUr; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Y71zZTUr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789525459; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=58FNP/MYLdkpcQhzYRQAomWVIiUUsg4akLZ4/b9ebIc=;
	b=Y71zZTUrZMBa/wvV5+dC/2J3X+fYZ5Y7lb0BUGjLDKhnRSQwDe/3OY5SR5ULC8LDdT8v+LIZjIKhE6PHB7lyP4Rz9JPeijcHU+xmg8gc4OonCnhhA6hwYO1/dmbjgG6oBPtulmCBb3nZL56UdYThBzuFDv1RCzo8T7APKJtPkQA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XB3ZRHW_1789525457;
Received: from 30.178.84.130(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XB3ZRHW_1789525457 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 10:24:18 +0800
Message-ID: <102d6ca6-73cb-4024-ad55-723213b949a1@linux.alibaba.com>
Date: Wed, 16 Sep 2026 10:24:16 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cxl/memdev: Fix deadlock between poison debugfs
 and cxl_mem unbind
To: Alison Schofield <alison.schofield@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Shaikh Kamaluddin <shaikhkamal2012@gmail.com>,
 linux-cxl@vger.kernel.org, driver-core@lists.linux.dev
References: <20260910094017.4032170-1-kanie@linux.alibaba.com>
 <20260910094017.4032170-3-kanie@linux.alibaba.com>
 <aqmoulHGkQR8sWJx@aschofie-mobl2.lan>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <aqmoulHGkQR8sWJx@aschofie-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/16 04:21, Alison Schofield 写道:
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
> Hi Guixin,
>
> I'm good w closing this gap, however, I'm cautious about claiming more
> robust support for this debugfs interface than we intend.  We offer this poison
> inject and clear ABI for expert users, mostly device vendors, to test their
> CXL device capabilities. If those users take the step to do something like
> 'hotplugging while poisoning', well then they are just being reckless.
>
> This patch commit message should make it clear the user scenario that would
> hit the deadlock, and that users should NOT do that intentionally! But if they
> do, this fixup prevents deadlock.
Sure, I will change this in v4, thanks.

Best Regards,
Guixin Liu
>
> BTW - I really do appreciate that you replicated this as opposed to many other
> patches that both begin and end with LLM suggestions and give no consideration
> to, nor demonstrate an understanding of, the actual user visible impact.
>
> -- ALison
>
>
>> Fixes: 574eda81d0a7 ("cxl/memdev: Hold memdev lock during memdev poison injection/clear")
>> Suggested-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>> ---
>> checkpatch reports "do not use assignment in if condition" twice, on the
>> two ACQUIRE_ERR() lines. Those are pre-existing: the unpatched file and
>> the Fixes: commit report the same two, this patch only swaps the lock
>> class on them, and the combined form is what all 40 ACQUIRE_ERR() call
>> sites in drivers/cxl use.
>>
>>   drivers/cxl/mem.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
>> index 798e5c369cfc..3959ec963026 100644
>> --- a/drivers/cxl/mem.c
>> +++ b/drivers/cxl/mem.c
>> @@ -50,8 +50,13 @@ static int cxl_debugfs_poison_inject(void *data, u64 dpa)
>>   	struct cxl_memdev *cxlmd = data;
>>   	int rc;
>>   
>> -	ACQUIRE(device_intr, devlock)(&cxlmd->dev);
>> -	if ((rc = ACQUIRE_ERR(device_intr, &devlock)))
>> +	/*
>> +	 * Never wait for this lock: the debugfs proxy holds a file reference
>> +	 * across the callback and unbind removes the file under the same
>> +	 * device lock, so waiting here deadlocks against unbind.
>> +	 */
>> +	ACQUIRE(device_try, devlock)(&cxlmd->dev);
>> +	if ((rc = ACQUIRE_ERR(device_try, &devlock)))
>>   		return rc;
>>   
>>   	return cxl_inject_poison(cxlmd, dpa);
>> @@ -65,8 +70,9 @@ static int cxl_debugfs_poison_clear(void *data, u64 dpa)
>>   	struct cxl_memdev *cxlmd = data;
>>   	int rc;
>>   
>> -	ACQUIRE(device_intr, devlock)(&cxlmd->dev);
>> -	if ((rc = ACQUIRE_ERR(device_intr, &devlock)))
>> +	/* Never wait, per the inject path above. */
>> +	ACQUIRE(device_try, devlock)(&cxlmd->dev);
>> +	if ((rc = ACQUIRE_ERR(device_try, &devlock)))
>>   		return rc;
>>   
>>   	return cxl_clear_poison(cxlmd, dpa);
>> -- 
>> 2.43.7
>>

