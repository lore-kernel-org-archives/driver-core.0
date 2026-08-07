Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16835F5ED
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102546; cv=pass; b=gUbDl730AJ3EVMd5CHfK4XNjoycooeuSQUAIiy83j3MOGDImJjihw4y1K9Fxiz7jUdjt2rS27YFT0jkg6jp9+mC+ACZUSrE/y5H2VtAczqVc6CtDjEx6n/eU/ghAvnV+Lwt+XJ+wAShh36pAk7p3QVq9nOzJxH8em0pTGXmDvz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102546; c=relaxed/simple;
	bh=KonotXRwXiSLQlw6vlTzZA1LY9JAAKMhrEBp5NWp/aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYAFlPtJkMVIncL2ZsSewFIGFbM/L9MqJLmaDmOyRdXsSKh0+SlXIRePOx0oyb/eDRJnrXc2j87u9C8eUppXRpzSJJWwjcpE1f5zFWua1MF8UYt1SIQZvSSQOLDBjZb8+tkxGRIkJmTr4LQRZvMRzJIKB0m22nvBdElBvBfp+bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RpWRZepe; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RpWRZepe"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8201447e8cdso53401787b3.3
        for <driver-core@lists.linux.dev>; Fri, 07 Aug 2026 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786102544; cv=none;
        d=google.com; s=arc-20260327;
        b=iYFrH3cZlTWGILMh5g/7mH2eT4yMwU6bFoCTBx62dB++BGf4NU4xkvF7PkspABvJSZ
         Bi9FXjwsCUrcTU8gEr5m62aZW+4sCF5IXOnzZkJPLF5/yV/wU3t0FBsa7QId6EAtZFiZ
         Et9/P+5bE0I4TjFmzXgy3MQXXj4JkWqNc/E1X2R10+TcaD9S1/jHLDzC+Qee/SG9taK+
         p/Wb+/wiJzXOWwsCBk++BG3D4zumDRnm33G43Rq8F6LHrYXqbIXTh25/f6JAXYChOX1H
         4ztwYbTbmKypzTFQgx+wXcCqvvIKa07A8PBCXfwY8R65xwaAdi1TIA+QnanwexcBWgqO
         GwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        fh=fWSzBhh9hCnnhnc22eoBv7UlF3gfJdNest2Ni9gmAeM=;
        b=Zfq3t92Lhzhb+f7OefN+/aY0g+O1xB2jEkm1fhheez7TNIeWGl3RlnTATFV2eiWec+
         5AyOuw+/m3+2bIKS/Xhbqmujbemmi741pgVJfJ3p8B6QmpmuNm/Mslo/wqw5CwhXXNkf
         MPLRl+fr/6t6ccC6cMQjdXNVaTLttKgBUno0e7Pj3DHvzlWZYNU9aUE6l7Z65a3NZbRQ
         y1hJHEvqxb+eDqRyaUdFiW6MGClE3nDJP+SUpCL/33qU2QU4eN2Ay0Pu7mXgANMmkCJE
         AUOt3RP/zTuHoAComr3bnHBuIC1uiPXS7kBMdTL53bTlEXtoA+9ZwW4/YxOjyQhVlTER
         9CfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786102544; x=1786707344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=RpWRZepeGCXEoepMWD1wUkTe/BJmmfRS5fLB2jD40p6Yf77e6NF2C7RApKIWXF/c5Q
         9BeqBEvFOYySAa05c0q7Nf3o1rdBpdjKUibJ7BLmD9xa4DVeoYycpWeNJjfWt7ACanpc
         dtDi+qlIm8lY62Ljs9yk9Vpw0pEHpAARg1fQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102544; x=1786707344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=rioJsmZuHcinX5B8/T7d2mey+jX7Swt+GYciHv77TwtgwI+VS4eQUxISgAlst0oUpH
         RnABbsIQ+WL6vedQPoPdk90U/dNWY5xCaaXHnhD75Tx4p96GyhA3BTdPlwWgwXjcdLk/
         7GtWlDVSPAwS7rHW/rYs/kGBrdECgiau2/35T4kAQtCsdJfTvVuYzyhTmIQvAJQ1B9+k
         bLRCO2sITvin/TdRxhM2T1a0KW6pMOI2iRO1kgq2B4h2qnlp09rLQ5qD2+bufK+edcBH
         knj7FU3opVjCUJpUY/2VESrqSOVIp8GtcScTyxVYKNhryNIy+eNUm9R4iQfV3Vi67CpX
         6Xlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp54n/0MlHeY1iEjoQul+eItXUTfc8do91I8TF1Qt5T7FmWQ5eP+5RSk9s5QWzLEOmfMD5rpdSbqQWO2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPpyqY+XI/sRXL5WKPYGbpds9AlYpd8vWF5vToEbfagIAcXDWs
	q3HuIPGddOfHzxKYuCNe6LLZeew32+uPX4ni16EJuRiCt0f/2tJv7I8QqHdAEAJxXwGGVxK5l2c
	licrAPfphTCmTla1zXdM8Pf3SU4hQVUkAPWd2l1Zk
X-Gm-Gg: AR+sD10Q9PMzTBTkUGt4VBVMdFGYsZ/kxYUGVJmkZO0nv2qLfp9TB6kNeNhC/AA5AO0
	ZB6KTr53o+vBA3+n1yWGq8cAeZeOucEQ3mEqDvrUvxfHbQF9/6P8HT3ZkfjGr9nb4Ro5x6VWIto
	NYWaz4mbvbXZreVA9dgeuKplU+uBgXibVMRbjiXv9fbs/AeMy787yQIp3D/v7DBunfT6NTuZ8Rh
	hXL5IzUvPT7iFg/w4jJ8v687byJm48rx/y28R4p5dkEB14EgGu8v46GpBenC9Z2t8SP8vs+sRj6
	Be3w99y0bAFSmXctG+NuSemW+lN8bOR7B73eA40imFXq7a9t6oZLxStWM+lpw1pSI2WDpVrPuHP
	WRPTRzvUDMA==
X-Received: by 2002:a05:690c:480b:b0:81c:872a:5152 with SMTP id
 00721157ae682-82022510fcbmr127613327b3.30.1786102543795; Fri, 07 Aug 2026
 04:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org>
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 19:35:32 +0800
X-Gm-Features: AUfX_mzUutrA5-Q9ACqE0pQ_D7Us70orWiV3KcyO1fjFDW5_he5R56G8cIzEovo
Message-ID: <CAGXv+5ETE2WAA8jwnQKSe69aR=qrqKnALuiSM12X_ZwFouxdRA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Fri, Jul 24, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v7 of my attempt at integrating the power sequencing API into
> the USB core to support the USB connection on M.2 E-key slots. M.2
> E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
> Hopefully this is the last revision. However the pwrseq patches haven't
> been reviewed yet, and the fwnode patches need a review from the fwnode
> owners.
>

[...]

> Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
> driver. This is only used for the USB target, but there is no attempt
> to differentiate the connection type. The driver simply tries matching
> the "port@" node first, then falling back to the port parent or device's
> node.
>
> Patch 13 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 14 splits the Bluetooth power sequencing unit so that the USB and
> serdev consumers can separately toggle the actual state of W_DISABLE#2.
> This patch is purposefully not squashed into the previous one to provide
> a clear target for discussions.

[...]

>   power: sequencing: pcie-m2: support matching on remote "port" node
>   power: sequencing: pcie-m2: Add usb and sdio targets for E-key
>     connector
>   power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Could you take a look at the pcie-m2 patches? These are the only ones
that haven't been reviewed.


Thanks
ChenYu
