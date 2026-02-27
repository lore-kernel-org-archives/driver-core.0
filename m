Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9E23B52ED
	for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182746; cv=none; b=omADSW6PuSy9goLXKQfq1NRwIw7acICaI58f/FbWaRSCTcWaaw9VO2FFaWFAM3eoKSUJyUT4QXyfSqz/GUVSKoutqTUSmAIoQWZWGz7LOUfvkyiPJt4llmto+9W4PBKpf3y8Sf1R9rY4eHJFkXS7wyB9PXYijsljUwCkpaezKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182746; c=relaxed/simple;
	bh=fB5UjQPpD+D9qZyDCB8SYs/gFWNRAvvueceaPw1cEQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxKfGfQnyrHfAxipO/zqg3Lw+D8OrIuNnBNZeY1JJZh+Ca2ZqlHbxGd0scD6Kfa2mvOVFdGxM1gLUo8Hen/jMNWtOxFUI0973ttiMB3oM4OJkGLgxSDXbyGB9JN8UqEY28QodUhEOwyKrY8ScHjt7R8cIWn4FCQfEYtbArlCito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4/1+DXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvFzTW7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4/1+DXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvFzTW7U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JvJB2982225
	for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=; b=R4/1+DXQpBbCj2El
	llgdt2vPmQDBD8CFDy0MVKnkTd6eQXyKPPjuJVc6VvjxtX+SNfJ1XVcP96ZnlQIq
	C14W/xWsGKw1PkGbAG8UTQhqJXfuCdwWA345FOqCMniL/G0ZgxHgRWh7g7ltJ7Ot
	ouerbdN7CU70HTNcHDmT6yKgpIE9iYLS8kKU9hwoOnYI8ubZ0ZNvKrgvjy3mn2eV
	Uf7WgWvNaZx79bXOI0Hx7QYJNAwjcqsT5SBietDJzXJyahRuFdjXEUakcKDo+X0i
	sDIcqTa6/RKUILUhW93HBCN40FaiQaUrXHR2kF/uN+JHktF4fT9UZpmSF9jDA+ZJ
	fVHd+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v4f1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso1918803785a.1
        for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 00:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772182744; x=1772787544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=;
        b=fvFzTW7Uo0mZGRwO6o5nuSRUSXB/J7zcXJFrhXK28ybcPP2olF2Bqg2ob/qsNydYiD
         dblcjHjBqyrwaG9C4Zm0WxDEoR7Am8ipy+njQV5d780NYydKyK8TCIYfqE953dj9a33V
         TLNIpV/Nx8RImbUBh5T6N/ciqWLm+6TsseGJ2Hh17WzKjRmsX8P9vuFqa6POIPfVm8JL
         zzpGv3m1ADkD0CSF8gx4dWS/VlQlR4bIxFeDSpSIlqO8vVo1ybjwoJq3Ntm+OGV59MeY
         dilCaBJL5K5nuJENmzJ4IxrMpSEHJtTgBNu839pjsthcl3JR0eopEoqKvI70YWIoeej1
         JkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182744; x=1772787544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=;
        b=XVQHR7OySWLLXWro2HAb/VVmPg6yrWpi7+rnQeeoxRwwJuhaYlIhqyvFA5cJt4t2pG
         nDwenHgC0pa0Pi1OcOUvNbaCng7Qg5c7o6L8GHC29Yc7LMakRBCENtWbKtyPJ8domtib
         +hrAHvIdaD2DOgFi7ppaPo7eX+PH9cB0ssCJZNAHzDKkK+3QPchDEmmFr9YYvecHQPw2
         CirzOgP1R9/zFbmvvVEzbdbISC/gpj7v0yQU8/wxeZoSAa1BjRh5cams/BpGZAhfwQsL
         rONjKAymskOv/kCOcaDhdvdXYIfzm2BqrnYKIAL0U+44juqpw3o24y5RTIHtgDjjezYD
         dkHQ==
