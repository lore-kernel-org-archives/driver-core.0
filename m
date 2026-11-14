Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794644342;
	b=aGXlab/6wr5dAY2MSVnIrveLDRAJakthtsh5NAcBfuDbASvTmK4GxpsfIBAK1bPf9nmY
	 Tiik7Rk6oe2iA6lMka2fPmAB4s0QnwrTOnkqoIrVqYqTYNw+k6WOKQh6EJGj8wTieYbR6
	 tOXGSNIi6TQWdIEv1QtAqu+tkXwzmY/kSRtYv7i8AyBANOt1Qluf+wzgkCFVhYHohslzT
	 3Iodj1ASyZzMUH7wWkri3ZuINJpJVlj9eEfWDG4hvJkioeI4o2DDLJZxqO7KVOzFgB6W5
	 oeUQCkA0oPmc5yiApKlSIEO/J26WxwzzB0xZYixlhj03d8OIximTjmKUM7inwrqdYiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
	b=I98KDZTu3J+oOeaohrFqAa0W//U0sO+KtlHu6JeSHGegn5Oe/itY7bnBgT/GJOMoUKGZ
	 Ttek8PWsTmSRypUxV66qHJ9RQtQHk78/ijFF8lP9NncbHmFZkj7oM2SLUZcJxKGdJ0F8r
	 CoLKgOyJDWzSTho5zoAfp+yLPRFeiDI7wzkdf6pyweMI5n2BP5WLPCAqaGOMVepnbngH+
	 zAdnEBHeLG9QurJVhCcIzaIoYz10oVf9GGhy9EFUQ74+6+ldAmgXB9FlJN0wI4+TamQm3
	 ih4TeznSrlvsUoz1MV++mGYkQ9OHlk65oMTtiC0dOId2mpnixBtSQTRjWPDSQ0qRlWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2lsw4oS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY21d4Oc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE0606A32D
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 08:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFE0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2lsw4oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY21d4Oc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61Cxf2224135
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 08:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=; b=g2lsw4oS0C7kW4+U
	opEiTfMF0LUYiQau3gh3GvXBGEhya76EPmzdl7rzJp0gn488egNSxOuQFZ5glSqH
	iVDkJ4JP4V+sZKVC6Ip+y4dVBjFTPfl8iwMBn7XuQYnARE3Subi87vAo6RrFyHgp
	/hgH+KTJFe8gxoWNmdLnD2WacWtj3a6qSMangdB3apVGNEMNojdYzz7piRjXIi0J
	7txafB6pHCJrviHm8yq3DmB/V0EwZssYEvGd2WUR2m+XC5NihS8uSQY23N8U2GUv
	GwskLP9+1tcdg/P3krNLXgTa+62rB/YVQbEmGxDxjePtM/GLS5uKn7Gc7GIi9Laa
	C2PbYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhg9pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 08:19:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eced5a4cb9so14001715ad.2
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 00:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794644341; cv=none;
        d=google.com; s=arc-20260327;
        b=Ya31XlbiWAo4Lvnej0boLOeSesvLEUq1NoNssQdcPIEePGiPrUFfoqe0aAjgYb6k7E
         mFRVsCQwIcLwgHyhJzj7jzEJPnQB4jwGtweQDrgOXrln1/VIQ9FnACb+Nb0M4ETSCazp
         p7OWZCczb1zlVzN52ox7YoDRxuhgtss1Aj2mlrKy485+YWbcosGy2SW05MnF5gNoGIvs
         a14HfHev9LU3ckKZ0VCWdDp9WlFK473A8A541xkpnXUWGw9vmb8TTMqZkULLOZLIqdex
         UpWfKyhxO56qi5NmmKvaU3kJ0eTUH23r+jQUkwzVcCF+w379Ekdfd3KLqjjo7Ie31pnE
         Hp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        fh=nTQZAJzO+nJ/iIGBHQHt1dDBwM6nf7ERKvf3918iX8k=;
        b=ZaPqFwpgBEGnvnoMjAw1i2YIiPGr5vlHddgOB/ZliBc7ZSNkRutVykvXoVY1qAM8N7
         B78YsdNri2iMETAo/H3Zpma4UqEnjtcQhQo2AJ4u5fJSP1fPK+XOpVxrfEW+knQvdr9z
         GNLDPpSMV2lM8d9l8xQCuqNM9M9c37emMakfuPROiG8NCOEyazH/H3QR2Y4MlsfTGZHp
         IQivMlt8B3Pz/rWMIvFX1wgMRZct4Jg2MwpUmeGTPfRdON/IYBdAvxsPnzD4w597vi5q
         ccB+gJp0lElTBNmo7vwlwszPvVOFOy3M5qyZjEqpPRuBFBPfWeNcGwCris43K/J4V2Kn
         N/xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794644341; x=1795249141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        b=MY21d4Oc9ZGRdkzGLALzfnq/DI4rCv++KqJjXvTIF7HqR9oXJYIWRLnV7lL+RGzjXa
         JkrAmHPpffWICRCqJiGE6+bayKt5JJYoOOpY0568Jwe1+9qZ0/34hm4ByLnOoYyx4AEQ
         OGSZaO4N0rjcaU2bSACkWo90vVtlj4yFuHk9L39qkH3LTCX+zqttFSPnQSLqsTj+0k1B
         2sdRqBPSFg460+iru36Js8k4ZdrltuZmobTwysLZd2m4RwZB0TGMYFjBrhGYOLfFM+/T
         /tVCRxWFmIDcrBcj6VKCkOZFftZSQo4OLeK0li90rKof+S2oB72aj0e5Jd0GEAUlw53p
         4c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644341; x=1795249141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        b=js9kOWLZvwKayLw019T0gVXmAE8fTcZkUI9xJnhIloxzt7jSNwjWYb9AUyu5Ck2DYR
         l++I0IXRFruCirB0nN02GOJ2CdAf9Bc+ZFSim0gZST6sxJVTitA2Zgtb35gJaztp9g00
         hjlTAZuMdRHYXe405LbCiFxEEsbHLvjlKh8HGHNruEvcpiRd6S9+9k6XWeT3ugtjLstf
         6HdjERyyYsMqTGAehySK9yCkf/4sV21m4qRKJGhBauDEcyMb4PlmC5CJDp4Ff8k6ABGW
         COJjtkDFlZCytraBeDK0pVaO2QtIt475Hazn7q9km4npNiaLwVeYrCgjoBoKEAT5T2xm
         LiTQ==
