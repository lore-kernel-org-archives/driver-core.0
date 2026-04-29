Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F97395259
	for <driver-core@lists.linux.dev>; Wed, 29 Apr 2026 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457508; cv=none; b=b0wYlNXByeFpYNHUrpqV7BgJvanMiD3Xf9WpcCmrQ00/x1WCliEX30d634FofsrGyG0fFeJvoN975XKdPmUMtXbiClqAXS0eXWACVlVfFN1ps7npowfr3UfG8+fCj32QoviT6Uiyz6/crtzkOwD+QClkk7qv2UidqCyeXQmKkxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457508; c=relaxed/simple;
	bh=PIpMqLnvKeFPStlamgR5UkyiNO93rr7vphpSFu46dyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbkpIbhdz7F4+vTDUnopyorTt8RICSKrTFlRec/MHS+mGLbrvhk9eqEfUfiqDnBVEAQfRczV8dD7JqX2n7lMluCXhaoQIzGVpYJdqAI4OAr/FYYS7F0QEOygjwP++tIs0CggttIWYxpoVXm8Ph+mPG3XJhUHaxEHZyjD0YyRZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xEM+oNRW; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xEM+oNRW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777457504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQnZQYLrTlNYy1jc1rXnnTon8LpqLdCTjRpZns17oGo=;
	b=xEM+oNRWB3iEUl7EvR41PZcCxwM+tlM71BYBVb0m6mTHUTUlRsZy9GVgnWzfYDsO7wLdvx
	qqqBFWU0yQ8IgsOppvyiVpGtZRPXqj5d1PS22xkgYBQtdQrPjdRNGC6Ec9FZq1PHvHQCTe
	D5/aom5/W69PK8yAlF8NAp+unM5fxYc=
From: Usama Arif <usama.arif@linux.dev>
To: Muchun Song <muchun.song@linux.dev>
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
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rafael J Wysocki <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 3/3] drivers/base/memory: fix locking for poison accounting lookup
Date: Wed, 29 Apr 2026 03:11:33 -0700
Message-ID: <20260429101134.1358607-1-usama.arif@linux.dev>
In-Reply-To: <A3EF6D95-E3B9-4228-9AED-A7018ED494C5@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 29 Apr 2026 12:18:08 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> 
> 
> > On Apr 29, 2026, at 11:32, Oscar Salvador <osalvador@suse.de> wrote:
> > 
> > On Wed, Apr 29, 2026 at 11:08:51AM +0800, Miaohe Lin wrote:
> >> Right, I missed that. Thanks. But I'm still worried that there might be potential issues.
> >> For example, this function could be called while lock_page is held. Acquiring lock_device_hotplug
> >> while already holding lock_page might cause problems, though I haven't seen any specific issues yet.
> >> Also there might be some other potential scenarios that haven't been considered. Hope I'm just
> >> overthinking it. :)
> > 
> > lock_device_hotplug is a mutex lock, and we already take other mutex locks while
> > holding lock_folio in other paths, so I am not sure I see what should be special
> > in this case.
> 
> Hi Oscar and Miaohe,
> 
> I saw sashiko's report [1] related to folio lock and lock_device_hotplug.
> Seems it is possible. You can correct me if I am wrong.
> 
> [1] https://sashiko.dev/#/patchset/20260428085219.1316047-1-songmuchun%40bytedance.com
> 
> We could fix this by calling action_result() without holding folio lock.
> What do you think?
> 

Hello Muchun,

You could end up in memblk_nr_poison_sub() while holding hugetlb_lock spin lock
from get_huge_page_for_hwpoison(), right?

Lockdep would flag this as sleeping while atomic when acquiring mutex I think.
