Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EE245008
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376492; cv=none; b=Lj/y4caMvOApPIhgmHVe/v8vpNJ3coExDL8NgiKqcl1oGNprtuz4yG4+w/XqcvM9wYARtuaVpT7G4/of6gZ0Z7m4C0G8G0lPoFL9b8kbFuVhE6L25/NreF9B5wgIBh+X+bKgQNwTQfsmibdDqb+C+24SUChM7cMX2cN8tFF6SfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376492; c=relaxed/simple;
	bh=cNgKEyEDQpewWjfmZViYJm2Cyw0ImUuyGjxPKOdBdMU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nB1Kv2fQEvZzBSuhNrrvnjgeLPiuD4vjKlxyR0cZQdUiNNpJcKpz4C54UwfoWPRNHPTXHfbs8CkT3xgGlstZusHOGCSsJB8MVoFXE9DpXRlb0Wnb+UKaACUmH4FJHiBHA9gOiR2HnZlYfSbDei1uc/UVcgUPMRTBcamLm0wJWcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pIiJUNLJ; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pIiJUNLJ"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777376488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+jsPUH7mQJKr/e5qJEXXKbdhvPY2r4JP9jCX0gwSLc=;
	b=pIiJUNLJDEg7a0nDy6IgBzhGm0xeJEU9Vnp7iBGKxUjiNh3wLGqmNRZNR6JzTF9lEBzYlW
	7OlAm+Ts6deGD4YSdzZydMQcIJZYzQSUtiJ9757k9Ilptebf/aeTvVYdf8ACq+2WOx+VrC
	mSrB0OIv8hMwIGH3ut84TzpITKIPYy0=
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
In-Reply-To: <fae6e568-fbdd-e697-8ea4-b12c73750ec9@huawei.com>
Date: Tue, 28 Apr 2026 19:40:43 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>,
 Dan Williams <djbw@kernel.org>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 linux-mm@kvack.org,
 linux-cxl@vger.kernel.org,
 driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <68DFF29C-B3CC-4950-8A8E-7D42350939CA@linux.dev>
References: <20260428085219.1316047-1-songmuchun@bytedance.com>
 <20260428085219.1316047-4-songmuchun@bytedance.com>
 <fae6e568-fbdd-e697-8ea4-b12c73750ec9@huawei.com>
To: Miaohe Lin <linmiaohe@huawei.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 28, 2026, at 19:37, Miaohe Lin <linmiaohe@huawei.com> wrote:
>=20
> On 2026/4/28 16:52, Muchun Song wrote:
>> memblk_nr_poison_inc() and memblk_nr_poison_sub() call
>> find_memory_block_by_id(), which requires device_hotplug_lock to
>> serialize the xarray lookup against memory block removal.
>>=20
>> Take device_hotplug_lock around the lookup and nr_hwpoison update so
>> the memory block cannot disappear between xa_load() and get_device().
>>=20
>> Fixes: 5033091de814 ("mm/hwpoison: introduce per-memory_block =
hwpoison counter")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>=20
> Thanks for update.
>=20
>> ---
>> drivers/base/memory.c | 10 ++++++++--
>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 6981b55d582a..f76aee29e9a5 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -1228,23 +1228,29 @@ int walk_dynamic_memory_groups(int nid, =
walk_memory_groups_func_t func,
>> void memblk_nr_poison_inc(unsigned long pfn)
>> {
>> 	const unsigned long block_id =3D pfn_to_block_id(pfn);
>> - 	struct memory_block *mem =3D find_memory_block_by_id(block_id);
>> + 	struct memory_block *mem;
>>=20
>> + 	lock_device_hotplug();
>=20
> memblk_nr_poison_inc() and memblk_nr_poison_sub() are both called from =
memory_failure() context.
> I'm afraid if memory_failure() is triggered while lock_device_hotplug =
is held, it will lead to
> deadlock. Or am I miss something?

I am curious is there any place where memory_failure() is called with =
holding lock_device_hotplug?

Thanks.

>=20
> Thanks.
> .