X-Forwarded-Encrypted: i=1; AL+hErGPqEoKn7lWCNiQssrcbU0TSE5olbonGw5UJoMnXAXN07hj6/2Se/D9GqeMULAUcH/FvUvsQSKIfOjV0Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8UixIWmelBo6LnkJFa39WOnnv1NFrf13Y5c9xIBSHhzeQlZcmp
	F0N7kZPtt35M4cdi2/6gMPxAplW8JH3oUqSHJBod4xQ2ISTbmgK6voeUOUdk9OUW9FwC5gFVBeC
	KDEy2grLcn/zVissr423Bm3IBhkGUcajwesBrQiz47m8sxAhxZPqyHNh9wEbVQTamG3T6y/IIv/
	MMer6q4CXLliiyhBsVpkVJ0Cz2OBvFTRjzkHwhS0QU
X-Gm-Gg: AYBFou3L8DBpzmmrJ4S64W3zRYFgGl2ZFP4sa8bq1mIgxmCBPggb8TxXgH3rSontcMM
	R1EK3XQZ4CX0AjzkIDCpyNwMI0VdaeDBDXgjQ8EwlBeWNXPVYSd6953Ji4FChJZr1h5wfnirtqI
	IICpJGkJwEtorDnBFFGFuu26mxgDIG0U65T2lUVqFDGA3KS+No58/Z21LSOg==
X-Received: by 2002:a17:902:e790:b0:2ed:379:1592 with SMTP id d9443c01a7336-2ee0dccfa1bmr52675145ad.26.1794644340583;
        Sat, 14 Nov 2026 00:19:00 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2ed:379:1592 with SMTP id
 d9443c01a7336-2ee0dccfa1bmr52675005ad.26.1794644339943; Sat, 14 Nov 2026
 00:18:59 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027140751.2465743-1-b-padhi@ti.com>
