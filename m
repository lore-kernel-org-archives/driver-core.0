Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34988414A1E
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508472; cv=none; b=YLNsBqzCYSnu2v+/S+O5YHubO3wuB9nGvqwWvWmCvMGNL7JU/gEy6Ne2l9AZvPV/ohqxUIbL2/YeMVKrdK0VKA3hl7iLnZBzidWhaH0MrxVES3r+apMeMttGlKF+8tEDASV8KO6576cZsCV8KT8n5cbVmhkMWFozHeJWkvVPMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508472; c=relaxed/simple;
	bh=Lu9hJWM5FnkOlRaWVWjIRI/RDVl5jUP9oaZX7fCXZhY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=chsduC0taomRdyJ8rid1ksCbgnwSEZfDZc7OuWjulhibSMHzIyr+95XLWUGmYgo/sGYd7r48Tp5uncOusEcGWzA1f4eRkWgsQIzhrmAoLOZdOPzN1ewTq4q4yhg9HB9Hp4oIDmHpBiMoiOFwp6b7m9T5Bqp24xgch81L1DrNME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhTFxCUh; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhTFxCUh"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39dbe684115so18289711fa.1
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508469; x=1786113269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=RhTFxCUheL9PZOcn1PfVNmxdZ90l5v3+AHbD4yBmLU/tXz/hsNlJWxoFhuavLzPIH0
         CF5JfazD6Xqac0riWLDJEd9g9Bmgdc0a4dQA0dTGrO6eiguTLCyNn9gxPvze+gRm2rrJ
         xXtuzBAqGHCeiwqWrqiuywiIoCOSflpij2JWFqJnWEgy3JKzXB9kgeyhZryPSUvrwqfo
         zfEztpLg9qgE3gfzJWL062Wj+y2sMOyLzBQT3zT+k3gCze6x16hTrHd+4faDoF355Bfm
         74qEtpi1/urTKovOrGiy82YQLUPbld95tkark9cPf5x9DbmwsOg4DW0CpNohhtXyWZOD
         DgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508469; x=1786113269;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=RXf0RZIG8jlKuEyyFC5ew5z+Cuq8UbCilV7QQqMUklBC59ZZwGh0ekPajy+Ufmu6Fc
         ESX3yNyv2iwl1yVQWWYVjIiTm4bkqlm9D/i+eWeypBQ/qnlsbt5vzqww+ORhZeeLKoLz
         xCNdgR/wQIJxQNQqkoau+Gd4x+ZX7UrVpDlRLwoFLw2fl6EOClU6e6dJDq7694tid7DX
         AsMF8UqzL14ORM8CYp4/uprJe6ozxGve0Lt9UyKUXYs3qARGk2EfF1xLZdBQjFGV3u8f
         esfKHwfyrVLQDqoNRyaLvU6xZ9bL4rhX1aug5BZTwi509XyX2xmQDSW0HV+V7kNmBMDx
         fTgA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwfl0e699bsHKuOy0JOmGsw9Di7vnz214qbUKBBcT057+dH64Pvfqqqxmm37mYazzDdqQbHfavcNZXKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhpBf68FJh6p0jDMpodqbeCHUFv/1xpXUyNRy0/h9WKVXybAH8
	dIzNEsd3BRSwM3KCDXs9Jb232Um42x0VmCyvek+xUIs7zTbQYrMsPb76
X-Gm-Gg: AR+sD12XMt/3PbY8AYbVHjAKn7zOzecEW54f9auHTYCOfdoAsaVDNbne7CpZha2cwpl
	T5G5aXHZCr13KoPmJR2wxog8iX3UCuMoQOuRdl875aYEbZdtMTFUYJ2eW2W3CrGRFTp+o4pi7Te
	/ikDRtq5K65PJdr41BIV4DTI1nNVr+9q3kd91ebVt7mnDH+TV2cfigBYxwDKisSEHZHw/lqDG5t
	nY+0dqP66t+hv8mChAg4SZRJXiLi8wF30hHAXt2lR/+VDvj2GfidRP9d7ht/vkbevhO4IzfrtrC
	WhcwoN91phqsZaiVPn7kkZwPLyuOjq0dRnn8jQW9HfMc1mS4NwzF038rf1M3kZJIN4RKzguHiWl
	HPLmkywECmGoKgs/jRE4IeFF2tJcnnk1AoyY/0by2YeZVqlD8YupPAZ8GizdrL6RCA97yCyQtF+
	DswQWKw7uJvkE/OYu0eHpuLa06JbWnJOHPhtGXbgM4HlG6yEoIrReVOtt7thpJ4KhyP6Gjx000
X-Received: by 2002:a05:6512:3d03:b0:5ae:acbd:439c with SMTP id 2adb3069b0e04-5b2e2422d22mr454761e87.23.1785508468894;
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441db4sm332262e87.45.2026.07.31.07.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Message-ID: <7855a0c3-29ac-4842-8e07-352fcb535a63@gmail.com>
Date: Fri, 31 Jul 2026 16:34:23 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
From: Konrad Dybcio <konradybcio@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-12-wenst@chromium.org>
 <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Language: en-US
In-Reply-To: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 4:33 PM, Konrad Dybcio wrote:
> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>>
>> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
>> and USB 3.x Super Speed (SS). The block can also be synthesized with
>> either HS-only capability or HS+SS capability. The SSUSB controller
>> handles the device or gadget mode. Saying that SSUSB handles the HS
>> portion is wrong.
> 
> [...]
> 
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Super Speed (SS) data bus if SS-capable;
>> +          otherwise High Speed (HS) data bus.
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: High Speed (HS) data bus if controller is SS-capable.
> 
> FWIW this is opposite vs what the (most common) DWC3 schema defines:

(s/opposite/different to)

Konrad

> 
> 
> (also true for mediatek,mtu3 and renesas,usb3-peri)
> 
> -- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>     description:
>       Those ports should be used with any connector to the data bus of this
>       controller using the OF graph bindings specified if the "usb-role-switch"
>       property is used.
> 
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: High Speed (HS) data bus.
> 
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Super Speed (SS) data bus.
> 
> Konrad
