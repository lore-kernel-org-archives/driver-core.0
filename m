Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685791;
	b=PyrTdvpWzCn6y1xG+40kWCRMd2ucANNSnXgPJJBTB7fnaXlTJbZhk/e+eUT5nf6+XwQM
	 vshxTTRpmh6hKY2ODRwIU2J3KS57x1B0NLrJNs5GfcmNwlJjx8OfFHCuTsLJ+dQ5YH+V3
	 A1YLAPCR+El0eZhzOAwe9kOiV6qfV3Z+nf00Fc45Ut32HR8antZAFid/XA8dQxY7/NGE0
	 qWikeb/rEeo8CCfNP4dgquUdpumcupYzoUJCTbGUR/FgnJQlVSQ+t8QwKFc8STB33uWXF
	 1TqrDX1v0jfzMd6e2BFDYPLR1aRuYAcLd0uIp/euYLPJMY26EaVP2J83i+jfchRHiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=5TjYA2utxldsLQmnxpPQ5aT0iFXNFf2Dme0if0qZNasvkQOAgKuhdE0KtmfZSOig1m+0
	 xaxo1ereqa+8tbbiwB3X7onKvIJmLOMjlIj0KqTV8Jak4zz7ydgQdaryWfvonkgOEBYpl
	 9k4Addis0gs0jqqRTmLue4nCuUuqTG73RI/uzpdFLBfy3x55QviBC359e2mScigW7OCqc
	 LPkDMv4HSIul5PJsj+sU/aMxp3IhT8HGshsDcQxYGmyUa7l0PLFV48AjTNUzE3Xa+IYZ1
	 QpyhVvJaCNbL+eyyBHi7mVvoCCVweYQL1KBDa318XP95OgOXm13yxh+a+nv9Otu9GbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XqrVqdyZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858F606A32D
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9858F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XqrVqdyZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B16I2175705
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=HvTU+1Lr0+TayoIV
	jjYxb6eyo99o+UgT/AVaicpY6fcDbW1BMaAX0d223RgCG3hu7zG9AVl6pJuaUzfy
	Eks6iYYvykbAa2pKrAnT6sHg4oGwjRknvKzaDP8pNRX1tuNpAFRhcbcWwkBU6m5/
	wbncP+VOqEGGJcwgS7ZZFH6WAa401chJSCR/I4qf1TDjTT4xmNYPjFoVTAxnCyoX
	k3iAh1KQl0yjEWlKbBQpp75dMJQin2AIa3TVJv7H14t3+3icXGyUAEGtcSJm0pSX
	kQ0WWtPX+r+owfwkZwxH/uyHiZtARvdH8Trx+pPCSIzMCaa7KXk56rJEYFFgbXRl
	mixz2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahut08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso370133285a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685789; x=1796290589; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=XqrVqdyZTZtwrVdxNRgV3Z1P5f9+7AHLvPv/fVs1qlT8BUxMIUumgkHqG/+9M/TOMI
         fYEZs8zOV9MVKWlAG4TwCSJqoiDXgbnEMzu+84bQQ1b7tgJx3ViVcAVK/SICviXUKX5m
         yrde0V0MnFwRL8E0Td9yUNlnobv6dYIFiCgwOKRf4TM9UMp2tPDj/Z5MAXNfdeBbcrdl
         h6Z5SQM9mg6rfJDQRoadXJg81/K1ZhPilxVPF/zFAg34YvpQJKjWekHUMKbr/Egj1k42
         E8ZoyJGTaXj7qc22LLbENbOMlDFY1Po1DVivIxBPyLIPJT5mOXKar7ROfiuNhDo5EriD
         KmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685789; x=1796290589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=uBOxIEO6R3uQ5yobmBZbTML8517pCQpdJxKZJLGr1fZIkplRXuGoH+cKscGA2lwpjE
         mlxy1/BfUvym0b0HinwvQ7NRP6bdWe1Mu0elbQi/Z0eDlwJjYQl3HvS1ku86IQGyb0ry
         OcsXBugUTh8vLZwOjOalm35Rreu2spPnuVE7G1b9NUXiHUdjYO5b8T8Cd604bNt4pTgh
         xTLJ+hThzLaBSdwR98uNnf1Gol722mOtZftPAZZcdecPMSb4J5OTTtJo45GJtKoI3mn9
         2pZIPVmjBG9moV1yfILxL6RhAHRNo9M2k3IQc6f3YnO1bJo4J4YbwN+HYeFwrr5vFqBd
         ZlSg==
X-Forwarded-Encrypted: i=1; AL+hErH1hU6aMmGztVGJE+UPCMDKhD0VD3HCw7zmxEgtT+aDD5prQjkw2QHngj6vUzreyw7ArjZpkXip1sl3/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/pH7baMwXVE6ji4mZPR5v1YwNKPcQcfyRosnGwqZyF+QYh4wCR
	4FCOrp00sRBPLHiKschwSHvQEbEG3K4NuQ9/NrCMRekZQhpCf6n+HamV9YBetbpr1SjrC90NWJc
	+Y4VzOCNA2m1A8qMFvojvBgxvJX1uSShTNcOLyzF2TQg0dtuiJi0dmb9DGraMK0qJCw==
