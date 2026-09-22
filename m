Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F353E2F5
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084409; cv=none; b=UpO6v8RgQRBd2n7K5inhdOZBw+0rn6vKbT+TqlN9WcE5oE5TD1lnR1au6TVTqw0rMbVAYB0EG5/Cf59AFUr8zb8lmzMoOFAD3otRlIm+oipOur3Qqz6LN7pz1KxeOns5znTvA1Y7FQUNWWNtfDxEKMaFYslCkiZtQCys396GNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084409; c=relaxed/simple;
	bh=DUEOh1yLTbnjKaiRVgHpJsP2PKjLs1lAERIDbW4fWng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE7H3cBYWcJFh6e7imFfFwsQU12oKQc1pXfFCljuy/VperdsbE59S1tcoie0E2iVDYf0JMYjzEjRIHBKaPZxWi3J6wtPlrE0ZEWZXz0Bct1EL9CKlYkTFEJ3P5m3VC1MKp1UB0hUoIK998kzMT3humtbeNTAWYJg+vD5BjghZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IXmfzQNo; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IXmfzQNo"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6714595153cso513323d50.0
        for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790084404; x=1790689204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJCG2Sm0vsgw6siNu4vSpBKtOWqusCF2a7VkMLKoqYo=;
        b=IXmfzQNoVNZOrIORjmaj2LTvd2+/2xVG8Ue0gGPBeEF+/WezMOPdS/fMJlnZxCZiVm
         qm8ghamOj93Q45Orv3FCNvY1QP5wxzbHMDpiN+DHFejpskzS30ur5BWt1eESMLt2PQOy
         vVk0ACrCA/MQLHnXgRqbgCK9YpGOMcioFupSIAj8knhD+E/e+9T9amaqv8OuOlrCVwsj
         pSCh+sPp2VOY6P+88uCcipcyFm8y3S0VCL8TmT0fOnqsMkF5nYeGlGzAE5pG4bIj2YKq
         95+0nboULxritB+rjtI+G1NgplZcCKBjVZ+x7H3PEu3nWg+XJWDBK9/iDprBR44M8jcF
         oL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084404; x=1790689204;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJCG2Sm0vsgw6siNu4vSpBKtOWqusCF2a7VkMLKoqYo=;
        b=1vsfy4NC456otAxGQlhJLtt5Y3GSO4odWA0gw/4QiRf0tpEOZegdHayQHznnznxvJU
         1PEAlFYqpCIQEPfQ0RhXTOfSb2mrf325qozl8MMDcjMcOyaKGPLFVy7bf3cegfHL8hGQ
         VK6OLI2ev5bKUQn/BwEdG1VabnqA7BjECx8Fd4py6hdSi9G+iqozipeojpA5RH13Azur
         mwrBh3vb2Hy8Z3/cBCPGNmRzPcF8qjQ/07MKiAlMOdnhv0fZqP9gzT1fH1zrOLIPDJFv
         dAJ4YHZVyXThSDyhJ7JFOTqunLyeJFEEzhXkvU4hvEKWqpNjwwUllxxtFM3SDVIuggjb
         RBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwziyAMl/Jy6gyHafBVnhLGAKxUSmzPeaawqPNbsRqhpYooVnDP+iWHMQ7GlpIzufkfcVKAzuyOvbEBQA==@lists.linux.dev
X-Gm-Message-State: AFuF++ldq+2LLncXnhVZqIH7cNM+dQVLtezoTUfI+FZo1rdJMK8NhtAC
	J/AfzzIohIcrChsrpybSqFpbKQ1qFjqWc0i9OY+T75F62WtaOikEDPCOLwG0PrAu6Fw=
X-Gm-Gg: AYBFou131/oLtvjexHDd28vkoJs4nWxbLqdKRf1J5OfPnBQnOMoODJ17/tRzCFBj9Lh
	CaP7bNCg0+tu/F6u0Og9h47P7MtLtmrOdj8c3FiI5oJQ21e/NFY5ON0xFFxXKejeexlKTxPACJf
	LF9bfUlSTSH29dcV4iFqTM5NGAG8McV9ZsTNqbmWWkHM7priDE4sLOKNVwcFuA3mR3TTbM61bNV
	5Wj/O/gBY8huFLfcUbqakYUiM2sMgRrZ1Xfdg91I3RRn73ZE2cgyEuSpWL/XYiXBbNjow1cUpm+
	Zy04aXsf0ifSJ1BnyxK51Vu0AX5pqgwFgJd8YU+8vPdPYvjGtvatoqXcplxFeoG+yH6qXlp/MBK
	BjI1NT712Mw5RzcKbyQVKt5zWXATU5R2Hfz4PM4BROiUAHevapX+HQDmA0hy1hQhnE0g442vcBz
	wOeY7BCNzQImkCSV/YhNmgW3LLxdpfnU6KUB+fEj+0FE7wTCzIi3c8XZH+sGeYopI6tQwMvebC0
	mkYYSb0ub3wCgbjT5HjsuDgbOzb4zYMFX3PjQilj10DZIwN
