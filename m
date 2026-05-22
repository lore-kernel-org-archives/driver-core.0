Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4728DB49;
	Fri, 22 May 2026 01:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779414178; cv=none; b=fOn76D006/anj2itXyIb+7W66jh67lc7rDO3eGfejX5YpqcxiEKY9PBFeK6wM7uhHH2KCgRI/mkV3FJ/kzY+uRfieWsrIDAIa+lvLOMitamOTDMyqtCqq4pKkNqaSThPNbojtaY1c8g2wb9yG0tfRS/2k66hfzcS5FipdH5KD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779414178; c=relaxed/simple;
	bh=qIG4YCqo1pzIsJc0n0NT16OjsexbA51WYk0DWYSRO3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR9l+8eidD5rFJRnoQj4wGetz7gelop4mFrNJT4E7yRvU+ccbftdQLrljW8Uf7XgGJGFUxr60fYn8M9NHyohDGueHZn1nioIPHG9xKsxzHWSU1ePrt89DgLuV946+LdO0b7QLm6s+1myGdGMIlHmo9v7QGIFUnll+A238/+6OUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzlH30ek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzlH30ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB991F000E9;
	Fri, 22 May 2026 01:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779414177;
	bh=mlNm6TyZ7Md00Vr37/Ne1y17FHH4DvK/soaPft4LyGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OzlH30ekNA2RUaCa9m4cCbrFAmMxCb0lDc5RdG5aAgcn4hDxm20AYqYANNI/W6TwX
	 3Nl7LpWjmo/IN+bNManh5WySchj1Pty1xi3TQ2hYLo4UF0E/nZ92QZsVNKbqL4Lg8A
	 iKxnWVensT53c6CCD2p4xVcNh5Nd0zmBPf2JfMxMAFzE6iL986Bn86e7gzdGKlhVn8
	 LoMpjhCNx3jV8iLAnuJ5cCrPPaKVEPGLgqahwn0pdmNp313qZjx3HOSrvq04TN8iAe
	 jxySjzFRay76CmTSXyStYj8qAKAWGBAPE4JmROMic6WZRmO7OxrXBfjlTh0nJ2XHVC
	 bptwyQp9PrFow==
