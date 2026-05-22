Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE4195811;
	Fri, 22 May 2026 02:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779415897; cv=none; b=VhKssRL88JB5TnEftBAQ6Du11aqvbfyi6dCL6/W5DnVPGJ1mMYi2Rn2+orxoF0ZBOl+As8yWijWXs9PSYXST3bHeTnOBLpNjQKPf6ufAsNY2Un4/J8fTwUpek0FXTp4kOnNT7TlKa4KzgXWHxSPJcqWxkxZNV064igLV4SAOjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779415897; c=relaxed/simple;
	bh=9yiAxEADPkbeF68BLscelnOqedgkoMM5eLOBPcF+BP4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N6gO21812nIeKKx0JFGIcIVebE3ZQXbqa+cc2XXI8RhvINtWH5rGsLnkMh6YKXXeeQrrFiah/m1baNasGklx/PrB7epJDclEhg1auZqhClcPiCJIVh7jBvXwpcdOtpSEBQJX6C16/muGzTSljb86a13sMXDU1CTx9I1gdM9EgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=If/9CTWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="If/9CTWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926871F000E9;
	Fri, 22 May 2026 02:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779415896;
	bh=8BUw2h9dAN7gi3R1f6+m5jsrtghP6ZvVS/z2xMuCu2U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=If/9CTWc6wp2QwMOwbvnJwdbAQXmcMuemFE7qADYU6H97FDR9tuBZLPH+O6ku1Ac2
	 1l+sM/yDlFFwAVLn2BQDRE6AB+rDjBRGsK6NVh0l0vUuiJcKSqYAjz7IaaP7bFB9kA
	 6NLPMEjMKpCfL8iSrDAk0wFRc+mBWfcNu6g36UzvHwzDx2/7gevCfSg4pJN9RYVuXu
	 0iZggc5RbaSiCTvVMAuGDhfSb5u0PiOeA7y2EWLC3QUWzVKUAJr+eQN/Ej5+8Wjuih
	 yAyhhY6AVIL7+L0wPJ0MkE53exWlZWAFJM8b1rl/6vYQDP0Ilg999PW7osKeBVP1DK
	 OGkEaP1/V8U6Q==
Message-ID: <00fbccec-07fd-459f-9b2e-23e293790883@kernel.org>
Date: Fri, 22 May 2026 11:11:31 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/slab: fix probable issue of dentries registration
 under /sys/kernel/slab
From: Harry Yoo <harry@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, Hao Li <hao.li@linux.dev>
Cc: David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Hugh Dickins <hugh@veritas.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 driver-core@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>
References: <20260520011019.1707010-1-vladimir.zapolskiy@linaro.org>
 <8a80496b-1568-4a0b-a878-836c27d19ad5@kernel.org>
 <e63e9232-6802-4501-a76b-a0cb93c77d5c@linaro.org>
 <08d70e06-f392-4c36-8396-735ac70ef82c@kernel.org>
Content-Language: en-US
In-Reply-To: <08d70e06-f392-4c36-8396-735ac70ef82c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/22/26 10:31 AM, Harry Yoo wrote:
> 
> 
> On 5/21/26 8:24 PM, Vladimir Zapolskiy wrote:
>> Harry,
>>
>> On 5/20/26 06:42, Harry Yoo wrote:
>>>
>>>
>>> On 5/20/26 10:10 AM, Vladimir Zapolskiy wrote:
>>>> L2TP/IP and L2TP/IPv6 protocol names contain a slash symbol, however 
>>>> these
>>>> names are blindly used as symlinks to slab cache objects registered 
>>>> under
>>>> /sys/kernel/slab. This kind of symlink creation is successful, but its
>>>> dentry is obviously broken, as well it breaks the access to the list of
>>>> /sys/kernel/slab dentries.
>>>
>>> Oops. I just loaded l2tp_ip module and it indeed broke it.
>>>
>>> $ ls
>>> ls: reading directory '.': Input/output error
>>> :0000136/                        kmalloc-rnd-01-16/   kmalloc-rnd-15-32/
>>> :0000192/                        kmalloc-rnd-02-512/  memdup_user-32/
>>> :0000560/                        kmalloc-rnd-06-192/  memdup_user-4k/
>>> :0000768/                        kmalloc-rnd-06-512/  pde_opener@
>>> :a-0000168/                      kmalloc-rnd-07-4k/   pidfs_xattr_cache@
>>> :A-0000184/                      kmalloc-rnd-11-8/    RAWv6/
>>> audit_buffer@                    kmalloc-rnd-11-96/   rpc_inode_cache/
>>> configfs_dir_cache@              kmalloc-rnd-12-4k/   task_delay_info@
>>> ecryptfs_global_auth_tok_cache@  kmalloc-rnd-13-128/  TCPv6/
>>> fscache_cookie_jar@              kmalloc-rnd-14-96/
>>> io_kiocb/                        kmalloc-rnd-15-2k/
>>>
>>>> Likely L2TP protocol renames cannot be done, since the defined protocol
>>>> names are exposed over /proc/net/protocols for years, but the symlink
>>>> names can be renamed, because they are yet to be properly created, and
>>>> this should be eventually done by this change.
>>>>
>>>> The problem manifests itself, if CONFIG_L2TP_IP build symbol is 
>>>> selected.
>>>>
>>>> Fixes: 81819f0fc8285 ("SLUB core")
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>
>>> There is also a debugfs feature that would cause a similar issue.
>>
>> thank you for review, I've just sent v2 fixing __kmem_cache_create_args()
>> side. As for debugfs I haven't reproduced any similar issue, please give
>> me a clue here, also likely any non-slab changes should be done 
>> separately.
> 
> Ah, nevermind! I totally misread the patch.
> I thought it only addresses the symlink name.
Oh wait, no. I did not misread v1.

I meant debugfs_slab_add() creates a directory under 
/sys/kernel/debug/slab/ based on s->name, so sysfs is not only thing 
that's broken :)

So I think we should either reject '/' in s->name or replace it with 
another character, or let sysfs/kernfs handle it (as replied on v2)

-- 
Cheers,
Harry / Hyeonggon

