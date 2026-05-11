Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F783CFF6A
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497083; cv=none; b=dCPn6kwEpKR1xfsj4FZvXSwBhxVPy9z8V9o1tvwMNGu546RgkCmNmxuJ/NrWSUu4aB4x8hymVgcUv2Uen5/6T/W+kt1ma4MQ+rt1KCEjI8o0KMUbG+eD+UJhcUMCcCk2XsqDbbNI+T7wOkrNmSPVYqMooxGuHTfJ97QrzXHRiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497083; c=relaxed/simple;
	bh=idKSf0Y7Y4AVRyohvvU0Gin/2AbcPVLAoJEq2SUw1/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyEnfbXUk5JMGb48u+aRpDTnLeDUGOu4YxeLjb1PE61YuTkpD/zEdUoE2kolKaru9zEcI2acrdgrgykzRZ1AfF+he9tRST4/pAuqSeGwM9VgT8RFkXCrT8K3QopEtNaQGFWZJuWSZSknsGPRin86OpXez57tjuXiJ5zq6h1wnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiLl/7Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5cQYI8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiLl/7Yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5cQYI8J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FKmp3332700
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 10:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=; b=PiLl/7Yi0R5gn+5i
	2hy68OfuaYkmHFrpTXSLhlDK+zk83/rRnwe64goU5qbMKvyG0CGjcN9ZvR1aFrA5
	QaX3qj18MpL6FvKb5Q4CS7mqsTLplElGPCax/l3UiXlGs5DV8VFFYDfcddEmWbRh
	5rA4NsRlbho4KGtmjLKn43mY0xHc6EVc7CwAYqEKgCegDzfaOrqJoezjKi/mhF07
	4sbepO1VFPQeY0uiTjtKPw3WIjq3ztMy9L+bLMbIods1sbK1MAtAYnC8yPLHqI4V
	ezyeqDymdwpAVbHV4MqYHncdpVNGAR35lG41AczSE6dxMolj4CTk9QHL3F9NgPuW
	b3WDcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgrtju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 10:58:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso98015821cf.1
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497080; x=1779101880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=V5cQYI8J9Ir3GNKvYh7S/kK5TDNKvAG+QFx5LnHQyLIv55yvLmrsyEg3DhwTQhs327
         UmeK1HpvNVY4oixv4rVFZp/uRXzHSGrFosH7QLzuRegKXmflGKKXA9zvK6paQD9MVPJV
         4HkHccCKcyr0I27HJUjq93bXv9E3GFdO62eb72lYsbPvrVtfts6tDTT2U7MwKsmRM4rt
         5qWqAjtp32wPihLcGRnZ9Hz7L34+Mg2W1DP7HYkwq83yggCNu9f4vBBfyN3J1D0oExvR
         nx532kxtEt74krb8JnHoiEOcJhIprfj7vuJOosM/YYwMgW0Ipd1t3NYK1yO1uK46aLbL
         RcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497080; x=1779101880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=pjueIPVZFoNWEs9umcfpKg8WNVWowquI0s6cDnWWxidq2kkuwtWxktpWuGJU315oP4
         uq50Un/oBdoOdqAwlv+0smx9G2gYNV5nAuMnOjjkFAirswobklUW96iFSrq18muknKlT
         /NrywX/MxNB9Suxm6m/Yl4qijj2AqVkKnInP4kekxBhLwQB6aRC2MxIv9Xhsp40DXxUD
         52SkgXjGegX4pHzLPP3Q51ezecACe46Bj3+V5UfNYMfhAjdS1tmE+ti8Iqkj8Gfu+2x5
         omBHsdqYbJ9ezsLqsZ7aQQf2Imgp9DRiF35ncWyedrEZd2xP5DHLFJLWoWCVux4hWNt3
         he7g==
