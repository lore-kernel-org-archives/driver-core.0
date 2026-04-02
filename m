Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17733D47BA
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135141; cv=none; b=uw//TJDQIPBEQtrHcCLLE3CHQo0st3kkmUC0Rzp3oi/GUCojjfw94ONbcwMb3JPIy1AZ9CAyNcNjkrSorYDKZs13y142qY8rWbfPoJzn3vDd6syYI7FuSWBiXHNAj8I9T9j2DYvXIqTK/IzcpJgKGezBp9Lpn/J2jZpRXsOAa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135141; c=relaxed/simple;
	bh=DqOdxgdcCLGaldkHkXFgo5J0eGj1Kpcn2M6cxW6F0hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAFD+350cqO3u3QfdWOjuflQyL/pSjBEoVuzPIubEE7Znogxv0jpD9g48PpOmEi+ezI/5FVm1tLJt5CkbswoyKHM9zwl2LlxsbOby1fvIampSz1xJvJk1P/qFBVYFzom1yB0LjA6jFvNp4vramFIsp85IW0qy0ojKibp0VKI56w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nify51Mc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nify51Mc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so5630395e9.2
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135134; x=1775739934; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPakThXcqJ7PCNMa7VzjIxV+o2G6zNPbZH8YS7//hxs=;
        b=Nify51McIHlJPrAVFar/a4QFpFP8OJI5Yf+dRf5JyUIOwHGbLjvyjYwXwxSFK85Alx
         HVlgwbdwzBTAtnH482LFzx9CtCPpqgRarQtBvG+ggMGTTrEIIuvqzVyR026KZO+yiubs
         JU+2vHdHEAAjsWHbV32Ti3r9ib6eVsz9cXes+EeJx6pOCtn2G62Fh+MyXzlRZPWrFmuC
         n5J8NLJLq57JkmL9Z4x3ln4oE/megrejhdhlDEmVgDqjgAW9TdqT0uQTbv8gmSRKJM8I
         hZHUbaAIVxKL+glWA9W1VHgGCwXdcEpKJ0MMAR1cClY8BsxmcU2dg+zAPcfS22Q/LAke
         BX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135134; x=1775739934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPakThXcqJ7PCNMa7VzjIxV+o2G6zNPbZH8YS7//hxs=;
        b=VsaZE2Gq7tWVnYBDn24u/3x+JSaPhiqxvEYAGNL0M624FEAZy4tu4HsPYC3kEHWqh1
         aL0awAvp6FGoMbS/h7OKB1902iYJ3IjmNy8FwjC+9c5vSEjmufGopAZc/gMiCAVsO1wG
         UDjgVxaK1DqFBo+OGcWnZPAf1fRgGGjG39eBQXg6Ipvrzs+rUKUh2O47vD46XdLB781J
         dHpaUN1pr3aX4UCOSamprLGXvtp9hAf3t8DtIMV8y4aNKHywcKjnz4gUr8z2gGAcm04y
         5LkOw3ZwH0VP8fvv6dXyeHq0X5OaYMkxd4HXbQB/GUT9HbezrTtZ2vhwMzkaf5bljDJE
         i2qA==
X-Forwarded-Encrypted: i=1; AJvYcCXVePpjfrKm6M9fB8BAmFSAPgy0Mix7asFlJXcrNzm6rPD5ZFfwlBCy7wLMyZeJP9bEiUCiMEtiwfObHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMDHkXjTNYQKlOzb8iLEnRn08B2qLu060nio+cB4QNx2OEMwz2
	jf6gIfjzdguuJoAmQlQ+1uMyGovDnbK0A+a12XIiE/3RxWc7aREQ/DhJ
X-Gm-Gg: ATEYQzyfPXXGCWzWJI97Y0OdH3wwVQXjL8kMRvlNq7cNaoCJmw6J7pZwSd/AoQg/aNk
	q9KU01gKm7J6T/DBTE65OPGqE2zq2xotxK5LUGVP++LwBA16WSlyzVcwdDm/nQ0uPQPsR9bnrMN
	7BnrLG1diSSNqQSgW+dsuIEjaJVoIbFvLQ1p0C8z3uB7QFFZhn+587DUGD70vwIpEMQgv+YNW2L
	4kJo+A/oIIlICXXiroXbjGUbGfPNbcV+oLZ9qvVFc3f4el1nCnQ+3HC6wNLh4d8RWFyiy+nzZMw
	6la49VtOLfFHJeVqiYb/SM/fDlKmF3G9hNEU40O9PHi+GZvvz5ksbzEfDFugyLIflB07CWbgUKp
	qqRYbEoC+x7BgcHq2vE53jyN+Tf6A9BZDQ1kVa/UpSt3XluGJEnfeKvtGsim6hfcfcVOWPIEpZr
	JnF5CD3e0M2QJDJMZ+dDweG4ernPFEBg34sqBOVI9YsiYS/NZPlBEXJ2E/ATynpQdEloOaI+DyM
	/gc6UYRNpJT6/B/IXDe+DOku2+hMw4wzzdKyJq6LtXidCaYNKGbP0rWLVrAyrYk/g==
X-Received: by 2002:a05:600c:c056:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488835b30a7mr87662745e9.23.1775135133581;
        Thu, 02 Apr 2026 06:05:33 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:9500:c168:ad27:2fdd:9334? (p200300ea8f199500c168ad272fdd9334.dip0.t-ipconnect.de. [2003:ea:8f19:9500:c168:ad27:2fdd:9334])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm121936195e9.1.2026.04.02.06.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:05:32 -0700 (PDT)
