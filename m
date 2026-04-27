Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DB4370D75
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286973; cv=none; b=XoS7+wCc4qaMH6MYKQWdJ3/w39c3ZBQRXZA9X/YoMYmq1DH8uGX7ErAnO8vYdRHqW326+8Js4E5OXjeue4YauEHqo7rOapAg6EnY7eG6volE9FjDEL6znYGneDxnK8WdEp1P/18Nl+kMkcikU7aQQNsJNjTCGy6t/twb2uqdQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286973; c=relaxed/simple;
	bh=1NDqOAekPri/m4O8impoBtCDJFr+DiW4Ny0SINZ8vm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaThou3AFDRrOkYh3bImrS2dI855wa9WuRrA+fAXWzvrvkv5OGTHIQFHgq4HIxPJJs0VUOv6QPp+J8itABHN0yosH927Tg7LssccF5Ji1ZDc8f5EbzpoT74eDN2Yywp5WxjnJVns+zQPJTgCIJa7VkiwNe2N1bsmLhRwd82Y95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HybofPmE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HybofPmE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87BBB1684;
	Mon, 27 Apr 2026 03:49:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BD633F62B;
	Mon, 27 Apr 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777286970; bh=1NDqOAekPri/m4O8impoBtCDJFr+DiW4Ny0SINZ8vm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HybofPmElUWxhJiHsWQ0t8uWuAGLg77UZdYEmqbP0Vvm0a9mwb+0sCN01sSw/7Ah2
	 7Q409dAH+foOqVQ2Lo3Gun2f++NmwGlOfy5rXY9PrLwwi/GgeNHzZv1y9+pIPJxEaG
	 rNrCwutKSV6vMlGLmesc0H4+GCSPYVfFvnAbT2ko=
Date: Mon, 27 Apr 2026 11:49:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 2/4] coresight: pass THIS_MODULE implicitly through a
 macro
Message-ID: <20260427104914.GG929984@e132581.arm.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>

Hi Shashank,

On Mon, Apr 27, 2026 at 11:41:22AM +0900, Shashank Balaji wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1694,7 +1694,7 @@ static void __exit coresight_exit(void)
>  module_init(coresight_init);
>  module_exit(coresight_exit);
>  
> -int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner)
>  {
>  	int ret;
> @@ -1713,7 +1713,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  	amba_driver_unregister(amba_drv);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(coresight_init_driver);
> +EXPORT_SYMBOL_GPL(__coresight_init_driver);

For consistency, we usually use prefix "__" for internal functions.

Could you rename this function as:

  int coresight_init_driver_with_owner(..., struct module *owner);

> +#define coresight_init_driver(drv, amba_drv, pdev_drv) \
> +	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner);

Please first function declaration, then followed by the macro to
define coresight_init_driver().

With above changes:

Reviewed-by: Leo Yan <leo.yan@arm.com>
