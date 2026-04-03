Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7EF2D780E
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214180; cv=none; b=dvZTQAX/CarGn97EF7LvlBOiFx49ZCcTyxmz+HGz8apF9NyBnv2ZxfaohhhyKkNzZn6ACeS8SVtDZp7unfF+7VnfpaNtxhM/SxYmR2rld4cccY9kocoPqQOTw+/WdipnYXZbpJAR8NOHEgfZcdp+xcjGJkgyrsYWeqyH0gMz8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214180; c=relaxed/simple;
	bh=+bd/o6zo/Dz4hDZT1f1AfVLw2z7eQQ9XFvt1pNeQfr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mb+V5ohpsA4T8jdUb716nbKnOeDcIq7lhCkX2zUGss1O8/5/BuPMcxaGdvwbVlopBJaIqRIYXQuC/lnfbhQC1bD4tulTZixqFkL7mBkV/+3PxoXA3julK6fP1NcBjpxZt8NRe7ULVC9kE4rk3TGL2EBqwg09x5NeX2FXRt0/exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnagcyGe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnagcyGe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-487012ce896so9749855e9.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214176; x=1775818976; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ju7lTcPs57QyWbn0I8Mi64jjvZvbsJY3R3w9IS8LCw=;
        b=OnagcyGeaNKunoOtrP4mH/CcFZKbtGGhuSlFq+Vwwp/1jHi7/Jp+VvRQAFOU5VtUnP
         xV0uuXKTyLe8TyL3KJfFGppCBQ6JSE9FLsokinNwqXYR7KqsvwPrdTM08tt3Tca6Koy0
         gzfWbyOXkdqV550G93m15NQepEEm9t7P6iHzV5s8Kbj8uYCiVkNVMydqmtFORNgtjQb9
         jymBrBvOeUt1U+jZYQmMHqYSCVpxweNm34kiFsjv8md9WJyl9MtBnxyeCdifsCyAftxK
         UuKpo8yyxSI0vmcc83DgII/zbPdd3BQzomy0agOUH8HIROqZ5ctZQFL7dx2uxzmJyRd7
         EYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214176; x=1775818976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ju7lTcPs57QyWbn0I8Mi64jjvZvbsJY3R3w9IS8LCw=;
        b=SdEDkhlU/cdVa2wjStfPaHNVUE+2NcG79mxuea9UQGCRvzmajsej/091Pb0OxGZNsn
         JmIRnSMFU3/dpIT/F11f5c2jTleSWHdyMMF8ZuDtAbNSR5i+hOl08ADhXE5LG2xu2HK1
         pM7VQBlv+7MviZN7v3N8Lqzk1NmHU+WMlFoaxdPL96n838El46xsqf6vlZmj7Q4rBTK2
         WU+pQh2heH7ZbQiCAzlbvkrTJ1MYJQ2wwd16eFt2jXS1zziBX/43WCyyjHrnJ5PpVxt9
         1uWgGEZKFkIu2273uFQbb0SOH7u3rD0wfUKpcX0cdIWn+c/DeoFOKIxhOWpzgjTQDWX4
         +1iw==
X-Forwarded-Encrypted: i=1; AJvYcCXJxxH73OhDY6KhX+IKezLPuMpzOz+GSRdseALN7A/KfAhQMeGZ6wWyzZOHBcGSIR9JHU5Uwqjoq6YCKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7J8Ez3ZWejahaKASK7T3RFknNPq/4mfsKXnlhuzcU//gavctL
	hwBoh7fKDFkMY9qfuhopwVEIZbZ6XfkiwV7NUxOA2+Gqns2ECBnpmU7Nu8umVg==
X-Gm-Gg: ATEYQzxz4DpLW8b2VflKtyTAqHy8BKNVK0gR1JW40WrJtFJQyl707S3J+mdy7QCsdJg
	3NLTroWn+ehPEp/oYpNqjlM/rP4Elk7RroaES6wt/pb6ZeC7lZ/zZJTRZq/cfq1GqMxE0YYcl55
	cGio80yNbs8O86jTP0rzgsMThqFHFowKTqlMKbRRHDLTzmmuI5ekDuK8dtTQ2sFlwnP3lwMWMRM
	tAGK7pT5q73bDkzPOHrNmHQpU0wimXW98tYUqzAYEFxQW0WY/uIdAzktbxOtjL4xw9OAj5LfMRo
	3ann+eHrRx74tK13puOGvkKeDT4yfNCcpjH5eR5O9lf46iENMfYBy1MBhzEvVSOmKzv26LwAbJy
	N6wEXFOIzliszEPIXRKOiRGhHBOHGs0N2UWr1Cih8WitYlH/cpABKPMl3LTKIt/p510QTogEag2
	QlXfbYIRV0y1iPFM1PNqokA8/MpWQ3ktyjsiUdMpk1m/RaaG4oAMBryz0ip1MdfV5lqsz5p/Eye
	aYLGWy4uLGpCB3yb4sE77oVFILl6dSY701VuHaimNnmXmoAWMpZd+Goz+JWytF6J39gtfg1rs2q
