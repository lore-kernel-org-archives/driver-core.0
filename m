Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F333B6D5
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484372; cv=none; b=gw3TV1TSJjPrDcWMzSyA4tDjHbnF60PJyGEFRHr/D8jUHRoTR29V/bBn45Y67y9hENmuRfjVm2xeFkD2PFj5Cr4ir4bDh/FLfCsE8AiW9yEQrLn8Z0aesyq1T+rOiPWAUvP3mVzoZZ0xsceyNHjDOw6te91BD95I/+y6Qn9be8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484372; c=relaxed/simple;
	bh=OIVso6kWZkQJvNF2O9NjSG2Jaux2+AUyYMRQLCpdO1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl0/k47WykfezcUvsWVEwDn/05wDAzysGuQvhNnmGIQGv6QAyvXDs73y0RimGrkTv+TuXjLuNdHFzexBUN5QgcgKQRAAG7PxvAhe53VdsIXJyuRD2ryuZCjjgReJzv3oNNNhnYsaLIxvF5hT8ci0r5IjfLskuU8HfKvLvW7aHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgJTcxmJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeG5iu0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgJTcxmJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeG5iu0X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gWT2775038
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=; b=lgJTcxmJIuGsF2hb
	LBA2KhTMxmWZelTXNMdlAYNaGW+n8Z7vAQp0RfLwbp36a9hFyb/X/JEG5pvFk/oA
	TluSleToCOiqDhaQuIVATdQ2C1DEwC21WPV9N/5jsQbcF1exXr+aykLPK3k6OnD0
	+QcaP/9M/5RYe45DSlc66pddDI7AgSOquf0oNAuprCAkGaHibdYpsJeSRCtBSlsd
	lEHnLf7kxaV5lrC3YMhxEJM7beyetCpRNbWriMyEv6G1jSfqdpvIVST5w1stQ++9
	cIiYsOatwMD/FeCpsAuV1rZ0UNpVJr4UFldSzKANmHNPTVloE5C3f/OgYSk7P1nH
	rNq3Cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32g4pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so3816867a91.3
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778484370; x=1779089170; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=;
        b=PeG5iu0Xbi0KS//5IcK/R87lXViPGEsD1MdCnh3U27tqkcDSRWTQb65NCV0abPiHk/
         ZF3E0/lG5F62jqp8ZIFpPGDshjyya1zRgJIHc2tPgNsL67QHzG3mo45Zywx/pBPE4MXz
         PZ0aS8x/0MY0br0joJcbpNrhXyKEUwuJg9IuRQmttTAH8VKHnHB31j62gsRRpvgCyRah
         cO8T9Lv9YKEjZ6KZ8t8B/SWvj8wxBxVKyyEGeq98GqVHVSWCxpBbF6cwFJbg21gGc6wt
         p3I/az6idCg5X4jRTzKkcL2ELfgT+4UMsB8SMCP/o35xpf9ovx1kjEba2xGAUbrXsQDA
         SKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484370; x=1779089170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=;
        b=ImgFPvXTsM3HefDeksWxfFuSmWa9EDSASphJDJzS6CRaRZPHF1xWEsyfhNLT049ol0
         JBfsYe24h0viyS1ogYPQ5K4ZjfdPWKAHvBZeFOBiRkoS4B7Vv/MfSemXlOP4Z7DgIhPU
         nppoIHt/s42zob2v/204aWnnXic12Voqzf/0dCCZm22FzXcSMWY6RxsZAPXQvkcRL8S0
         tpaw1Xrbi6C5DKB8rJ+QJWHuC2WjafhbzYI6RMFCE/Bdm+qGP2p8f09UcRR7da7x7uji
         iJtLd+zCLnr+ya9zfPBvVr8ka1Q/vWv6YHnqcpd+evHqqpnxnXA1OzjhVgPZkaWkKMlE
         iHqg==
