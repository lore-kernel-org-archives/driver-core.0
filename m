Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5A448B91
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905630; cv=pass; b=cl1IOGQq67x6UEz3kU3iw5vTULyeCvJ8s0yb5VtEz0HhNIi62ixGQIK9oX5VzpJZ6XdpX4KXvrA8oo7f5JIohm4rXO0J9swlpYip8dA3a4UvEN+XsmnbTvHDAwtYksdlTOwD6ZlKIPUF0rA7k1xa/VfxHOUU9hAovtDx+DEdcjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905630; c=relaxed/simple;
	bh=TqF3wLHIA1jAdZt0Tltgjjcw3xRF7uJIwJwkCK9UGR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukyGgysfvxpJP2hdQDR8BqwpS6cb8uFtgNirkhZjpQrP1eqL7hUUDFDDytu69qy0ohH8VM5tvie/Vh1r3rsrvzTPgg3sU6p64w5BhUEVPc25KucSl3Bs8V+oPc9wFFOR31HReXV8wnjdQUqLSLT1sG5SSwt2tBcaGtfuNrlxx1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMNYH8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMFf3aBJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMNYH8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMFf3aBJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbA1C2933480
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8grk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 15:07:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7ee64b25so67056585a.0
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=oJFrmjPqJ2u6f5nBJDDkNgDlfg6h/4xQTYAw9AUp5MS9Lg+XGdhq244S2tyjM91q/6
         XFOR/O253O8GPJq8i87dcF9UO2KCRmlDN3UaLIcRnLXZIIJiQGjNsBPR2m0AdcbXWuEG
         vPV8o3FuM5HhhwzlEFc8GkQjbrl99g2bIaoTrM+NxCKO3kNsRfa20l0Y7ys4Hgcp7Dcq
         WGyNSlzWt6tJsK32Vmf0T5bLefktlOrOSBNEklQYEcJwM9xTmhxuj2s4E02aRU6/qur6
         MDrm/ZSatfZoQmrJ7NgtKdSdisSQ4h/6rV/8Aw0MaTCqiMyPf1RDnaqdXWnve9BjY6ze
         BiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=8w/wDhIrG8/s0YN/fjD9WGeuEAmFSLXeWRXwnQWUJck=;
        b=MVvkTXjFUrDHCigiwzIVAFhcIUQhD4vTMrqFGJLkJodtq73E4Ou0KJ0j6vkilDK4sO
         SSmHGj9+AJKkXfPdmS68ecg8b0YzRhnRdF4X3KlIJ2XR3TVzIEmu81qbvqMaPl2RD/O5
         hQ43hwhrVIA2AHb4HbnjSNY09jt5X8Me8dVTlySKZVbGHguBXKZC1ArJK4ek2qe5VOZN
         20oF1CYTG88u40y6ixd2XezLMIpwFx2I1imORcE0TcpFN5Vo3d2vrXd7omKDXGdUmZAS
         GclgeNbgXsZx1mNo6bVoHoLLysOluvX+J89TyegMcdhHEK7PLSzR9WDQo+NprqzGHwAX
         +X6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=DMFf3aBJXWZmEyyf3ZJpCzufZt2FEkCHIKwbIGE7H5jDnCfdk09N4s2P+DprWR5tqj
         Oc1pSb5MRbgVUGaSGgoxE2x3CFhqlc42CTypFDiC9IPeNrvYLKcorUyLXcvWgwZP9bzr
         ekZ8kGkkLzyZJrmblrvh/8id6VmFn33C0QKPZFGy67+u4hg1sx/RrphBW2TOO3M8q7cz
         CE42U8Y5y7RetRWXSiW3WMgqaq8QJ4Rw8yp2hElK0kqOS4IzHbR40v/fO3bWe3Wshzk5
         K31V49tVxjjKRg9l1x+6IzToM/QSLXFUeuC360eA9VAI4dyoZUCAIxni3SBO/f8EU9Qt
         3Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=TtlO0xXgPR/r2o4KW7iQU1hjpeBcpFBeAwJ1+5WKJ6kZ5hwmkDfY2U1tRVG81GDPKX
         zixxGdlFJSJRzsVB9rdTBtLYx56slQfpZ1ChjFdkHBnK3M5yPgCgGc5y8TdrDK5wCJGR
         EAq7fVm/PU+Amc0BIO6F9ivoFhT1t9mjRweY+1+VR0YYlnwiSCYa/EEZvwts+RCD+wKU
         FenYK1eo0cCqpyEnB0Su3xkr+uqdcarI1yYqdT0WRPKxwhEi0C28NdWmRZNCyq+CLAL7
         DcrJ527tui07SwNnS2QiJ+gDj9Fmz2tXXH4VhX9oe01CpvUTRD69RcMDKwBgNBhxz61D
         q1Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rpo5TscZySt1RGS3QDpHb61SlYf7nAMuH/TfLUqZGLUPuPrh0KPKo4P3Mgjae2Rb+SRcwkOkM4+SWG86Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuiNT4GrPO25XJFwLlf/+swW+WeRGeiSm73dstJMMXbTAfqrdX
	fWLtU/CIacQgUlaGFxeZ+MLxnpbkHI/62R30PAmz6/teDyevtYzf0CzaLelXnj2f5Nuo63p/PCF
	J8ILYA6wBnkpzn+7QmQWe8Oj5uHWoSOGfolayU0lZS1e5fwRyl/TQLiNQ4aQO93oLr620t6XWWs
	kMonEEKvizX6I7Y7h0YnPlKlY7l7t/D34ort6DTORP