X-Received: by 2002:a05:600c:4e0f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-488997b7b22mr41612765e9.22.1775214175997;
        Fri, 03 Apr 2026 04:02:55 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:db00:6561:9024:520b:6259? (p200300ea8f2fdb0065619024520b6259.dip0.t-ipconnect.de. [2003:ea:8f2f:db00:6561:9024:520b:6259])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e832585sm486166925e9.6.2026.04.03.04.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 04:02:53 -0700 (PDT)
Message-ID: <f0ac89b0-2b6d-429c-9716-51a00832d7b2@gmail.com>
Date: Fri, 3 Apr 2026 13:02:41 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PM / wakeup: Allocate class wakeup_class statically
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <0fe1b679-ab28-4505-b0db-14e7ac3ba749@gmail.com>
 <CAJZ5v0iMfiqjkkvOMU6jWEZ+nBvcRtWNwjvBW0pEva1G_owFcg@mail.gmail.com>
 <744440a6-e1cb-4792-a848-57755de0686b@gmail.com>
 <CAJZ5v0i5dSuQ7f8Okb-Ch5igzNn=L_Fj5d3H4pftvxoEVBaDUw@mail.gmail.com>
 <0758441c-e88d-475a-80ef-061b227ae7fc@gmail.com>
 <CAJZ5v0jTTdJDPDk3ACVpjP=S5nrA-vddfKBnFRyWSbHCuWWKQQ@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAJZ5v0jTTdJDPDk3ACVpjP=S5nrA-vddfKBnFRyWSbHCuWWKQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2026 12:45, Rafael J. Wysocki wrote:
> On Thu, Apr 2, 2026 at 3:05 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 01.04.2026 19:32, Rafael J. Wysocki wrote:
>>> On Wed, Apr 1, 2026 at 5:45 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> On 01.04.2026 16:19, Rafael J. Wysocki wrote:
>>>>> On Sun, Mar 29, 2026 at 6:14 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>>>
>>>>>> Allocating wakeup_class statically avoids a little runtime overhead.
>>>>>> Define groups and device release function as part of the class, so that
>>>>>> we don't have to repeat this for each class device.
>>>>>> Whilst at it, constify wakeup_source_attrs[].
>>>>>>
>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>
>>>>> Can you please have a look at this and let me know what you think:
>>>>>
>>>>> https://sashiko.dev/#/patchset/0fe1b679-ab28-4505-b0db-14e7ac3ba749%40gmail.com
>>>>>
>>>> Interesting finding! I think the diagnosis is right.
>>>>
>>>> But: I would say the current behavior isn't a nice solution as well:
>>>
>>> It is not fantastic, but it doesn't have this issue.
>>>
>>>> wakeup_source_device_create() does: dev->class = wakeup_class;
>>>> I think no reader will expect that wakeup_class may be NULL here due to
>>>> initcall ordering. In addition this behavior results in such early
>>>> wakeup sources not being shown in sysfs.
>>>
>>> They are registered too early to show up in sysfs, but they can work regardless.
>>>
>>> I think that it's just pointless to call device_register() for a given
>>> wakeup source if wakeup_class has not been registered yet.
>>>
>>>> But I'm not sure whether registering class "wakeup" (and registering
>>>> classes in general) would be possible early enough (core_initcall,
>>>> or even pure_initcall).
>>>
>>> driver_init() is called before do_initcalls() is do_basic_setup(), so
>>> class registration should work for all initcall levels AFAICS.
>>>
>> When testing the current code on my system, autosleep is the first wakeup
>> source, registered in a core_initcall, and it's not shown in sysfs.
>> Same result when class wakeup is registered in a core_initcall
>> (instead of postcore_initcall). Registering class wakeup in a pure_initcall
>> works and fixes the issue. So, would this be an acceptable solution for the
>> discussed issue?
> 
> I don't see why not.

OK, then I'll send a patch for it. I was asking because comment in init.h says:

A "pure" initcall has no dependencies on anything else, and purely
*initializes variables* that couldn't be statically initialized.