X-Gm-Message-State: AOJu0YzdyNdB8j6AKfljmC5t0UmmQtLa4wn/MM4xmSri94GhsXn7xY4v
	gRRpwR3/ba0CGcknes6LI+zspJOT7EfMbYIYKpL7bfH9ZS5emSBkuMaIzz7G8lZKtDsJ3gWdp6V
	FzJpP069ySyh3vIP2xv1ppuzmxQCgH7/tY8fRQdYpYQbOws+CH5paCD97IUtWI4KeAw==
X-Gm-Gg: ATEYQzzwdXnZSmWHyVs5TunVNCwFypK3PG/9qOlANenxXkTKprRcqs4bS4n15CVN2Dh
	EhLLvq2sc8w6zuwN8lwL9m6rsigXf/zFZJ5xaD+tg6Y1/7WoP8ZtLLjk89OmzrtKwVw6tqBOzxE
	Tu5UKwoAurLCm6wL+7s6f/VizN6B5VBvH4yl30LasqfDDMO9Tytas+R0SFvi+TuVnj+kDv4+HLr
	BY8eVxQBa6ZLpwOVeDdM8UALEcODlPBiqIhSOFoyYg//7CIefZjzgrnYkalq8FeaoJy3Vt88gkG
	iwp0Z8CIWrs+e++KvhXlx7r97Twko//+OvUA9L1b3eB9jL0xsbA/VRhqJ4yGESkVSPQyqQpF5VC
	29LrlU1hHZ/xCPsdUtTEt/PIwORuA0Xryb1MGGtny/kNdLf4qS8s=
X-Received: by 2002:a05:620a:1726:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cbc8d9d7d0mr259516185a.34.1772182744210;
        Fri, 27 Feb 2026 00:59:04 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cbc8d9d7d0mr259512585a.34.1772182743777;
        Fri, 27 Feb 2026 00:59:03 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm224129855e9.5.2026.02.27.00.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:59:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
Date: Fri, 27 Feb 2026 09:58:57 +0100
Message-ID: <177218264423.8055.13971416115087410858.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
References: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H4iJ8Z3yzqpaQdYehVwIN07ZQphJvrNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3NyBTYWx0ZWRfX+cHR0OX09bLe
 dY0eYQMkgasCITimuEEUkTwLcxTzK3F+aeNFtdmdieFCx1UxTISr8wVOr1UCDzsaBxs00ZGrDpF
 MDzliYyklQGfjTs1menkiT8TwOSyaoFhNmBVC1G/74TSadwyC2/igAfUy+RTjJUhmi7o8Osd8o0
 NaPTzAfpoMGSqXG/Q/W3gAoSeFi0GbQbelfujm/mRixzmKFY7XKGs5YN9xKaQ7eWgS09+GuYVS3
 gr4UhACHyGdELUd9OPVETCNBTENqKxkztlRJmb3H5uKQL3KPDJgnX8Lw+8VzMrkmDKTd2s3+JRK
 tylvGAGsAoIR9vukvJO/vTHBCUzT/jNLa4eRpftlwQdvwaOWdgi343vAlRO2jtpymBiPnpDM4AL
 P4lUHihg8KLPWOf9FOErs1KxJREB9r2itfREjR3fJaQpHcx7Vz584VWp+dY/q6cQHK4HsQ/ztyL
 b64CM0JiVdMn4eDwKfg==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a15cd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=riAGlF5WBYjY1qQTpiUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: H4iJ8Z3yzqpaQdYehVwIN07ZQphJvrNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270077


On Thu, 26 Feb 2026 10:56:36 +0100, Bartosz Golaszewski wrote:
> In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> reference to a specific fwnode, we only match it against the primary
> node of the controllers. Let's extend that to also the secondary node by
> reworking gpio_chip_match_by_fwnode()
> 
> 

Applied, thanks!

[1/1] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
      https://git.kernel.org/brgl/c/eb58f2b9bb0909ebce64e1a90b21b5cc2c9f17df

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