X-Gm-Gg: AZFdTZfKWWd0eb1HxKn4AtLHwJ2xX4NLBLjm5BN05jmtTl/v9HFkFhX3pyXpdBJv19d
	O1Un5GTdPi7Wz/Tuy0G39FFoeyoGPhKPF0xw/W9WwbN2ABSCua9JPX2ih1BEX3MBYVQNtsapjBn
	mYQ70pGaXm3QllPt8btfeH7rrzWhe4TDCceWXLnnwoxLl2lWpQMPLKCEHWvmZYfnuLP3N8LB6mT
	8R3LCJYvsQ0iM+qp6ZuAWMwMjSRhQh6/SLUQYO4sfCbgHP0HlXNbVpZpYV4Rd4OjHPXna0MX2eD
	atgk0IvkzKoNw/Iysz7GJN4kHn0RJKdX2p9S+Lp7vNcN9zKCMOqcEPKHHeHRhBYvVkfGed9TCce
	4i9g3v6DvHV91Q/jEesMe60KG4hhTAkqzOdgxxM+yTmeSM2aVtnQsaVMQc4jewWtj5zB8qmn92g
	AO1Q==
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832613085a.43.1795685788862;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832608285a.43.1795685788429;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:19 +0100
Subject: [PATCH v4 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-fwnode-for-each-prop-v4-2-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UmlNPXMYUFj1OkyjJlNtUg+TUKM1XF8Nu7
 d7XYDXF1R2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8xCD/9IYhGx3cvDc9WQWKHuSblgrzMbds4fs/OJHOvppEcKmijm7eXlATdeZIwTvT3isiBUj4X
 vMkHZeEcEb3x5E6sPII4oL2sLrwLi6Sc0G687C90sYbHjuaF/cvPNwQ34R53OhVsSusUhpn8UHL
 ba9XnX808PqRAwtsHkPJei/FdYKzTAjyLVJTlIjXVh8ePI8zN6IjdXJRCSsPodY5I64A/swlRIx
 fpIfZWyra+oHPh/oY6PilA0cVcLLOLrKe/pvRKp6RxQaCenoPI3s+HYRsODp8vMD+YFabDJRoBF
 Ttfb9xQb8DiNf6sW9Vs6Hz4vwtoINt/h2jzIRwaRntNqP9wbgGcgdDZCMqoSXfX8XPLJ0eY401A
 SlgEgNSWLenIYKcrGhH25okc+JMMYO3oJ55c6yKNT4XbAxUTpMzsB7obKMj/c3dWzHJnQ9QoJ7h
 pqZ2qtHyWZ92+t7QLHW8TqRS7pvmu7vuvBeAJOSI4K3CkAzlm5XUE6Y6NOs72ti+GUvdN9Kj0KD
 DMwOqA0PUUR/Rz379B1UlFOzYoGhxCGxC7Kkwy90FcAsR9whZuHVEf6/oVrPLf6K244LKS7AlzP
 AC6jyUhZAuwrmwu0In9diKO6B6mIe7ozf7LbBcG5/Cl8f9QkcSYK6xla6At0MSFKKhgCB7waqvE
 xLx5I9axDKDlkjw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: aeuVz7HMSat1sziPTpmzSXf-LD1sKxvx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX3yc6a00a4VWt
 5EnP5mvh6Kb0uhPnm6oLqAFB4lwszlOmceKSUZEL4BYjpn38EbiNPlqDg/NfCsITNb0olnzbwzK
 /7df6+Lx6PWabHy4MD3R828Sus4osbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX6erb8N+NvigO
 +kqhNejfhZwE5Dlxw5ozq4SSH9l1FhP1TPYtnn/KJ/ehTt8RcdKUGwS4GFDe5zb2864a2yqoy5E
 1j59rGY1YWao7zjvRzUvHtSUCcu32BU1GpidvGPtfBgBJbfiCI6jZFYpRojXwIMmJY7GSSLnrCA
 nDQDjzTlLEBqqZevNErh6XA4/YZfvwdbElIEOkREDJMvHCuS1kRMrM6oXOJMAKWnkt8dGbY/z30
 8rd9/7cZXYfJ7ZaAlSbeqMZddbz0ExvrrsN2X4sNljytbC8D9wzrVZEvhj3QaCoxsm9JFhtUD4x
 46J5NtxuV7CBEP4Th7BVM7ETqetNm1uGNcJfeLEG/Tvm3zAcWvjsK5JcaJ7MAhCnZU9YKcr3JxR
 K3h7ZiynfSIwgRhn1jashdp4htT8GS4qIDGum9KfcOj9RPL0cLoTHi0pCxoSHHIdqxcIs0vWsZ/
 i09EEVSkiZuALMi28Ew==
X-Proofpoint-ORIG-GUID: aeuVz7HMSat1sziPTpmzSXf-LD1sKxvx
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07fd9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

