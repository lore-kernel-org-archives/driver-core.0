Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CCE33F8D6
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497344; cv=none; b=g8KfopCzbpqhPx5AXg0kf7x9EsYGEkLbF6u/+4ok6Xo5nHGZpyd2HV8JtqwNK+M1qcSX1LGnOBSgSNbDOUlQIo5ckDFWZAPT3ZpvjPgZypvnPUmP7r/5z9mdxQS0SDgV1hoBuDuhSDPk1WTgIZXY1kvyaUcOtEnnHvXwN1V0b9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497344; c=relaxed/simple;
	bh=tTNXMZH6Ae+7u/TjfyIMvdzqq0hdS/+lhtAgJD0DOPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRHsNzYWNbf0lZzMeaOUA1sxBqgdpYQpZnPC53ELc5rh06i6MbaSaj9JcWUM3G5MFLNalAcUslkEAJLPYplObJly0+DSWDUMXANLPOa1IVkzOBxlYmt7w+aDYPD9cbQM1Anc+VPSiP6mNjeqPLwXkyjP8KHdcGBGjyI6LC6YNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvffCpGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoNweq9U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvffCpGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoNweq9U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7AEiP1258762
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 11:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+g
	ykgxHWXQ=; b=AvffCpGgIyC4GPNB+NsO/7GqsYPjpKtpaDnvWyzJsXXHU2V8MVj
	u6NJiopbN8d3rn3Pb6mZpErVt4hulbzaPob2+Ymgc8YGqXgJEqcLkbee1Q0N5nVB
	sC30wU8p5ypVBbJYDhfJgcsR1x5VBgpcBiQzHdSHJdVymSXEUcaxfWKiAs69oHD1
	uX9NcKp5YleHe2O1D4Z+SelyRvlYkQomvH7elqgnbYR/f9QysOUF0yLK/1qpU0B8
	OyO+dgirOSmkA2rJEyWMZlKcUs84puxBy/zHCWYSBjiLNWTxnjGAJA1zEFiyOsgm
	ZqBquMHFEUKk4AWBf7zjTG1ugAxSibri8aQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20uc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 11:02:21 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6967b799acdso8036134eaf.3
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497341; x=1779102141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=AoNweq9UDIH2SuHhVd/SfVwH/K4IitXxHynfk+VjeUlsi0DPa2TarVbbyXTwsYUmbR
         V2mDNkA1KpGPSDZdoXFbxVEOzD4J+l6/H7xabrGYBV7ZGUpJQNonM2lRLN3CSudAEhSh
         FsJ9af1vYlIFQxND3wRI34fZAMsqP/mb2pGVNOXHrKcyIXvjEqUk4TPw6GHJw60O3IWg
         aDllSy8Z28/xX7uwtSRlgJpxc/8SUaDerspbW3V/TemXssw6jRDrFIrY3lOpNojOcYFX
         gyFP7tGrRrUqqd1TkLWkmG72UWSWz/TvuTF9jV3YYRVR6PwTtXUESsEWmxTwa+35FzU9
         YCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497341; x=1779102141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=EcXOPYtktnfX6v2dtVfowcDSe0yYc/ScvXCMA+YvOXziR4O/TOExvCk3Mwb2VXjAs8
         4QncbIE4ic00tLTrXe0hOOeXuOJ1lADHlxYp+BHlSfnGZ7jX6m+eI2D5kWiMSM9LaXk1
         vI0jCMwAFCmyinbaF5z6dvkqKVRJxTDuIlKDa2NHMIvNq9n56YRwaV3f17ffi0ctUjCv
         Y1LeEU6FPVK1PROsi4lUQLUB7a0/5t9cw2GOEMiW7wY2rRv+fRIBgNRXJfvOWXGP0ceS
         ttrkidgJLB1nCnn3sSB2A1eF4H/jfbHryZYNWLjuBeyUcgakcv9XumfXbIEmvA18nk+f
         uwyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vevZ/pcJrbkHOg9yQmqMiJcZI5XIN1Vk49/4g25ULQi1Ia4ej9wy+SxqpxPtjglZ5ICKsxPND3SAqxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy72cbE2kYNWwTMBp9sbB8h5qA22uaOcnnzhaVev2e82PzWtjT
	5zkOcdEsZarqGMOcUo3Fs/z+YZzpTXdqUL5hBMeRI47BrrAULetHZC5FRho1ItFVazijHfbrwux
	QmHMMRTh205PahbDbvY34nPPgNCtk6Hq7rJdwgCVgG6rTFS+RrP6aAdCUFcNj7jqcug==
