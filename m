Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A86318B91
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402369; cv=none; b=YqI9tJEiQLBiPunCwTHl+uf41svdhJugv4u3PwRvieXpxdRCXdvzbwe8x5yj7Akb4dkoJqowkv37SHQANh/0XhzvUpcDxgUJ65NXhn+0EZszR1vD4g6F4O4+lWRwBSmpzsm1tEfHWLim6qH45qi/ajj6RVQaoCoaf9PQT7qCUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402369; c=relaxed/simple;
	bh=kr27uYpqKnl3/NaFELLNpZzJB0wElVbtKvpi6VqgH1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2dPsB1AgngIPha/aQiJRkve8C2/LEOdZ5Dk+IdzmL5NtCwbUwzPTofZXr2tWPormGIAieigmIhjiHhYJCq7XbC7MeZjJo/a3m9pIqgx6ZnASfnmLYfqAno5uGs/IqNu27PII9Tpyusz7BGLR8nS8k6oOWPoS79uh0UI7Snozkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIyYDvwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGJ/6FZs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIyYDvwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGJ/6FZs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5OdXk4025110
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iocoITrqzOavAzny70iEVGcoDGpxtUqYXZTgwIQV1KU=; b=VIyYDvwG2NMuEJ8Z
	QqIv6XDRxCwMPB3WoF/mNYBu7FrrxN+zjRq0q3qTETgZfWx5BplPVFnJ7wb1Jjxe
	AHOjVekZN2rd4OHTZyoDWXGq/v10wGiBZlnmW7KiUR9mH36eIAS6WFNEPJvHQcBl
	S5HvO1zYyxy7h1EYYseORgqEyVRulDcv7hKtnA63ZGBnp5vK2xhljplyKpxhN7ja
	hJBx8z5OYSUgVyyPpV/XFgGhiz3hO/9CFcAXuZrjYcppsrHA1QqFzXubWwPyzIA5
	UsPgZ0/caPzaPZjjsJLsKfXd815AT9ueXsNM/meSlAvbAOuw+zew5ExzreGF0xD6
	kvk+OQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c0ay4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8f8c81d02so48481475ad.2
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 00:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771402365; x=1772007165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iocoITrqzOavAzny70iEVGcoDGpxtUqYXZTgwIQV1KU=;
        b=fGJ/6FZsu5OQL84S6IM1lBg73buek1aUaSaJaTu82be9kskYeCtSiBixQ7s59NkVyZ
         7m7m0foGkGqbI1oGzEblc0sZ0YILvbb5zGW2I2Dy1JQKGKcFyWrwoqX9tovqUEYifapI
         ekb6N0f4QswYj/MNQmAtvdhxSlrHFnKGBff1wMuOJNtsFfjMWWWNicORUUg2gyE/5WgZ
         KUB7D9ejSRypkhbX2v48EV2oMyXaQacAM/tzy6Jf9b+G9ZtluBxPRk+MdYbgXQqzkkI9
         Nf6fQK+qTQtNOEs+TJEB9iVMmPffmQLQDL91ZVrt4UJ7FT2n0mwc7suBapjEpxdSIecf
         MQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402365; x=1772007165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iocoITrqzOavAzny70iEVGcoDGpxtUqYXZTgwIQV1KU=;
        b=EcGw5TadC9DbfE3mYzA7sYI1MhxSQrcerMk4CS9Oe01kvUYWFVmWsI8yecI2Nbzy9Z
         3lq8Mx3IBjN+hvL6nXtnQPmGCtyJSTZSATlNeJSb3k64MX0TJVeUYENVU0jObY22x4A+
         ujKpeBT6y5lrnNFsLQ3WQwV02GzltbMTrd1LBukar+3T8sk4SiSy/BI1KLUnE2dF2uKN
         PJOb2KQNeR2Z4XhVS+cTpjRGjcLZdIbe+3iyC3IrNvGKKIzEZrEMASuJJ1wXGt7RNoJX
         6U8NlaPlUSzrfp68FET7KVWpplXg134JI5Xa8YdxjLHDEAOrSc5GZz7pnTMISvICr+8D
         tD9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkbd0erqq0SRv0ebrm2Upt21YS49GnILhQCk4Uw6PxoPh4WtXmjhK5sqEIBbvH60eD7DgOCfdi4A6IsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoBTGJptPKH4coFTQWcDu/QmvIq1eUOI2VCB+QOF2NvLJq+o6U
	L8yy5pnfnhTejln+ketS4E81uPyIorzQoE1k1mPMODt69ojQoOvbi213rBLC2ucSy4JmGCdrwaP
	22nCWvRVNQXCEkTmgaovn0ORJeuOrvVAnzhF5UUm7t7s70xy4mHsBWavEckdPdG3Liw==
