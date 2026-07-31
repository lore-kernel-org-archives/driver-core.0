Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A142E8C3
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508409; cv=none; b=WpnSd9R7+J4N1pmcn/avRgKSide5vwTpOirWnTK+6znEF6vAKIDkpIty73a48YrKP2LTNdAVaHmysWOzJW7JEIck3MZ21s602oy0Zm7RjED9jcZ7T5CzLumcv6z3CYSTvlj+vPW0fcCSMD52kvrq+VGobu/c4IxFgO/EIC0YzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508409; c=relaxed/simple;
	bh=ijNh1l6urWW2UsORZiLTXZySDEmKMwL5HbqApkuKIsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTQs6kxT2F9FhVL9zxh6nwuXPljr84SoluA+BQ64QfPSJ+9Bf8i/VL/3ChbBlRurBMIHDmyKWmSrMF1kIijxaftkWmVpv4WJGi8Zh8Q0aC/9BcTZ+xiv5rN6VV/hhpb3Hl+N6XV1kGbpiImdgSFsoiGyhVztcZKKQTbB7DEe+BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdATbvrt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdATbvrt"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c83acb86eso9235591fa.1
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508406; x=1786113206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=QdATbvrtUDqSD1VnHY1ODSpeysDPBibwuw/mR4OOJKf8Arj8TXHa8MHx+Ylz/VDmep
         W1oTd4lTvzA1AryJZbuBVriyhlDvOPcqZRL3VozBCMfvEQokKivF/P7ToyoGC+VjIT3w
         dXH5Xj/8O5rjpGGiTRmJT/c4Mqituwy6426XOl9WZdhel7Mq1AJxBxPSRWs60/vay27v
         XiyfW63kSbH42Nva4Ypwx+M/kL6GiTsPzMHgWrhCaXbVHvUtMRrNLZlMG8XVCdW5AHjY
         zvXGIMkvo/wPNCyeB43nmEEwZzirhXIOXhMnVcQYR8Syy9F8Mw+r9dy8Zl0Qk23iF0Ch
         arww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508406; x=1786113206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=IEuh4QRitDLVT6/RA0SuUzEWgD6s8Osbc3eVnwOXPwYiKqQMZZUFUXHq4BdofKMCGV
         OAWPmQ8f1vCQgHV/MeQLAFCWa98H9JRRNZE1wEO1D6EO6aADS1UQkYr5JnWAsTFOQiwu
         mcEusS41IzVaMJGsumaFWvfSH8pCLCtC2LanR4lGCjLNiPw4CtBpR5Cz4Oc8raQ2erUV
         Rgbm+mPTpU1NdgeKV4HHfaOzVyO0LgZVPEk5y/oqWke+fjkaUjNrZsoN2AUzTmxFpXvw
         830VaPwzWCX4Nt1SD1c5+04oBcck7mZuN47g+zJRS8+rAQIShbAYVD5f9Yz37ncI31aa
         RNww==
X-Forwarded-Encrypted: i=1; AHgh+RpNumCaAMs6NHggcGipnzFjWxq8CXIAP8e6L2m9X6FlU3TN3k0KnMl7WWTmVz7ULByAvRdI503QPIc3Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbp1zkv4ENcMlOnbz923JiI8nMqUKHE9evi6YfeULeJ1wUsifN
	f5kkhBdxCq3GkaCqJsONMCXswdIqIZ5GfVI5dlix5JNEpMd2pinMCn+Y
X-Gm-Gg: AR+sD13k8HGFLKPrhFjDpukbqYwrRiMzZhWkEohTT27xUZcsQ0QAvlhdfipTrLx2LlM
	qIp93zPuWrxMywXhcwMBcueA2UG8txGgde7mHih9hiAm0F3vIOgqnS5PRg5FStHMPkOxuluEelA
	+AoVPMCuwPZgqtFvwX5dAAgemy+aifmwAED0oAaJxm6h9GmOpyGhKZjwS6ZfC6V2kYZEY8P2omT
	9fVONue8kD/2DZ6Q6PsmL5/4t8+U0ymE5bC/mduvcDismO+YN/OPBgVYHPdpr9mq2yEk2zrtkZ+
	Ry7zZPdaVhkTqgVu9FMV8ZhQVT3ssZB5twc80LAVAUetbDkFnJRQFPddsD/BpehgOpG0dODskU7
	wF3vEnoWineuZfj76Szf7UFqICkqooHD02Nuo0g+/QTdoYAWbvBUWg7w35zDpT6TmFRK52pXcn4
	K7uLDXBWcYRZDhumcJPg7uTQI/AVaXFKvmare3Pd/A4AXXfeQeXyOVTrIjShGpKFku4fVVFGEo
X-Received: by 2002:a05:6512:3d0f:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b2e1fc6317mr582376e87.17.1785508405470;
        Fri, 31 Jul 2026 07:33:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c556asm341380e87.9.2026.07.31.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:33:24 -0700 (PDT)
Message-ID: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Date: Fri, 31 Jul 2026 16:33:20 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
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
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260721065413.2306137-12-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.

[...]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus if SS-capable;
> +          otherwise High Speed (HS) data bus.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus if controller is SS-capable.

FWIW this is opposite vs what the (most common) DWC3 schema defines:


(also true for mediatek,mtu3 and renesas,usb3-peri)

-- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
  ports:
    $ref: /schemas/graph.yaml#/properties/ports
    description:
      Those ports should be used with any connector to the data bus of this
      controller using the OF graph bindings specified if the "usb-role-switch"
      property is used.

    properties:
      port@0:
        $ref: /schemas/graph.yaml#/properties/port
        description: High Speed (HS) data bus.

      port@1:
        $ref: /schemas/graph.yaml#/properties/port
        description: Super Speed (SS) data bus.

Konrad
