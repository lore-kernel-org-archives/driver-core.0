Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147129;
	b=Z7E3OaHO6aZE6Sez3YkTcUXm4E9MEoya9jaRLmxP5UczwQmgAYrwDUQUSFzw4romANQY
	 nQO4mZO5LxT9sKNqgXvihJQmsXtm603T4dm0BI0giODBmqlOW6r3/s6xMkwCRigrGM6rg
	 iT+NdWMj2C+Qf5iYYg8ZY70nyIumim1U0M5hDqmA2+0JNWaSQNF2Ziz5w/jJDl6TmpxZB
	 BWEnES5h162rob3/Nq5tXWYCN5PAg67RcYA0KdukWYSlxiO5SLMdYlB20oG0HGbYg+iYS
	 coFhVprblzUcyAV+t4Jlv2Cn1Nw4EuL2dxGZOTnKhV8737k+AJAlnSbweVtQ7MNJsJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JIaZlR1+78hwd/ku/8utqk2QTcK+/IJ9jh6fcvBKyxA=;
	b=Cpg01THt1DUr2U55n39Z9ZqL1R+pT/NJZihf3GGQXISiQRdTdVRF0skqtjpJdhCsuYcm
	 Id53qmOqkPUQSoqTSGSw4eSnSqt78xI09flPdodu4wDB9skA3OaswVYXXN8QmvIZ/4byr
	 0HrvQirFahL0/q0KUegreRjRbkKwEn+bj4VKHS3aveo4OsmjyEtuxdGaje5kO3H/uOS6E
	 aNJLkvLtgW1FFCdGys5OymraPfoGNvAfQ6+gphQgIyRV9rgQ2W9kJnVvSbfQfzFlE3kBs
	 0TOFtPJ+Z0Fdcb/amZNlEvzPlcyUTph4gM2A3LU9TGI8kPyc39/g1v0XicGzFYUaQ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Jxa6TG/n";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65445606A320
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 14:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65445606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxa6TG/n
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so85290f8f.2
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 06:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794147127; x=1794751927; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIaZlR1+78hwd/ku/8utqk2QTcK+/IJ9jh6fcvBKyxA=;
        b=Jxa6TG/nXB30EKB4s891xdJGXrTHpgOxOmWsi0X4n28iVynXwa4ns2ubF3UvW7rZ1y
         ouFh3iKWspjU383ZbNqPv9Go3r0hxZap1/shjCMj5VwjzRrwUB+Ffhxh3zMYBbs992TI
         URjrgxa4XJ1DifLOeZO2cdAxDTv+VBwjOy+pSq/Exub1OGUNwnWMu0eQ1nQZYZXCZTBe
         62FiUnNZW6wceo+wvwC0rDI95kmnmNShKkmk4ISDVDvIaN1QEzTIT2swEydUe0+QaAso
         xE+R0l6k24SQAjdxqOsny/DH7SyitkgbJHJZh7EeZtpxSKqUMFz9kYnCoM1XMMAY1l93
         UQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794147127; x=1794751927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIaZlR1+78hwd/ku/8utqk2QTcK+/IJ9jh6fcvBKyxA=;
        b=1rHbSFJUTeJV6KdHeIuKfZS4ydyTxiB7hNa3JfwFri3g6nZ5OFHMpKhsjcQIgfm3bm
         qkTr04nge2YNVjyZwd2zqN6FuCyODnX0lNRyfHHtFPjR1Qopn02kTpSF+E0fI24xNstg
         LNQryacGZXNIS6RPEO2p43F+rX0nSTiOw0Yl6mMMN9jtUd3YMwxkfcAsK2uR11MRDgvH
         dtGTvEnpW78ZCsODTdyuGWTxs8u1rYpsDJnn2Ncdw9QNqOuHnZmeCRzOmiS9S+cj16/O
         rF6HFbeQJ1+ol7yJR8yZG1c09W6vNoJnC4TQSubgkR7BagxJMmAZaSByu8ANYH2Cm6f1
         sJDw==
