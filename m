Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C137FF54
	for <driver-core@lists.linux.dev>; Thu, 22 Jan 2026 03:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051060; cv=none; b=NnpnCyBqSTH92GvDQoml2LzIF9u7Eze42xhtVFmT3SFns7PUSP0JXvshqLTQrtEIQCSZdfBEPTQF4rXhs5z3MgPpvLLrJGX0wHOHOFuGhbSgpZfbvDJplTZYcm9M8apQ1gjT6y3byZev9dnHSqm1eWvqB2EHr2Gfk7F7Vhp4DU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051060; c=relaxed/simple;
	bh=aWIpZruFnfeLnUmipF9PoJwZIk+pza0G6A4wP33USMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MhmRRO24eeKaP2z63tVXo6dqG/zL4RnJtjDvFWXtFOR0h3vErRb7QloErI+nd/wAgTqUhPBEs4frZxAOEePzu+HAD7DOp1+KLchKnucBXUTstv3J6T5W01Ciwo12BJYppcrhtWNamIV/4HbHJ/hYI32BBbVoBq+JKvCqo+D6iwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0tLUTfu; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0tLUTfu"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a743050256so2911605ad.3
        for <driver-core@lists.linux.dev>; Wed, 21 Jan 2026 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769051057; x=1769655857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=i0tLUTfu21/qmUufPvOoCzjxF57qqU9/rxwoiswB+TpX/edxbmyhwlCmu6ZCa1lihj
         uTxtm6xBDzdTS4yo8EYCSfRzTtzaJG61uxpiNNMw/VlZ297J7CGsPVBkiNUHnuA4Z2DI
         vVdt2558Np+Lx6MqtXfmr+QxedVFTV4mlnU8Zf30q4eps5xKKyKefx+Ts5P2j95QUrB+
         ejjUuosPmDDLs5MZuE5PXVn4R2OfwqqyX6qT2EeMW8J2gXy2Rt1AXbMSL5XFk3kzOY39
         cQMj/al/ZLa8UW1Q8oDfLUbz0DTgATifTt/U9r15De664emWHpjvl+kEQrX0J5rTzjR6
         dpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769051057; x=1769655857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=GnbSznEzSAyziE8N4MzOGoO3OnADynk+OuVt9rpDtlSzD+nqocyd7wz8PnD5MDFe1+
         8tkBF6HC4hdEiD4IwDe4A+3sR6SWJj+bBHmbATdC+W/DRHciNaiHHXKBv5B/MD9eN+x4
         LDZ9pm4cLl3UnY7E7BmUJ8wzSiBMxk1ctFh47CnMAtTTcFKVSBT64UdE3RSmTgm2htFn
         /EThh+/bLM13Mx4/LnlFGsvqW3H/q1hT8wasSWk6xFtcbvbVG6mLNyFEg3cXDrKtg4t4
         aJ+yeB5enBuLGhJ9bgbDnw5LeTcmRHKA60Lh/os/SBTNFZ+sY5jiRyXUw21er/LaERsh
         rT3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZTAuDKZ3glhiCKGjtoJEHPxobrlBY211iatTqLTlEEkpllZWASGQ01vesKmPOEvno3Wo/sohgbwguSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YylSxZfKTBCpaoQC4/2q2bR/tnQdRHnJS608Njg3tmS+2lF8+Fc
	BDoNSawPQ1R9Ega6MDQDSfNUXec3nNtlINZ16JKrWg4ZFHgXnKVFjmXT
X-Gm-Gg: AZuq6aJ3Ptdt09/e0BTvxFu/ar9Lua4LQk5op1GxJUXv+k1NmJOym2DRTK5DRZHY13j
	YTNb/IDE/0mOi8SpvhDymgyQwWERC3rwI+c6dGhokHFwil4KhhPmnYbbEEwz67vJAemUJoZqKSi
	HXnAqxAd4/hlBEl0LzCRnSjfbXMOdge4bfnE5ZOH7nXx3XY5RPMfLlow37ikyL1+rkPxZ9/YoqF
	clli7UoK0a9dEvFlYNgw0N7G+WY/CwkS9REon7pQsN4uUCGnsB+tKx28Tjo/1MdkKZ4Y5bqSRyU
	niQC31JjCQXmbdCbv13ic7i0GzfS04LTOF3pmSOFyL1aj5V5b9nHIg9Jntqyi/fCsgmCILAf+sV
	p3NLCle3aX8yDcpk7Lo/OUhkwQkY0NCEWpPrS2jlWDXM+dWxnN81DysqGhwAJndw5M0eY1NJh0t
	kPdbskq6en4erp8CAWUHrFwyyc4rVGHUjTXksm8FIvsNbbjNPSV+gHIR/rhJ3QNKDQTQ==
X-Received: by 2002:a17:902:cf41:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a76b169703mr73489085ad.54.1769051057371;
        Wed, 21 Jan 2026 19:04:17 -0800 (PST)