X-Received: by 2002:a05:690e:1382:b0:66e:5332:a911 with SMTP id 956f58d0204a3-672c299a828mr1382169d50.21.1790084403903;
        Tue, 22 Sep 2026 06:40:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:bbcf:6512:c1f9:5b9e? ([2600:8803:e7e4:500:bbcf:6512:c1f9:5b9e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672c75bc43esm697539d50.6.2026.09.22.06.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:40:03 -0700 (PDT)
Message-ID: <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
Date: Tue, 22 Sep 2026 08:40:01 -0500
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org> <arIvG0nx4LXG9nlW@monoceros>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <arIvG0nx4LXG9nlW@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/22/26 2:39 AM, Uwe Kleine-König wrote:
> On Fri, Sep 18, 2026 at 06:39:02PM +0200, Danilo Krummrich wrote:
>> On Mon Sep 14, 2026 at 4:30 PM CEST, Greg Kroah-Hartman wrote:
>>> The ability to add and remove devices from a driver through the sysfs
>>> "bind" and "unbind" files was created all those decades ago as a way
>>> that kernel developers can iterate faster, and provide a debugging way
>>> for users to attempt to add a new device to a driver without having to
>>> rebuild their kernel.
>>>
>>> This api over the years has been abused and recently come under a major
>>> fuzzing "attack" through tools like syzbot which decided that it would
>>> attempt to just randomly bind any driver to any type of device, causing
>>> loads of unneeded errors and pointless kernel patches to be generated by
>>> unsuspecting new developers.
>>>
>>> Handle all of this by adding a new taint flag, TAINT_FORCED_BIND, which
>>> will be set on the driver if the bind/unbind sysfs files are ever
>>> written to.  This lets kernel developers "know" that a user is
>>> attempting to do something that is not normal, and as such, if the
>>> kernel breaks they get to keep the shiny pieces laying around on the
>>> floor.
>>>
>>> The flag is 'Y' which was unused, and can remembered as the user is
>>> "yeeting" the device being operated on here (thrown with force without
>>> regard for the thing being thrown).
>>>
>>> Note, the taint flag gets set _BEFORE_ the bind/unbind callback happens,
>>> as many times crashes/oops/warnings/failures happen within the callback,
>>> and the taint flag needs to be there to show what was being attempted.
>>> If it were to be set after the callback happens, the oops report would
>>> not properly reflect what foolishness was being attempted.
>>>
>>> Fuzzing tools like syzbot, that doesn't have hand-crafted rules to keep
>>> the tool from hitting bind/unbind, should be run with panic_on_taint
>>> enabled so that they fall over and don't continue on, thinking that they
>>> actually found a real issue.
>>>
>>> Userspace operations that rely on the bind/unbind files
>>
>> I agree that this should be avoided.
>>
>> But I also think the biggest offender really is driver_override. Specifically,
>> on a hot-pluggable bus a driver must be complient with the device driver
>> lifecycle rules and hence shouldn't break on bind/unbind. I think it would be
>> nice to not taint the kernel for such busses, and only taint on driver_override,
>> as I think we'd still want the bug reports for such cases.
>>
>> But I think this is fine to leave for a follow-up.
> 
> I fully agree. I'm fine and support tainting on driver_override, but
> bind/unbind are used occasionally in my bubble and I consider drivers
> not handling that properly buggy.

In the IIO subsystem, unbind/rebind is the de-facto way to reset a wedged
chip.

A few examples where other reset methods were reject in favor of unbind/bind:

https://lore.kernel.org/linux-iio/20240727160216.2488ed29@jic23-huawei/

	This needs documenting as it's custom ABI. Note that we don't often
	accept custom ABI. Particularly not a hook that seems to reset the
	device. If you want to do that, unbind and rebind the whole drive[r]
	so we are in a known state etc.

https://lore.kernel.org/linux-iio/20240720163440.03c713dc@jic23-huawei/

	Firstly as stated below, we don't provide interfaces for this
	because it's a heavy weight process that is most of the effort of
	unbinding and rebinding the driver. So if you need to reset, do that.

https://lore.kernel.org/linux-iio/20250505200609.54756520@jic23-huawei/

	The solution is to run it once at driver bind. Similar to reset
	below, if the usecase needs to re do it then unbinding and rebinding
	the driver reflects the fact we are taking it effectively offline
	for a while.


> 
> So please let's do
> 
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index c51ad96d4de4..ce8fb14ea19a 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -242,7 +242,6 @@ static ssize_t unbind_store(struct device_driver *drv, const char *buf,
>  
>  	dev = bus_find_device_by_name(bus, NULL, buf);
>  	if (dev && dev->driver == drv) {
> -		add_taint_module(drv->owner, TAINT_FORCED_BIND, LOCKDEP_STILL_OK);
>  		device_driver_detach(dev);
>  		err = count;
>  	}
> @@ -266,7 +265,6 @@ static ssize_t bind_store(struct device_driver *drv, const char *buf,
>  
>  	dev = bus_find_device_by_name(bus, NULL, buf);
>  	if (dev && driver_match_device(drv, dev)) {
> -		add_taint_module(drv->owner, TAINT_FORCED_BIND, LOCKDEP_STILL_OK);
>  		err = device_driver_attach(drv, dev);
>  		if (!err) {
>  			/* success */
> @@ -513,6 +511,7 @@ static ssize_t driver_override_store(struct device *dev,
>  {
>  	int ret;
>  
> +	add_taint_module(drv->owner, TAINT_FORCED_BIND, LOCKDEP_STILL_OK);
>  	ret = __device_set_driver_override(dev, buf, count);
>  	if (ret)
>  		return ret;
> 
> (plus the needed documentation adaptions and maybe a rename
> s/TAINT_FORCED_BIND/TAINT_DRIVER_OVERRIDE/).
> 
> Best regards
> Uwe

