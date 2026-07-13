Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886A63E7BB5
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938559; cv=pass; b=XREWeSZaf9o9q2BHnHYJFqloLH00R5i7YyXAjkcGZ7897IY257n8zEvAxG45xsrjsOOqllVcSlHtCHprZtJOhh0wFfK067mf+SdgamCqTJ24nHfGkvEF2ZjZtWD/RSdoVkYBSwOx9/Y52uXDkmMcE9pnfDjijvAQKwBXAeD5QnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938559; c=relaxed/simple;
	bh=g9PH7rit3zO//u5Hq2QTKSHhPM7nodoH6Z5rCiQghkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRbjfBUJ0nFnBhkDDIruLTCi/X4fpBHTZPkz3P1YCQU8jmGK8hCan0Iq3MJfCBoGCnKGV6bRscIBoxqmvpRxgoxukVLWZksQXpNFHX+SclDBxGziPCaVl3XK8YsZZI8LlQDBhgodpLxmiHkMB9M3FG7PjL8z+NuXt/oppWItSMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNFOxgh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=goSfUZ54; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNFOxgh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="goSfUZ54"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Yo5u794293
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=; b=QNFOxgh31F+aQwWH
	ovN+MuWYrQupUnEJ4E05qCBe2S9rP7KHAIzWX8QuWwVLkBnQCTy1Hz9uUXC1S7DF
	8ziWPWrYXfAPxVQX7yIQ90tkfXiCc0VPr519QCrHicbq5mx/va6EOAY8OJvHnMC3
	RZF+ARzvL1gWrkTRgAmMOSEPMRMgnJsk3tSucarsmgrls/L4q+xlgyoSuIM/bgkt
	B+B96eVD2U0ghoOzlEzmHlymMGN9Zy4snq+v8VItrjMOWQ4hjzJIFO+xwOz3UgBn
	1yZtKxrH/rfPDe0dXOHL2JQMVO51Kqi381IJox02JTjVELMpumm0HRsXH/c9hr2z
	cyqT8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0m9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 10:29:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so51634426d6.3
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783938556; cv=none;
        d=google.com; s=arc-20260327;
        b=eK4y2lRj6gHg6j9Mous5YO5Fae9y3Sp778634B1zHLTr0LsCC/Tk33tGk/PgGBGI//
         XmgR5FquTiyltHXUfN42Mt/LDIz99uDXLO9mG1cI13AZEQTUbAbcys6lv6MKQI+raP2r
         NELSy3zJ0q2nlIUdsPD4IxOSNHNpoJN7/T7tOU2QjFp/1ucliI/7W7+gozoa03QKbJ4A
         opqJ3gZ0+jk9wXplWN6NEC5c9GSwUB8JnyXIOr8DBdLRT7qZM1vwNsRvkn1hYbBMYahy
         CyxhO2YUpl+s8fE3e5/fEwW5sCl7Y6rV/GHxEeS5lCSIGuABCa66VVnQufVP3vbLtVGW
         dCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        fh=LVwGtD89XMpOQVNW3MbFhYVzaX+v1/HviYZjY2NLsC8=;
        b=Vh/fqUHXiGLFWTgHcB1sDwmFtLdppPmswb/U59jqOAbOziDtpZz78vwIiCd7bQ+/FQ
         iazorsxkItPO0TyxNfR3f5S8mfoeKjby3FEs7L4jmemQ5SRoNPFjyvUNkX1qbjkRe/0R
         hkqjZs/gqVuHlGL/cJovFQYoSW9NWho4KkdOupslhU/va1S0+mVlAhdYjAgdaf1zRTUl
         b6YRQG2TUP1YNAgOwN7EHjR3kTp8CCdih5FlWtM2JArOFwyBjOGxKPPuIg6OlwoDokCX
         JpnufD7Fs6B33T5lnR1Im2tQU4iJz4JlWv1vfQmpJFbiaSVW+VxHjM2eQEUH+ltV/Uad
         J07g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938556; x=1784543356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=goSfUZ543oEtgZDsjYw1l0t0GrV2PUtlV0/ZJO72tgkXp9fyKSK49q+uB+IvxvFT5P
         yomVNsWnvJtmetbm1dmAgbGrH9WcmpAfdTfG1bEVB+Fjz/t4pYmHxuZRT3XubZSI0qdr
         VhWOzpvM4YaCcJdA7w7Pg60PK799616dmQC8n4lmMaHLP66ywYisXhs9eHzMMSCapsUV
         wE3Van87VnwQiP9lBCTsnR11ga1bvYcuQyAQn4ug2sQfPvmbQ8hn07+EWchFPSnqfp+z
         FL0DDDsFQ7c9N25uikNXab5DBu4jU4TPiTInDFWFJ/juPWUf7pgoY0IA1E37OWXmWJHR
         J98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938556; x=1784543356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=JRnTnsYXp0VUppZidBgcbGwE4ypyPE/cep3mJboA6QY03Na6V3udRSHSynzjZe32xi
         Hyk87m5tR5fSMGyH/3e97GI6O7QOsY8+50GWJ0jDo6FhZdVxxDnvuOQPJPE7PixMU3tF
         Axdzq/57QVeAF5RICdeCOMNebYn7f48gZqT/LGNTqp/aYrgmwumj2pjB/IncIZuZD6RW
         XMOG2PqscHvn/0S/gEgqR4RO8lUdciq3K+abAtOtzoWkSL2B2MW6QlhNR/jC/p133iFe
         gqlVZagI7OY7ratUiMyHDvraaIWsYrJTyzJryhYcyiuCaMOLKRxLN//mhvX5NIIauoq6
         KCTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTbPdScuzb2EtCRjsnxAJoWPtcEX2mL7gyaGJhTOIciJu2PDiaovrlXsck/FLxNn2GlyfDWDp6M/PnUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfsigi7fGjrKBm7PPZ2K3zeZdeyI815g1Ec3EvY5Ja74yVVlSZ
	bLirmlyNCzsaoAe6mFkSfj7UKQOuPLtpCHiLX/r3sIOsPpJ4pfEspDFxvjceHeviiLVtxkaJ2qL
	YYGWJ16Lqu/tDNyD8ZjqE4kDpHtyEeYNtDHQdlWXtHUpss4f6ZxfxGBcI80drr7ya87CZOdEPV6
	86fD+RyI9/PZ+uVJTkjDjRJ4Jx98s3EN0OuiwdD2uD
