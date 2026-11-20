Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178818;
	b=P9wnEnrJhBWCVEjMOg6kt5DRFkuTAs6kuU9o2MFqe39nW/SmJjA+s8xPx4w8X2o8x6Fq
	 lCakLbOZbnpfXBZ6/F416479c0446bhlYpAnYQC7PAhwJLSiy7iFkeQdVrUV5lBdcR6NJ
	 lkL+7qklk3YT3ti+W2uvfbJTbGyoNW1MS8pbNkVKc8XXSq32V/Vqq70TEUuTKuA6o1jsu
	 65m/cQLMK3kC07fr62rvRc4P4znTmMqmxmc60Ap3m6/0TnuwXZap1OjVI9uYCWSRSedcw
	 CCDHiCP/JKboFOHv81sAQwjzcTsuiBE73DAxcmbZKcjk/b8jF814JJDp4N1c9IcCE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=YyO19gJzXTGj88gJM/xS0ymaT1jphRb3PsL4YgxTj/jl3sR0yUStVP0jSEj0jEFS+Kz3
	 SrXIYNBZ0AvmH19ZRApLqZtf01GlXEyXiLjaAMslej6eGDy55B9FP6LA1uW7lvbU1Bmpr
	 iEjiuxhPeK4kKYK1gT03Bu0QmcvHnUAPtEDrcAvhfMOFhseHRaJJGt+/XNniZBQ4ZnVMs
	 fA78S2mm8bHk7113WwX/R4B4SjRn/FZMhpUrOZNd9qmbv+ASb9CQ9/rVOtsrJgwKMjpjW
	 jY2XUt8p/Q3jOceviPSfGLxnTg18UNz/awHaduuDlzChrxs16RHU7UwcBWa8z31rWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IDSdRUl7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300C606A333
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F300C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IDSdRUl7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk4IZ1169017
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=OL7mQEHYCSQc+cj3
	MZmSyugOTRomMWlrOXLRTXLiwpIxJDgG/m7xi4pfX7AnWWlTSLYM+oLaQLDqZvAz
	j4yfa8Z/zA619xCf2Pk6aHff9oCsH1NN8zOOuqOSsR7xjMk7/8XFA7Uunl8n9oWD
	C+QCD6TQ835NRVubbiiE3sDruxE0ENoF8reK0pwiR3R2+9Zy8h7wzK9qXiDIxKoy
	zrEwv+/In7+AY6UeVDEY/2xiGRHaVZioqOBqn9JB9ELncCBjS/V4seeTnAbYvy89
	VVDZCWkTMhHODFhx5sC6jPH2KJDq3fICfE1sFC3QfTNyjyJzrb42MVAVXY805RxC
	92lkrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uset-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so237643385a.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178816; x=1795783616; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=IDSdRUl7FwpJrMnqcNwlbyLkz74bwy7fxJg4TCJ0imxQdQ3To/MI+EnET3jn6f5AjC
         Q6ptQm2/A65PF40E8xaxk4ldRsWFpL7QbNN9UpmvKfV1WBRxLExhKrbe+3rQmubV9VLV
         OoebvgMWHfcyzemIXMIp0bcWox751wJ4JFfbXPLzKZt2pie9qcGVmrhgN503Ae+am1Ax
         87oCVFtlhw/zGtVwL42B9IBEe1AF7XKj/+R6MCpq9Ww1XcS3HJ4iMYunC7gQ3/lGPtsJ
         paAdtWu084kbQiNX4bl02ZF8h4IAxCkBNfyiR6uBfJ8pTyCrn6qYKpSVi8VpJuCm8oAT
         jMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178816; x=1795783616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=U1KTIGIgc4Mma9iND3zTkFvAo1nTZQAP2tEIU2dZ7kQIHsbAct7+AvfbvhvSmKBUC5
         LLh1Rl1wFXaDSEbRgK4CdeGOLibaQAduTprfnczM0EiJl+vY+iM1Nn7E5LgyCuRuRAUG
         MGQyckKYFSlBpImQK5wM+x/Vouykrxj2AHzunogXKLKhqY37vY0FdaQW17ckcvLRgCAA
         o7WpjyGC6+ceRSPzNUknAWPpB9YQxVcf5faC2oHLBw6JZFftGlQzmw5Lwg/7c2XTxN4q
         1IBgpMjGKP2c4eWPxdTJcS3VE5lQxIiEner53UqErqx5ibjQgF6h+GC91qPe1ZfTeZmT
         ZAqw==
X-Forwarded-Encrypted: i=1; AL+hErHtDqqCIQd/zShBvl4DVpnPQi0ysststDRowjH/79NkIxd7dvJ7nBlmnZTm6q2zNZ4c3ra2ogQYvQ5w9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+IMwic6keFigjG0AQE9wqKtNMD8gHE49OU0Zy8eWh5K90aabag
	byxLXItJYr3iG5X1+VCMsWaY0gfA56MrHyerApcineWRJzQIPrLc+pTLVvJnfzzYv3pRVayi2ko
	81B/lZK3S6QyBA7j8lunHllFU88dsLpcD04s3zmSOkNy/e8uzZcZOvE4bOAXmGOE2xQ==
