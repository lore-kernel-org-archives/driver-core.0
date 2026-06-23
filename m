Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF603D45CF
	for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215693; cv=pass; b=PwjKCXK4HSx8OlWKfYpuTESYE2mrWSDHokANEQk4X1DO0FnjKIMigvDfwH5VaB0pKnsL8YZVkdcbGbCYZ85j0Xv+aIzjSDqWwv2bpKzIYo5XC9F9GNO6+ky97ITUlmPsdiF1YND5xthR9tXAJlJJjQXp8MpLdgKgfY+Kp31fB6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215693; c=relaxed/simple;
	bh=RRpkkLa0W2etFg/RhsIv5UIlJlesmVn4cGN+MF0OYls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXK72oToWkTpL+eZqPGsLBeFieVK6dq+tb6OTN2eZN+LH5OxsWnNFSlvlTWVdZ3nGtY4leo2NgGnJWisWAVBk+UHvHHWz2pqLAWIxjIxuZWtu0MIBO0AuVy7QTQ+0+0RSMnIuPi45i1nz+cuVQR3kRskc29TEoCM5VHxDagMCMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvc/uqFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STE7dfj7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vvc/uqFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STE7dfj7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBb3D7053691
	for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 11:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=Vvc/uqFUHWTIaaHw
	CgykLxh+JHbckuAbxr8LVfoxnnIpUyBQj287laGknSqX7pOZSSLpGsPrSAYWRcS+
	k+H+i40QkYoQxdBykEvh5BrF6HyKN3Td1orFAy1o2bYjnSuwYjOwvcRofmktQE5k
	hMqVRmd0wJAgUGR1+zMxIcflbZlA5seD39z7St0Kbrike7NxXRQOmlwaK0X5nhTm
	yPe5OSX6oy6SXOyRLgdjXnZbsO/scPyawcLxVz2PGhOunTtpvEwhL1Bb0WBJqd73
	yNUIKOr3FoCTo2VwA5NNDjw4wW28XoaBUS9X7FrTqyhPI+MtMGKYDfZEQkulIne0
	+DOtnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44kqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 11:54:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c364ae3bso1107113685a.0
        for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782215689; cv=none;
        d=google.com; s=arc-20240605;
        b=SlfJ9vrHBBrX4yrhvINBBD80g5IyEIuPRlWqaBDIKa1XRyJYk773wDI7g1/yH8YX2e
         PUI41cw7VEx6hl8Q8ZLOPKTivdDSqGEEsi51cAQgIgQxN39FJF8MF4F26DC/ejKTXaU7
         5Q2eZL8pJSqpm3mGdW3icxi6swZWbiHdiPLQYffkg4tdHgT/qA+/pfmDVTQKDC0jSGvB
         aOux7KfjWwvXCO6Rhdjc9HnsUyBjh6grrVlVw6kEYgMBkQMOmThoPHHRSN9u3Wt+YJin
         xrB6jO0P/Qe1I8gE2ZPcyYkehGkumiqDnpDIhrUwY94jD4meRkh9+Sl2kIPjKE8mF2gU
         6Cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        fh=c1yRdDHw3FpSnJ6iKLIjvoQUue+Avk/A6dUmf+bdwGA=;
        b=kpPkmI0a6zQb15h6HKD/pkIesZNmNZqaV14LLgGYA96nrgjQHHOWIfVJLZHCvLMMxh
         Knee4eMDaABRSkXaBzrO4XzQKyd4LiPwA6ThkMfC6u+r3TwqJcINgL26Bp0VV0ykYKe5
         VXMBatZ0yggDyGx7YkLmd3J6Ov4pPDPIG3SKRu9xldoujNlthW7z8kTtGG1vidPzOSPZ
         QOEL1v0hrJkykJxEO22B7RuEb/6wK0l3ibRKhC/oiKq29SgYK8Li5pobiRc/tzrjdLHK
         mH9dopDTFf52l7BlU0IQY5qPTgpeCH1fN+85/xQ/swL444KASd6YypDGfF0vUl4OnmIS
         Umrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215689; x=1782820489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=STE7dfj7+YReynp6vSg8ZCjtdNly68LVbY7pkMvK2RVo7ty23SEu9WxQ3unsvNlO4x
         6KgPbZp433D/T/vwwgwzdO6GCbRCPS+6m5B73Wau906gRSwADoMZRM+w+fcGCUKrTrcd
         MTjYsJXRAi2IQKAcBs75Q7XFQmiV9Uuc47zDmYnSkh916l3KJnU4QswJxzd0q5zur3zN
         8ThABBczkXtN+2/KS82xEY/Q8wZoeDk3P5cmKYxMvqN5gwLaWijQpBTQGiHUAz6gxVac
         EzNkgZn+O3UzEhTnz8lfTnYDCSuGZghIcPefP3TFb9ek5f5XK57O2vFcgjAbegH8Zk7p
         3REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215689; x=1782820489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=IXQNrcL7OGd8vzoiKgP6eiS4zFaE022fxd1mLYa3fXU4Qi2hRq0rvoNV1nPMwnsVdR
         oNn7yVVh6lFLUfwx7R/dLpLRLPfx+iP8LzWH7MOuc7K2YGqGr5PTTzbyeG0JoI1T+/h5
         sqp7YpGXawWcWxFf41xNDUgFqap/PSkImFA8V7MIHVMQryDVwyFDwDhltRl4xXGxvrpS
         AnjzybR//jInVLft2VPXDX+vliMDnGyVKu1I1icjBegckCIMpaM4GzhThTKqbQIBhKoN
         Vvtx5yRISfiFgLOLppEzEMHy/JV7GJgVGopjnbkx/ohjh/FYDszEmfYW9uxI/M1jIrfY
         XCQw==
