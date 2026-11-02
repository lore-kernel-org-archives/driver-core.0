Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793581568;
	b=EXZXpEdzlhkVWy8w8sGdQDCJZgpvroi6D2hvcaTiil7onnzLusEelz35phzMQkBZ2bE6
	 tjr2OMFK7/UZ01NrWnD7gYD7NVp31T1t86RHFE7DNYhWhYPDfTsZ4zdhJcG0zqgMBCv7t
	 RPKMxrXGOiuftH1joOHuLwgMcFkgtMSud1NeLZ3XHDMXyrd8gECbDDW8avZGHOTb6wIuX
	 ftT+694GI886CD/f7n6KhkZwTyljHnjX1xLUS038lElTAp5eOIOEW6k06Ffq24xV4f6qY
	 5TsJybYU3mCMwMnIoKfp8HprCGBypw53B0h6Mmd7JxtZ8dMxZV56R2Io4bCSCIPrSFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793581568;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=Zo1UgpfExrdSaxdzBucFoa8Yd5E7v5UM/ya82JsqfeA=;
	b=KkPewMJz3CoKJ7FDLJ2uHsn+EehHkm3r4OHbCfTnjLa93sxiOUsaV6hHIZN/W7+4zB6u
	 MqE5TdW+pnKG0kSZ3ZdNzF6H/uQkN07jWcnIjYfSJPjtDfKQT7NfPpr+0jKqG+VHMN86U
	 T2oBlg8EtjEXJ7ROvP88qWP14CDLpgOJoevmNHOujMgxLZ2Li30J9Z4ZaqLRrqUNqHMah
	 E9GFV+5YcbFgTbgZnMDjtzYymePMwdHrcJXGoqDYWXN3uj8L7G+Z6c0bNo3yRdDgqlt6T
	 MakIIFE8hwidMLaW55pS3fafj6QuVVouH2GiqiVBIWbi3y4cyYrG2rPpMKGpfrhF7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7C606A324
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 01:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C7C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 4831B80A80;
	Mon,  2 Nov 2026 01:06:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 9932C20027;
	Mon,  2 Nov 2026 01:05:58 +0000 (UTC)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 17:05:58 -0800
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>,
 cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
 <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
Message-ID: <2556411d9bf65125cf5c1dfa37eb4454@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7ihqq8zu4wt8d6sc9oe61qzyiepq3q84
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9932C20027
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+tSEqHxwg/Cl4Yi9FtrWtASKGJGfOSlM4=
X-HE-Tag: 1793581558-879429
X-HE-Meta: U2FsdGVkX1+hucxXj/E8FjYYuXOJBvbHv6o/KN2yNbo/Y3VW4ETf8+sBjAhSVgjcoGsIuO/mon1vo7oVd2Jq2FSoH475Wdou2uvoSsDfVVS1C86tQ1nJ6Rgq2YV3XelvlEkqjqQjT175PdsfEvZwd0iFuw1o6Q313ni2sgG91rX6RFUMtFvy/zi9pFZVbM5Z/QfUmPX10+sb7d5AayvPi6ENto98Sm9I0ebHQUN4x6JpX7yBH6MWKzU/PHltLT91Q+rT2s6hOfXDsgs6llyRs1zAqztN18GlF0gWLSRXPEtapS8zZuNKk2ZBdSGNITVvQf8F6xVKS6dyMP6wmLhfMQ==

On 2026-11-01 15:51, Julia Lawall wrote:
> On Sun, 1 Nov 2026, Joe Perches wrote:
> 
>> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion 
>> script")
>> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default 
>> GFP_KERNEL arg")
>> 
>> Finds and converts sized devm_kmalloc-family of allocations into the 
>> typed
>> devm_kmalloc_obj-family of allocations.
> 
> Applied
> 
>> 
>> Signed-off-by: Joe Perches <joe@perches.com>
>> ---
>> 
>> Maybe this might be useful to run and apply just prior to some -rc1
>> 
>> This script would change more than 8000 instances in more than
>> 5000 files in Linus' current master.
>> 
>> $ spatch -D patch --very-quiet --cocci-file 
>> ./scripts/coccinelle/api/devm_kmalloc_objs.cocci \
>>     --include-headers-for-types --all-includes --include-headers 
>> --keep-comments \
>>     -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include 
>> \
>>     -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I 
>> ./include/uapi \
>>     -I ./include/generated/uapi --include 
>> ./include/linux/compiler-version.h \
>>     --include ./include/linux/kconfig.h .
> 
> I'm not sure that --include-headers-for-types is useful.  That is 
> useful
> when there is an expression metavariable that is required to have a
> particular type.  I don't see that here.  I also got around 5000 
> changes
> in Linus's current master without using that argument.  I didn't try 
> it,
> but I think --no-includes would thus be fine.  --include-headers will 
> get
> the changes in the header files.
> 
> If the --keep comments argument is useful, it could be added to the
> semantic patch, by putting #spatch --keep-comments at the top of the 
> file.

Ok. Whatever is appropriate.

I just copied the command line from the one that applied the commits 
above.