X-Gm-Gg: AYBFou10PMz0Jgg3DYrkCQiuwpoEsuQvEuI3h6YU49JOuRSRgzfytl6AWJuCDxnSTBc
	zG6MZWUwwmbm6k0tPBH3TULGV2bZXFO6vGemn/A1VXZ0eTrQ2uiP93p6mXgMyOPhZRLe5ODSoU9
	gkrnUPGY1DBWmcNezPl2dQvcaBWwV1a+/vntjlFYMxdj2e/z1JBN6FjbGh2nzs+AH0+oO9em30Y
	plYJBv3UQTuGPhuBWkMHhG0oGa0fnCwwP06RUh0VMmJq8GwB7Ye6Bx/mdr5tpjO72Mk81FIufqI
	QPMAS9huMtFijNL9HnhCio3braBa9PYpFQD/zJWJyT1+AV2O0WL+VGK2z5GjWv59ILmD/V1UNPK
	6U8wAUDzi4+WcIYK+Vq4/KHDek6+DUDlJgzwICyQRKCUXAJ3XicKwTQ7M7Wk6dTBw18HTdcY7u1
	Q=
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464268785a.30.1795178816388;
        Fri, 20 Nov 2026 04:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464265285a.30.1795178815926;
        Fri, 20 Nov 2026 04:46:55 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:39 +0100
Subject: [PATCH v3 02/10] lib: string_helpers: implement a CLASS() for
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
Message-Id: <20261120-fwnode-for-each-prop-v3-2-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2jLXmZl1uQUBpEf+eKw/T3UBW/o8UeMEbm
 +gQPCy9bhCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w6OaEACp2HMa3L5w/tLsNIekUn6RV5BW14T495b4IkQjhG9/ndutwkWQh8k7Rk+kY8zCzHvUpY/
 I7kDBzNwwAbAaBNTpYUI2PHBTLTM5NxV/844KBjNOzxvdZib+uxEvQfVpb1z4COHby0Ps4GVQ6V
 qo9cCpLSdcK4x+eTOMDrdsUaLphAdS59/wpD2hdOq4wB3IG227nQOGq8yPhk1vyZ5Y+5QDYy+n9
 Ww8fY3dO6oB7iw299+WB9Uf7WZLuxGdmHYawNxGJBCankEqZB6mm6Pg+7TV5iWPxwP1aYXoAMJi
 MXpThnPqR649IK7QcXRNUYuw6PiIMjc02SJ6KvC8UdhsppqFvMwxjvt52+hjFRWIUC11NzGLln6
 YmzwEEUBhcwSAN4YQCjRhZeGs8Pmu0MwY1Oj269YCXhCMTNSZ/4bEU9uUVXXWAPBAAhFSsrPP8y
 dTbqURJ9+Y1c4cy8JvwQVDm4P6Pb0tN1QBSgnbIZLiFNJQ0ueotPvAGLiSwwe5wb3ojn5oAMu57
 8cj5qte0LROY6R/2pWim0uiI17A/m4pERPD7VtHgmUDbxJx5E7x1HuT1i4ajcaq5rLyF4/uEXnX
 t+7cb3wTQUvva43F8nb+7gz+jraQSNDhscRkDj1Tk1rEUGgn1O1voxd9k6uTTiqqKt3Qru9aXbD
 LBGS8/MxI5yk/IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXxGZ9h1vu1eLt
 euPFGR7+POjjJowu3pl6v7w4sCbhBSLZWYtQifCTVygPF5J5h4kBEGCEXgTVL00NnjupTxp0Iv3
 ITiLHwmBmiRIhUQFDly2kaQ/987vxMM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX9Y3dr607R8V8
 Ln6xiVRD37aPrFbJv1Sn/fh4X4X/oKdIOUy5Nv3qR65cHJmgujtQVZrX19EDGBChWLtFvzj5Mku
 pVLiGtnQom/szpX6kSDOml1+YXEXYbtAmVlzKa8d91y4gENMfOiVAF+APtEglKyG/AvuOveuaNL
 ZQ+QlQWjedVGsDqk6GH+RuNh55ZtA6mBWOMRx3aK9AZqb+SZsVPhqFxEaBAT76cw9qHT+Pp2Ko4
 d/cxNKFM9UodFrkr6IzjoXMURIkrrdU+Toxmo6lBnCyc79EySLscSI305ZFDhVhu7ZTPESGpiA6
 irOIZBR/uqIpYbYbgm1AT3ZCeU8d/UaAiMQuDMSbw2i/JOykq62bjQMTnICUWNGgkthzUcXrW7d
 0KQFV6BaILlMB8eL2HreuJ8xGEQmuQsOTjk9LTEat31d6F8P5Gux+be35Mqvi+ioeA+t7hI4+P7
 Ot6gSXcrnIwC29Fczdg==
X-Proofpoint-GUID: ruzas_sLFBx_s5TMwlPgPz7fVnH0IO_c
X-Proofpoint-ORIG-GUID: ruzas_sLFBx_s5TMwlPgPz7fVnH0IO_c
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004140 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

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

