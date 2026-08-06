Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D35421227;
	Thu,  6 Aug 2026 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053223; cv=none; b=gHYEkqe8ZNptKxdTMARVYF1aMVQhns+0aHNKaghpeJwiDt/pa/h7KE+7sLkfiilq1wTLC6IazE+8CVnqBogvj3iRRAJEBnKxlUXNVfOlEW1LbuFEo0HVTDMT5YWUE6o3poh+Fj2gm8yCF5mwhs1leYqwO7TAWBcaJZm02rU8ReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053223; c=relaxed/simple;
	bh=9ZOaXu9z65fyWXZILL5DxrD1nWphml3bbhqMgJbd4MQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=O1g5jDqqR/xAwWHyqSgAlYzqnF6XGc8xf76YDfrmzfpHCpTbB+JVvk/oHCJGiHnmN8xiHCkIqn8Dz8koqBOlOsNPlxkHe4a8l0ho1f3XCSN0UPNSfUVCo7HJDV1Se4YDG7MbPSg48qOjGNnPQJIbNYL5UVaii4Ag5IRyCDcOJcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBrT3bJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBrT3bJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5F01F000E9;
	Thu,  6 Aug 2026 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786053221;
	bh=K+6ynOwQ/EpPnq1/bTSIBWm/cuX3tkvkY+OnFncahBI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=MBrT3bJ+Zn2CtTVO5tZk3XAd5FGY3/sED4T6at8FHPqFmIfi3r2sVUpxyIPq8IY86
	 x223FeL72c8YOXjXnJRIcmxog/o90ebxZ0spwSm67EvOvdC7nYZzA3RD92Cw9rHyVy
	 EGOqvaeSC3LLFnRy5oJ4K6izJ8L6SDvxsB35SydRHO1PQW1iGbM0YIX7EyQEYUAWV+
	 WUE27sD3x0ggvOkTZnhGF4ONMLFBIPNifWh1WSIMAm56UAipV2z+UqfRSyXpiMRNRy
	 92lLxN8srsEBhh42qyAxi41jxkoNDr8QQgftAcpr6E3LZf8JyIQgCQkUDuboosWR/N
	 M7o1V/rJXgT6Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 23:53:39 +0200
Message-Id: <DKI70XPQTCBY.1MSQGUFCEV2WT@kernel.org>
Subject: Re: [PATCH] drivers/base/node: fix UAF on device_register() failure
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Keith Busch" <kbusch@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Linkai Gong" <gonglinkai@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260806082804.2845360-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260806082804.2845360-1-gonglinkai@kylinos.cn>

On Thu Aug 6, 2026 at 10:28 AM CEST, Linkai Gong wrote:
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 3da91929ad4e..d2fd57c2edc8 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -176,8 +176,10 @@ static struct node_access_nodes *node_init_node_acce=
ss(struct node *node,
>  	pm_runtime_no_callbacks(dev);
>  	list_add_tail(&access_node->list_node, &node->access_list);
>  	return access_node;
> +
>  free_name:
> -	kfree_const(dev->kobj.name);
> +	put_device(dev);
> +	return NULL;

Good catch, but we should also rename the label; free_name is misleading.
