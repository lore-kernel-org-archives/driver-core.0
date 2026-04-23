Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2A2AF00;
	Thu, 23 Apr 2026 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776921563; cv=none; b=GP38CwTXlmiF095PVmiD2Il6ToxYDXaR+Fd5u+mZ3mFvKKGUiQd1mKM7acTrg981kk3lyP30YE8t8EFToiHOnit3kQzno6VGmrcLg82uajzjotW0H/+P2g0WlKtR3cG9su5WshpChZduMJ83hvQSeGKJzOcfCVZZNB4Su87s5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776921563; c=relaxed/simple;
	bh=XN7WQGeQsEDnRBpXI8hnED/oD5rHGhtUbhNXkc+YPjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lql2urOUCEpYvnH28QERdTnIjZDFmFPi3ZOfmpMX9n0frCeuyDZUaIHHuTYFvaVAaGyT3CkAplc1mq/2HNDVUhM9ocn/l0sWo0cLgvjLW2Wk5RYkP7Gq+kYGOTSs0ZGpCpsPJGW8P3mgHVhjFQf8pXwuEaor5V79FgJ4YTJ4WJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy6waPCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy6waPCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AB2C2BCB2;
	Thu, 23 Apr 2026 05:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776921563;
	bh=XN7WQGeQsEDnRBpXI8hnED/oD5rHGhtUbhNXkc+YPjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hy6waPCVD3EhX2+2OymXHrPQSPrCjTMD0XOd0ctOacKWK4ew6Nkas6ZZL9gn8h+1F
	 twMvxDo1FPjFR2plNBwMOl055AQoA+2wM3rqqgLD82k4sS5AfBash5pexwhVqBeIBO
	 Nz6fjfzlKi2g3Fg7ekfCRgRSZ9Q7jGIUZnUSOefjMkqVWeV9owB1XYX/WziDLUPk8s
	 FspoZURkrw37CE/AWAGD13M3eTxkPmfm5TvqBlcU86wM8nJyZn5WlK0q9gz5qID1Jp
	 9BZ2dZkKIzVBWCEoeixqw6PzphJywhtPjLrPCXF4BHOhT9LT3U4x7M5vCMjVtvXxIp
	 MFOeHtrwNPxXA==
Message-ID: <d25b3ecd-9941-4b3b-9480-4f8f16a8ecd7@kernel.org>
Date: Thu, 23 Apr 2026 07:19:20 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcmtest: fix reference leak on failed device
 registration
To: Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
References: <20260415193138.3861297-1-lgs201920130244@gmail.com>
 <87h5padnof.wl-tiwai@suse.de> <874il9eu4c.wl-tiwai@suse.de>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <874il9eu4c.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17. 04. 26, 12:52, Takashi Iwai wrote:
> On Fri, 17 Apr 2026 09:57:20 +0200,
> Takashi Iwai wrote:
>>
>> On Wed, 15 Apr 2026 21:31:38 +0200,
>> Guangshuo Li wrote:
>>>
>>> When platform_device_register() fails in mod_init(), the embedded struct
>>> device in pcmtst_pdev has already been initialized by
>>> device_initialize(), but the failure path returns the error without
>>> dropping the device reference for the current platform device:
>>>
>>>    mod_init()
>>>      -> platform_device_register(&pcmtst_pdev)
>>>         -> device_initialize(&pcmtst_pdev.dev)
>>>         -> setup_pdev_dma_masks(&pcmtst_pdev)
>>>         -> platform_device_add(&pcmtst_pdev)
>>>
>>> This leads to a reference leak when platform_device_register() fails.
>>> Fix this by calling platform_device_put() before returning the error.
>>>
>>> The issue was identified by a static analysis tool I developed and
>>> confirmed by manual review.
>>>
>>> Fixes: 315a3d57c64c5 ("ALSA: Implement the new Virtual PCM Test Driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>>
>> Thanks, applied now.
> 
> ... and now I looked through the whole tree, and noticed that the
> majority of callers of platform_device_register() don't care the error
> cases without calling platform_device_put().  There are over a hundred
> callers of platform_device_register() while only 5 or so are doing the
> proper cleanup at the error.

Moreover, unless the static pcmtst_pdev has ->type->release or ->release 
set, the patch triggers a warning upon put().

> Judging from the numbers above, it might be better to change the
> behavior of platform_device_register() itself to call *_put() at the
> error case internally.

Yes, that's what should be done instead.

thanks,
-- 
js
suse labs