X-Forwarded-Encrypted: i=1; AFNElJ+PvGRgKiNVAS7TureDOyqNknJzug3da5ab5LTy6ebOABDmYc/QXRfhnekXzwOceAbhXJthtfCUg2UhdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ/UWq8gxVXxLe21AElU+ETfvYOUOmsBd1nU3QRCgG7ym+W4og
	kszgTOQgAwaBegCtcQo3Lo8+0spknv9jNm7d6hTKhiWhJpzpvedKiDawATrgJadNZayxbDtZbJk
	wg0DExxB3dEtqjjRE5iYMv6J/TSJ9SrnQ777L5c35Z5NbtbH+Dx4pPbL+T+OkJj7hmw==
X-Gm-Gg: Acq92OHaP7wmpov0dLuyVeJ3U5wlqP35k+HkS5DXgP0hPbc7+o6p7Mle/qjowIF/Pde
	fvgUxMionuCy3L6KBMZEo8p1gFO03yW4K5fzN97765bbWy5Ruumfsw31Wh2BuBa7402sMLoJVDm
	9xSivxEacMPlkVyKdUkAYfcdAtIp/+rI5M/v1DtK4U+uvxqhh+AnYjnPnuN5wOhnxNQenACOXsB
	pj0DXdM/FxKF/HoTg5fvDtN7E6JYoemwdRpo/lHem6PZTUzKdo91AGRwYFd9zRRBOfQEBdFq4uX
	ha8KFwhOigGjkYuokGHS96+sOuiW4An3yE9f0Kn8l4dy3bm9uGUsdeNWSG48X5WE6OY1L/wD0P5
	09H8RJQfshgLSCstnJi3RGyoB3bAD+UFsqRHo3+cH5E5klEDJCc7FO+ty9PuKqdUCQds=
X-Received: by 2002:a17:90b:578d:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-365ac47b367mr22785777a91.19.1778484369650;
        Mon, 11 May 2026 00:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:578d:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-365ac47b367mr22785751a91.19.1778484369189;
        Mon, 11 May 2026 00:26:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367beac2c7dsm3314306a91.5.2026.05.11.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:26:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:55:37 +0530
Subject: [PATCH v10 1/2] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-wakeirq_support-v10-1-c10af9c9eb8c@oss.qualcomm.com>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778484355; l=1362;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OIVso6kWZkQJvNF2O9NjSG2Jaux2+AUyYMRQLCpdO1Y=;
 b=XFdAtRZMzFR+THosoBwQeZxYToTdCzQYhelBf3Jq0YIvKT+wMt7DAzEXogwgPnpVglW06nLiI
 VpNcQwOF8/gC1RFuTGFgDi0TBkBMjhT1VHRnR23XzEeqyXL5aBfnQ0B
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: rv01h4afA4ehCf-reUJGBNhGOmHEd4CK
X-Proofpoint-GUID: rv01h4afA4ehCf-reUJGBNhGOmHEd4CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4MSBTYWx0ZWRfXzWo9z//3N+l3
 QYs1CD5a8qal9Wc4wGLn0LMK0QN3SlN8AaQKvI6CgFzlYGXGJZC9s/YoIDMVQLyU+2emnjrEp1q
 jlM20U8+p4EKICyhrWZKwlMA1jcKPHXJN8ugv9Wf0auVUFx+dZwWVX/DQfw+ztBu0RWMDjFHfvP
 t1SYIAFsDP2nzE+0rCwauwThnVNOAfWiWteJdCTlTFfauVvetX8aOqwCe9/VqK8BxMLUXX7Fsqp
 XvWp+cLr5zDdQFY+3eui3qHJq8sRy2bFc8+e+qBEuXOLUnLUacluCsIgEXslU+q9JQtt9ZTxzQD
 og4iXSpK6vB/LvWP2UdBvu/RMjVBPSc7+4N1/Fkx516xz+kMkfR5AmXnOsKPisLy36bI/QuBIbB
 6znGVc9Jlk8dLsJVea89T0LVjJYfIQ3gWB6Ua9KrUZoK4DrFVAnkOOgYhmFMBOTAIoglkgdpH/H
 neGh+n5EvhLYOIzjsJg==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a018492 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110081

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 3efb5cb1e1d1..e2601217a71d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -598,6 +598,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1

