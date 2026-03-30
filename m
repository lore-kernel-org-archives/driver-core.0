Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA4A296BD3
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882197; cv=none; b=Y9hsUjVjZkU+0HOtE1VYKM9+WIcXR1e3v5S/SFLDJYgpxFcWwkVbJEjsdQ7fGWakBQ2JBHjEqw5xbmY02oCWvnEa29DKID3u/kC7d5NSg6sdlRor932fev5WNRAuhHu0ztv5Zh1uAenRiwLvRfi5imvbF6N2XYsZZZVebveRarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882197; c=relaxed/simple;
	bh=r74CxeVQS+MaGx5qIStVX7Dkyw5eva6XeRU/qgsTVAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn1womVE1JxiEEtrxgmlqSXsJyR8bcfcUVO2W7ojqzhgKDvapjoP9JI8FUeTrRFDfwWTd0a2BjZWwyCArbwQnLlZ6gr4Pb//MDbqhJfk0HB406aN+paJSK0kgR6Hp0VqfMc5iaXAUKQBbWQLW/sX4RowvKPAwxYDk0wwif6+nKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GeeHyOiY; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GeeHyOiY"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50bc115f206so17485681cf.3
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774882194; x=1775486994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d63VizpxJtFsSbrbeZx9OSixUi8R0KJ6qBhGjjaILvs=;
        b=GeeHyOiYwuzkxa3Ac2jKNGM9k61ks2U9LkDjQvmyU+Kgh1xeXPz+JNGQxkxp9GYuUi
         cLOuZsfHfv7hoQa+Pe/IV5A7Z11t4qTyfg83O4E/G6rTNMHfIybGIsYPVcns1Y/Yeqnx
         jqw2z8UwA0Cg8iNRaRgyK7sdi8wyqfrfA61oYBnNfxftUK99htZ8569Xq44t07hvztXn
         MU5YZqSPiLhXeVixSe+XRmm/DaxdcQi2TAreVMP1mBPczJlU0sh4d+UUuuYxrE+JCG1d
         7qYhYQqK97xO2iuNcxDBwYG6RccKVWzD2jlkALOcuTWvf189PKdQQZcD1cENusryyL3I
         lhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882194; x=1775486994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d63VizpxJtFsSbrbeZx9OSixUi8R0KJ6qBhGjjaILvs=;
        b=DKkO0yfLlfjyOQYl4v6GpSqCIXmoNNf8piBQduG8scln3Wzs1lr/Y5Q089jo+FGIQb
         iyxae+cL708K9fkiAWE1i8G5EdVpNLOIE475v2riVsgv/bWvbpb2IEOr+S6LqzfXAYxT
         M6TrON9q1/wft+nHwkuEjAFhBtXxkwSVsm0EIFWzf1EcOxRUwj4xfNAzJUoLHuO5jCbT
         ozbEiaLCNjZ45XwxoEocCu3FKFxNj+6z/vaExrQok0HHLIdy1BuzNwoyULTtbsT7FhbL
         KUc+CY4RjAvRdSwAaSoN/io6TdwWyOOCz8WVVzSfR9uwiozHj38a6gzfGKXlkT9vPLbc
         LC8g==
X-Forwarded-Encrypted: i=1; AJvYcCVvQYOBm8qPgOS//csA8l7F65W1mRN9H0FF12j+szYp7hYbCrEiz2ACTnECKiTEvsrpT0QN+/3ar3KNag==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi5GJWvsyjJ6BJgD02nnEUwbhxUNF41JuuXe81JXnfhxQVtgoj
	+yG1aA/6R9FJ0yivjQs+UAhyK3bMAiHlOfxvtJQBR1SLUmutFrcHjVTwGluYytnNzA==