X-Gm-Gg: Acq92OFK9p/k3/HXRQKheHUzHv8fKCAruSpbaylvm1Oi0TzsGGAaXWRpP27W750kJxe
	ue8kxMTfI0sLP/WwrIn2W5VpyjcVkOzwz0yutOoe7qwCDIZsLX+f+rg8qzwThdPnyyXhHOm1UDQ
	WPlNakqrk0o5LNyhcs5H9U9TVBM2NzykUiiHNLmMDydu9b+RrCXrLJK9LrUKGhGX5a6ZHnb/Dq4
	zJ/G28BRpp6I5jm1jPmmfWqXt1J3V9w4648uDRlNXvxY6DSYn/T3fh//IVdAdGYN2VlN0GPY4RX
	1JVT7r+B1kffybfh05Baq5qCiVbav8b7Pg4t7221xHdDxNuMMu05KboQMW9TN9n2bR1DoY+MD5O
	GEXp9t/GTY00voB5junYT/zPufL5FJJG0xR2DorumMh8aNvo+q7VtyS2X1UeO
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284320eaf.8.1778497340823;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284298eaf.8.1778497340436;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm109967955e9.0.2026.05.11.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:02:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org
Subject: [GIT PULL] Immutable branch between the GPIO and PCI trees for v7.2-rc1
Date: Mon, 11 May 2026 13:02:09 +0200
Message-ID: <20260511110210.46711-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3c0r_7bE98fA9KCg4PIZq9ksYXbk3J_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMiBTYWx0ZWRfX2335q3yFR8si
 uNL/UqzZ5yM2vW3gNP7A7924Ec/uTDx1JubjNLjy/sEubrm2t1STOcaOX7RY8DTA0hOkkHpewpr
 5z8ppmW57FY6e4NOXtCVaobAKDm2UeCIjebp0AeLn0LyCbu13Iw9Wcuau4ThI1AjkhUZFOUGCk0
 InkqdH2tyu/MGc8Cn7Nvy5y6AGPwecjEe3hjfAq48i6Vx+mmr+zcB+tGy1U53eZ6paEGMOLzq5T
 sMUQ6FamAmzZn1DcBEwDYWOD5b0btLmdU37J20iMNNj1Sy+lZuKSmal76TBoQU19tJsuXym4oXa
 aVSoqJpZ2heqUKJJ+ZDlyEmCQb8GsEe6OKlC7Ad/wRn+4bl8rxAy6EltpwWRT8r/m537cQIvouH
 LptyvAQseu3BMEAJB/LigSCd5qgVk75YdHzFS93/1AIcvXYwrQ4SdrxCXh+lkXsyzmYfvmPbr8f
 s9dzEsIefBCl0/4Ivyg==
X-Proofpoint-GUID: 3c0r_7bE98fA9KCg4PIZq9ksYXbk3J_7
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01b73d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=OnGjS8KU5By8L4kgiv0A:9
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110122

From: 

Bjorn,

Please pull the following changeset adding a new helper to the GPIO
consumer API.

Thanks,
Bartosz

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-gpio-add-fwnode-gpiod-get-for-v7.2

for you to fetch changes up to 8a46bd2638f1ad6d1ed73dc3ab10919e67274738:

  gpio: Add fwnode_gpiod_get() helper (2026-05-11 12:57:48 +0200)

----------------------------------------------------------------
Immutable branch between the GPIO and PCI trees for v7.2

- add fwnode_gpiod_get() helper to GPIOLIB

----------------------------------------------------------------
Krishna Chaitanya Chundru (1):
      gpio: Add fwnode_gpiod_get() helper

 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)