Message-ID: <aac8ce93-8236-4471-add0-c04ee7a84d0a@kernel.org>
Date: Fri, 22 May 2026 10:42:52 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/slab: fix probable issue of dentries registration
 under /sys/kernel/slab
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, Hao Li <hao.li@linux.dev>
Cc: David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Hugh Dickins <hughd@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Pedro Falcato <pfalcato@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260521111516.1903707-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260521111516.1903707-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 8:15 PM, Vladimir Zapolskiy wrote:
> L2TP/IP and L2TP/IPv6 protocol names contain a slash symbol, however these
> names are blindly used as symlinks to slab cache objects registered under
> /sys/kernel/slab. This kind of symlink creation is successful, but its
> dentry is obviously broken, as well it breaks the access to the list of
> /sys/kernel/slab dentries.
> 
> Likely L2TP protocol renames cannot be done, since the defined protocol
> names are exposed over /proc/net/protocols for years, but the symlink
> names can be renamed, because they are yet to be properly created, and
> this should be eventually done by this change.
> 
> The problem manifests itself, if CONFIG_L2TP_IP build symbol is selected.
> 
> Fixes: 81819f0fc8285 ("SLUB core")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Ideally we should reject '/' and let users avoid having it in the slab 
cache name instead of silently replacing it with another character (you 
don't have to rename protocol to rename the slab cache name!).

...but actually, I see kobject already replaces '/' with '!':

/**
  * kobject_set_name_vargs() - Set the name of a kobject.
  * @kobj: struct kobject to set the name of
  * @fmt: format string used to build the name
  * @vargs: vargs to format the string.
  */
int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
                                   va_list vargs)
{
         const char *s;

         if (kobj->name && !fmt)
                 return 0;

         s = kvasprintf_const(GFP_KERNEL, fmt, vargs);
         if (!s)
                 return -ENOMEM;

         /*
          * ewww... some of these buggers have '/' in the name ... If
          * that's the case, we need to make sure we have an actual 

* allocated copy to modify, since kvasprintf_const may have
          * returned something from .rodata.
          */

(Sorry for broken formatting my email setup is bit messed now)

But sysfs symlink doesn't handle this.

Any thoughts?

[+Cc DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS folks]

> Changes from v2 to v1:
> * added slash symbol replacement to __kmem_cache_create_args() as well,
>    many thanks to Hao and Harry for review.
> 
> Link to v1:
> * https://lore.kernel.org/linux-mm/8a80496b-1568-4a0b-a878-836c27d19ad5@kernel.org/
> 
>   mm/slab_common.c | 23 +++++++++++++++++++----
>   mm/slub.c        | 23 ++++++++++++++++++++++-
>   2 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index d5a70a831a2a..b9930521496d 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -366,16 +366,31 @@ struct kmem_cache *__kmem_cache_create_args(const char *name,
>   		    object_size - args->usersize < args->useroffset))
>   		args->usersize = args->useroffset = 0;
>   
> -	s = __kmem_cache_alias(name, object_size, flags, args);
> -	if (s)
> -		goto out_unlock;
> -
>   	cache_name = kstrdup_const(name, GFP_KERNEL);
>   	if (!cache_name) {
>   		err = -ENOMEM;
>   		goto out_unlock;
>   	}
>   
> +	if (strchr(cache_name, '/')) {
> +		char *n;
> +
> +		n = kstrdup(cache_name, GFP_KERNEL);
> +		kfree_const(cache_name);
> +		if (!n) {
> +			err = -ENOMEM;
> +			goto out_unlock;
> +		}
> +
> +		cache_name = strreplace(n, '/', '_');
> +	}
> +
> +	s = __kmem_cache_alias(cache_name, object_size, flags, args);
> +	if (s) {
> +		kfree_const(cache_name);
> +		goto out_unlock;
> +	}
> +
>   	args->align = calculate_alignment(flags, args->align, object_size);
>   	s = create_cache(cache_name, object_size, args, flags);
>   	if (IS_ERR(s)) {
> diff --git a/mm/slub.c b/mm/slub.c
> index 0baa906f39ab..843bed864a7f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -9634,6 +9634,7 @@ static struct saved_alias *alias_list;
>   int sysfs_slab_alias(struct kmem_cache *s, const char *name)
>   {
>   	struct saved_alias *al;
> +	const char *al_name;
>   
>   	if (slab_state == FULL) {
>   		/*
> @@ -9652,8 +9653,27 @@ int sysfs_slab_alias(struct kmem_cache *s, const char *name)
>   	if (!al)
>   		return -ENOMEM;
>   
> +	al_name = kstrdup_const(name, GFP_KERNEL);
> +	if (!al_name) {
> +		kfree(al);
> +		return -ENOMEM;
> +	}
> +
> +	if (strchr(al_name, '/')) {
> +		char *n;
> +
> +		n = kstrdup(al_name, GFP_KERNEL);
> +		kfree_const(al_name);
> +		if (!n) {
> +			kfree(al);
> +			return -ENOMEM;
> +		}
> +
> +		al_name = strreplace(n, '/', '_');
> +	}
> +
>   	al->s = s;
> -	al->name = name;
> +	al->name = al_name;
>   	al->next = alias_list;
>   	alias_list = al;
>   	kmsan_unpoison_memory(al, sizeof(*al));
> @@ -9691,6 +9711,7 @@ static int __init slab_sysfs_init(void)
>   		if (err)
>   			pr_err("SLUB: Unable to add boot slab alias %s to sysfs\n",
>   			       al->name);
> +		kfree_const(al->name);
>   		kfree(al);
>   	}
>   

-- 
Cheers,
Harry / Hyeonggon

