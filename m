Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371221D435F
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536210; cv=none; b=qt6XAlamvYDajjZwbWHbLd/qJzpd1LsSn+rzjZ8hLBNj/zBOfWQ6pcjeT6RiKC9uM1R6BzIPbxPNfH040nwRYhVpTvDZTNjU6JVH5tLR/xOgNqLho4ZoMDwuF4lrFamQRVtwtlNYijXTqCpDtjGvzeyhOXxMCtD+zkFn4D7E28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536210; c=relaxed/simple;
	bh=aaZIP2ylDVjQUtzurgdQ9wq0pNSQxBzXiVQVyeKHPJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv3SLzogo9UozGOnVMYNDN7VDHIH1l15a8rVO+PX+U3AefvQd8ocgLn5vqp/UuUv9ztL1UUH5Ia8jV4GRksNpA2J+NmNTUEYWAfd0naN5eAKziOM48b7g0MvuaKFxNPXQnocR51lmyiwl0FbvZvRdd7vQVpwwH1PVaEJgrMmMCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d0WFH8AM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d0WFH8AM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441fa5c37so783299f8f.3
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788536206; x=1789141006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsB/pfsHs0wy5wl2WAyEdIegLrat6VbBoQVukEgDfgo=;
        b=d0WFH8AMn71t/hESNJ51sAyJDAIg7bHdiVSF9T8y/L1P+epSP+yaL2nmWp6SkVN6mM
         oi4Z5/WX8JcBafLEWCIF6VIsqkF1YqWTNqE0CqXVT/ZM4kkuUpt/qk5X4amzVQoJw0N2
         rU+pv9qGJAYmyX96+5b28SQuU4NLc4ooI9A1LAwCyPXVc2RNze5iedAoSBtAHOTS9jLw
         3gCrwBpJHUK7615m1TJWgkII3AdQACjhyQLwdlHsAu7PLgahOH9Y6boH3kMXG7DB1Viy
         mIo5JBC06DCf+Vdb12GXsvzq/axhqpyltZkdy6JvLMfUYI6np5aBF0QjW7+hNsrStT/p
         j9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536206; x=1789141006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsB/pfsHs0wy5wl2WAyEdIegLrat6VbBoQVukEgDfgo=;
        b=dEsNtWIx26ak9W5z18mDcZlKxGzFK5kz8do9cqYd0xvh7GIu1wdPUMWrLF8mmu1XIV
         iuxIwa8g7LoVZoxG7XqJvqH9eG6cw2CXhUgCNPVO56dnnuiJfI4wS7sFpzzFmTO5p6Z+
         uaEjH/RWsnVlP0Lb3loWPhsZ7842Apo7QeZgjVHOWLlh9yjbL2M4NSmFf42NY6uh5GTH
         NYj7ru5TZ/DaNq+e3dhI+xwdjHzZXzkcYN+7shR0JNBdzRwIl4z53BKd2DHqaC5WsTHw
         2BmBIGEgVsTXWjWObsp5po5sB6qFIdWVeD1rzwRKEDuoY6xmmI9yu2WUC23fShNc4L+O
         nFkw==
X-Forwarded-Encrypted: i=1; AKwUvBxv4xhSEa5KCPUuCPz0ZZldsuwkYCwQ7mgSwgWjeNPGvwqEN8iWAtQuFpxaE+/Ach9LiSwSutbvvK+DHg==@lists.linux.dev
X-Gm-Message-State: AFuF++mX0Biwc5vvMcQRK2gmNlw2gDA7PGhVu/zBe2lnqNp5GjHBp5jR
	oPyDKmoMtPS+enJJppsuK6YnQ9a/PTWgFrg6+PEyoaoOadJ9k7zmIC3r3Tv1WM7z8FI=
