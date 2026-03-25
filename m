Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DB3254A8
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463112; cv=pass; b=kynij9eNbV9wQZWIQcCnN/H8ojgDpthoTCUAE+0gDl5xthfu5leYn0cq0Wf38Nu46gxwNNhXYBhIeaAh8bpoTdMuMkwoeAWKDZ7xZ86nEm1jA6UFRboD6fTURoWqMegGwFF+blmJKPlG2pXELZ+OK66XsUrJ8z5LF63U4wZlWr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463112; c=relaxed/simple;
	bh=octYghLj3lL8jmmagJjWza5YBb4cgg47jWgO1cXXGP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeAjpnp9+JlmM7MXtcFX+1vt0BUp1w83yTEHUw97Rt9cjSOcmYdrZsjBE5AEIm/U5UZGfs7n3MGfZ5ercSxDH16Bb0/RXu4SnQzveNXAsqSNLA/Ks+ldVcCeQ0tKOx9oTFacE1JbwnWZw9Q6BxdV8yMICyLHCjXZkBgbRvxiAtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p73FyyeL; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p73FyyeL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so184589a12.2
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 11:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774463109; cv=none;
        d=google.com; s=arc-20240605;
        b=QH5HiYoS/hfjxpoXjRQlKIjOKIRc0uyWz0yv9vXtLlAG6iBHS4jynhTMwWDQGWzDOa
         zR9xwM97vFBpav8mr1GVOyuX/X7Wix7HCxu+7JMOcLKpvZJ+xfwQXugtPvseg25LoebQ
         qDKl6G6nGFyBxnlh1xrS5r3BEk/eoh90+YOPl0Duj5B8MngVz+ZnC8DhmFbxdUSmsuLm
         cjhbMvGuaKhGyO8gQODpdmr/f8aQj66zG62F5CKUjwn5KS02U1ojVtR8NdXR1pvQxiGj
         eMXfiKsDwvVxXvUbhWXO0fOYfyDyYsagRIBAquuDLr/i6Xo6mkVQST8GitZFPN0Wkz+x
         clNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        fh=+q3/PD2cXFX79GtiT/qnC9+uZ5Xklol8zOjNgFAtzc4=;
        b=h7tbs/+S+6NdGhsDFBQQHjNiGHxqNEhsSUFYztoLFcev2uxtqwNGpSipKzOnm+kLsN
         oq892IlxlYRQdh52LfapHTbkXgmTf2freyG/DRXPAkfeBpFlEaNQyvu11mhIKWGH3K8u
         2PRDlmLtjriopv3fQ14VVtOvjgKtZVAmVvg++T/v3O4+PTfl/oT4JZqwOdYL9RoS8z+3
         yXjsgB2+6D+b3KaENsk7ecdXhWuohU+4dyeW0uiuQrtadbJIm4tdqX5EwcjLgWniEIuM
         A4sUzsCJY0SPSEd+bycBubb2A2dKp1wz1HA8wc2kYoQ/JHP/vATYX61o/+qWJY/vMZBC
         ZQzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463109; x=1775067909; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        b=p73FyyeL5pnFVqh2W6Gb5hl0ieLNbRIOoahvUAhXsQ8XjzQmQRVbkyib8TbtxaFPSL
         TvtR3Q3t7UoctNxAh2R/ger5Gqfyi+t3/UBOCU685PJp5gkOCaUupG9aXen8cpVavO5q
         8cIyOJYIeWb00CXuOwr6W1k2grzFuLBFFVSgQ/rtzCEC5y9X2O7eFXv+wrLgTxWO2tko
         /AK9dr4LY20Ei4h/PAUj5pG9j4A3kXS4O+FnjIrQKWL3uDsSVxh24+QaeXBuQk1wcZ4p
         7H8FsFo68LN3WE+HsPesAdAnPfmObmIcHlb9/On4svhBDOnfuewmLEzrM03mz+kd0tvL
         P9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463109; x=1775067909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        b=QdkRb1cstB9XKG5/h8NvjLLfjRk9xdfOuyIkN/mfrZZB3cjVaMiygR58cgpI8ab7C6
         qgGtRZFpaO03vt/WIqrPs2+8KFlHH5AeRJ/e/wXjrVY9/5z2Pqz/Hpo47KI/Mdj/Py5l
         NAd8PwlrF4qRmeg6vwTSaSrvuHH3y15q9uWnvPmNK4F7J6G5bNlXsmWhqJB+tQ+VhZEi
         q0V/LyKmS38osmhcQz1uia5maaq4/lMK/tO3VfqMyfB8H+Awcern/z3CdxJTEo+1Ucip
         T4dCu3gFZy4fd2CPp2aoOCuVtuHzNbR6t00tyB79Dh8D2N4S1S5hg1qL2IpiL7GRQ8PZ
         zMdA==
