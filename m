Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0B383323
	for <driver-core@lists.linux.dev>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481738; cv=pass; b=GOybx0QInIxAu7W7PafeNbrOGkzt2Xb28k37Dd32LOEhp+Chk0ZESYTaBZ4gKS0CiXVz0jtVhVy+hxNvXeXrxrdkkPbWJpp/2+udtjAR5I3A+ma5l83/UeNnpf2NYefWDKLpAO48brz8969PCW23ZHAwRtG6QLAJV4BOTjHRdn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481738; c=relaxed/simple;
	bh=ImyaRmLghxFwQsTJnShE9IsVAyUjBEQQdEnQ0b9Byos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cux8LO6DIEroN2FMUt31ceZxAp4PLwqVYp0YJ5eEORV3uTE0GRatnv7+pDsDb9KFvYqw7H7F2nnWYGgRS9AoQzigXzlM+haqVP4MUpTIpar8EGP8YDp+VPUwO0sHc/CGBx3jXPmzjcu5SHf9tCqTHoQCymqjfr5imIrLNJfhSl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/ZBQBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SV0VS4tf; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SV0VS4tf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vY7K2368138
	for <driver-core@lists.linux.dev>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
	C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
	9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
	YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
	SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
	LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
	vbBXAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gg2d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so85824736d6.1
        for <driver-core@lists.linux.dev>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
        d=google.com; s=arc-20240605;
        b=bLhfI33kJ0kE9S+S78n3obbFEvVLnL9J9EFxG9RH+Xxc92GjcZJqRs1UlGFUEYIsxx
         mUtXqhcfWAB7Q6MdKtB+bxPNJDgiFyxS+aZwuRRf1zeiNfxzZ2rt6bYWn1i/4yyAYwb8
         ZINnLgJBq1CcK3I326usVLUWo5WliZMeMg6PlM56tB+tkZVW+zUW11cVRxmB1swi0jOd
         ocuzV3XlUzwxKz9uimgWpQrThjcADMWCe1zAKw9CiaxlwJuCt4agWFbU3oBvhZtSOgkZ
         t+VgRIYqJQdRwtEyfxpz6hTzb7gs7DSPeHvpxtBKDIspSErckh4MotO74a1grCXX/60z
         jdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        fh=qNS2/QnxN6b8cFzqa9nAxixRXv8LkPc0J/lMemS3Ueg=;
        b=WpmYZZwiM+HYM3238XW+bwsEfCXBnt1viKyDD+YafMbLEDQEQWn/e6+q+6pXi9n/oG
         JN4AaNp++HYP/p1sfO3XWIJYgbzTLxVW4eOJzacRCOFFBFOMk456eMOhBzJmwMLxQaD6
         SUP+gv0038ZqzLAUL95reRNKOa7USSzNmlPnQMclpJ5lt73vtUrA9f8zbqyLvpIfx79N
         /GpZBUcbe4FB24xbANi7tTc2RUKoRgb/fLfYcOovTrrDrOrmeU5/opgxJNTfEOLdB6oL
         cz1/Oynh520vJhxDZV0kzLvGQeBlrRErOKz/p5amOt0aEche7r1qN1olrBcytuaTiOi0
         WOLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=SV0VS4tf3FdUe5U+DPPF77N4VtXQF8ccSvYC6qZegUTlSAtFvQF215ftZzpXNWcYt8
         p1HCaXK7xaXg2lYKhZGXrnylual3x7yyj4KbabHxgRefTHmE6+3/oAD6snQrpMBIjOng
         ierth8X0Jv8Y2+Utn6xI2JKKn+ry4dCzXYbAx9jKddScWAARlGNhU6ycL8BwKqJE5B7L
         5D7bJ7NYZGiY12Ozclizq9uF3rvJil4k7iH3zijpm6XkmXvPhgGDK/mO9DqzGEntGcOD
         gXienBa73K5cwgnZZXFutEd37BkSRrEOZSCrScI6VvWvCmamlqRSJpb3tVrF9hz33ekM
         YkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481735; x=1781086535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=pG1+wu5dfPMtxICGY1036h3zSvK4eqU4N2UC1HY/iO8Heh0CayXtLkLTMxzuY/mrq+
         +BwE3eym1M7PK4A/5VnF/SjDhkRjuRs35G8YVxz7uu/gwICPHMr/GirbSs507Z4dFcYP
         Dbw6iaP3AsaOCXe2HTXl1F1OdLEIcBcJiReFipAKNHL1HH3BAZmZWkrmnCIzaHZfSsEg
         IqyOWVhzpVew66LqwejcbLmvLI0V5Wa1FTs3kKuT2gRPJQ/rAZKLLPZ4cvKPjzYZJBYh
         wPpWPyTGD3lD3pv5lTd+ePRcnNNvaZb+139/cCUlvMj6z5VCMYleyBIDHD+cyX3Q/ryx
         K8vA==
