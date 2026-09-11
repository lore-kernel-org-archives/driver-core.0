Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD023246ED;
	Fri, 11 Sep 2026 23:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168614; cv=none; b=nmq+Gf4X0V5Z4iaWxc6KCWpsn7QsT/eStlnxifP1DbxmmuZD7q0qev6fr2lI5gIYDInjtaSyieoorEC0cTHIj4Ewypy5ST9n92e0qFual+sAURTM7kKyJdQ+skAKhA7rUze3++U3a7wqmJJpiyycZUADuDULYivXlovn/6hn9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168614; c=relaxed/simple;
	bh=wTm/1EiXc2sn27/CkwtvTE6clTnQRZjzELPzy2zbuT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaYjQHagafppPRyGxL4nBNcQZzBlHqnA1/wanwVe95IPsHEZgj9XR99yQDXQBTV7BVwVaT/6la1gAes3XOrbvGTErAgkF4o3X6nscIMWEjgWZIV/sGLZ+DEx23syz8BiYETQ9sizqUEO5JCyKSUU34mmO7TGWzCAVZdKqsuDU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vmi2wGE3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vmi2wGE3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yqejm1zD4RbKvezlowNuHBpJQwfTlrnS5/GcsMN5248=; b=vmi2wGE3FHdwOxNdyBeHAF8u07
	5l4Ue1spHaUgbVcqq6ljl0C+rzs+WraLzlcE8t9s9wzJNVOm4aORNkOniCh6vaXpjmvC/ZlfkH3t1
	E2NqaK1w+HvlI/Y7EXQhMsLRqsyw+ls0LTAGl1s2vV9ELjwl3BoXw8taUUwxGgjcwtZQiih6jmkP0
	jbdtRMt7E5Qy0s67BCMG23SRcsSmCxgB6s03066pqhEqEC2tIQcNn1tDqYoAYt9DQicy8cPAuZ7WB
	ZPW5wPWqb5KAK/SZHcxIEyOd1A49etvKgq+JjkkJsDSVaWHRYTi5AdLoRogr7BbE8sOuqcKdlUzVw
	hu5woc6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AUA-00000000LjU-3vhF;
	Fri, 11 Sep 2026 23:16:46 +0000
Message-ID: <28dd8b5d-a3ae-49d3-bd78-2621593b52b6@infradead.org>
Date: Fri, 11 Sep 2026 16:16:46 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kobject: Fix the kobj_set_name reference in
 kset_register() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
 Luben Tuikov <ltuikov89@gmail.com>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260911222029.7267-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260911222029.7267-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/11/26 3:20 PM, Karl Mehltretter wrote:
> The kernel-doc comment of kset_register() refers to kobj_set_name, which
> does not exist. The name is kobject_set_name. Say kobject_set_name.
> 
> Fixes: 1662cea4623f ("kset: fix memory leak when kset_register() returns error")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  lib/kobject.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kobject.c b/lib/kobject.c
> index e7b010a989fb9e4a4ddb105989ced638ce02ccd6..942ee439f06ef8962386ac9b7b37ce60b29e83a6 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -855,7 +855,7 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>   * kset_register() - Initialize and add a kset.
>   * @k: kset.
>   *
> - * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> + * NOTE: On error, the kset.kobj.name allocated by() kobject_set_name()
>   * is freed, it can not be used any more.
>   */
>  int kset_register(struct kset *k)
> 

-- 
~Randy
