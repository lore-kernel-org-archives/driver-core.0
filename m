Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5B33D4FA
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777398770; cv=none; b=aTaCOl5wIFUGNnd1eT2oybczjAiD60NdKWzCcMXRppg+ikkpT7qipM5g/03RFSGAfP1qbGXX4K9qQ3cv/c/6Vb3vqbgPuEH6txaKNpUzqVlCTMC/ujafvieIO+/cxKIvBxU1eb74ppBz93Dh57QhgfTjvMiCaInKYOEZvVxqWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777398770; c=relaxed/simple;
	bh=vumAW2RFVHMxatUpH5GEYCNI+DjNpeDnApNOIrYkPIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dH1FkWThpHojMBgeqhXqxL+15es8G2HbBI8t9ZMCFwpY/YFOfSMUHDbXz84I/owMKen/jC9mD+PkPt9X83zQPp0VwSOJALrNzxDpovgZbV1sPIPzJL/RFpvIJoaKko2usJSgWq4J9WePCAF0xgJVib41iP2TfUptS53dCmg3nIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=CORNI6xs; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="CORNI6xs"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4g4p1Q4TFczlh2fs;
	Tue, 28 Apr 2026 17:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1777398756; x=1779990757; bh=XJm/G9ISGpUcmxXEw+LSQg8J
	3aA0kJK+ptYA0g9b4wI=; b=CORNI6xsngcO2b37tVbGnwc87cdx8AtEbXHhF+t5
	80XugqGg3GjPcbk+YqU7K3tVhFqoWCgQ3NTha6igIFb20RPjD5+HChLvAHdRk+jd
	6kezxkJ5uV/SJp8ANz4U8UaIFTaAmWZ/ATR9VQHY/839xB60dkJWIucygKo7aqDX
	gxHj0UPG2D2r9gikX6HW96soyrOyGfXY55L7BBQ1tynQfiZjlOKYMmS0BDuPdKXd
	8C31AlZWhvMsL5B+Kxm1KODg6JhhTf3E1hrQY2hPhhElMk5wakLWrJdV69n26btw
	RYwvIv/qT8bbrvPMhUN0YEQ2D5Nzj/xha2TG4PmqRMA21A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cAPZW7nPvpKq; Tue, 28 Apr 2026 17:52:36 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4g4p1F6PH2zlfc3v;
	Tue, 28 Apr 2026 17:52:33 +0000 (UTC)
Message-ID: <16b434d9-ee15-4231-a722-ee2398c48c63@acm.org>
Date: Tue, 28 Apr 2026 10:52:32 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: base: Set mod->async_probe_requested if needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Igor Pylypiv <ipylypiv@google.com>,
 Chung-Kai Mei <chungkai@google.com>
References: <20260407160511.56289-1-bvanassche@acm.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260407160511.56289-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/26 9:05 AM, Bart Van Assche wrote:
> If PROBE_PREFER_ASYNCHRONOUS is set for a device driver, and if loading
> other kernel modules depends on probing of that device driver to
> complete, e.g. because it is a storage driver, and if
> mod->async_probe_requested has not been set, then the
> async_synchronize_full() call in do_init_module() introduces a delay.
> Fix this by setting mod->async_probe_requested if
> PROBE_PREFER_ASYNCHRONOUS has been set. This patch reduces the Pixel 10
> boot time by 100 ms.
> 
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Aaron Tomlin <atomlin@atomlin.com>
> Cc: Igor Pylypiv <ipylypiv@google.com>
> Cc: Chung-Kai Mei <chungkai@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/base/module.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 218aaa096455..e58fc189d389 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -39,6 +39,9 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
>   	if (!drv)
>   		return 0;
>   
> +	if (mod && drv->probe_type == PROBE_PREFER_ASYNCHRONOUS)
> +		mod->async_probe_requested = true;
> +
>   	if (mod)
>   		mk = &mod->mkobj;
>   	else if (drv->mod_name) {

(replying to my own email)

The above patch still applies fine on Linux kernel v7.1-rc1. Please help
with reviewing the above patch.

Thanks,

Bart.