X-Forwarded-Encrypted: i=1; AJvYcCWl51Cf9abe1Ldfj2fpJvt3d931A+JqRy1DvC1eSLgr/UOdwZ4yAKNZehs0nrrOtm6fRcUqgjh9mfkoZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyIOeLwt9g1hfWscpCtUoe0oOp3pY07/DhhJrJN6zgYieAVfgx
	cilOTQgb7QGDDKs8MkSDPLqh3WUPIxbvwBy+YUeFkcKdxC1RDVs2RrzPSx1DIjdJDtS19QMIJnW
	H0XBTdsKWpz1IzCxfdS4I59Pud3p9yDI=
X-Gm-Gg: ATEYQzzjN61epH8DvAFv56Q3nO/CFflEhs8gq33rHRPKehTz+RP/KlFdPu/NZ1dq1J8
	4vuQEJZ+SA1jibgPO7NcW7mQqQjzoq5ASsAhNFjipLvsHrsu0guD2xZYiowMcQ2DFGrCcBWwGB+
	sCXUfucplCEbuiihPrj7wTH0of00+LG5LKs69834an1aT+r7ulYBt/n9CwjMpFAA7jcR0eNpEqX
	6MV+X76aK/h25uWmxjZgGKYWUJMDGcD2GnoTMmnjsGzKDwMC7jy43jKMzKnYc/QGHSL2eikXljl
	o5ASfg==
X-Received: by 2002:a05:6402:1d4e:b0:669:d9a4:cd4b with SMTP id
 4fb4d7f45d1cf-66a8262af14mr3212998a12.11.1774463108886; Wed, 25 Mar 2026
 11:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <acNgUoWWMCi1oLU4@google.com> <DHBYL7Y262J2.263EOC2JNN4RK@kernel.org> <acP9-AfUQ7zp3kMS@google.com>
In-Reply-To: <acP9-AfUQ7zp3kMS@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Mar 2026 23:54:51 +0530
X-Gm-Features: AQROBzC57btNYqd28tboSY034eYP0IcSkF3_Hl9bgfxidfp7h8unSgphUiRekA8
Message-ID: <CANAwSgR7ABawrnSG6CievYT-BZ447TaFC_kqCYc+oqxkD6Uxjg@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry/ Robin,

On Wed, 25 Mar 2026 at 20:57, Dmitry Torokhov <dmitry.torokhov@gmail.com> w=
rote:
>
> On Wed, Mar 25, 2026 at 04:13:03PM +0100, Danilo Krummrich wrote:
> > On Wed Mar 25, 2026 at 5:13 AM CET, Dmitry Torokhov wrote:
> > > That means that you are kicking the majority devices (for now) into
> > > deferral path. I do not think this is optimal.
> >
> > That's not necessary, we'd only need to kick those into the deferral pa=
th that
> > have PROBE_FORCE_SYNCHRONOUS, no?
>
> Yes, it may limit the fallout, but as I explained in my other email
> there seem to be a serious disconnect on what synchronous and
> asynchronous probing mean.
>
> I wonder, don't we get issues with phylib in other cases? Don't we ever
> have a module resulting in creating a phy device triggering loading
> another module on the same thread? Won't that result in a warning also?
>
> Thanks.
>
> --
> Dmitry

In comparing the Orange Pi 5 Plus and Radxa Rock 5B schematics,
I noticed a key difference in regulator implementation for pcie2x1l2 node.
While the Orange Pi uses a dedicated GPIO (GPIO3_B4) for ethernet_power_en,

Reference: orangepi=E2=80=915=E2=80=91plus schematics
[1] https://drive.google.com/file/d/1cVT7lSLlgtIvHh4PllijP5E4zz7pxCyh/view

On the Rock 5B ties the LAN_EXT_CORE regulator directly to the VCC_3V3_S3
PMIC rail without a control GPIO.

For LAN_EXT_CORE regulator POW_EXT_SWR/ENSWREG is defined
as enabled by this regulator, but with no GPIO pin linked to toggle.

Reference: Radxa Rock 5B schematics
[2] https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf

Because the Rock 5B lacks that GPIO toggle, the existing dummy regulator
definition is redundant.

By stripping out the dummy node and pointing the PCIe supply
directly to the PMIC rail,

If somebody could verify these DTS changes

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 668b19c05f7e..cf7d9d516d0e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -81,15 +81,6 @@ vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
                status =3D "disabled";
        };

-       vcc3v3_pcie2x1l2: regulator-vcc3v3-pcie2x1l2 {
-               compatible =3D "regulator-fixed";
-               regulator-name =3D "vcc3v3_pcie2x1l2";
-               regulator-min-microvolt =3D <3300000>;
-               regulator-max-microvolt =3D <3300000>;
-               startup-delay-us =3D <5000>;
-               vin-supply =3D <&vcc_3v3_s3>;
-       };
-
        vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
                compatible =3D "regulator-fixed";
                enable-active-high;
@@ -480,7 +471,7 @@ &pcie2x1l2 {
        pinctrl-0 =3D <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
        supports-clkreq;
        reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
-       vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
+       vpcie3v3-supply =3D <&vcc_3v3_s3>;
        status =3D "okay";
 };

Thanks
-Anand
