Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CC3EEAE3
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603759; cv=none; b=Q1Tc/z7KKMNFNDxC/sGlr+GjIZljPmIGfGzBeSCITGQx3k4Z0b/4ldEC7btF0PqZGcfCQYqspW6uwsEDvvgaJEblzkyIAqJVs2eRpLrFrmYhixKaobWaLHgAuVAVAb3NqxNngmDjiutL0cUJs6ftXEB8WWD4GRQwNvXD4epHeok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603759; c=relaxed/simple;
	bh=NqLgUWE6jIPmIymuAVK58ZLpiRo2e9IbrQwJw+3ZZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwA1vBGUy/jiI3ZmKZfgi0q0Y+/eCYUQ0rjnOZjmr0FaCMlRmAxQbwTwwwV9VEBn9hecT46bsoX8UI0K+zOVCHyqSbXG4aTqC4/yIp7V3bAba4oCF6fPK5EqMwoQ7Wv0MrEvDppKTEJQW4SOODczm2t5c13vuXxj1A+EUnM8gpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8e030b7a696911f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bf33c852-8639-498d-a740-44dccedc436e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4b058257f1648ffb8c7d8a48cb03042a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8e030b7a696911f1aa26b74ffac11d73-20260616
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 364456039; Tue, 16 Jun 2026 17:55:50 +0800
Message-ID: <125b0cba-e674-4bbf-9a97-faa7c5c08c60@kylinos.cn>
Date: Tue, 16 Jun 2026 17:55:46 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Add error handling in
 virtual_device_parent()
To: Greg KH <gregkh@linuxfoundation.org>, lijun01@kylinos.cn
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev
References: <20260616082528.1220652-1-lijun01@kylinos.cn>
 <2026061658-grandpa-repulsion-f752@gregkh>
Content-Language: en-US
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <2026061658-grandpa-repulsion-f752@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

When i read the code，i think this is not rigorous enough.

2026/6/16 17:37, Greg KH :
> On Tue, Jun 16, 2026 at 04:25:28PM +0800, Li Jun wrote:
>> The virtual_device_parent() function calls kobject_create_and_add()
>> without checking its return value. If memory allocation fails,
>> kobject_create_and_add() returns NULL, which would be propagated
>> to the caller without any error indication.in get_device_parent
>> call virtual_device_parent, if return NULL for parent_kobj,
>> 'k->parent == parent_kobj'in list_for_each_entry, will always false.
>>
>> Add proper error handling to return -ENOMEM when
>> kobject_create_and_add() fails, so callers can detect and handle
>> the error appropriately.
>>
>> Signed-off-by: Li Jun <lijun01@kylinos.cn>
>> ---
>>   drivers/base/core.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index 4d026682944f..50c3131b7106 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -3249,9 +3249,10 @@ struct kobject *virtual_device_parent(void)
>>   {
>>   	static struct kobject *virtual_dir = NULL;
>>   
>> -	if (!virtual_dir)
>> -		virtual_dir = kobject_create_and_add("virtual",
>> +	virtual_dir = kobject_create_and_add("virtual",
>>   						     &devices_kset->kobj);
>> +	if (!virtual_dir)
>> +		return -ENOMEM;
> Are you sure this is correct?  I think you just broke the callers of
> this function, how did you test this?
>
> How was this "found"?
>
> thanks,
>
> greg k-h
