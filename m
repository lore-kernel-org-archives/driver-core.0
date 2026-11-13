Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584836;
	b=U70wpXbaDxc8g/2+9P/0QmOHyKpU1eGRwQ+PdBURCeJkwkMAGItY3V5md3ILqn2X8Ngg
	 8C/ydELpt3LfofiRV6KHvaOPUrmqCa4jcLEr090jpcudRJVuqH+B88/NP9QOxV5bjG8Ov
	 CKJEjPupyDl8lttojipEvPn5DfdcWNqeX8Y72/4apk6R7Tzg85Rx2UAdHn+roVYFZLKtd
	 ZDxjda2FLVRA9zNEScd1M86K160JEA7mcwzlyT2WHuDdHp5dGL605Jkcrg+U7+E83DuUn
	 PCvEQHzsOA55TVOKNHNU8MvV8NzeMLMKBax9RDe7Jp8evVhualwegWfHmH3MtISzypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
	b=R+C/ovQowjcFbE3XbfFLUegi2+RfLgOr8XgiS7ElKXyxwq4O91yMaNcOaZrR9fsSio0P
	 w2ixZiag0nLbhf22+O++v4rmTqLoNPoSax7F13JydUETOTe5xexYftBfaVDC/xS+WjHIG
	 EU0dnRscL5x4VvGgVJgvTM4GzdoF9cY2ffO7PI4GGtZzT4dumvxEXwD7uu03mG8xo0FSs
	 x//YYCvB8MD8y48oB1iYx/Xld5K9yNFDL1CTMIucnwEqkxadjy+51rSKauxXwO2GMrsbZ
	 6j0DRR8K5b6few9FEn2lBNhQG2xmrPsIPO7AS5ZkZy/JhlRNEAOP9SQlg3c2UiOD2sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwomZ+xk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03736606A8BB
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03736606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwomZ+xk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRnGm2638818
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=; b=n4egnpxzMUjory/A
	EgpxLjmcnRjo/g0HqrZ3k1+S5ZhHMOrlwl1c6HX4lCY/+KurbdpSkhK0VSO7c82O
	le9ef+plrlRoqB8I719JVmeRxofV1IOQSyTsDzV2YBcwuYkwdpYfMMr4mDCjAj7M
	lvRG/lHlfk6udEk0GcftmLxA7lkn0T4nMDk0tkU4LsuNFC5nOk4+Ml60bpjAKyFL
	ZJGeQieIm4ne4VwBjti0xnBkT7HgO++agHVH1l8x0v4y/6cVpH54nME+W/hJV7/K
	MLc+EcMoN0Kz4umnQV2cokbUc2TUCyEOdSX1J8eUU25ZY1jsIhnPQWqO/pyGX7+X
	R+XxAw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso1043803137.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584831; x=1795189631; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=WwomZ+xkjTNwKu9t1o03AJgdDWDziDPAKVrGIRwq/dMfmwsGVMiEf7rfp4MW4SQiCS
         DO0+ZRVo4hj+FGXUZUO+RFu6GKTOhtq9eFQPqHmGDMpTIcT038hTYMT5kfbjcgDkwe/6
         rkWH5bQZl9GXph37toCWo9p0E3mBqn+iWzxBo/l1WpYJxhvpDhipu4XOtTl7opZFpDBM
         fmTXJpk09Rh8cmqT9S9bt3ZsZdA2R8/CvjPKuz3oE7llcjPGGKmpMWDDHQRvzOz5lAu2
         3xa9cLdNU/DzFB+vAA8564TlU8DepYmhNPjSY3fgYpPQFtYkPJfo/h0hW8ljujgsUH6Q
         +VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584831; x=1795189631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=c0sBfjdMHIsShufaUZt3GGWu0/NjGVHGcUcEb5/lSv1ZEFkDYv3GIrVTA+hyQR6DfW
         r+mLwiBlVq/19+h+1Rj4yORBkAJqzR/Nt5HicwvZfQr3X8L91MUtg62L202vjWcN8HyD
         /gM4jahWS+oavTfhPj4XUSWtUHwmz6WpVA1xjUf4y0xiUNXeSht8RlDZAAMLhJSyNZPY
         zkvVdLvsOx9ZLODLfW+J/pi77iDXPm7riIsCMMG34bN2dB6eCi2UvDX7d8l9xilKyFSq
         CDFeIseuBAgPnw8i4FoBdur1iLMMAwn123bSV/XJqZrY8gpDNQLFMzKwNw1dSW8Fa5mS
         6MOQ==
X-Forwarded-Encrypted: i=1; AL+hErE20Nfcpz5AEq3ZfitsgERfmwp1HncULgUsPwecShd/XeO7azWsAV7mX/fB1XZXYG2VBJMimMrVDPrzMQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+KuS8LRuk68BejoEnmvhX1cg/Fx1NfsOQw3/AWcLby7bLf6rwr
	nlrk+6/cDeN7bKXvF1fYs83HCLwac4f4OKbSFGeZUvJbyOFC7Cr2pBhHNdebFY3ITcBCCmabLC6
	9cfiq7NIocdv8xjaIfOTlgAFK37J75t3Ss9snIEnWFn4C6yAtX1Wz3pdXbeM6PFzkow==
