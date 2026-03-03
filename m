Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C635CB6F
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557071; cv=none; b=PZV9S8pUzCI3kw72zD/42AqVCvIXK3NsBPDw6hRpcYYCFAANSY33I5609PRWADUxU7836VUeONs463brg+G2E8plO85dY+xNZo6Pz+DCZjx8Q2OWGbSvZ3E2cTXhGKPKRXHEgiWXa1Wj0g44A/hMEuudO/IESGRR/w3S10zCVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557071; c=relaxed/simple;
	bh=3/GzSmoRFQsgGZDBWOEZf5WA45dc4iHal7c2SQqyU/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhaj0d20F4Xy+bXbphrj0WhgdKGhOP8dJR6SRf99RS7YB9lR9envDLvubEArkoZRzA3byoaeXkEnkDOp3/Vi1wkltiSatVoIKRENLUOAMrGyJRfa2ZmkEWl0ciZNpWXAaY/ADmF0x+RO6wc6EIHvms5CkMYHy5VUQxL3/S7dieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KF3orNr1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KF3orNr1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a9296b3926so43749325ad.1
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557070; x=1773161870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DV/HSQAamVa6HSuuaGYt1Sx9aCryyCjzy9hIsHP5+oE=;
        b=KF3orNr1XUQA/hwP34neLmC2cas/NTSUOjEHmsQDCt/hPNsuJb38mcTOFIvaBoo9VW
         +/KWkI4X2up7Lal9LKvDfFCc182J1WkoptumpKGtsr0PUQwkfiRb2P1IiqvIAEPTBrkE
         3V22L8mjXLjWVzNYPvkXTw2O6b0B+eo/IDKRhWopGR4dIUmyXbuAeHzP1NCsAgQFobgL
         LRlRI24Q9J0fSpdu967Q2OVcltrUhp/ro1Q8n9El98jHR6vdA3+wseCKX+4tDK6IB2eT
         JHmJ44Yd1VtzwYaYqVFY+Ja3lEt20lT4DJ3kkt2CL9FOJH43QygYyQzxZhVkZHPZ+g3e
         6eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557070; x=1773161870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DV/HSQAamVa6HSuuaGYt1Sx9aCryyCjzy9hIsHP5+oE=;
        b=uaFQPINo6NpRVglyZjocbsakmY+DdhehWDQiPfTJ7huAVhFJxMjAKrN6KT7e4xJqgy
         7RTHkJFNrhyPbyB1sL10aL2On7C/qXkdbHXqMEgoAQkkkgPi5ey0RkDYd0Pg/Ns4CpFp
         o+B46bB4XrB5M0jaWM9h666OwkZJE1q897fVpdVQLvktgEmKT5B0gu6MOlg5od8Ft0f7
         5W15So0BVob1oJHM1dLD0UyZ5qmM+gO9Qb2QAXT6A1GvahVc5V9COvvi9U25jiC11NuM
         80C0ijjrsmqgzLBjy0arN+opOVIpCNP/2x8ElSd1CXyR/cUPNFrjyKogmBcl4U6Nmosl
         Ne8A==
X-Forwarded-Encrypted: i=1; AJvYcCV3BkXtuIf9BmDkJVszGKGBJbpyvRKEbbH7JO1cQ+1ltyKmozJTyVcT1F0tGSTAcEfLS3RfIgG5bSzwng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1vvryYZwbJzOYQJVWTACUJerHuTMewhFzYPtBcka2hMfY+uIJ
	EwE/BoRJsSzFScZ5uJYsKAYVfoR7EQQAKTX00bZpoYT/RnXFp69Jl3PS
X-Gm-Gg: ATEYQzwjHCvDYgclPBJQUn/uDs+yWN8PRYAAg8/KSqSlSkDY5/rbHRcBKw03EiEDQ7s
	i8kqYIAIKK4Tay9QWGEZbjHP0l6Urp4preSoLSuivCWh4jpWOdrw/elT4QEKD0cI6nvvs8uAzh3
	TnTQssBNfI2a7ozTD9q7pruCQI+JIP3DFjU8nCOeQ+NBUaqggF9kqJVozM9kDIXNLoV+4RSlkNO
	vRGLMgpuJiF2FVPDxa8jE0izXoA1CA3CLqE9il+OoKwLXVF4JQVXqOBXGyAMe4UCMDcQRQcbuTg
	l0+z2pLyjchw7atZDXS8hlH5id6fbyTTVB3hEvcwNr/zCDEFG4W8x7wzW4uSqzwvfRV9zRWvT/k
	RXajZxFiTHtQWF1U4EoAUaJLMnWriKYWc6MLdGi89ZtgkeK4JkynvXAlEkO4KeuZghP2bkqEmfL
	S4ic411UG91b2S6jYWxye7LGAzGDoTqBxewHPd6i+Ek/pd6YJOs39B56ihsDm+Q0Hhhl6Q1bb4P
	7tIbKwredA=
X-Received: by 2002:a17:903:2f89:b0:2ae:6317:56e3 with SMTP id d9443c01a7336-2ae63175cb8mr20707785ad.28.1772557069742;
        Tue, 03 Mar 2026 08:57:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4802645bsm83989515ad.12.2026.03.03.08.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 08:57:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a7ac923-0f1a-431f-a029-8843a8eddca3@roeck-us.net>
Date: Tue, 3 Mar 2026 08:57:47 -0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-sh@vger.kernel.org,
 Guenter Roeck <groeck7@gmail.com>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
 <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
 <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/26 08:25, Danilo Krummrich wrote:
> On Tue Mar 3, 2026 at 5:23 PM CET, Guenter Roeck wrote:
>> On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
>>> Do not use driver_override as IRQ name, as it is not guaranteed to point
>>> to a valid string; use NULL instead (which makes the devm IRQ helpers
>>> use dev_name()).
>>>
>>> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
>>
>> Applied.
> 
> I need this patch in the driver-core tree, otherwise I can't land patch 4 of
> this series [1]. :(
> 
> Any chance you can drop it from your tree?
> 
> [1] https://lore.kernel.org/driver-core/20260303115720.48783-5-dakr@kernel.org/
> 

Sure, I'll drop it. Please add

Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

