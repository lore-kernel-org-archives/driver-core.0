Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024C9394E8A;
	Fri, 28 Aug 2026 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940444; cv=none; b=IEGd3f1Xf6pFddor3+RCcS01y8OSKPSJ6H+aJXIyLAas9qoly0XkHJF4IEkd2iv7KbLIx4DGDmQRxSy5W9fkQ6S0oljwifT03TxsZe75jLf0+j476811el4G0glJI5PpKd3Qqb3il1T2pahdD4uzba8JBMHCdMOQbKNoD31J2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940444; c=relaxed/simple;
	bh=Lzx9Xq9BMeq+ZpB7GGU1u3d0U/wril2CkGqKpFEoi2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aXxTqcAokXrwXaKH3ypYiJcUCoixTvled+rO0h5r592KHqFiyNNXBjFY2c5g1xEzYaIGITq+jXZdiVssdjnvUpIHiA//0dzqByGph9NFA3YARxC3+LvZaZM/LGghxB4+G9P+E1biYgQAxBVlVgUUoQ9EDCk7OJRgf8l4FzRgjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQbLatPS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQbLatPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB841F000E9;
	Fri, 28 Aug 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787940442;
	bh=OpnphWdgzPULckeiFXamEoh0hJR1q1iyiG4unRaCc6w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=eQbLatPSxVotYtgsTveUpVgBqXcMch9LJ5fBw1SujuJSPoY+xLRAr+fzXZBtxTSZH
	 a12GyEuoWMoSKE+S+fxM4omt1xTObbb+x6imtl5Lbh3qSHVWPrHU95SfZUZezwy56G
	 OrS/hN0KQzWoj0fXpAGS1o0wbHUNdJYsHxQDwRfNwAgDDH3hvGj+1Wcp96Vqwd5BGH
	 pQvKQsJ95QZ+SPutWc23Wj9nNwti9HDWPSSa8nzOwGaNaPskwkGwU6NVSDZv03HOQp
	 Ty1TXgDa3qxoiptySmzW5L474ZrqcoCT4Cv9AyQkq7z13c6zt2rhpXO3QBKFKoRn8D
	 C9AGMPxr0Kz7Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 20:07:19 +0200
Message-Id: <DL0RZMS3MLF3.3AJP3BNVBV03Y@kernel.org>
Subject: Re: [PATCH v2] drivers/base/node: fix UAF on device_register()
 failure
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Keith Busch" <kbusch@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Linkai Gong" <gonglinkai@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260806082804.2845360-1-gonglinkai@kylinos.cn>
 <20260828012516.3591496-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260828012516.3591496-1-gonglinkai@kylinos.cn>

On Fri Aug 28, 2026 at 3:25 AM CEST, Linkai Gong wrote:
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 3da91929ad4e..d5eec2ef76dd 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -171,13 +171,14 @@ static struct node_access_nodes *node_init_node_acc=
ess(struct node *node,
>  		goto free;
> =20
>  	if (device_register(dev))
> -		goto free_name;
> +		goto put_device;
> =20
>  	pm_runtime_no_callbacks(dev);
>  	list_add_tail(&access_node->list_node, &node->access_list);
>  	return access_node;
> -free_name:
> -	kfree_const(dev->kobj.name);
> +put_device:
> +	put_device(dev);
> +	return NULL;
>  free:
>  	kfree(access_node);
>  	return NULL;

Sorry I didn't notice this in the first version, but why do we keep the got=
o
labels at all if they both end with a return statement? Can't we just get r=
id of
both?

Thanks,
Danilo