X-Forwarded-Encrypted: i=1; AFNElJ9ljJJt+Z701InxouPQ2l3pUa1OERVtPcvqf1weHF6BX+UlRo5KYWd9zOwnm9+RtRv2uZDQ0FGcw1jWrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7+rtKAp3aD6WUQGKx/RimSqnWp97aSPIwN89b28/5iv2Q3PKY
	b/oCtBZxWWBxiPbgMraZl2jS4Ud4xVgYRfJxT2Nyx8iHQiRpD8W5tjf8fGgsmFBvI+QznbL2/7E
	GVcEkLIdh8fD4g9M/TDguISbw48pCLUrZTb0pXZ/oSuBOKgRPxDUWtY8IaaBGTMRcjA==
X-Gm-Gg: Acq92OGendkt42AfRCmdeRp/wAMtHVGxl1TyisN0G31asl2EL0iapUl4uGyTOgOCMWA
	MU/RV+pfBDAf5Yce1j62WjfastVX5/pdYwP+bm6B4FayKCtMcv65cBC8IwZSbdEhJX6YBHuPXih
	87NO73kyJO7JGKwucHS758vhv7wGDprvS9JFfvGmYK1icUm2Rxhq+ZzE6gmItjgEt49jy6QBHZC
	+RC+v4tbDTESAhzzEMiDb4bMvyZBABiJkikJEckOCLnOmj597VH7cKke0whXnovL9+nWNg4ph7O
	cF0RD/94bSvY+4p3QRxdsbYbM5MDaZ0kEv8QwcficxDn+eJ6qHXYlPUbycPoZP/2ZPhqUfZ80b+
	NOwXp5tmTSU7TNxea70R66PSN2aol7sx/BX0+m+TRyiyrJnnlCQ==
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570491cf.50.1778497080356;
        Mon, 11 May 2026 03:58:00 -0700 (PDT)
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570131cf.50.1778497079931;
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fffb9bdsm166087555e9.1.2026.05.11.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
Date: Mon, 11 May 2026 12:57:56 +0200
Message-ID: <177849707405.46496.8165024025113766918.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01b639 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TmBss_aizDygq35vy4EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tjin_RdN489EdpAp_D9i6pujWiX8wSUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX7cIcYaYSaggO
 dBySPY38D0i+p5oFWQiM/28C9fGQZZJJv7Uu52uBkhQPB74ihw1s+ZGBogNYmjkrpTpT3kfOkWT
 q4oIn9GuNyU2HoOgmxURQrJJh+QeKC5ki7HPVQILrXzqj1WI/QqikAg4aI5lk16wZN7SRoIDBhX
 B41PwAHTPZw7zOiUdmo0eVj5RXTm175yG5kmaVkEiHkEXNXAPxNPTjBUA5UPZ5ppLmjb0pK5EAC
 95PpR2HiuV9GEelnIsR2gHkMMu5buncACzkNSW5PXr9VFseNILv7v257QwuMMDiCd0xbs5F3DQO
 nuyAo1+wyZDDcJruRO5/KaxBm7XUziFKkJmKtP+KQCfvLQZ3OtHhkj41lOK78aYOJEOcMaA62dr
 nqKd9MWECdJ4k/iLpedRCwwO6DGfQdNacQaHCh2pPuQ2JPVQX6QEhbeKcScqr+XC2gT9tYzyAeI
 Lj8AFEA/KmtrFG5jaNQ==
X-Proofpoint-ORIG-GUID: tjin_RdN489EdpAp_D9i6pujWiX8wSUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121


On Mon, 11 May 2026 12:55:36 +0530, Krishna Chaitanya Chundru wrote:
> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
> D3cold to D0.
> 
> This is pending from long time, there was two attempts done previously to
> add WAKE# support[1], [2]. Those series tried to add support for legacy
> interrupts along with WAKE#. Legacy interrupts are already available in
> the latest kernel and we can ignore them. For the wake IRQ the series is
> trying to use interrupts property define in the device tree.
> 
> [...]

Applied, thanks!

[1/2] gpio: Add fwnode_gpiod_get() helper
      https://git.kernel.org/brgl/c/8a46bd2638f1ad6d1ed73dc3ab10919e67274738

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