X-Gm-Gg: ATEYQzygkOKWvC1THs5sW4cd9oKyAKWhKx55nPVs5M3qERTyo1sR8jyLc/hQpyjqJTz
	5JorbQAZe2aehY+frKz1ODlKyzy31fkr4uf7HVuPjmscSxkv5bBIWw53t+Q2N5BKHlg4P9wVl+w
	Pp1rTAaKeRED06HCeSHTRMBJUOTKyEK5VKZZpbyR6uITlTueerHbIni/CDQ02j+QxeeygC/4CrO
	Nj0LNXNwuPzLdg4VLfF8ikotPNuPUYyUul+wtPqnfwjr5UPqAx7rvi4/lMJQBrS5tfTb2mLM5n9
	+XBEOPTd0UcrKQwMZiFLR0PDtfKfZRUuY/N+AQrEJxm5kYiZM22VliEq8h2elf9a/Ybj5tyf0Xn
	ZljbSNqDtu3tnsW9e+zzBVu1X9k/NgMkQmQrBtEUMw/dszIOCpznZl3I7Rh5k1TUvxk/lzrXbO/
	h8Nn7Oc6+WignlwjuLg+R5FI2SoWUBf6c5PAuSuYNo1g==
X-Received: by 2002:a05:622a:1343:b0:50b:404a:746f with SMTP id d75a77b69052e-50ba3976e93mr171565381cf.58.1774882194276;
        Mon, 30 Mar 2026 07:49:54 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm63548861cf.4.2026.03.30.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:49:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:49:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Kay Sievers <kay.sievers@vrfy.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: Don't let a device probe until it's ready
Message-ID: <55bd10b4-4d4f-438d-9f15-9293bbe3c734@rowland.harvard.edu>
References: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>

On Mon, Mar 30, 2026 at 07:28:41AM -0700, Douglas Anderson wrote:
> The moment we link a "struct device" into the list of devices for the
> bus, it's possible probe can happen. This is because another thread
> can load the driver at any time and that can cause the device to
> probe. This has been seen in practice with a stack crawl that looks
> like this [1]:
> 
>   really_probe()
>   __driver_probe_device()
>   driver_probe_device()
>   __driver_attach()
>   bus_for_each_dev()
>   driver_attach()
>   bus_add_driver()
>   driver_register()
>   __platform_driver_register()
>   init_module() [some module]
>   do_one_initcall()
>   do_init_module()
>   load_module()
>   __arm64_sys_finit_module()
>   invoke_syscall()
> 
> As a result of the above, it was seen that device_links_driver_bound()
> could be called for the device before "dev->fwnode->dev" was
> assigned. This prevented __fw_devlink_pickup_dangling_consumers() from
> being called which meant that other devices waiting on our driver's
> sub-nodes were stuck deferring forever.
> 
> It's believed that this problem is showing up suddenly for two
> reasons:
> 1. Android has recently (last ~1 year) implemented an optimization to
>    the order it loads modules [2]. When devices opt-in to this faster
>    loading, modules are loaded one-after-the-other very quickly. This
>    is unlike how other distributions do it. The reproduction of this
>    problem has only been seen on devices that opt-in to Android's
>    "parallel module loading".
> 2. Android devices typically opt-in to fw_devlink, and the most
>    noticeable issue is the NULL "dev->fwnode->dev" in
>    device_links_driver_bound(). fw_devlink is somewhat new code and
>    also not in use by all Linux devices.
> 
> Even though the specific symptom where "dev->fwnode->dev" wasn't
> assigned could be fixed by moving that assignment higher in
> device_add(), other parts of device_add() (like the call to
> device_pm_add()) are also important to run before probe. Only moving
> the "dev->fwnode->dev" assignment would likely fix the current
> symptoms but lead to difficult-to-debug problems in the future.
> 
> Fix the problem by preventing probe until device_add() has run far
> enough that the device is ready to probe. If somehow we end up trying
> to probe before we're allowed, __driver_probe_device() will return
> -EPROBE_DEFER which will make certain the device is noticed.
> 
> In the race condition that was seen with Android's faster module
> loading, we will temporarily add the device to the deferred list and
> then take it off immediately when device_add() probes the device.
> 
> [1] Captured on a machine running a downstream 6.6 kernel
> [2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libmodprobe/libmodprobe.cpp?q=LoadModulesParallel
> 
> Cc: stable@vger.kernel.org
> Fixes: 2023c610dc54 ("Driver core: add new device to bus's list before probing")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
