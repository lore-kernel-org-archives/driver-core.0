Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF835CB8C
	for <driver-core@lists.linux.dev>; Wed,  1 Apr 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058343; cv=none; b=kA3NJ+S0ho78QFN+aADkghzrAlDZsnVwiTzWBiRKiWvmJWRGkNhzs1pCqI0Ezr3z/f8fj2p6nbzksGIc6LpfuEN+zKQGVaqKil29pEYEU/L4RyiwoGJBi4Dspdbpt4kRJ0WAlG7EcOBP9ix32sR0r+63ZjnNHfSOTQsoAX4FBTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058343; c=relaxed/simple;
	bh=NM5uFeeSvuv7adnI5V60GGtN5WPUAUteTNbrV3VO9pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAvBRiITGNcIWt/rJOsLRrn1vmYDika/Ihcnar3NcsTdCzsEkBc485dVvyTiZ1fzU7CnEpMjoCNn++bh13Q5ORn1et+ocZO2qik9NVWi3Z7dFQv8QkwB3Wg3gdYsCsoI8UUkYIRoq2Va+qPgV4TxbtuvUCQPVGpRxHZkONtSBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQLZrPbp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQLZrPbp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso712675f8f.2
        for <driver-core@lists.linux.dev>; Wed, 01 Apr 2026 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775058340; x=1775663140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jkjla8CaRyFo0jGmemy9X4FUXjSTK/5CQirIzXT0fE=;
        b=fQLZrPbpVUIHtheVQPYeytjG3s2AXTfLFj/R0E6o6tnKQsEn2VWjlxCC7gisOS4RF8
         Cwxi1qByc0Y7hc4kEAxM/HJwy2FI/T2L0XM4g/rtsxYt7CgnTYlZoFeOxWtVnrwXAkSl
         DybYDFcl8P5bX2WdshwCzTaLjlJS6PvZ9zKIJvw2I7Yj7W56LzLC6IGjTluw6ZMsSxtF
         DBvuSbNqjyfgxdLOVK7uoknCQeeujJKc/CzVxPyISJHBE3ep0tzgwBLPL3IWmmWOq+Fc
         vIRb0JEXy6Nazao9i62o+PQcIeM2gblA55baxSobbWzFs5zDeQyY7M7izPVruSQpJ1W9
         g+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058340; x=1775663140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jkjla8CaRyFo0jGmemy9X4FUXjSTK/5CQirIzXT0fE=;
        b=bwEMssjdDHoU3BZfbpQPD7K3PNwK1oAxj/PqF0kUKNyolNW9sfEwd2ITYh1KBcxVv6
         ZU8jokiwNq9BN5cK8IZvuK/lQOmfhzj+k3EQKs6G5eAmBPXhS3A4mZ4G8ugwnPfoWMB7
         LiqdpxlIaSL7tdXu4YJnTRT+K1D75aS0giFwRcIMq0GYKm7Gxx+AAQCq36GxWXt2jaEI
         PWcQeH9VMu7+qK0yzpJBiaHzpV6eZuSSgAuGXGXj+V0ldS/agKS0TOT0Ulmw5i8BxUbT
         sQxbig8uZv0VypGvf5FWLADDe5fF0bJ7aH+F2xG5m8yySNkAkuflE7scl8DpzVybnyGr
         GOpw==
X-Forwarded-Encrypted: i=1; AJvYcCVpIigmctUaLga1neoeORfBSNwDRBLPL51RPCW0QU9nmDg7kH7GoAigQARApyoFGuM9gEQo7CWVuVJhnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLVwTO1jDdOSb5MzowiD1wZpPfjFvPv3lJLG4VMvY2J2es2c0x
	D/kTWubXLyA0v50n2px9Q5TwHtjzmpiNK0JiJ/MlcI0Jf8De9Znnf8pi
X-Gm-Gg: ATEYQzw5GKEoJVpWIWEW6U1A3IAPebKYX0QoB0xbMLBD/QBG9g6ihWhJ0V7ZERpyMT1
	Nn40fGtV8oz41NG4xhtmJUW3eOQ/mcr6XKjk4/vRKmUfjH6kK0jIdtx7S1CrWB0ooDEttjD9cm7
	z8r7ATuY3Cm81yQ8K8N31LGMNCpFk7SCPkLktnnV9w5gfXlUiONTvjGHjZCk7DtQt4ezryzMCcu
	o69QhvfiP4P2pzvXmN5Nc6a8vps8+mgaK1AI5CSBVzuzuGh2I8OujLUGdbSWmmq8jA9e7W9dYJM
	XBKWjeScgXnkZpNframjrmwvPVTr2ja8SCq9LCSU8Vq0VMrCqRvVg38mYzRbxhJH6C6HY/MMBnd
	c5zFnU1rA9+AjqvUwdxSmN1f1aOD/gP2l3fpY0UxRBeFh7fwN7+3NUNjIZnP5BhwTGirsD1B/Zf
	qnej/f0QfUzadS6QIfftIAcfAhyQKKak6fGf8qOc8bcRXsldawq3aoFQt4GFQAi9rPAemSdQYQ4
	NjndTWKjM6evRWBeXfK56PWmnTr3ftG6mwqMZ5wp7Uq51BVJaV5BSOUkTrTBKI=
