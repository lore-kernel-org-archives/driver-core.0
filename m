Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620521;
	b=aIVDtYG/FHs4LmEpxcjaU0Oy5r+lJiYXp23wLFSLwQnv/VvMTLBWYAuTDTWm3j12vFJ2
	 Mj6iWOvH6Hvr+tp8ido371KiJanLM748Rd3moF1a/078l5ZYJ3rEdR/E4nVmPoNxRKBMM
	 o/0V20CBnDWUiuQGnIamRV//BtK3DR/8jWzxqGrPvydoB+MQ74yWIY8Zxw3jZyZ4oB6E8
	 U0foT7X7rp4KfeWfTi00NWos7wD+kRjB+9I1LMleERKMAKZqjIysSO1M2GI+EbbQlcXnJ
	 f1VkZDSLVQehdWoLOelCbmeKpnjlcDv0HDhyjT7F9+g85BhrhCY1fASpA42kK/Iifgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
	b=zoDOCeIFR01PzZbcCoj1UbcC4UcMDXOyQBXN30CD0BNz/5PYFSVh+EnadA+q0oqavSdx
	 lxn25MvR5/aBnnmkiE4wIkMtLlZmJnmh7KuSaNZ+/yk8m63MkuNImWdAFP5JgL7XfG6T7
	 HWEhEJBc3YUgcxeeqlqcGQmI27y9n6CP5O1IPy40cPBdPhuxPy3EWXvuETSC5l9eyVQ4r
	 jnfmWsn6fMXdvhLLPVuy9Fjwbh8O2Ts5hpjXvAwXCtHaWWvEMpetkDWqH+asDomtd/i/c
	 KtFcAmmbdt+SD1J4hy0/EcUTWc2LNwBw2JEYdKFhTZiNeMxNdqf1ed7JjyR3wBD3d0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcJeNz7j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZ9YPcRV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F273606A32D
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 15:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F273606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcJeNz7j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZ9YPcRV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMIXI175468
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 15:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=; b=dcJeNz7jBO53pM9b
	BWVrwtK7J9Fh2vzyGuYd2ROc95rQjRVUnpMNAi24cw4DUxj/qKO0bf7p5K5v+ppC
	WoLmdJU4QuDKlddsZsQaMlvb/xAfL9b8l1OwK3z99yl6iu8po4fNwM7HT01XnGiP
	uTsd53Uxewrpk74/Q0ugLMkY/MNDJrwmodDT5pCBAGsArM45yCsJEKBmE01NDSdQ
	H4Uu5WBscdP+W8zhFQt7BjyuS6UtxJ17JY55ZzWTChDwajmNvxhxkL8ZZhlyyjmR
	nxAfSF/aGTdDGjrFJe/RiqrxaC7jxsracyRrOMB8E2xc4brdgOAOsk2ZQdDgIRPI
	owy1tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sg8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 15:28:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso4477202a91.3
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 07:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620519; cv=none;
        d=google.com; s=arc-20260327;
        b=tCN7VnWJVCoLK5wtYZCyuYuI0lC/J/WOevPJ2uFwOBhb2Z4Q/yiBiWy4MwZioTYRR5
         aeuAdS6Y3S7Zp8sGP0r+kRIxgAwYiNeoHxz6AmO58shstMpq+gdeJ4X73AXutsHw3Bjf
         j6k9EdWibNGaGPBgi8+8jgLsO3zTxU0apeqfAwOQVWzIRqhRXx0np+DGstcIMm3B4Hp3
         hGn4fGjTJL+TOADiZq8BPu/PkdufNpKWcbEBOEeQVz+q+DR9sZaLrrq+mxAJ+cXREroS
         otVgfHasDXqmtSNwc7hB1wF1tIdjoeBs7fTZIE8nj9mI3EGHzCjaEedq9knmOybWXjLC
         2OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        fh=oN78Hh5nJw8kCR+bIwSgvumk643c5FGjHoVMwmsl8hM=;
        b=rEsEP+kPVFcf/wqdXOe6tBcO7aeumKLQHoDw17NlePjg/QQ5ASCb6tqkD0dQiw2o9i
         1cPCRAKbX1PsIW6l4Nq+hU8HjcQ5csxlCbA7z6ggFN59oatdRTuOAfVj5PyqAOez4cMh
         /jFO83RP8qj3QdHH8Brcp+j5Vk5P834HOlpE2RkLPaoFJvkpPLajZIca4DGaLzSAq/6/
         iIVgAkelIWVHFYsEKcP60YAc38B9YIEbV/AG2PRRNDusFdjL0EWUr0Yu5j8/4YARSOiC
         +6GtpmR/hbPIiYIKFWvrnV034GUfXudHk8ZRCUVdI4vphRrd9t5JkgfvoF9Z88xq8+oW
         fMoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620519; x=1796225319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        b=aZ9YPcRVgCN47rHztlrsNwwJbGSHj2+ZoByWdi6PskjQEwd7E9kn6XpqYgpqsX5Xfy
         mEA5/kA9a/RTJ6dUrMS6yA20dSEZVIr5GlB9QNO/ET3JhHGQfTRV10nhJVccXEnN+uB0
         QMzKTMe5v0cAc40P77qfh2Ah3ynsTKr/aKfdqIKKx5CwmY2F0gTfmO0x1oqBJrECviK2
         KsAhbOHi0lNdALnxoQMB2sFDWb19d0gNhJQDQJScuZbCiEe5hFtPIuJkPJfc5yDyV3Uh
         oEaLg8dukM7lKOtthoXUgUKS314WnPzd2gndopm6Kxu3+Y1zsmEJHJStqM66d5edoNE6
         tCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620519; x=1796225319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        b=krCAyMXOPO30VOssYw7yg+1Ix49MN3j6lqPxJH2OSG/6USBtrFqmYyJmrCRTmMB3YN
         it23cs9VUp5WAU12w3YIS+fmZia9rU5C35yfFwB8DLqbui+kxDjlMTFTKgY5eBb0xYxA
         TkmFSICAq8wOrgRqzqfxi90N7gwr2yQ9UnAW0ReCpuBEU0JiTdQbgiVubKZWp4SOCxuK
         L8vzf2/rBz3hUZFBQF1sLALt+i28oWj26vEYiiFXIWoHeJfoA4aQR0nAqcJanJClwYwq
         MtEHlbDHMpRmUy+4oUKR148vzryavq83ZYsB4/ELzEKYJc5mUYSbGg5jGk5WL+soJ0XU
         3KlA==