X-Forwarded-Encrypted: i=1; AFNElJ8dvzIOg6al+l94yGl3e9I9ur17Z4j/NtuQVGiyezz5IcmYRU4Hs8EbMMlwUOXTSGuHF7RjIVgjX+TIyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgV8bylQIQf/WMRvVvvo5e7KUKozUCm/SCXjwRMTvcMJgiRDCe
	ekUielRmeeUsrJ3MZzVbLIHRUISrvpbIHkDFPAWsHfXa+49TcJnnHKXcRBVNrrNmiajU9hXXcuB
	0FDpTEggGQrr5vswrgc8FEyjUtSkwc1g9oYIBSmFeIFFGSGMD03OEjSBg3HFxcrSQRB2U/NkJ0N
	UUnSWEx0M3hYte3Wjrv+GqgmkxloC4ze90+IJJcYRF
X-Gm-Gg: AfdE7cnjWFYkC43aoxIoyqCeU1WrR6ma7W2PROeadw1jrUQ4PsWFvpsaq+ELuGcv0W2
	zzZNyGDzAmlTVR0PWeX259RE2vK3BiwghzVInpfzfxX45mhb0GyCc8QhIKjXn/7knGCFDybFYhV
	BtWpxOjdzdQ7gI46cPcVWRv2PEJbX11OSVbS4SEThIE4EPw0onTKshVYEuwHoPZAiarLyfMusbD
	nwh5TNV/ZGJcNlhH+CKJDWKoNLCr5wgPfAXpoFf9RluNJp/UAVGq5KcEtnSi2UOLOAwtKBK7TZ8
	8hohWI6CNGc=
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id af79cd13be357-9264771b2a0mr434707385a.30.1782215689085;
        Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id
 af79cd13be357-9264771b2a0mr434702185a.30.1782215688526; Tue, 23 Jun 2026
 04:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com> <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:54:37 +0200
X-Gm-Features: AVVi8Cdel5T7fniqHB4_fyyFIVPTxPRe8hWJeBKySDY3t80yH0us_4QRaPBT6xo
Message-ID: <CAFEp6-1vaeC9oDKuPAdPNtmGSsewbHRFS9RcPMzzzWHjnXQA-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped()
 to simpifly code
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX8Uy8TM1UK0oI
 Z9WH5fqHmiNNjjmbzQqiziu+ycGNGdN3/8iloFq8y+AEsPoWhs+GFhIZsKz9i1JGB6EO7BYeQhR
 467h6g07VjwJYiayihIuc9cIgzDXqb8=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7409 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=9UnFPMSZPvWmRCPcKGwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: qJUgfgBZGYVzeeJGuDVyv4jxUPzM9AJv
X-Proofpoint-GUID: qJUgfgBZGYVzeeJGuDVyv4jxUPzM9AJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX9/rwwQv3Z1d4
 jjZEnrNscQMCKylvf9UOEF/DdOqGQ0a0COrKHmfPNKSEp/p4qPJYC/eX6bDwJ44OuF4EcpWp6rS
 xKbCK5uu86bv0+/g/iGot4iU/oeyilWmHD9uSj8YkTc9Sq8DVmS52qsdJwK+oNVnHTjkxoX/skU
 iQk9kHRYm1dAI4xvh0rC5rPosSeHBW1vNzKZ+LGsXD9S1uo+jxmQA2k5P6PNuLCoW1yLbdlb9Ws
 pZfZlmP3UdHWLxKzwhGGh4NJ1c8inyyNprbkGQPPPybhd0ceUmzil2nibraLrwurikiqbCnfGVl
 6WYGLD+484Alto8hgmsV3FxwTFM9B2Z37K6b1EYm/Ix/9oOLlojV/LhL9IhqyNNsvxIuLatbmBP
 JSYl7PCHkswHxs6cnDLruhI3QYdHcfzRTA0eQAhQHAEPC+BPQl49L19N1wn/mu2ptpkAzabOVcv
 ntqC7WOcsgHWKjtB+qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097

On Mon, Jun 22, 2026 at 4:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.
>
> No functional changes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
> -       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         int ret;
>
> -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +       fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
>                 csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
>                                                       typeof(*csd));
> -               if (IS_ERR(csd)) {
> -                       ret =3D PTR_ERR(csd);
> -                       goto err_cleanup;
> -               }
> +               if (IS_ERR(csd))
> +                       return PTR_ERR(csd);
>
>                 ret =3D camss_parse_endpoint_node(dev, ep, csd);
>                 if (ret < 0)
> -                       goto err_cleanup;
> +                       return ret;
>         }
>
>         return 0;
> -
> -err_cleanup:
> -       fwnode_handle_put(ep);
> -
> -       return ret;
>  }
>
>  /*
>
> --
> 2.43.0
>