X-Gm-Gg: AfdE7ck/TY92uGqpQIobmlmifTQB/KhYWRW2ERSXuSxk2k9eKVbFa9lSGixFvEY6baZ
	L61C+hcmj9zv6cKygC98YOHc3Hr9qWU4PO5smB73FfLeNcUJqIzwPiURKHpIB95iNkUHV/hY56n
	vn8jQXNDzoBgt9IKrSF8U1A2zT5NqGQfInrlvlPWFyanw+Ig+T/2kEqrHaXb4ItawmwEFT
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id 6a1803df08f44-903ff76144dmr97564696d6.1.1783938555910;
        Mon, 13 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564106d6.1.1783938555502; Mon, 13 Jul 2026
 03:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com> <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:29:04 +0200
X-Gm-Features: AUfX_myf4-1EuuJEsM9iEruoBmhvEE1_shBmpnLHYi6rPSO8vgxEgiRb5eZm2os
Message-ID: <CAPx+jO-P3Yt6T5Kb97MjmMB1mYeEgjStCkSACM_wsrqsBVFEvA@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: oj-kdX9YqJDkAfezhL1BeEsFwOfXAY9V
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54bdfc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=-ghbRyKqcrg4NgclPfMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX86JsdV/fRH1Y
 UO4yJFZfqTLTlTN1aXdT+ZFhpTG9/Qc3cBh5HzuDuGaJvImSDZtu8ajVisegf7R7oDJ52vkmk+E
 68TOnxUk89oKhMsGH+wV5dzp43FDAe8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX87dpDYZm8vzW
 Sgf/9uVYXZByIUUu+W2MvPwK8IyFfoJlSlHQZG84/Jh0+8uNhbIZLIs8s0Vp3RQtBxHSicigenX
 gdoPwdvs2gXZhaVtst777Z6TJrvtoZv+WIFUEgPzDuJYPpSVsCBjmjVCIvstPkfufUlAAf4adDf
 oQtkNnaHa7kgo7wJxecnZ3UvyMacU0jgyZxDq7z7Fb4z7+WVEN7dbysrt1J+knwhuAuurCKSNdd
 7HmNxvkHnMrX0hOupXxf++GWHPeKgNRR9STF8afmopbPdHtB/HR8egGv4MiVrGAyN7aQacCx5GJ
 Lt00lJEvS61rIAl2Ds6kfX3n5RcI0W+LKSBTSU5xgg6pzT/WV63ZdvasYYEcwIvqXhUUGvyLduO
 V3ZW7kLH3LkE6BKLTUJeDflOWsjFrNpNNKN3GCKkFvv6pbbdTnDQ9VY2lkbiO9VVNS/BBr/p6p6
 s04rco8+AC9XJ8SRrUA==
X-Proofpoint-GUID: oj-kdX9YqJDkAfezhL1BeEsFwOfXAY9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

On Mon, Jul 6, 2026 at 2:45=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e=
1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D of_node_get(np);
> -                       pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