X-Forwarded-Encrypted: i=1; AL+hErEveuoo81JAtN0wQ/jwsE0ChWsxAsuAz/R1d7/pUxAJKteBcwim+QpouAIrLE2WpuQGN0FwpyGSq6yjBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+4y+N2nMjRqUPDCObZpB2qW4vjPtJXeklZDJipaaHEeEFsCvqj
	K4C83GnjUvxUV6V7+YYBZjVLY+gSntERwnRTCYMYKdvpaN5FMxRYv0k8IS74rG/OJSp9S+VDAbz
	YIOM9FSYjaVAyIE2KdjJFIzb3w6J1XgfxmDmhxEA4etRQGIP3Oit3DmFoHljU4hvBuMnumyNmXO
	1kNFMBLsk6WDFve0Yy8DdaNQ/TzQtqcmQeAhpG/JxK
X-Gm-Gg: AZFdTZeYtn6922Qkoqi2K2PgdFDn1jeSbRDccVzc3e79rvrXDyJc4xUnaqMIyg7G434
	u5qoP90zHeZrczZsFODPSL9p4B0v2bjcwVFTzFHlPONngjzZv0vcp6wugRbCTv9F/7AWHf8PFRC
	vjnnt0Tnv1SogK99EDdZjo+/1z/lrpPiC0cBXTXFUR8Fe8eDuuZPOXrycKaA==
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b41c7b56bemr16095963a91.8.1795620518950;
        Wed, 25 Nov 2026 07:28:38 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id
 98e67ed59e1d1-3b41c7b56bemr16095933a91.8.1795620518406; Wed, 25 Nov 2026
 07:28:38 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123084218.673382-1-b-padhi@ti.com> <20261123084218.673382-3-b-padhi@ti.com>
In-Reply-To: <20261123084218.673382-3-b-padhi@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:28:27 +0100
X-Gm-Features: Aa3M54orfvOVvXWigsGrBuGRN--3G2MONDmqMcP_qizMGu0HQcaQbj1P0UCc2ug
Message-ID: <CAPx+jO9LhihGLHYSFR4Wd8GhOu_AC7tE49OJxrVEVAJyEDHhiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver core: platform: Allow drivers to skip PM
 domain power-on at probe
To: Beleswar Padhi <b-padhi@ti.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, pavel@kernel.org, lenb@kernel.org, ulfh@kernel.org,
        sid9.karanam@gmail.com, afd@ti.com, nm@ti.com, vigneshr@ti.com,
        u-kumar1@ti.com, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX4Qxzut23/gRC
 vknJoFuWcFnp3kH3MW3Wey9ZRYQkugQsrP+5sjBynpk/UzQv+SXhTrFy5tCNYDoYlHW6I+HcHUi
 +hXHTsJ1USsspSkLXMCLDqvZRYP1pVc=