X-Received: by 2002:a5d:5c84:0:b0:43c:f45f:dcc7 with SMTP id ffacd0b85a97d-43d150419afmr7950699f8f.3.1775058324254;
        Wed, 01 Apr 2026 08:45:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f29:9c00:4967:922d:98a9:84a? (p200300ea8f299c004967922d98a9084a.dip0.t-ipconnect.de. [2003:ea:8f29:9c00:4967:922d:98a9:84a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm657273f8f.29.2026.04.01.08.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:45:23 -0700 (PDT)
Message-ID: <744440a6-e1cb-4792-a848-57755de0686b@gmail.com>
Date: Wed, 1 Apr 2026 17:45:22 +0200
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAJZ5v0iMfiqjkkvOMU6jWEZ+nBvcRtWNwjvBW0pEva1G_owFcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2026 16:19, Rafael J. Wysocki wrote:
> On Sun, Mar 29, 2026 at 6:14 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> Allocating wakeup_class statically avoids a little runtime overhead.
>> Define groups and device release function as part of the class, so that
>> we don't have to repeat this for each class device.
>> Whilst at it, constify wakeup_source_attrs[].
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Can you please have a look at this and let me know what you think:
> 
> https://sashiko.dev/#/patchset/0fe1b679-ab28-4505-b0db-14e7ac3ba749%40gmail.com
> 
Interesting finding! I think the diagnosis is right.

But: I would say the current behavior isn't a nice solution as well:
wakeup_source_device_create() does: dev->class = wakeup_class;
I think no reader will expect that wakeup_class may be NULL here due to
initcall ordering. In addition this behavior results in such early
wakeup sources not being shown in sysfs.
But I'm not sure whether registering class "wakeup" (and registering
classes in general) would be possible early enough (core_initcall,
or even pure_initcall).

>> ---
>>  drivers/base/power/wakeup_stats.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/base/power/wakeup_stats.c b/drivers/base/power/wakeup_stats.c
>> index 308f8bde9..72beb8fce 100644
>> --- a/drivers/base/power/wakeup_stats.c
>> +++ b/drivers/base/power/wakeup_stats.c
>> @@ -18,8 +18,6 @@
>>
>>  #include "power.h"
>>
>> -static struct class *wakeup_class;
>> -
>>  #define wakeup_attr(_name)                                             \
>>  static ssize_t _name##_show(struct device *dev,                                \
>>                             struct device_attribute *attr, char *buf)   \
>> @@ -114,7 +112,7 @@ static ssize_t prevent_suspend_time_ms_show(struct device *dev,
>>  }
>>  static DEVICE_ATTR_RO(prevent_suspend_time_ms);
>>
>> -static struct attribute *wakeup_source_attrs[] = {
>> +static const struct attribute *const wakeup_source_attrs[] = {
>>         &dev_attr_name.attr,
>>         &dev_attr_active_count.attr,
>>         &dev_attr_event_count.attr,
>> @@ -135,6 +133,12 @@ static void device_create_release(struct device *dev)
>>         kfree(dev);
>>  }
>>
>> +static const struct class wakeup_class = {
>> +       .name = "wakeup",
>> +       .dev_release = device_create_release,
>> +       .dev_groups = wakeup_source_groups,
>> +};
>> +
>>  static struct device *wakeup_source_device_create(struct device *parent,
>>                                                   struct wakeup_source *ws)
>>  {
>> @@ -149,10 +153,8 @@ static struct device *wakeup_source_device_create(struct device *parent,
>>
>>         device_initialize(dev);
>>         dev->devt = MKDEV(0, 0);
>> -       dev->class = wakeup_class;
>> +       dev->class = &wakeup_class;
>>         dev->parent = parent;
>> -       dev->groups = wakeup_source_groups;
>> -       dev->release = device_create_release;
>>         dev_set_drvdata(dev, ws);
>>         device_set_pm_not_required(dev);
>>
>> @@ -212,8 +214,6 @@ void wakeup_source_sysfs_remove(struct wakeup_source *ws)
>>
>>  static int __init wakeup_sources_sysfs_init(void)
>>  {
>> -       wakeup_class = class_create("wakeup");
>> -
>> -       return PTR_ERR_OR_ZERO(wakeup_class);
>> +       return class_register(&wakeup_class);
>>  }
>>  postcore_initcall(wakeup_sources_sysfs_init);
>> --
>> 2.53.0
>>

