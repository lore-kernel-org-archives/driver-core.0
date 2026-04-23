Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B541E7C12
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965547; cv=none; b=XQ21DBTqlR/8fEF+n6zTcZdMQI0yJd8cdJ2yK3t+a/NvNSSbFSPNkp51NhOlBcFY3bSICRiA7RhfcXjWF9DfhhPfFzCikVQFaBcHXbAU0hYdAMvW4tqCX/IExH3W81S0cKS+47x/MYw3tnXXRuFQzHRVzLcGOv7pGNuvDRyZoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965547; c=relaxed/simple;
	bh=+Wh9eb+A8Yt7HINMKgqBsRte1iTr1zfqo7kXXSP+mWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/d2dUkHoQxo4aQqMEkngiE1zB5GPm0ARMGcbg0O7ewSjBffRh9TbCfowqMlV6rUme0TXKGiP33oiUC805hEElU6su2b8GXOQa1JYJDvuUxYLqQp2FExRk7JPTdwKVo+BnWgK3FSZlFRAhsquvFq189O2Q2mInbCbSDepx+Y9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2KuyfDO; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2KuyfDO"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso7690231eec.0
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776965546; x=1777570346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=roTEmQN+Ir7L0cfKfGP/6yejCPhHvoS90pxDwlZRW90=;
        b=C2KuyfDOO+QzqnZ8XIGjovI3i8EV98yk1nHzgzKWzZaHnhPZZfZIPr3Mef1id/F9sr
         aaTi8Rf65HIj9jxpEEV4p+VKLXNHj5k1PVgkdFRKRbnf1B7OJYalNbjy/5YkGnuoMbo9
         K10TjjaeFcWwDS73Wx/+J+y78q7KpbgZ+kXBH8yjgEWiUtteQ8RClw3xcqdzRQjZlY79
         dc+/wg3arjDht1fRz1wqdPjhc+PJWrS6EgWL+4HI7RRcs20YwSuMZ5VmqQxr56/i3+oJ
         t7HQUpz/jw9GDWfFWGMdwOSidsIrJP+tQStVDkTPd+OV5XYmQdkGZErqogaeKOx8uFgL
         Qu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965546; x=1777570346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roTEmQN+Ir7L0cfKfGP/6yejCPhHvoS90pxDwlZRW90=;
        b=lt8OUD/V2T36lU9frd5GI4yQLTGTW5vqCUNnScYzCFx3LJidA9/wR3bb3GbXz94xI0
         9mAP0WT6t1bt9hT61lt8b1634hWMlVVZMPO5Lvq/oS1k9PFQtJSB6snWBFWusidbBgjk
         X34ttg7JBP+Fbt677nSlMpTDY6kItQRrrUdGdoSErrN7OkP4BCwe0RsNpZLTODy5VHpb
         1butdhpeAMwh2QYp5Ye1lOXf/iiKFkh1CbC3VpKaQIfid06sJxusNzCQ3PnyAQ2SMmTY
         36OXJ2G/qYsEtOorgndGP3bNILge1hhkJCmd0kXbzFIUQXEOToRei4HoHaDs279dga3K
         WbEA==
X-Forwarded-Encrypted: i=1; AFNElJ+1rhz2LAI+XVg4+9oBN3RvxF307AiqrS8X6L9M5GgSCOwG87bsDW4yb3V3KWwp3aQWxpE/bVrvhl9hqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHykeQz3TReru+Frm9qfQhG+WnnsIg6+xWJHhm+tI5esJR7dv7
	LE6b6Mim6y7dV7zsfFuBawFuWoviXu2OXBIT9YE1VsHYgNw6J094W0in
X-Gm-Gg: AeBDieuMjbSLIM1Y8/YpyoMhsueGJVjR6RnpWLErphHoxDAJxmPW6Kuzu2+2/nJyki5
	WWBmqCcU0JBaS6u/9JgODGHLb7/zKtVdSIndURhVQE5CWhZlJ8Gpi1F8GwrjinLH76m3PmUn+IS
	cTRbL2194o77Ei7qnFbZ9F42Src2xwXfeLJUsTqpUf+CAB/vTASzqe4RRu24u/ZSIsdGdBxuPZt
	rZ4BL/B21yEctJwybMry01kQXKKoXKDU2TBW+cqkBdoCCDawjNITWAmt2EOek+xVQeyOQhTFY0y
	SDnls4IhytIM13v52PP2TRjPfigoL57bIeHMAKuRBPLWdxdcVnZXlE99Yjq2JeB78ojI9zhNEXX
	70Vy20IegnwqYtElb9C/ZM8UNXtabasQWetRLE4NkNIWiKqr4ZarZkOzLQC8FARSWXL1aDAgojE
	9CklDBNOFQ6Q4X1SKUABK+LE6UXzUiZf5T2FTZfONBc2nXtSvp91uzeei7Euh9WAl7FGZXsl45X
	bw=
X-Received: by 2002:a05:693c:2c0f:b0:2d3:4252:b127 with SMTP id 5a478bee46e88-2e479017537mr14873358eec.26.1776965545353;
        Thu, 23 Apr 2026 10:32:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2359:5fa4:9c29:41b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm37264351eec.29.2026.04.23.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:32:24 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:32:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <aepWdKzd8GPeayNJ@google.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>

On Thu, Apr 23, 2026 at 02:12:02PM +0200, Bartosz Golaszewski wrote:
> If we pass a software node to a newly created device using struct
> platform_device_info, it will not be removed when the device is
> released. This may happen when a module creating the device is removed
> or on failure in platform_device_add().
> 
> When we try to reuse that software node in a subsequent call to
> platform_device_register_full(), it will fails with -EBUSY. Add the
> missing call to device_remove_software_node() in release path.
> 
> Make sure that we still function correctly if a software node is used as
> the primary firmware node.
> 
> Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/platform.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 75b4698d0e582e67adafa78c312d75c72fd654cf..43ea7dcd338dd3ddae57e6d0677e5cb2673f6ed5 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
>  	struct platform_object *pa = container_of(dev, struct platform_object,
>  						  pdev.dev);
>  
> +	device_remove_software_node(dev);
>  	of_node_put(pa->pdev.dev.of_node);
>  	kfree(pa->pdev.dev.platform_data);
>  	kfree(pa->pdev.mfd_cell);
> @@ -885,6 +886,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
>  			goto err;
>  	}
>  
> +	/*
> +	 * If the primary firmware node is a software node and there's no
> +	 * secondary firmware node, the primary will be affected by the call
> +	 * to device_remove_software_node() in platform_device_release() and
> +	 * its reference count will be dropped by one. Take another reference
> +	 * here to make it have no effect.
> +	 */
> +	if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> +		fwnode_handle_get(pdevinfo->fwnode);

It is possible to pass already registered node in pdevinfo->swnode
(because device_add_software_node() can handle this just fine). In this
case we also need to take an extra reference (or figure out whether we
need to drop the reference when removing the device).

Thanks.

-- 
Dmitry
