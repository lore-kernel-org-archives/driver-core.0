Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BFD36BCE0
	for <driver-core@lists.linux.dev>; Tue, 24 Feb 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927083; cv=none; b=UXzu4cWbyIYo222T0ItlWF/47g3JTuzdacdx/UNWcIOdXGYr7fo1l4dWeIFCp/QndHPBBGHhaVJPOhEq39uqIvh+hr1lfeiLgGScP2KKT/iej+0Qk6rf6rXeSEKDhxsHNSuYOp45uJYdj1/T5ew7ftgnU44Xe3ydvryQO4AEgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927083; c=relaxed/simple;
	bh=Iv0RU8ESXCGS1lmPLquw+3+cIGz1w0QV9/R+DRzRtQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLyd3smCDsx8LjlyAG8P6iYr9epPtvu+D+jjqSs74qBvVX+HS3EvSh+mKDkDmw0FqmFkJctoGlAnjEhMORWtsZ+O1LZIO9jz7xAwnQl2oNwKO/IM1XNfbwk7Ae/7BvU3Be0zLB6S92EuH8i1Z8fVtBhNolT7y4wBip9U5b0TzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss/EfuRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzpAjc+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss/EfuRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzpAjc+I"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sM6V1400518
	for <driver-core@lists.linux.dev>; Tue, 24 Feb 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=atWeCfnf8b/NdVkyr56hTky4
	XjjMPB6Vdu11M3dtNFs=; b=Ss/EfuRLxJD4Jo4rOx+5N177MtA+FEq5jQgZ1rkL
	W9tFvuyPEQRI7ZOjT3HZqiqByKq1zXOIIS8GytrhpNV7SeOvoy446wsSUrGYL3D0
	GbbegVReVhjIQtLHy+BFD5lEwWCE0FGz7mTpjPbtuZUeiPgGpEcwISVajjkinrj1
	hYnYsp+0WTPbx1mCUpdb+5tPgILMtOeZ2xb7Xu1bUbWLU3Ke2z2Tfu0aHDCNb7V2
	yHHD0+ZseoyurIgCbiXo8xIbI7HLj+r7N3Zzn8ZMoq9TxlxlrX4zt+hGA/0w7B+/
	JeAREjw5j+3gw6K+4WEIPdEolGgkeQK00X1rFclBBz9LUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9tpah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 24 Feb 2026 09:58:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so4496376885a.1
        for <driver-core@lists.linux.dev>; Tue, 24 Feb 2026 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927080; x=1772531880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=RzpAjc+ISvFJaPXy4iUur7GsseKB/T++xHsCYfGhHr4rMUiVqv+1/upkkRZ7TS2XJS
         sYjK6cCDcOZPQoPh/uVP01DhTDf3fenkVVs2sEUL5RTSqdaxpcfccRTQcj3z365SeGuB
         VqzRCr9Fdfod6fOtUc+a6mPjpFHmEYvjFsFbZm/FdqXlFw6xjiyhSeX1+anbX3aKvJz/
         OB7NL5XOGdp5sgk+wDAz3SKWHu3Z4NDkyb3S2AMWG6jGD0mgU9MDsZWWS1JhwlvZLzE1
         BAMCrwVtYWBr9Q5Ezs6AHOlkO25zK1kNnVVZqBlM10t+KaGl6SQrtks1lLFNOh6mzdDs
         uOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927080; x=1772531880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=kLYnhEr6WnmrcXfT3TCT1RjAA5vZlCTuHi51jCleL38CcsxQF2ri2p4GbDtP/rgvFN
         oW5+5XWe4a4UJtPuHkQBxn6wcZXvhCwt+8TeSCewCFQpBiQxpYIqDpwr8SNFagyEoR+2
         FJx3mivrk5LMwfplO/nw14BweKssSWyQOpA+bP2o4Xv0o70/Vyy6SCTEaZqx4zu6Qq+m
         nbJ24Y+Wc86mfjSYN+sKAfrtD9u5II8lQYJjdeJ12seF5UEyfaqg0uFyFUC3WITNSJBn
         4WM269wI6gtj+ir4MKFDT8iA4Wk6gfyw4MCOcc0NZPW1/DamKxQNWi9l0cBF/KqSW7Zc
         9l1w==
