Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCDF36F432
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394006; cv=pass; b=rOZctKe+C27cS953LGT4csXUfwDSo+KvlGw80OCGW4SERCg0iLXjkOlVMqDFAQu62eyxmX4RcTdq8B1cX0iPvbipIHc2tb4qlHbEO/q4TIEoJvHfbL+f8mI6yX9Ho3j0W4iaPiGmK8VjetynCW7d/bQ/wN1fynrHJxzzDRsIQ1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394006; c=relaxed/simple;
	bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edWfxyngrSm5rQdO5PgCiiwKm78oYhNKBVART7zTspOtVrgEjY2/dL9cN09IwfHYbWjzd9NSehM9Mmq9WnUye6euq8U3xnJHct3zdM0le4cqvQrmujn9CQ0+VJJzV1aTtpwzhZkMThhZke+szZJ9cM8Su86Z0Ha14A6xMU4Tq4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzi36Dkw; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzi36Dkw"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661be3380adso3387126a12.3
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 02:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394004; cv=none;
        d=google.com; s=arc-20240605;
        b=EA0+77bZJvyHmdIwluPqz4BKBTCiJTD6y5N5wCrfs5bjTgEO5fQgRNNgLekapCHAoi
         INK4tUkYWmDsY41Rc2sBhfSk6v/59fUZjIY4yzTSuw/PjV7zOjEwbif8Qqr9j6uBXDFK
         Opnd9RVUvVZe2/OKhCesyypsxXgLwnS/hepR+GFz+1rjkg4mv02JRNsMa8uV2+XThNkh
         uvCPQIKoEOIlPjQ2Y/SdPcIKqyGzE/d6Y3Y5FQi6R19/OA0tnowVT/Oqhe5xsXrPtyCQ
         6NhhNlN8svbyzvLoQeHUmlMrlrB8siVBwAxYFKsVyfXWilhIDgtU9UG8CnNnqxTno7c4
         NvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        fh=ohPMVwyLvIqygrggfAzlm9b64ev5QFgif15eDpiqlPo=;
        b=CnGW2PV+CwDxzDQf7mTAso3fU0B+WVChEEjD5+CEEmhGXVF8hcT4GYKRQ4uQ7IHJpc
         0tDobMLXTg7ksvK5eNP72x9GOvy/LQgE1M8HV3FZB5X8gTXO6K25B/ogoBFVa4OeuPIN
         rQm3n8zvVxEesF8xuGET0sxXhLA6dc/lxM8twMZOY+YMv+kYfthjAtv2BJqxwdtUd8HD
         TlGr6fXP0C8Te8S1ud2629KMJwPMbi/izGQ41HiLdGc7GCDEU4oabfdVZ/ebauplC0jN
         Me3p/IRoXywHicF1m/4FEQIqbs09/YHscu7yCb3KOpTQtMElWu0BeXtVdJB3Me4G2sRl
         aBgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394004; x=1773998804; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        b=Tzi36DkwN4SqqKoTjTpU4iskePw6xt7ZDnjj4SOmjDFSKucjkDU51wKUYbzCdej9Yz
         p+h3hCX45D6uujkMb5OzvLCRXUh61efFuqaWxS2+ZzAZ0Y9l6j2di/mQcRR7xj/50GC9
         ygucRw4Wiw4JcuQG+MXcYgI993t0P58xPzqlsxVwKwyc7+zPIVcCVW4SmTFrdHgm733L
         ix+JQMhjrHpYW5Ha+vu5oXII1A/fFSrXlu3cSof0Wac9+ASSWPrQVYNa5C5qZm3zlTna
         j/x1dpOKYPfKEtcj6vHjPVP1D/bES6tLhCGmKjwjw7s4pepoouD41ISTuXjbLdPcW90Q
         c62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394004; x=1773998804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        b=FCdPzzwGVsZHRpippa66Tlt46FxRdLmwlAXYeb9Lv4SDU7jOrfQqTOXVBvTUdQKie/
         0NTFSzCoeeEs8ssoAprpjrH/Q10Dz4lMSXPU08esZMRwdvQwuqSTu8qPomY5ir4g+b/t
         wFuFY29QIh4R25jypAvOoH2B2lMt4WBj2LK62LuosZHmTN7uLAqT9wDtRDBo7YXAqYY2
         Rxg5DusQWXVI71MBQsde07j6Wq1dqqvqv/DVeWZipDK5nmO245GXutZueIvnC/BBTaCX
         VUArrqpOgyAqC2BYm+GdBzLb6RDwhfmnXGeN/qnJjLJoaBI9NWkQmhDXVY7UlunpRGgi
         n3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFXvYTD/1aqGV8Y8ZXB1wLvw2i1zterXUwoT1DXl7ztmFnq6Rmr/ERTfBnLl6omMlLUuFyuNi8IvFQRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAipdD35JTIgYgdy3Qz8tayGLZt6iNcV5hc+1XTzGJ9eRE5hLm
	KojnX5ULUczBq5tGtAHZ5++WAa4/VdrLOA2cNQY0Zb4cCLbts6RW8BXMaWt4igqnSzqK9NueTcp
	sGv9CnZUD0UlOc3yk1KOOoYCxnOig0r0=
X-Gm-Gg: ATEYQzxo4we2tFUxM0S5O5VOIlIs+12eL9iy1sA/XmLLLRNxBmFUI6MI1u2Vh3YzpmM
	nexREcsCpk1m/bgp3IKxWuW1BK8bW80JBW8tBI+taf7OQ/J3rrZj9+c/T9wYrpJ8liEDP/9AFbh
	yDiduZSCUVcrdKBkz6Vx24EepL/5lIByQp3ktkEJrFIivyR8urOb3rfSiGO9If6qOY5JfhQXX/J
	Meel9o3eOc87D4h5diNF1i0oaxuJgRSghtmE11bxCQTChhM4bU6HbeWJeBD8EqphZMAhK8LZU4a
	18TwUg==
X-Received: by 2002:a17:907:6d24:b0:b95:53ff:5e00 with SMTP id
 a640c23a62f3a-b97651ec2fcmr160615366b.58.1773394003605; Fri, 13 Mar 2026
 02:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
 <CANAwSgTaZqsHYXD_ACkJGGLgk4knc7N72f4qrJaaenE-cXM8BA@mail.gmail.com> <DH0S7TSFKDJV.2YPSBH9F142LL@kernel.org>
In-Reply-To: <DH0S7TSFKDJV.2YPSBH9F142LL@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 14:56:28 +0530
X-Gm-Features: AaiRm53rZCLp_kErJJxBMXMWmeLwePiSPPATSICps4w1XibNQCvpnT-mxDnWsvY
Message-ID: <CANAwSgQCQ4z7p7Z8qe2mRqUY7zKe0w0wE+1RfYtD4NePzoit3A@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Danilo Krummrich <dakr@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Thu, 12 Mar 2026 at 17:24, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Thu Mar 12, 2026 at 12:40 PM CET, Anand Moon wrote:
> > I've reproduced the issue on my end. Following Danilo's suggestion,
> > I used PROBE_FORCE_SYNCHRONOUS to resolve the warning.
>
> I did not propose to add PROBE_FORCE_SYNCHRONOUS, I just noted that we should
> not force all subsequent drivers into async probe() by adding
> PROBE_PREFER_ASYNCHRONOUS before the issue is resolved.

My apologies,Thanks for clarifying. I misunderstood your point.

Thanks
-Anand
