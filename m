Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153767;
	b=3ATfvydVwHuoi+0OUZrsrcrwRTGLKxVU1P0rdfqiv515I6FtItNiN8+8wt1Y4I9DbThC
	 9WSq7GzqOtrdU9w8xleci8uvp2vg2O7NCip4ngi2QI0d1EtyGSNUa9dnbBnZbFyACfhc+
	 QHIfcwhHpzYu5Re5oO0NTzka6ckj/HPn2CmRlo/rXHYCqjku4vLCkiIiHy4gt5jizbR34
	 3FIwDjI+EPEyToJ7oK16mL14K8j6TSsTXhdcYm1lyj7m8VRjguz5/sKXS5Vy17DK4H9a6
	 5/yeVdceKxHDdDoEguPnMcC6t7NOk95DPIVdgC8pHQ+7f2mzUPXePWWhXcAO37NsfQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J4NyFDuTUY3lwLAeO38/EuphRDS2yiibt54EKH6XAwg=;
	b=eWSU0J6F7BRg6gAZy8C0O+H0X2MBaLlu5HJIJ+QHredQUWS7WmIZzDz+MZ1f0eGnAjyV
	 stos4YVfOf7lMum7eUDEUnTt87EVH/HnUYlg6ntC6nd5K12udWPBWJXTTqqeKjwnGXhHa
	 2+jngdgI/sBNkYh0GtXUAmBiF4Qp6/UNOXrtjrs6FByq8W0+cPJpXr6xOW3TBt54o4OVx
	 oxdbOOE41Po97PfsQwHG94hbCyj0I1tzikozzj6HNvmr8+uNJ+bOeBu08OYgmoaWp1rWW
	 75HIuazzVuPMC5gSQidLkp3ziZdozmYSpusbQ+oq1brhv7gLEKejzydUj22+iFQobbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OV8xl22t;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7927606A31C
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 16:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7927606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OV8xl22t
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso118571f8f.1
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153765; x=1794758565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4NyFDuTUY3lwLAeO38/EuphRDS2yiibt54EKH6XAwg=;
        b=OV8xl22tJwi1CYK13XfidDenBb5kcDpuNUfronRjfmAKW/RAV+f0Xz0WYPMN9FrWDu
         1mKokcJy9PagzLIF7ue4sVUf6DZjFd1dI1qBSGoyb3n0bKdlOfPzq0XqM0oPXxXOrQef
         8plV12HsuKXui9gk+zIJrZ6509hZkGvzE+E/YUQLfh5taBb+tKs+PsVqqqfK4hY1Oovw
         mb5zgU/KA+RImLiXuKN8SmEarW3eOWHBsb2GQ4uUaIHU+mjucmJMVuLiq+l93kX99u6W
         zWPzyknAQylLpwFdSTzs4T1Q0agtPcvgJLE2iOJ2wj4lKCZEUcIaxFj+/3wn0SgKUtjy
         07kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153765; x=1794758565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4NyFDuTUY3lwLAeO38/EuphRDS2yiibt54EKH6XAwg=;
        b=ukHWU8ORpLKR5c9Hht9GG5OKLH47on4lPQs56y3o0JUJEs6uBDgQvac42EMXl0IAWk
         fJCMdL0OcnjnOSoEEhWdY9SEaQMrOvN49dGtHjBs9XvTnrlaF3bsMKyQNtuxJ9nWT8op
         iQsbetkwckaFB3KBlYIRyPm/r9wk1k7yY5lhTYWR/NVMhAQwJnU8vWfWE6nIv4jq2rgM
         qQK9pDNxJdvmcxhykLVv5k3DGzyZ0NPkef+fBEDw8TzAazllag4ji5VXrAsWJ66NU0tN
         Cw/6KVK9n7wD+lxOjsrIjWwMo3vpG/63/fdE6RXzPMz3ub8yNzhEqFwZeA84t+73QoV+
         fTGw==
X-Forwarded-Encrypted: i=1; AL+hErHR+AimkNTWgAVpoxVbPKY9DY22/7IfOvcJS+9Bm3d0p4pgFjmzxUaBXhL/TULf/33zWHJKrHm2YxloDg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/7GrAixMNnF0zSvhrPVa1MfQD2M1CB4eyX/8LAnR9bJ3m8Ziav
	Rp2NgVY5aBho0Tg1lr32gUVuZQfaw+P1EUXWJbesIxXfBvRI7hOwb1UQ
