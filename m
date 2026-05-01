Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DBF40DFB6
	for <driver-core@lists.linux.dev>; Fri,  1 May 2026 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777604168; cv=none; b=rtJeScdCIr4JmWwqlrNp/G4S//x3cmDlOrFEQJt+FLWupnLBS/KKpDu0DYRXmT5SsLd526razMrriOTCWMakphlciJYdBJjSSdgwQUO0PDmES4j58FcMRnAr7pA8XqUVj9zPdER8oKR5jxHw250hdycbfLz7w4Hl/nhhwVP8dMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777604168; c=relaxed/simple;
	bh=OzFf8IXRVbYQTRERWmhi4Gau4qI+ard8q8aBvde/xAg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tE23q4aefXmOV+j/9UrFBeXvac0o4jqT1AW5cRwZTjduKU9mC7h8B+vZrhWDjikWBpn64EAQvfq//lxDzG8Hgd/ZtdA8Nl0bpUbvH3DM7GQyr+MlPor555HdT9Z/aazXUojQRAQM89ovDZJW2SIbt7tmEN01p5wZOrePltDFq0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pR1/V6/q; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pR1/V6/q"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777604163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzFf8IXRVbYQTRERWmhi4Gau4qI+ard8q8aBvde/xAg=;
	b=pR1/V6/qpV+GN44kVDka7D4dqFdY2WTJYK/vqPYvWOHqMaJHINcU1ag8cD+x4K6EX5Q+K9
	8vOYFOCmwwZYjnajkk3cPsRC+X7Sh/xq1gbXeL7lEy2lDw7Pkqt1xi09L1D/wafbwNt+d9
	BZtjVjMHrD7JWlEe3MId1ZvkKP0r8lY=
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
In-Reply-To: <20260430085058.f566bdc2aa5c19a54936da30@linux-foundation.org>
Date: Fri, 1 May 2026 10:55:06 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Usama Arif <usama.arif@linux.dev>,
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
 Danilo Krummrich <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <89000C13-1AAD-489A-B70F-73ED909EF4DD@linux.dev>
References: <20260429101134.1358607-1-usama.arif@linux.dev>
 <b67ff3f9-8661-45cc-b408-6a7b611d31c1@kernel.org>
 <C2C5188E-76BF-444C-BF2D-8BDC1410BC61@linux.dev>
 <20260430085058.f566bdc2aa5c19a54936da30@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT



> On Apr 30, 2026, at 23:50, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 30 Apr 2026 15:59:33 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>>> Lockdep would flag this as sleeping while atomic when acquiring =
mutex I think.
>>>=20
>>> Another thought would be, that we always call the inc/sub from =
memory failure
>>> code while we hold a folio reference and the page is not poisoned =
yet.
>>>=20
>>> That way, memory offlining cannot continue and the memory block =
cannot go away.
>>>=20
>>> So we'd let out page reference keep the memory block alive.
>>=20
>> It seems unnecessary to hold lock_device_hotplug if the user already =
holds a
>> refcount on the page. I'd like to drop this patch.
>=20
> Dropped, thanks.

Thank you so much for helping me with this.

Thanks,
Muchun.

>=20
> mm-hotfixes-unstable still has
>=20
> "mm/memory_hotplug: fix memory block reference leak on remove"
> and
> "drivers/base/memory: fix memory block reference leak in poison =
accounting"