X-Gm-Gg: AYBFou1SkW5EcJN6kyEZAYUBM/vSMz9x94JkukgK1V62DKtSNHeqMVLPQqOdz3TGVrI
	hDL2lesgK48SjUk2bfRmgG2DKT7tE14FyRzagBtYc+i13CMcgeJF09MVw5xeNkfn8xNFjRfgvh/
	NoHQ+yZW/4+iTMx2QwN1LSTvO+ZArT1dly1VEd/f7ehi1hO/6Q2PbQJO7za/A9Tda+bkPGxy2Gk
	wsy16ccd/E6/MxQdYZPV/g7NOQfsjXp0gy8SwU8UXwHwi2eiuu55HTzu+Q8vIJ3uWl04Fo4i9Yk
	Tj1eMbAsdLW3xMZFf9zlChWJAIq3NBpHozzOuuid59BCkwALnEF5nfwhHUAs4F/zDPBDo5UJQh/
	ak4Ovh6uxqbRbAsSNVqMeY5nAieExa0+fon24sta1st9Cfe3p8wQx1DTt35cIrjQ=
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050089137.29.1794584831404;
        Fri, 13 Nov 2026 07:47:11 -0800 (PST)
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050056137.29.1794584830870;
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:02 +0100
Subject: [PATCH v2 02/10] lib: string_helpers: implement a CLASS() for
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
Message-Id: <20261113-fwnode-for-each-prop-v2-2-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t30FPQpb4Tnh5cjxh+syE/bSfLdlIjxN8NWgVucIhbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3zxDfNmTZ1oYpGu3oDNSKeYhLlJcTGJy3w
 i9b5ljY2i6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 wzyeD/9liUwDxOgRuCtILa7ZmLSZouUUEBMZOFZYeJfLbxqPj5BOO3LrGyZBB4eot1x51iaTeaL
 seAk8C1sdvB1kdjX6QVoJ0tGLj3Ws44IQ2wvoebYW9lUY6deKsomvMU6U17LDKO3L/XaMt3FDjV
 e6/HReOyU8IGPJLMZdufybX2gEVS+Xi/MPiHXevqmFcPKSwOoRFNfchRO8E4tIOUoEJb4mIRsQB
 0rsnTeD1IDzbiN+9o8sigSIZVxc7md3ox8EmjUHcINHaClSoizGKJ5TEKAEW42pw0xIgalLcI/B
 Ta9vfewgPI6i03x3Bf99tJUk+JJ/arujVKmdsdTxAe1iIPmdsl8VIfL2upL5GNduYQ5LxyQRP0R
 wLCEUqksltK4bnonaZfrLbsYBG/jMOWQVFyDN5lARrMSAUS8set0dHoSVQRsG0HnuQymrmjVteg
 zDr9BzfXp7bdlYHJRThjawEDJTtrr3tqtNaBw9IHETOLc55+W5EbKbDdkCm9uib+NWXiiKN04kZ
 11miOyx0tXie3POOHvpLjdqe3gvgfBX6bMxZM7yAGpfgwWV66EHdGZMIXgHyKMg+vVC4m9mKL8k
 RoYXaq/lvXSIRKxVnv8lbV8T4AeSEaWmxBot0jOg9YtsPA/2tV6pyP2JS/lri4VVTt05v3Cpxld
 d+rv30AlQOrl1xg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX1fL42n1kxCig
 i8Jc0vrc+IaOGxV9KBh/TxonQjuhcm1NBi/pbgS//0RdqxWUbqrfRcL7bb/WNlxo8IE1qPuN8N2
 puhlFH0VoFCG5naaq7iqUjtg+kc2sxC6RrXyTbceqkVdGwR5yrTi093ui1zcuxl9uZwcoDH6ILT
 Fh1oIRZstNHTkJk9gp2xWu5Oih3JVVmsOvEu8ZKgaSfIRpmdwBNVaSmCVxxW6Uk0Qin9sQnYo46
 0AJlhdHah6waaG0fss6+rpNjYKVZ5GLXLTX6Y4s6XEKNmp4jesp6ZBDDSOeGILhiYqJTmm6e+1y
 Rzn4++g3ARSIkutA/mdYf+EHJqV0k1W58zFjclc3bPWMd3ADzuIQRLA3oHEhdwcGCEHFmJHiC0L
 RcB63f2EXJSgiIl2XQt/yHOcxaqmx51U3PJ1OOVFCs4FvBVqFFj4GNBfK6hsk6jzoHjcPKQwNaS
 GdNezJndGjrrkSfZH8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX9yPajTc0lUvN
 C6xaC97AMANJLJJNz1r7ZpLKIc0/6cO1RhSZRbpLmxpfuaCJSdNWpx+OFnKR1uk3eZIkGSTXoSo
 SF2Rb3UNRRUaOkXjto65Pk3bMfQtmCo=
X-Proofpoint-ORIG-GUID: 1q7jkZ_izZYBk0Pxmuhh6X95Ief0IFND
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 1q7jkZ_izZYBk0Pxmuhh6X95Ief0IFND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

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

