Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D9325A359;
	Sun, 21 Jun 2026 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782070775; cv=none; b=iTQl7sLgnZ5fc6Sh+hqeTGFAZ+hn0UnsIoQo2G4ZnavrmWSoJADuLIT4DTnvvT8gfIaqaJ4lzwc8/zmCJPCv2WBzTkNG7PFFYpH8w86/zZkzNa3o6/mVbPCU5OlPoF07awcIQ0wgnWtoXvqdZqOilg5KtbGf2333OZSowEHf8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782070775; c=relaxed/simple;
	bh=20Iir0TcagsxBpH55esfbU6j/vvA8k747VZBKq2E68M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=im6kNyeyizxLx8of6f5dPNw+pa54XUkLrVL8p1N9Mhy14tBqWO6DwBQV4IOA+Hi4D5nu80RravG+UgujKsOFwFTkJDJTq5V/2XutS+HXX7h8Wp9o0sI+P59EisD5mZ9MAVWYcg9RaTbLez4Dez+UE9p43o3bOV4rM3TAqoK15UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kv+MK4n6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kv+MK4n6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pcHH4rgu91QxxXiDXwpcDrPwL72hs5gquggf1dp1sws=; b=kv+MK4n6uO+0BvsJIp7WQDZxZN
	92+6QLuHN3RqLN2Fbp96zAJqEmEQxIxfNW3N8DL1iNMfCDZ+1XYjDrbgR0lnvOyCU5iasqz6Q98Dd
	NXPZuHe7TgMPcw1a4WKJEVF+ER8iG5UiO5TWc5iqiljzilK0qUH2tHQMdam407th0XlwbsXM+m4TK
	O5j+0xuSG4VREutBXIZvgntGsKLsSIxVJKkXgFxG5caeaCgFhrxJ/wnzvRtfizn0/mQNF17d40QNM
	4Gyhr11PQIP7i9TEsQRpHE6ebn9vuIPW0NYvpJzTvdgj7v+TXl/ountbVBhnkaaNQMO2cc7y4sYZc
	MtsuRh0w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbO0s-000000048EG-0eND;
	Sun, 21 Jun 2026 19:39:26 +0000
Message-ID: <79b404fa-ed5a-4e58-8c15-c7c78a9aa980@infradead.org>
Date: Sun, 21 Jun 2026 12:39:24 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: fix path of /sys/module in comment
To: Zenghui Yu <zenghui.yu@linux.dev>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
References: <20260621075239.11330-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260621075239.11330-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/21/26 12:52 AM, Zenghui Yu wrote:
> The comment wrongly references to /sys/modules directory instead of
> /sys/module. Fix it.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/base/module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 218aaa096455..6789dca485ab 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -42,7 +42,7 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
>  	if (mod)
>  		mk = &mod->mkobj;
>  	else if (drv->mod_name) {
> -		/* Lookup or create built-in module entry in /sys/modules */
> +		/* Lookup or create built-in module entry in /sys/module */
>  		mk = lookup_or_create_module_kobject(drv->mod_name);
>  		if (mk) {
>  			/* remember our module structure */

-- 
~Randy