X-Gm-Gg: AR+sD10NccBfvCyioIWDOu2FZIPDAUdiZOy5FJG7QDDMhVhfho/mCG/7CiGj/YGAY40
	Jm+sFE3hkiVVIfbV8pNsbkA0PmdsmUTQ+BEMHiarVUTzx2je5XQDd6qKFWV3ALzqxc+QjOJUF4j
	k4x8mRxMRb3TiLVy87ruT83wm/+mzrAVnhxxkf8WunUWVWy+Wfjo9xDwSYFQ==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772233285a.92.1784905623928;
        Fri, 24 Jul 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a637f98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfXyD/aLL1O6Eed
 S/3WJJw57T0H9PdjNeoIKvkUT2fLAbyHgIWRVqu3NtX9L3gVFS0LEEERMJjf/it2ldqg6qJAo0m
 CGbp9vS3Y/9FNhNbZY14PIRwf/w2fQOnelwyVtV3d7pZ/i+4rwchJkN0+KAvE9aJViNqKw07yrt
 2SHpI20SkZmWKNREcGHSewvwfVNvlacPzwq2Lgd6R6NqvyM5Igf015aUvQgq+X4JKTA706XLyzf
 BadYAx4uC4C9fSEMDJkEK1hx+PludzJBwVjqatrg+vNRqdL6m6SHnBM7ucEz1QVxb/CzE2lPaID
 o5KZjYJNWOOQ/RODieyrBkTyWtr0m+2KiQgEARvVnwQ1PETrGsWph9E61ulHxdEOKW2C05E1aYB
 wISMKKA+mb/EWQbw3eyptn++MMjiELl5BYa4IHek5dldUnHnd1XuSBtPu+vm3JT1ikmBNQKHPbR
 l2ci1pbCt6WNSyN/TuA==
X-Proofpoint-ORIG-GUID: B2miI1B9sciXKSAv1SDe0hRwEzgaWsqd
X-Proofpoint-GUID: B2miI1B9sciXKSAv1SDe0hRwEzgaWsqd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX5iWJIilV5jxI
 hYsA+XvJkKsUd+5N+soYB9RIdBLXxnm7IrVsgxspzodfrmJrC7YzsysZgTW3ZNq8f7ewUPpkzNa
 GipAR41+NLVo8369CxRjGf7tkw2LraQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240136

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