X-Proofpoint-GUID: FqlbckDcTUKuxmCXx2I0mQCrBhivADHg
X-Proofpoint-ORIG-GUID: FqlbckDcTUKuxmCXx2I0mQCrBhivADHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX6j7Np01pv/X4
 Z8OKTfTpaITMfgCz9XMRD7R6QwIxBw7fkC/mvmANrdqKT0ocErD3mGY0i+ELuXZCuddz2tIvFK5
 AFypWA/DxIcvIQxnxaBEd7XerzaIB1Nd1aJRjGidTLBwd13qH5ipJDdqO+VGbDaXiRv18pZDuYE
 cLSRDT/w2fqPnjuBmJXf3EzdPY/f1jM9ws8mEhyPPguYogwKw42fAsFEnsU8i4VbpkZGcm9IIgs
 0SBxvm25tpLVp6sNO08zzaNa7DP6ntE6ff/ID8ousYHDDbsKNMGl/2Kp6pxhFQMo/6tfd0PJ916
 KpQQnkWiqL+kC5k/FVo10SqWB6puy/sNRGBmTO072orblrfHC7UqKDEDsd1P7gkRuVV1Av++MwJ
 i8pWZfNZFdPsJTirL+vgOD9D492SCCsQ5tGiYV4Qss9E6OcaRpUkxLnZ7Q6E33g9FrVVTyXESBV
 DtHYgTOU/oni2FSudZQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06fea8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=7sSX37EjNprRciGDyAYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061

On Mon, Nov 23, 2026 at 9:43=E2=80=AFAM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> Currently, platform_probe() attaches the PM domain to the device and
> powers the domain on before calling the driver's probe. This works for
> most cases, but would be erroneous for devices that must be configured
> before they can be powered on.
>
> One example is the C66x/C7x remote processors on TI K3 SoCs like AM62A.
> Such a remote core's local reset must be asserted before the device is
> powered on, otherwise the core can start running bogus instructions
> whatever happens to be in its memories at that point.
>
> dev_pm_domain_attach() lets its caller skip the power-on by not passing
> PD_FLAG_ATTACH_POWER_ON. So, add a pm_domain_no_power_on flag to struct
> platform_driver by which platform drivers can opt out of the power-on
> at attach. Drivers that set it must power on the PM domain themselves.
>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> No changes since RFC.
>
> Link to RFC:
> https://lore.kernel.org/all/20261027140751.2465743-3-b-padhi@ti.com/
>
>  drivers/base/platform.c         | 7 +++++--
>  include/linux/platform_device.h | 8 ++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 979593e5cca15..6e7b803a50ab2 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1482,6 +1482,7 @@ static int platform_probe(struct device *_dev)
>  {
>         struct platform_driver *drv =3D to_platform_driver(_dev->driver);
>         struct platform_device *dev =3D to_platform_device(_dev);
> +       u32 pd_flags =3D PD_FLAG_DETACH_POWER_OFF;
>         int ret;
>
>         /*
> @@ -1498,8 +1499,10 @@ static int platform_probe(struct device *_dev)
>         if (ret < 0)
>                 return ret;
>
> -       ret =3D dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON |
> -                                        PD_FLAG_DETACH_POWER_OFF);
> +       if (!drv->pm_domain_no_power_on)
> +               pd_flags |=3D PD_FLAG_ATTACH_POWER_ON;
> +
> +       ret =3D dev_pm_domain_attach(_dev, pd_flags);
>         if (ret)
>                 goto out;
>
> diff --git a/include/linux/platform_device.h b/include/linux/platform_dev=
ice.h
> index 3bd0f1f0d8704..4d1679c4ea78e 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -292,6 +292,14 @@ struct platform_driver {
>          * to setup and manage their own I/O address space.
>          */
>         bool driver_managed_dma;
> +       /*
> +        * By default the PM domain of a platform device is powered on be=
fore
> +        * the driver's probe is invoked. Drivers that need to configure =
the
> +        * device (e.g. hold it in reset) before its PM domain can be pow=
ered
> +        * on must set this flag, and are then responsible for powering o=
n the
> +        * PM domain themselves.
> +        */

I would appreciate it if we could be more to the point. We should not
need an entire book to explain what one variable is for. :-)

> +       bool pm_domain_no_power_on;
>  };
>
>  #define to_platform_driver(drv)        (container_of((drv), struct platf=
orm_driver, \
> --
> 2.34.1
>

Kind regards
Uffe
