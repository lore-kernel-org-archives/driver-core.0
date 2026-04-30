Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB031E859
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536047; cv=none; b=u2uaFo9Xvxs2IybJHu+/CnZOokilFzIiIxC3SYa7+ki/feGV36usAWb73w/GgO2FMz3FAlw5x2ADjoJLIgkexSNnYUanGX7Y8Qy7/xNazbCFfquszC/zLcQsaAFHWmcKvIM7knexVHfg5Fdt7zSlFfyMGWWCGq8CUE7C5F/wJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536047; c=relaxed/simple;
	bh=A4A6wwPd/ZSj0TC/HEHCOyDVduWypr9xbHHX7OGSc38=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZnffJmT8O0rm19D9wU7uShIk33pci31nS3WLTsm3KzT49HvxevDOBoVH4FIjSq7lH8PqzUKvlTszL9uYTPlYSELVu+PPghi1ZcSZasBsVULZV/jT/lWyqvUg1ac8mqQrABOl9HGqrvUEcDQ5HTys/pG7pR8WLPxhz+G8HxoYstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cqGR0kT8; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cqGR0kT8"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4A6wwPd/ZSj0TC/HEHCOyDVduWypr9xbHHX7OGSc38=;
	b=cqGR0kT8YoGyTPyfnvPFCbwserdf1FLjN/yQXTPkocffUQHDm3U+VUtUUu2fiuMlqEYSSv
	cnVkEmse2/Cj/svvt+OdUgzyZ8kaVKh+Cohi2PlJ2Dx3BSPWqgqDwaYBpaHZCBSQn4JO8m
	Miq9YpF5ZyjrSAJTnBUrQRHoscQNybo=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v2 3/3] drivers/base/memory: fix locking for poison
 accounting lookup
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <b67ff3f9-8661-45cc-b408-6a7b611d31c1@kernel.org>
Date: Thu, 30 Apr 2026 15:59:33 +0800
Cc: Usama Arif <usama.arif@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>,
 Dan Williams <djbw@kernel.org>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 linux-mm@kvack.org,
 linux-cxl@vger.kernel.org,
 driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rafael J Wysocki <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2C5188E-76BF-444C-BF2D-8BDC1410BC61@linux.dev>
References: <20260429101134.1358607-1-usama.arif@linux.dev>
 <b67ff3f9-8661-45cc-b408-6a7b611d31c1@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Apr 29, 2026, at 18:44, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 4/29/26 12:11, Usama Arif wrote:
>> On Wed, 29 Apr 2026 12:18:08 +0800 Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>>=20
>>>=20
>>>>=20
>>>>=20
>>>> lock_device_hotplug is a mutex lock, and we already take other =
mutex locks while
>>>> holding lock_folio in other paths, so I am not sure I see what =
should be special
>>>> in this case.
>>>=20
>>> Hi Oscar and Miaohe,
>>>=20
>>> I saw sashiko's report [1] related to folio lock and =
lock_device_hotplug.
>>> Seems it is possible. You can correct me if I am wrong.
>>>=20
>>> [1] =
https://sashiko.dev/#/patchset/20260428085219.1316047-1-songmuchun%40byted=
ance.com
>>>=20
>>> We could fix this by calling action_result() without holding folio =
lock.
>>> What do you think?
>>>=20
>>=20
>> Hello Muchun,
>>=20
>> You could end up in memblk_nr_poison_sub() while holding hugetlb_lock =
spin lock
>> from get_huge_page_for_hwpoison(), right?
>>=20
>> Lockdep would flag this as sleeping while atomic when acquiring mutex =
I think.
>=20
> Another thought would be, that we always call the inc/sub from memory =
failure
> code while we hold a folio reference and the page is not poisoned yet.
>=20
> That way, memory offlining cannot continue and the memory block cannot =
go away.
>=20
> So we'd let out page reference keep the memory block alive.

It seems unnecessary to hold lock_device_hotplug if the user already =
holds a
refcount on the page. I'd like to drop this patch.

Thanks.

>=20
> --=20
> Cheers,
>=20
> David