Message-ID: <0758441c-e88d-475a-80ef-061b227ae7fc@gmail.com>
Date: Thu, 2 Apr 2026 15:05:31 +0200
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAJZ5v0i5dSuQ7f8Okb-Ch5igzNn=L_Fj5d3H4pftvxoEVBaDUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2026 19:32, Rafael J. Wysocki wrote:
> On Wed, Apr 1, 2026 at 5:45 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 01.04.2026 16:19, Rafael J. Wysocki wrote:
>>> On Sun, Mar 29, 2026 at 6:14 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> Allocating wakeup_class statically avoids a little runtime overhead.
>>>> Define groups and device release function as part of the class, so that
>>>> we don't have to repeat this for each class device.
>>>> Whilst at it, constify wakeup_source_attrs[].
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> Can you please have a look at this and let me know what you think:
>>>
>>> https://sashiko.dev/#/patchset/0fe1b679-ab28-4505-b0db-14e7ac3ba749%40gmail.com
>>>
>> Interesting finding! I think the diagnosis is right.
>>
>> But: I would say the current behavior isn't a nice solution as well:
> 
> It is not fantastic, but it doesn't have this issue.
> 
>> wakeup_source_device_create() does: dev->class = wakeup_class;
>> I think no reader will expect that wakeup_class may be NULL here due to
>> initcall ordering. In addition this behavior results in such early
>> wakeup sources not being shown in sysfs.
> 
> They are registered too early to show up in sysfs, but they can work regardless.
> 
> I think that it's just pointless to call device_register() for a given
> wakeup source if wakeup_class has not been registered yet.
> 
>> But I'm not sure whether registering class "wakeup" (and registering
>> classes in general) would be possible early enough (core_initcall,
>> or even pure_initcall).
> 
> driver_init() is called before do_initcalls() is do_basic_setup(), so
> class registration should work for all initcall levels AFAICS.
> 
When testing the current code on my system, autosleep is the first wakeup
source, registered in a core_initcall, and it's not shown in sysfs.
Same result when class wakeup is registered in a core_initcall
(instead of postcore_initcall). Registering class wakeup in a pure_initcall
works and fixes the issue. So, would this be an acceptable solution for the
discussed issue? 

>>>> ---
>>>>  drivers/base/power/wakeup_stats.c | 18 +++++++++---------
>>>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/base/power/wakeup_stats.c b/drivers/base/power/wakeup_stats.c
>>>> index 308f8bde9..72beb8fce 100644
>>>> --- a/drivers/base/power/wakeup_stats.c
>>>> +++ b/drivers/base/power/wakeup_stats.c
>>>> @@ -18,8 +18,6 @@
>>>>
>>>>  #include "power.h"
>>>>
>>>> -static struct class *wakeup_class;
>>>> -
>>>>  #define wakeup_attr(_name)                                             \
>>>>  static ssize_t _name##_show(struct device *dev,                                \
>>>>                             struct device_attribute *attr, char *buf)   \
>>>> @@ -114,7 +112,7 @@ static ssize_t prevent_suspend_time_ms_show(struct device *dev,
>>>>  }
>>>>  static DEVICE_ATTR_RO(prevent_suspend_time_ms);
>>>>
>>>> -static struct attribute *wakeup_source_attrs[] = {
>>>> +static const struct attribute *const wakeup_source_attrs[] = {
>>>>         &dev_attr_name.attr,
>>>>         &dev_attr_active_count.attr,
>>>>         &dev_attr_event_count.attr,
>>>> @@ -135,6 +133,12 @@ static void device_create_release(struct device *dev)
>>>>         kfree(dev);
>>>>  }
>>>>
>>>> +static const struct class wakeup_class = {
>>>> +       .name = "wakeup",
>>>> +       .dev_release = device_create_release,
>>>> +       .dev_groups = wakeup_source_groups,
>>>> +};
>>>> +
>>>>  static struct device *wakeup_source_device_create(struct device *parent,
>>>>                                                   struct wakeup_source *ws)
>>>>  {
>>>> @@ -149,10 +153,8 @@ static struct device *wakeup_source_device_create(struct device *parent,
>>>>
>>>>         device_initialize(dev);
>>>>         dev->devt = MKDEV(0, 0);
>>>> -       dev->class = wakeup_class;
>>>> +       dev->class = &wakeup_class;
>>>>         dev->parent = parent;
>>>> -       dev->groups = wakeup_source_groups;
>>>> -       dev->release = device_create_release;
>>>>         dev_set_drvdata(dev, ws);
>>>>         device_set_pm_not_required(dev);
>>>>
>>>> @@ -212,8 +214,6 @@ void wakeup_source_sysfs_remove(struct wakeup_source *ws)
>>>>
>>>>  static int __init wakeup_sources_sysfs_init(void)
>>>>  {
>>>> -       wakeup_class = class_create("wakeup");
>>>> -
>>>> -       return PTR_ERR_OR_ZERO(wakeup_class);
>>>> +       return class_register(&wakeup_class);
>>>>  }
>>>>  postcore_initcall(wakeup_sources_sysfs_init);
>>>> --
>>>> 2.53.0
>>>>
>>