X-Gm-Gg: AYBFou1iIHeEQEIAgH7BD2nF4oHANGBggutAVP17BtvL4UZbgrPnu9C5tCLR0q18Ory
	bF8qx9nn+QJht5g6hfTDjqsz8d05MY5HylfK/PxKyi1VQ9qODsI0r3En5TuE0AOL3UQAfpq3OLn
	nwm3XwXREhKg3fhR9SkHrI9TRKv3rKTCrbWPIYhm4z9jyfrp/RdMOnnjOaFGA9g0jEsfr3QnlcJ
	PrYEA4Lk4zeY8HHCu5NjZBFnJE5c0chZ5KQUuc2x69o6TSGT01kbnDSFQfp5ED5JGwdgSTtotg7
	IFEmi/2D/k+YZozA+gtmnCUs9tpbmIyjnSqVB0R4bD0Asb1rb3YQfWvy6OKdkDxZWQZ5wzutUHi
	8upgrXBO8HHhKsDdjoScNb+++pDacfP3LgHD1fDyhbbFS0Z7unGZX1iNckLy/wQauGesr8B7F8K
	Da0W0W9OnwmhBskK7kI5cHAAXkLD9YO3N6cLbV4MGUXPP3i426ED8GhRA/0hKZimzuHLE+s3ca3
	fAM1tDdVWn4WkVlya1rl9Z2WGu5i0huymlgnfBm1X/MjJT71U6RttWsDwu9Pje73wsCefil7gJ6
	IxJhc3DMN3VEI4ehbS/9sIu7RyNjCRb5loiU/pKgP3eYDTBzyWEuJzFdBbYYZvtgrizKQbazByu
	vEn6GkX4A+GwrxFttQU8SO4a/XxDw4VDJusBVMXtzH3i9iac5wEEuVNYe6G/nLFYQb0g=
X-Received: by 2002:a5d:5f90:0:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-4958083082amr3604985f8f.4.1794153764903;
        Sun, 08 Nov 2026 08:02:44 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597d0a775sm4952992f8f.55.2026.11.08.08.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:02:44 -0800 (PST)
Message-ID: <3e6370f9-0905-41ad-a87c-c51c0a41513c@gmail.com>
Date: Sun, 8 Nov 2026 17:02:43 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net sysfs: simplify creating empty wireless
 directory
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Miller <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
 <675f4353-125e-4168-a617-c0d1fb519045@gmail.com>
 <2026110816-crate-tightly-8560@gregkh>
 <d85b02e5-d9ab-4535-ab82-9b8184fbd1a8@gmail.com>
 <2026110812-angles-guru-473b@gregkh>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <2026110812-angles-guru-473b@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2026 15:21, Greg Kroah-Hartman wrote:
> On Sun, Nov 08, 2026 at 03:12:04PM +0100, Heiner Kallweit wrote:
>> On 08.11.2026 15:06, Greg Kroah-Hartman wrote:
>>> On Sun, Nov 08, 2026 at 02:46:03PM +0100, Heiner Kallweit wrote:
>>>> Now that an empty directory can be created with attrs being NULL,
>>>> make use of this new functionality and remove the dummy attribute list.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  net/core/net-sysfs.c | 5 -----
>>>>  1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
>>>> index 5c0402389c6..f58b59e1126 100644
>>>> --- a/net/core/net-sysfs.c
>>>> +++ b/net/core/net-sysfs.c
>>>> @@ -910,13 +910,8 @@ static const struct attribute_group netstat_group = {
>>>>  	.attrs  = netstat_attrs,
>>>>  };
>>>>  
>>>> -static struct attribute *wireless_attrs[] = {
>>>> -	NULL
>>>> -};
>>>> -
>>>>  static const struct attribute_group wireless_group = {
>>>>  	.name = "wireless",
>>>> -	.attrs = wireless_attrs,
>>>
>>> Why does this want to create an empty directory?  Surely you aren't
>>> adding attributes later to it, right?  If so, that's not ok either...
>>>
>>
>> For compatibility reasons. See 38c1a01cf10c ("wireless: add back sysfs directory")
> 
> How long do we have to keep that?  That was a very long time ago, 2012,
> why not just remove it entirely now?  And if the sysfs core hasn't
> needed this since then, why give other people the opportunity to abuse
> it this way as well?  That doesn't feel like a good idea to me.
> 

Seems Fedora learnt at the same time (end of 2012) to live w/o the compat wireless directory.
https://github.com/fedora-sysv/initscripts/commit/4e96fcecee7ab70295a5f2c52748cd57cbab60bb
So it should be time now to remove it. I'll submit a patch for it.

> thanks,
> 
> greg k-h