X-Forwarded-Encrypted: i=1; AJvYcCVH7odCpKMwgCrM4vYZVXKYF4LKrxhy93khFfn6iSSLIFoPpK7x37w5shLJaJGY6yOiTYCoZ8BEtyHxlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJAEwNV1BRQd2sp5o2qKhWnSZPykCOv/eP8FZNPQpCkVmx+VhF
	clXDiSMWtHwV480eWbQYDGr6MHPXOph0Hmi+AE4dsDsuuePhzrCh2HI2oDFRaG73l6S8rkzkTtc
	cR6puQYbSDvf9BrF57rM+6NKIzY5iDboQM7vu3qZq/ul2WyfRQ8kXKOWJjeOILpa14w==
X-Gm-Gg: AZuq6aIwk/FOBxXw/TRjmj6ZKMzLldT6OYa8QVa3oTqUifsX1eNq3MY+wvzgwo3gRDS
	Jc/AN9EttfqkXZs458oGs5uI8xZgSb7cOQPhF4TywSOQDoojq9giaHxJzFb+osy35u5rg2zGMyZ
	6oYqb88sKzFemvPf2j6C3pv15TmscpUgg49uVgg+OxMQscCONLTLJOfyea7cZt4Mkfs7mPZQPqe
	pV5bTPOr5jNCgA+LtC9UHZQ9bhwVRvhGxEpAOt82MZWL3Yat0nwG8pfuXlAMZCuio1n+PE2Y1Jb
	fIvpAUdzX/8ZpLN1oVx34c5YHn10tTlDfVqO+HYA6hfzL1AY3+BLlBu3pH9jKkJ75EANgRu/tQj
	wNsTAafVc38q7J/tcTQGeDjm7j2exf21rr8Tq
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513683385a.6.1771927079652;
        Tue, 24 Feb 2026 01:57:59 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513679185a.6.1771927078924;
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00768sm24787904f8f.10.2026.02.24.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Date: Tue, 24 Feb 2026 11:57:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d7628 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=8f9FM25-AAAA:8 a=5g7N3gLuN7TUrZyG1CYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX6vMhItUg1iBO
 miUa8+BF0ZHcswUohM6mmEDVLqm1IbnPSw9Vwwcd6mzfu7YG8BUesTg8QsGsM9+K/NLze2F7EQU
 l9mXULexG08wq7EQ+SVJr49/qkwNh2PgMD/WIZRcDuz5R2lsmV70It/SFa8or/BOVox8tZnHobJ
 PxZA6Igj1C+9rKH1h9XFbK/HSgOXRg+TFiNB2tjVtDxXspuAV02Vp3FWwto6TCUFwRHu6fAXSHs
 f+19kkbEZlLHsUUBQ1IjfHAhYIzcZANYGkS5TDXpDDwqxc1+RqiKj5za87E6NpQstWWyhkTCBNo
 ccCihc1unjZ9iBArHMYYPhUU/mB2T1XRzXi6cC20b6XoqgxhKjBD96Sg2+Fl3Ls25Ylxf6fWl1U
 NZsv7lQOC2lFLoZCglBVXvfa0NMoK+hDOmNhGOvYploIJC5OdfK5eC0zh6vC+tlCvyIftbXTSjI
 GQJ9HYMpoOkk5QE8JcQ==
X-Proofpoint-ORIG-GUID: Z2vrH219xfQtZqu6RC4-OzPMfFFC_gGt
X-Proofpoint-GUID: Z2vrH219xfQtZqu6RC4-OzPMfFFC_gGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082

On 26-02-23 21:21:29, Danilo Krummrich wrote:
> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> > called from IMX driver's probe() callbacks.
> >
> > However, it neither makes sense to register drivers from probe()
> > callbacks of other drivers, nor does the driver core allow registering
> > drivers with a device lock already being held.
> >
> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> > device_lock for driver_match_device()") leading to a deadlock condition
> > described in [1].
> >
> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
> > the corresponding driver module is unloaded, which leaves the
> > driver-core with a dangling pointer.
> >
> > Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> > any subsequent call after the first one will fail, since the driver-core
> > does not allow to register the same struct platform_driver multiple
> > times.
> >
> > Hence, register the imx_clk_scu_driver from module_init() and unregister
> > it in module_exit().
> >
> > Note that we first register the imx8qxp_clk_driver and then call
> > imx_clk_scu_module_init() to avoid having to call
> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> >
> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Abel Vesa <abelvesa@kernel.org>

> 
> Just a quick reminder now that -rc1 is out; I think it would be good if this
> could go to Linus for -rc2.
> 
> (Just in case it helps, please let me know if you want me to take it through the
> driver-core tree for this purpose.)

Sure. Go ahead.

Thanks!