X-Forwarded-Encrypted: i=1; AFNElJ9G0jbY77dTIhmeFFfQ3Jc/KOO4WIrPS03UWlzand0a4TuaH/po6OWUuxKrsmxcWqXnFxh1qQ7svYWGMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAkPN6O28MzEBC7I1C1Jo1G15eQBYEhOPQFRZiK4mjrskA1zdr
	7/MZUQimH+c4JpG7C0I4MZ0GGhh8n2yyooACME9TqYla+QQCUiSA1Uw1ZRuLIWCvXKeQa+uwX77
	rB9e+5r+t7ML7rJ8EM93VKnN79epIFP7P0leRWDED0Qh7JDJUR5JbDFY7mh/+2u/G107XPFEgnx
	8IhYkthJ1Q+7AUwlBcSzenGRN/pF3RpQ1wFO0A0q9R
X-Gm-Gg: Acq92OEppxm5mS5h2YqxQ8JYa/6t9oVqGR9f/eo0QxF0iNjmjkTY1wL6W1ULXNmU/Xt
	1Dwis1TNVcnao0YWvnoo6N4hRSAsaCsN/hK81gFRv7uZAu3dugkezFfKgC7/rdHe4Eq6mfNpTCA
	Zt+2mvPPPzDSObn4XknrSlza3omCnma8QHNGx3Ommh9wZlnqXGZ9mCsOxeI0fQ7NtbwCyFC7PXJ
	0r90FfyskEHYDkh
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id 6a1803df08f44-8cecdc03682mr27951806d6.9.1780481734742;
        Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
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
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXyaVnZPG/KUDK
 zymjyZOdCabvTtiBJLMIkT8aYnGq+i943tJ1H2gAc50HNEu5DcqS+ZxDqk1gDMTwrkUWLCd4L7P
 C3BZfoWLsaqrsv5JLxSTgxFh27p/mnhW0jpMpQy23qyH9mKEx/D37XxqxzTQpNBY8RhYIqvG/Mq
 izYWApT1zgeQ7sOvzHCCtA4SURc4dhw2JXk/POALpJhacPAngnmYgvaCUXY1JGHR63HfASrGzVw
 g/Rso0I8nB0DvpD/jX1i9b4x+/1vk8H5CXtdwDA00Nrb4aEYUgT4OLngpXGYubveGc7/FqV1BrE
 wSDPXhZW2kXj9EcRWNLPB3zGsBRZniKCdLUnwl/uvA0nklhRxa7naneI+k4ka69+oHX/x+ynoER
 px47BHAdMMAv+Kl0C0INlYc8wx2r1YQ4JnpDgk3uRl7ItjsBxAsPu+cBrxGJBzfDNoM5pVpCqmy
 iNGJqp6ctuZwaU++hiA==
X-Proofpoint-GUID: 1fjRRE8gqakb_QSNUlct2-AlMDnFt730
X-Proofpoint-ORIG-GUID: 1fjRRE8gqakb_QSNUlct2-AlMDnFt730
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
