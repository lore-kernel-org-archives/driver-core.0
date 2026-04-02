Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D013EF65A
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147132; cv=none; b=syKE5/RTsP2IakXohxT5D3/V4R8rDgNtG4rdOCfNpLMOtszQA4QgjI9OXPGNybo4PtnN58Ex9iNE7z0xOQtlob4+CLNpt0P1Yuwp5Yav/vT+VVVihovRfgdcPEAhGdqN5xIAkiR+sJdpfLHZc92kdCH4Ip05zHcntOEXWhIHrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147132; c=relaxed/simple;
	bh=/+oE8o2a7nqWIyq6hPQN0Fdtkz1DVk/0ksULENx1DvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWCivp7+LjtRUe2twVBSayg/W07snocKjv1XDf9JPg1PsVlkJ42JgLuybX7SsQkGPlMXuFZ1JGj64v/RwqgQ4u9SUhKBq6Y6lpNPn0rwYp++tVkzDUsOACWQN/QpOnEt6h/OEdeEmAqAagM4dkR3h+vUrm3oWm0CjQpCEAQJ8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/VLtCSy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/VLtCSy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486ff201041so10896315e9.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775147130; x=1775751930; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRJCrCtZHmXNRoutD3USI3mOL7xfOdKoAeCAQK+CcTA=;
        b=j/VLtCSy1ve3hha5xCj96sr1UUFey5rmLMDd6ZCF07UbIklu/C229a4FJaAPrpxw1g
         XRQzEyQVJZz9B2uBanlVAi42FZTwigk0Wdtw584O4BQCkq1zI7mGG7/zfWje/g+iF9ue
         7QxJlV2KmyJ46nAU+diXZsPKT5cw1XcDRWn1+Djfz1taI50Awo6nJkubDgVR+P0ThOky
         PG8qrlmFrfHDaGNhAVoKfmasAoeXm7hvNQkbK+5B8V+kyBmnw1hwY3RWbviFxl5bA00Z
         7oDPTD52bTSGKkxwpw+xVi2rH3/06AyviewbRGg259NCR1+M0R2ZWLMwt6cxWBnZ/gWX
         jsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775147130; x=1775751930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRJCrCtZHmXNRoutD3USI3mOL7xfOdKoAeCAQK+CcTA=;
        b=JtwFn76Cuumy1qbup3jKLLVkxmkXRbrioq4vXMhilVjbc25TQjKBdbyacRy1tVPhsq
         UkQ7Z9Ha/Vlk7duTEnL7qhmFB3zv7IGjWOPLqbB/OmH66xAJXbZSvab9olxBV40KHIO5
         KECWQOeMxtnNZ464zvr0cxqMsz3+Z9nmKY3z6y0EiNzeChQM7ETUz1DrGO0VYM6z3muN
         /PXAdcBTWhYWFiWhNNfh13VSaFiIgTmo77LKwVbo4c1M1foPmSQ4JAOK2F1uB9Ph2Yzb
         uEyzPN3YrBU6nZGQIcudGqzWMYJoxzLBdCuu3N5r+RbH85bq7XKy+jMuDg3HwThhd7YX
         dPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRX7EOogvdlgmt/xGjI7J+v/VBkmfQeFfVCw0moPQ4iQ7VKHgYmM5QaLf76q/lNPoDeaacxQghwTu5xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUNwA1R8WB3OOCmDH9V5iU5e4KjsQ+yJKdb26vjEimn6pKr/gg
	P3BbPqed3prP7vK4E3QF6oNOd20T4hfjaP5itfITclr49+8tMmiHbuHE
X-Gm-Gg: ATEYQzxx1LNzEjGlFUtuTvu1s38txR4Wo2zD2JOoiOWAw6WgIZ/jf3mW05dcuPfeXgO
	jnxyL12qw5z4AXDK+XiT5ARf42MDtT7lzN8WLVKniYkpeQyo8X1oR0KCaVt51Y71CsdCCBW/IoX
	lpFohKCtiog5na6SIwGRGgtZVVuIOcIee3XqALly6DBKZYEvIPtGos2RYjuQHI1z5C4pd3S2BA/
	8kMrNJF48uUrwPlq7LGGsMbvgmsV2WoXovv56M9iW0H1EKDfXoPsuhslQ0iqt6OXvp6s+vFcLnu
	sMem5mPH9ss8lzBVSYM6jsE5dpccYpDRrSl51um6n6jpi1gQhrXmwooEIzyfbkwD0bqRM+Q7cNl
	HFhcg6SSPnBdl4UNLQqVeDpVXMo1b3aL+gTyoxk2OCjxrlzJfHv/gblquwBo2MlyRsw5JAIcUWr
	dgxYX90g7Fgu5LUMRTMJ+3cn8AyV7okgGS9bWGRKlu8pzeiKnR3yhHkwGG5ptVGM1okCFs2w3av
	LD+BIXn6IycbflqAT+VtfuJYD3fjlyYgaqquqwhv/wceDl/i9QO2Um7N6Sf08Gjew==
X-Received: by 2002:a05:600c:4507:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-4888b6f7f81mr68393685e9.10.1775147129436;
        Thu, 02 Apr 2026 09:25:29 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:9500:c168:ad27:2fdd:9334? (p200300ea8f199500c168ad272fdd9334.dip0.t-ipconnect.de. [2003:ea:8f19:9500:c168:ad27:2fdd:9334])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a705f99sm75208665e9.11.2026.04.02.09.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 09:25:28 -0700 (PDT)
Message-ID: <1e904f24-63f3-4876-8d9e-63e2b5465269@gmail.com>
Date: Thu, 2 Apr 2026 18:25:28 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver core: constify group arrays arguments in
 driver_add_groups and driver_remove_groups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
References: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
 <21a1e5f1-c6a0-4f6f-aa86-1e6abd25f9c6@gmail.com>
 <2026040222-progress-thrive-220c@gregkh>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <2026040222-progress-thrive-220c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2026 17:11, Greg Kroah-Hartman wrote:
> On Mon, Mar 16, 2026 at 11:09:37PM +0100, Heiner Kallweit wrote:
>> Constify the groups array argument in driver_add_groups and
>> driver_remove_groups. This allows to pass constant arrays as
>> arguments.
> 
> But do we?  How down the * const depth do we want to go?  :)
> 
Not yet, but this is the next step. __ATTRIBUTE_GROUPS() would be
complemented by a version creating a constant array. If something
that de-facto is constant, lives in .rodata, then that's a good
thing IMO.

> And does any of this series require any other fixups?  If not, does it
> actually do anything?
> 
According to my checks no fixups are needed. And so far no CI
complained about the series, what I interpret as a positive sign.
This series doesn't do anything, it's a prerequisite for changes
like the one described in aforementioned comment.

> thanks,
> 
> greg k-h

Heiner

