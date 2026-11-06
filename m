Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984254;
	b=p5Hu+FxCr2nXCM29jEOhuKazFD6vA6ucj8NpNgDStejTJDZg91z5/QxI3y2JP2y94vqm
	 ohQMlQDTHPP+WmKwpqmCWe5GzBuz5F7P5/GrGPjHw1gDTjDekW1eZgdENzS2cGefrry06
	 EBC762uxw8i8MDcXHexyvTWLLRkwWjj0HQ0FYt8bPX3mDhwi1JuZIXDKf9VvCbqBpKSWn
	 eHJH2w8ELsrTbI6xduClmWG2zllN6SR8e6VKU7oJH5AVxTXMN1iWx9mnE1bGgBtM91hAV
	 /lpc/aA04wa7ZX3zxsShFzOFZOQFG8X5cgOkSA18lbahHoUJ42cJia5dkGU9y/FRXvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lDNPLrUxmcTvaWMZDOjinxQGN0Dfd4EyRHpy4Hl3zVo=;
	b=zW7qEeYMYi+S9q6j/IfCzm336nW7OwZtbPZWczMZw74pTABVJ7J2IYPgoMfFDyfugRdZ
	 zsKLy7N+sxZQfKM8oIcR6+3r7/9c7634gJApbFbZjGGKGTPDXT8ema+itcbBtwXe5esub
	 kH30dUzT4QxzGBjUJyeSSyg+WPhrXJtbsh9opd1/OzdnW9espJJrw9NpS3Zklz2VfFXQQ
	 gbvM99H02BylYb0DTSpE1QpdHBRYi+uSbLU8nQ+1ANgwN8I/16oii1gQufBiECOwqPVai
	 w3Q260S1/TLwhFtKFKxvmxx0FPk+hZAdJho2EJNQXPq1ai63OTVm6L2rtn2BVsz8SmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FylGggKJ;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1B606A32D
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 16:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC1B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FylGggKJ
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e7ad9f78dso104635485a.1
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793984253; x=1794589053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lDNPLrUxmcTvaWMZDOjinxQGN0Dfd4EyRHpy4Hl3zVo=;
        b=FylGggKJ9o6Vs5QksRYvEqBwUWVUkPlaFNMNZ9Wl9ZrB6a+I5xNezlmuh3ULYU2OrF
         nHadKciLS2sTUIlGdZmB8NJcaC9Jp14yc00Cy39HJtdZqTBdrgZ/Ym4x0qBOgNivjdle
         PFWcK2eFdY+8H93bbnbvsJRNmObg+LDqZ76iL1yJQUK0xDf2wy18toYeIjUGw8MgTDgX
         +oHmBZiY1ZdyAXaAXNSGaGRXcVNHJqBZ0MryLl9Dej/0p3ehfBPIsd6rkuSSrIDm8TII
         xFp5ujeAXKOYP1DtE4UsSj0ACHJrBI7UFtPKOueTJ6TNMNtrgZ4xhWqILsnj+ZgbEJg8
         FJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984253; x=1794589053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDNPLrUxmcTvaWMZDOjinxQGN0Dfd4EyRHpy4Hl3zVo=;
        b=HnDT5nzAujQAKMlMTwDEX5HcJI5jKMR8iaLHdBu6UaTO1uRSY4GQDXBWNFrF6kuQjd
         YeRwR5YNlHHjYJ2Fhaa3Al/D/rdmbelHNCsbG7UwCR0mLskxn2fr9IRoRpnehjeWr9mz
         r+3i9rb4rCIV9VnB8Zj5NZQcPuxQ2xZrtYeOy/cNwZfpXSCzASXJU68TGuQLzKpdrhgg
         f6thWJ/PjNPe1E1HdtR+lZuMd+WrhcyxXi4H6yxgS4dk+sGPrAlrI0Nj3bOsJ3mLfcAl
         NZ7g5WBIjqg+O7nQsBXEq6LdH0t9bsTF4PUIMprPFoRYS/JXIjhW3cT1Aexg6e9qPC9C
         +8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwk/xX+1a166798rqOy8FzEPwUqnANA4iPd8dkycUDl3RKWIvnX7H9g3J3lUAp7WQBPng5aGZcwxw9dHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8azhJa+OidOZDzPmzY8wot+XquzgSHGjuljUNh5etOJ2onGuax
	LUfxZ7LpiQEAjIhqC66CiodjZE67rRGYdfhMPXiFAExEYZdTYd8oiGwTdxzyA1ebKQ==