Received: from eurus-Lenovo-Legion-Y70002021.. (n058152022160.netvigator.com. [58.152.22.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm168938085ad.69.2026.01.21.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 19:04:16 -0800 (PST)
From: Wang Jiayue <akaieurus@gmail.com>
To: dakr@kernel.org
Cc: broonie@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	hanguidong02@gmail.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_c_gdjako@quicinc.com,
	rafael@kernel.org,
	robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	will@kernel.org,
	Wang Jiayue <akaieurus@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Date: Thu, 22 Jan 2026 11:03:56 +0800
Message-Id: <20260122030356.61373-1-akaieurus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
References: <20260121141215.29658-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 10:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:=0D
>=0D
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in=0D
> qcom_smmu_impl_init") intended to also probe the TBU driver when=0D
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding=
=0D
> platform_driver_register() call into qcom_smmu_impl_init() which is=0D
> called from arm_smmu_device_probe().=0D
>=0D
> However, it neither makes sense to register drivers from probe()=0D
> callbacks of other drivers, nor does the driver core allow registering=0D
> drivers with a device lock already being held.=0D
>=0D
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce=0D
> device_lock for driver_match_device()") leading to a deadlock condition=0D
> described in [1].=0D
>=0D
> Additionally, it was noted by Robin that the current approach is=0D
> potentially racy with async probe [2].=0D
>=0D
> Hence, fix this by registering the qcom_smmu_tbu_driver from=0D
> module_init(). Unfortunately, due to the vendoring of the driver, this=0D
> requires an indirection through arm-smmu-impl.c.=0D
>=0D
> Reported-by: Mark Brown <broonie@kernel.org>=0D
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596=
@sirena.org.uk/=0D
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]=0D
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@a=
rm.com/ [2]=0D
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")=0D
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qco=
m_smmu_impl_init")=0D
=0D
Glad the backtrace helped identify the root cause.=0D
=0D
I applied this patch to the qemu setup where I successfully reproduced the=
=0D
boot hang earlier, and the deadlock is resolved.=0D
=0D
Tested-by: Wang Jiayue <akaieurus@gmail.com>=0D
Reviewed-by: Wang Jiayue <akaieurus@gmail.com>=0D
=0D
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> ---=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 14 +++++++++++++=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++----=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 24 +++++++++++++++++++++-=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++=0D
>  4 files changed, 52 insertions(+), 5 deletions(-)=0D
>=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-impl.c=0D
> index db9b9a8e139c..4565a58bb213 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> @@ -228,3 +228,17 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init arm_smmu_impl_module_init(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               return qcom_smmu_module_init();=0D
> +=0D
> +       return 0;=0D
> +}=0D
> +=0D
> +void __exit arm_smmu_impl_module_exit(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               qcom_smmu_module_exit();=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c=0D
> index 573085349df3..22906d2c9a2d 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> @@ -774,10 +774,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>  {=0D
>         const struct device_node *np =3D smmu->dev->of_node;=0D
>         const struct of_device_id *match;=0D
> -       static u8 tbu_registered;=0D
> -=0D
> -       if (!tbu_registered++)=0D
> -               platform_driver_register(&qcom_smmu_tbu_driver);=0D
>=0D
>  #ifdef CONFIG_ACPI=0D
>         if (np =3D=3D NULL) {=0D
> @@ -802,3 +798,13 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init qcom_smmu_module_init(void)=0D
> +{=0D
> +       return platform_driver_register(&qcom_smmu_tbu_driver);=0D
> +}=0D
> +=0D
> +void __exit qcom_smmu_module_exit(void)=0D
> +{=0D
> +       platform_driver_unregister(&qcom_smmu_tbu_driver);=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c=0D
> index 5e690cf85ec9..1e218fbea35a 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> @@ -2365,7 +2365,29 @@ static struct platform_driver arm_smmu_driver =3D =
{=0D
>         .remove =3D arm_smmu_device_remove,=0D
>         .shutdown =3D arm_smmu_device_shutdown,=0D
>  };=0D
> -module_platform_driver(arm_smmu_driver);=0D
> +=0D
> +static int __init arm_smmu_init(void)=0D
> +{=0D
> +       int ret;=0D
> +=0D
> +       ret =3D platform_driver_register(&arm_smmu_driver);=0D
> +       if (ret)=0D
> +               return ret;=0D
> +=0D
> +       ret =3D arm_smmu_impl_module_init();=0D
> +       if (ret)=0D
> +               platform_driver_unregister(&arm_smmu_driver);=0D
> +=0D
> +       return ret;=0D
> +}=0D
> +module_init(arm_smmu_init);=0D
> +=0D
> +static void __exit arm_smmu_exit(void)=0D
> +{=0D
> +       arm_smmu_impl_module_exit();=0D
> +       platform_driver_unregister(&arm_smmu_driver);=0D
> +}=0D
> +module_exit(arm_smmu_exit);=0D
>=0D
>  MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations")=
;=0D
>  MODULE_AUTHOR("Will Deacon <will@kernel.org>");=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h=0D
> index 2dbf3243b5ad..26d2e33cd328 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> @@ -540,6 +540,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu);=0D
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu);=0D
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu=
);=0D
>=0D
> +int __init arm_smmu_impl_module_init(void);=0D
> +void __exit arm_smmu_impl_module_exit(void);=0D
> +int __init qcom_smmu_module_init(void);=0D
> +void __exit qcom_smmu_module_exit(void);=0D
> +=0D
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);=
=0D
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);=0D
>=0D
>=0D
> base-commit: dc23806a7c47ec5f1293aba407fb69519f976ee0=0D
> --=0D
> 2.52.0=0D
>=0D