In-Reply-To: <20261027140751.2465743-1-b-padhi@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 09:18:49 +0100
X-Gm-Features: AclHuK8IXFCYeB3AWBk0BgMTxu3LSqf5mRE3cR_dlEjTborPRMXNscrVzwDLsE8
Message-ID: <CAPx+jO_GHZopd+D_v5X1j3GO4ANxsR8eMsV9h8HGC9qdJO6b6A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Allow platform drivers to skip PM domain power-on
 at probe
To: Beleswar Padhi <b-padhi@ti.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, pavel@kernel.org, lenb@kernel.org, ulfh@kernel.org,
        sid9.karanam@gmail.com, afd@ti.com, nm@ti.com, vigneshr@ti.com,
        u-kumar1@ti.com, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MjWuuUtW1qnfUBv5Jg-IW35ImM6dPo6K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMiBTYWx0ZWRfX1CTJMgvsMyVU
 W/IFZIN9lvVCZbLm6zWt5qHoOqRMw/rTzcrlX6UsMSA5yY3S6qYlmDGQbrYt5Ll0twNS0Fz/LG+
 2zGyrvua00erZsbIgfQPXNKETIkE0Wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMiBTYWx0ZWRfXwk2BP7xveK9r
 /eK3lXfh7VUccy+fclUm9nipgWQ7oZ6ftRysTYkHWZTaXO0f9LNJpbYyMLXZy64xq0m6h8F0MQf
 vK8wJcaAGta8hflJ2YLmqGuIxZTsN6ECZtrnSzx86js+WfwK9EFzidl8mL3D0lQzFgPlHYqvJsr
 qguj98ti/JR1fr/7TSRxcKklEBSHoajzANYeMnHlMz/nEkv6WF1yAmAmoK5dNklweO6VdbJR1nL
 k6PD/DBsydHDN/6Lg+hQsh4K2NZzRMXK9N5yHD5p/MLCsSXkBB6mU5NAeqodphznwRatEnhBedW
 KTZnpJs32FaE8DUqLaHzH96cXlDWBsg1VqiOb8BMCM3UUhXWPqM5OAf2ROFYGSU3IBS3r1+wpAW
 hP86muO9VYJnitIotU/t91jmulYlyJQBxi6QXogyMhJMOBmV37ardTP7ce8gjL1XuSniis8Gwyu
 wDGvttwy3H1w+RURL+w==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af81975 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Ht0MZJmIM3MH2Up-epYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MjWuuUtW1qnfUBv5Jg-IW35ImM6dPo6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140032

On Tue, Oct 27, 2026 at 3:08=E2=80=AFPM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> Some devices must be configured before their PM domain is powered on,
> but on DT based platforms platform_probe() always powers it on first.
> This series lets a platform driver opt out.
>
> The user will be the TI K3 DSP/M4 remoteproc drivers which need to put
> those remote cores in reset before powering on the pmdomain. A patch has
> been posted to add "power-domains" DT property to these devices[0] which
> is the motivation of this series as well.
>
> [0]: https://lore.kernel.org/all/8cb23b44-027d-4d81-b342-7eaca0248f63@ti.=
com/
>
> Please provide your comments.
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (2):
>   PM: domains: Honour PD_FLAG_ATTACH_POWER_ON for genpd
>   driver core: platform: Allow drivers to skip PM domain power-on at
>     probe
>
>  drivers/base/platform.c         | 7 +++++--
>  drivers/base/power/common.c     | 5 +++--
>  drivers/pmdomain/core.c         | 5 +++--
>  include/linux/platform_device.h | 8 ++++++++
>  include/linux/pm_domain.h       | 4 ++--
>  5 files changed, 21 insertions(+), 8 deletions(-)
>
> --
> 2.34.1
>

This series looks good to me and solves the problem in a nice way.

Please drop the RFC and make resubmission so I can pick it up.

Kind regards
Uffe