X-Forwarded-Encrypted: i=1; AL+hErEeweuRGT79yy32VZxTHCZsmbW0f50BF0/C5tOOmGFbuZ62GITESkRXHpGkKGF1LFfM9t+36619ZzuB7w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QuGcQTQWQv84FAGfyY1l17BcixMVYyokvCLBiumLDOBRLAGgU
	0cFS4daTvCSohF7UdqMH5ih9AQztYtCzpVD0v2rj1VqxftGExyRCZE+U9E7hNQ==
X-Gm-Gg: AYBFou0V3Ehp7SyxghbfpSfj1QfAZLIhLRVurrMp/uu8N2NfwN/hzrjwU5v6gSvCkgz
	/QzRTemApIq+xdo9eOjvtt+briNPIVtrv7X/KhBWDBrEOdoez9xa3P7rkpd6vlNIGtICuJ2SqsH
	3z9Tb/vITI0jwZkXUlhojGlaGi3wMouK3qkIFUw5UiRFTbQE9qsgZdhbe1TRkta3Zczi7b3a2S1
	VDS97YeML3V4ZGrMNdTYovkn1Xt/VBb9mux2lNTndSQCkWj6ZZVfwb3XqQSVU856VbZnotQHP2h
	gR+8zbzQ7bq+TPd/5FWW/78gvNGVqxsVkmWcr3X18X1M6dywqTMftr4A3JW4e7MSWTJJRyQhBV6
	VWUr4MZMMS5YPu0grdFaez/88k4jScpWd8LHhTrEQ508auoj6+JtRKsAyO3vy+tRqwQ8D3lBd6x
	Jhx9huASnJ0DCd+WU+aiWKpVR0oawojsQLm3leZFBKABNaHmgv2YgqvThynQ90R0lQx2oWgB6On
	9dNuor+LSyGvdKx1prbFUYc+5D9O6G7xiR2/ymLW5IhVm/lmdg2PyXr7G+occsh6GOnwv/BQLIS
	qFKZRYaz+V/c4qeDkwbP2oDmr4tjeuqTclX6Q4XGFF/kNBPZipGr/2dI6ojdlX1/1R5PNgQXFzP
	YF9UN2WjaaZ+fanE+J5n2xknvLZ/OsPqoK2DC0pdoHmdZWmJw33KE+4diuaCyI0u0rQ==
X-Received: by 2002:a05:6000:2310:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-49585d9a986mr2902049f8f.55.1794147126685;
        Sun, 08 Nov 2026 06:12:06 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783f1d6sm4215028f8f.46.2026.11.08.06.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 06:12:05 -0800 (PST)
Message-ID: <d85b02e5-d9ab-4535-ab82-9b8184fbd1a8@gmail.com>
Date: Sun, 8 Nov 2026 15:12:04 +0100
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <2026110816-crate-tightly-8560@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2026 15:06, Greg Kroah-Hartman wrote:
> On Sun, Nov 08, 2026 at 02:46:03PM +0100, Heiner Kallweit wrote:
>> Now that an empty directory can be created with attrs being NULL,
>> make use of this new functionality and remove the dummy attribute list.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  net/core/net-sysfs.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
>> index 5c0402389c6..f58b59e1126 100644
>> --- a/net/core/net-sysfs.c
>> +++ b/net/core/net-sysfs.c
>> @@ -910,13 +910,8 @@ static const struct attribute_group netstat_group = {
>>  	.attrs  = netstat_attrs,
>>  };
>>  
>> -static struct attribute *wireless_attrs[] = {
>> -	NULL
>> -};
>> -
>>  static const struct attribute_group wireless_group = {
>>  	.name = "wireless",
>> -	.attrs = wireless_attrs,
> 
> Why does this want to create an empty directory?  Surely you aren't
> adding attributes later to it, right?  If so, that's not ok either...
> 

For compatibility reasons. See 38c1a01cf10c ("wireless: add back sysfs directory")

> thanks,
> 
> greg k-h