X-Gm-Gg: AYBFou0ABgjnLBYWrVwUXco/PlQ8gqrib1Cj7v4SVq/Cj3U1eMo/O8vBhejj5uFoXCB
	bGrokVsR6zlqtsKtP1GC5PCeQo5QSWqPWNLH0jWb+gdRO5OZt+AmZxvcyYEyUhVcdmlG125F6nn
	boUEvxbVsw6sGe6SIwU2mjP7ilYgmid7r4X1u/MUq+lWu13oUnEG1u9eW3G+6hvLhreS7ulw2hV
	sA6bBOD2efRMOhV6B2nrXK+tcnqOZr2hbVAp+dYSm037lk9KkGHWCxL1VKYhkb0OQ4cJynkE3Yg
	d0ZzuRdYdn5rEMQ4bxY2gQv2ZqDeD327Gv0cDae1nA8zAHdaHklHWmm1Pbwih0oRrZgSsT/v973
	7lX4uZ0/sePp/+z/W+I47f9R1xqkImEhm97X/+MR1SWf2W+VJsSRc6v7NS46fDGNspd3MqNiz4P
	bpELtAk55N4ZTIg4CLDbcXy2NPUDxWXDbAoyvEy7IgEr9HvCjVfV0jw+5Xk1i7iB92hnwLyEMye
	RGN4Wue5KMCQS6D4puXS0ZK8R9LFnkRtpa/pmTQw5HUZ2jIrjP3G1XPOxxRefL67e9ORQODIxLN
	hLqHFcOYSdG19UeJwRqIH7JadJ7+
X-Received: by 2002:a05:620a:84c9:b0:93e:c12c:f142 with SMTP id af79cd13be357-945f356285fmr466963085a.76.1793984253353;
        Fri, 06 Nov 2026 08:57:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5c10084sm179741185a.36.2026.11.06.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:57:32 -0800 (PST)
Date: Fri, 6 Nov 2026 11:57:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy in rpm_resume() for
 active devices
Message-ID: <c44be544-e365-4ef7-9165-243cce708d55@rowland.harvard.edu>
References: <13032301.O9o76ZdvQC@rafael.j.wysocki>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13032301.O9o76ZdvQC@rafael.j.wysocki>

On Fri, Nov 06, 2026 at 12:31:41PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Setting an autosuspend delay for a device can be expected to cause a
> runtime suspend of the device after calling, say, pm_runtime_put() to
> be deferred, so the time between the last successful attempt to resume
> the device and its subsequent suspend is at least equal to the
> autosuspend delay.
> 
> However, that expectation is only met after the device has been actually
> resumed in rpm_resume() by invoking its runtime resume callback.  If the
> runtime PM status of the device is already "active" when rpm_resume()
> runs for it, the device's last_busy timestamp is not updated which may
> allow a subsequent pm_runtime_put() invocation (or similar) to suspend
> it right away.
> 
> This is arguably inconsistent and confusing, so make rpm_resume() also
> update the device's last_busy timestamp when it finds that the device is
> already "active" and it is about to return 1 early.
> 
> Fixes: 56f487c78015 ("PM / Runtime: Update last_busy in rpm_resume")
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com/
> Reported-by: Brian Norris <briannorris@chromium.org>
> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/base/power/runtime.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -819,6 +819,12 @@ static int rpm_resume(struct device *dev
>  		pm_runtime_deactivate_timer(dev);
>  
>  	if (dev->power.runtime_status == RPM_ACTIVE) {
> +		/*
> +		 * The attempt to resume the device means that it is needed for
> +		 * something, so update its last_busy timestamp as in the case
> +		 * in which it actually resumes below.
> +		 */
> +		pm_runtime_mark_last_busy(dev);
>  		retval = 1;
>  		goto out;
>  	}
