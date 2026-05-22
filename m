Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5D246788;
	Fri, 22 May 2026 01:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779413476; cv=none; b=Pj+AGLLmfb3BE2Uyi95fccaZWFTUn2sNcJSf4KTHMvnZ6YG8HTtii7HOgiLSrjRqAVxz6AMC+yTyZTwm6/Vw3NGFOYdjsEo5M9lqGs8YEqOoLWD55bgtAaOB3l4X5uucJPqbBqTJyDulJjx1J47sfIjw4ISLwiprRHkp5z4KJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779413476; c=relaxed/simple;
	bh=hnMSsmOKseZwW7fIAe+WW2V+eYi+KMQJHcRb5nlHfL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOAwMSC5HG4QfxVuPXIX6qyKP/kEhddXx0vz5eGCNgR9oyW3RVfY3Nb3vA6xzFMnSc/NV5aoTSfHvO5RRZiXSouitJ7Oty3X5yBBrNk6cpSEW07sHYNGmD+n4wxodh2MPIPbJ1oX6XP6S5ed3wNlDOqTxF/bpilbb1VYk1A1bag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miF+CQii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miF+CQii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C05A1F000E9;
	Fri, 22 May 2026 01:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779413474;
	bh=ax6hrPRWaIAx043nNXcVSuaLaRixG7DNWXgd+IZuS8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=miF+CQii5izoKY5gao0oxo3bG6XVwvi7AZHsl3IuLUjX5I5PFvmFgYrQGBxrW0oX2
	 uNugW8Ymo568ftnNzss5OrO9QXCdFPZZFDu19wAOVbKXjBimeYKT10RJys/VQbq9wC
	 mZv0IxDg9h1AbGnL1F8GQssoRWZXoekLZUwYWdOevcnbabfLKyVAWASiKyWiEcqJPf
	 nvpBShONSfxd/fE5DsRNPoSYCkOXJLv1+hULoZmEdt6GnzPQlPdd4IK6zUYc3fVCLs
	 EuOGOBx+O2M2InWCSS1KYdBeoBsC/OT4zxn+J6v0OsMEuy6eBWIEKRL/mZzIpOe5DF
	 sqVPSGq22XeoQ==
Message-ID: <08d70e06-f392-4c36-8396-735ac70ef82c@kernel.org>
Date: Fri, 22 May 2026 10:31:09 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/slab: fix probable issue of dentries registration
 under /sys/kernel/slab
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
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <e63e9232-6802-4501-a76b-a0cb93c77d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/21/26 8:24 PM, Vladimir Zapolskiy wrote:
> Harry,
> 
> On 5/20/26 06:42, Harry Yoo wrote:
>>
>>
>> On 5/20/26 10:10 AM, Vladimir Zapolskiy wrote:
>>> L2TP/IP and L2TP/IPv6 protocol names contain a slash symbol, however 
>>> these
>>> names are blindly used as symlinks to slab cache objects registered 
>>> under
>>> /sys/kernel/slab. This kind of symlink creation is successful, but its
>>> dentry is obviously broken, as well it breaks the access to the list of
>>> /sys/kernel/slab dentries.
>>
>> Oops. I just loaded l2tp_ip module and it indeed broke it.
>>
>> $ ls
>> ls: reading directory '.': Input/output error
>> :0000136/                        kmalloc-rnd-01-16/   kmalloc-rnd-15-32/
>> :0000192/                        kmalloc-rnd-02-512/  memdup_user-32/
>> :0000560/                        kmalloc-rnd-06-192/  memdup_user-4k/
>> :0000768/                        kmalloc-rnd-06-512/  pde_opener@
>> :a-0000168/                      kmalloc-rnd-07-4k/   pidfs_xattr_cache@
>> :A-0000184/                      kmalloc-rnd-11-8/    RAWv6/
>> audit_buffer@                    kmalloc-rnd-11-96/   rpc_inode_cache/
>> configfs_dir_cache@              kmalloc-rnd-12-4k/   task_delay_info@
>> ecryptfs_global_auth_tok_cache@  kmalloc-rnd-13-128/  TCPv6/
>> fscache_cookie_jar@              kmalloc-rnd-14-96/
>> io_kiocb/                        kmalloc-rnd-15-2k/
>>
>>> Likely L2TP protocol renames cannot be done, since the defined protocol
>>> names are exposed over /proc/net/protocols for years, but the symlink
>>> names can be renamed, because they are yet to be properly created, and
>>> this should be eventually done by this change.
>>>
>>> The problem manifests itself, if CONFIG_L2TP_IP build symbol is 
>>> selected.
>>>
>>> Fixes: 81819f0fc8285 ("SLUB core")
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>
>> There is also a debugfs feature that would cause a similar issue.
> 
> thank you for review, I've just sent v2 fixing __kmem_cache_create_args()
> side. As for debugfs I haven't reproduced any similar issue, please give
> me a clue here, also likely any non-slab changes should be done separately.

Ah, nevermind! I totally misread the patch.
I thought it only addresses the symlink name.

>> Can we replace '/' in the cache name, without renaming the protocol name?
>>
> 
> I believe that's exactly how it's done, the protocol name is left 
> unchanged.

Yeah, now I see :)

-- 
Cheers,
Harry / Hyeonggon