X-Gm-Gg: AZuq6aJD+l/4LxplZcMKEN9UN2XYKxJv9M3ayZ/MpJesajvvNQX45kCx83F312pOcPC
	hG4YTNEC3lVRyhj5RnqP2Zu+TtIpsTIRSlmbrxToX3t/orNQWEoFeexDfdo8hYsHvP9ScLB155z
	Kx18GNMO9DzZNksXljj/jkG/GibfQK+zUhVSIzhCcm/kNK95qvSF7OqhXmipVJdYLiLtuCVEA9E
	mB7Rt6hmxthnKg1NU9n1KlINND5mWiJk2xzotzPBYgCNOzaOFrqkUFzQo7dmPKz71iVhrG1zdSe
	po6Sf/rN6Zsk2y45j2OPKq5LGji55XCEDuYljB1VWZPLSRczcm9ajILYmx7rqUY+0BD9k/8ZwDh
	owZDRpwqCsgofU+o+zASh0gz0nA/tW48dhSD8/8ucp61X7xubBTx7KvGd
X-Received: by 2002:a17:903:320e:b0:2a9:5c0b:e5f4 with SMTP id d9443c01a7336-2ab505c0e87mr138782725ad.28.1771402365447;
        Wed, 18 Feb 2026 00:12:45 -0800 (PST)
X-Received: by 2002:a17:903:320e:b0:2a9:5c0b:e5f4 with SMTP id d9443c01a7336-2ab505c0e87mr138782615ad.28.1771402364996;
        Wed, 18 Feb 2026 00:12:44 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d624esm118123685ad.49.2026.02.18.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:12:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 13:42:24 +0530
Subject: [PATCH v7 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-wakeirq_support-v7-2-0d4689830207@oss.qualcomm.com>
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
In-Reply-To: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771402347; l=1194;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kr27uYpqKnl3/NaFELLNpZzJB0wElVbtKvpi6VqgH1k=;
 b=CHIK6Dfv3xgeAdlKFHR8JSiT1167UOJDFNWBSMNuEKKQj5r4d7YEoEK+RMUc/wYwINFP5f56O
 Nubwn8ni7TBC+yld0IihIzYNB+K6wwABaSn5UR9uMig/MvicYBQ3pFu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: jJmwiK2D5AFISi_yc5d7DGAnerSc2g2w
X-Proofpoint-ORIG-GUID: jJmwiK2D5AFISi_yc5d7DGAnerSc2g2w
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995747e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3MSBTYWx0ZWRfXy6mJOH7K58Uy
 jT0qTTzK7ZANO8jxXVJHV0K3Z+BIc312a1SGtP5IHJ8GX8QN0A/yXgQTZWrYgJD8IkAImopThiy
 lEXV0cAf3HhWD2sGNuv6ksMu42+uMUe8glnDvU3Dq+c//tKSl6PfeFIwlcVNTOu6uDK825O1Q3a
 GaUHzRIfXdX6j1kAgrrpCnsouLEaIe0P6m4oUzF1e/Lb2GFpJVeZhuRsZm0zKURQW5BdBQw0uw3
 DiMWsgvlVzHGtejEESBHYQB4a/QEpETi9uutPeIc4OZ3R5gnSarsCE7w4nQfHpjg06y2G4HaWgF
 jgV4nOryeGJzi/auzD+05x4IsUh6++wUXZcjTlQfiKZsxwXHYobe4QnVrxh1mr7wXyhfAX1pHY0
 6+4pAlGUOz1TeigrZ3UKUILTZI5vG0tT09nZsxsFa61b4NUyo7ZwD5+SgXd//ODpQ07T3YHKNNC
 qOo8PL3sx3xMLgKknJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180071

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
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