X-Gm-Gg: AYBFou3CXlbwOO/4QD+dsnqbdLB2OmuFOlL9sVnOvBnAvU+qzynHOcIrJhPM463NrPB
	zk77e2/H+JgYKO1g6bnysg4Y0z768Co0Mrc2sBjwo50BGR+V+sRMwfkis60aFsS/yNhMdRaIN0k
	tI+1nOgQhjghNj/ycPPlAqQfBNfgzHBk2JsoPJmE0s1KeqKXZ1TpxXHYad+eNsX3VLaxm9GG2jL
	2zItHa4cchwUn/gapX6c33q0oz8WluVZn2bXWxLp5SPC7x4MD9JQgbRJcCjKThkmYoV6fVxnBR5
	ijjorwYIFY5Nnc+6KvO6hK0C5L5yXfB0iv/L/N5fhQEYqWg4EHPveHrdY2pT5ygp/S79Kf+7GEG
	y5o11p1hYA7JlpHTd6S6cY9vYfPDHXH7Ym95NYaf2oUCwl1gSMV7iPSzwCp34J7kd3FRS8EJ4eg
	egH92wMQ3XOnQTCtYSp4xM0n8j8daKKI5a+BN0DtEoK73d5WY6W29nuAvtOd6hxoTvbX1CvX+47
	i95pmoiOeyMkMUWDYgKpdf6Nk95RJvi8Yyvkg==
X-Received: by 2002:a05:6000:1863:b0:482:e6b5:61c with SMTP id ffacd0b85a97d-48587098310mr9747937f8f.8.1788536206395;
        Fri, 04 Sep 2026 08:36:46 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm7833177f8f.25.2026.09.04.08.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:36:46 -0700 (PDT)
Message-ID: <33487133-b587-42f8-9716-b0bbe2f1511b@suse.com>
Date: Fri, 4 Sep 2026 17:36:45 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] module: pull out add_taint_module() to be public
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20260904-bind_taint-v3-0-30025465f38a@linuxfoundation.org>
 <20260904-bind_taint-v3-1-30025465f38a@linuxfoundation.org>
 <a79a6a06-cc48-4036-882d-95e9b4cc01cf@suse.com>
 <2026090432-outlying-glitch-9295@gregkh>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2026090432-outlying-glitch-9295@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 2:19 PM, Greg Kroah-Hartman wrote:
> On Fri, Sep 04, 2026 at 11:25:01AM +0200, Petr Pavlu wrote:
>> On 9/4/26 7:10 AM, Greg Kroah-Hartman wrote:
>>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>>> index d0e1e0bd2ad0..444d990c9983 100644
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -191,11 +191,21 @@ static inline int strong_try_module_get(struct module *mod)
>>>  		return -ENOENT;
>>>  }
>>>  
>>> -static inline void add_taint_module(struct module *mod, unsigned flag,
>>> -				    enum lockdep_ok lockdep_ok)
>>> +/**
>>> + * add_taint_module: add a taint flag if not already set for a specific module
>>> + * @mod: pointer to the module that caused the problem
>>> + * @flag: one of the TAINT_* constants.
>>> + * @lockdep_ok: whether lock debugging is still OK.
>>> + *
>>> + * If something bad has gone wrong, you'll want @lockdebug_ok = false, but for
>>> + * some noteworthy-but-not-corrupting cases, it can be set to true.
>>
>> Nit: The final paragraph is mostly copied from the description of
>> add_taint() but I don't think it is quite right. The parameter name
>> should be lockdep_ok, not lockdebug_ok and the values are
>> LOCKDEP_STILL_OK / LOCKDEP_NOW_UNRELIABLE, not true / false.
>>
>> I suggest updating this part for both add_taint() and add_taint_module()
>> to something like:
>>
>>  * Use @lockdep_ok = LOCKDEP_NOW_UNRELIABLE if something serious has gone wrong.
>>  * For noteworthy but non-corrupting cases, use LOCKDEP_STILL_OK instead.
> 
> How about I add another patch to the series that fixes up the
> documentation for both functions?  They both should be fixed up and I
> might as well get them in sync properly.

Makes sense to me.

-- 
Thanks,
Petr
