Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178837;
	b=ET49D1luLKhVRwn0znXadX96yUT20MWEkrANxektlqqopbVYv3hJAlGl8rl3kENILziL
	 br0oMoT6Pw5L/QelPvG1bqek5pffWuUXX4LICIHAswRe3CxGHKIGx+pzXASnc4ep9dDpC
	 95+eqgQ3GHtXEsE1ZN1eTraMojxmgTdkoftvsghj4mlp0pJcdEBURy+4+uM6uVcITgHbm
	 71FPjFLN1RB1X1BVW+dSrQ4aEgE12rzt178DrNb2Tk0ctPME3ZJFtfM/duFQKaPpUb3WB
	 +p5n8hOlUwOvPZx7v21JKxERFEHauSoFTpCnEhYuTVCWmpFYbd5wK3Rh49hEybvWbFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
	b=l7pyDLiPSQOYXF16rju4kR4Eqs3iEwtqtRPqWS9AVHxuGDx0eVAE1AUefSs4goCXXXMG
	 oMyI2pNtVUGLGMCW33fOi2nXy6zHXMxh5OhfLrRIm4Klw2C4mFpN8cU9dbua8jJNgqGDW
	 unfvwiQ2jWQ+9stAWbgp2Ti51AjnffkWyxcaqEHJ61xbu7PoMiXlXNx6GZgTagBCUMhEr
	 HK+i1TY+1hP0I0w4aRFQPQudKY17hKg+I0VXrayhDgY5CVrAejeeQ9T3aryze6ub4v80Z
	 CKxne9tl5wcr5eo5HOIJ4/2/ct+P6PreEDQeldW1Au/Fcwtc5QHIc7zww2zsyrDO6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YT85h/eP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53D60A3819
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC53D60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YT85h/eP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtBf3731152
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=; b=oRZVYadQvCYWx+Q6
	Y2FThl0ba8JhSx7ZZ01sfsZ15h0Z5wT1EcyXAp7GAgEGAx9eRti+oc5Oqlcm+xto
	zajaeD1uOMFymuGWBRC/C1Oe7x4Gq465BUxjtsGFfF2tn1ZIw3rwoyF1OaMJD/24
	zeW0jgAVRzLmoHn0Y05pFlhEcdn/IgIZiPk6pLHQSyUTLNTQJI19Q4kSTS4qWxvB
	rC9Y6xOz5XT5Uvpp0k0+/5wayztUdGnKX0HdSuBM15gBUI7rRSraJrP+ZfWAM8P4
	kVo9hLo4o3T/j0LgUDtonVYTnrQrs6OpFYk1+SD2O7CkVyytegXedpcAlDSMKKy0
	iL+cgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gfuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso135092585a.3
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178835; x=1795783635; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=YT85h/ePzFfBRCV73BkY9sNPodoiHTx7bghyk72oP0+UDw7zaG8OQVkmQYEyqi1qKi
         8Dh9Lz33F/BxyhjKNaakNA6WqzCRJ77fmaj9ZzVazpu6+8wluwq51GYDlZ+NWowSmyTG
         h1cU6H0sKeCiS58xPCweXa6GzyGyUqRuOdcDJxsM48txD6ZgHyBmLaXruz49dtlOprdF
         MndEgtVosIMzN4lXxctWLuojslCu5xdsSDamLvrXVSir9LvG8c6NdY/ZZvM3wjCvQfGw
         qt3yy1unFiv9HP4Uxzu8k6WP7kwNYRVHy12GRX3Ag9a16JXTcsJWVqlt8MWjaUuoJ9Ht
         GGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178835; x=1795783635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=BlX/tktT9PZJZ5w+4KNkDeXxbWkADZEWjkspcQ2HmzTWwjMSZkdjJs7JRMFzl1A6fE
         s0XjwUnmptKXyobi8YgtSPqKEcMME0A5Dao83WZ2tcHDXwTOe6nhbrm1rzSuoBPgc8+Q
         3l72LKNr93C4c6A1sBMVaLyvLxOAatBcmYTcbdfAN0Nx85+ZsxsH7o4SgxFtkx8Vs3V3
         UaguCZHToe4S8vGz+VSAH+40pYoEIm/6abOk61nGjSnxpS5spnTQlJ9wfDtWjt8h/fCy
         25bl8RctKQNr5o6zf2Ag1Z1nfpOZinlDoJ0ZWoqLXtwFswpAjTI0i2tMn9yOirHBiPF4
         LBYA==
X-Forwarded-Encrypted: i=1; AL+hErF6u3ejFiPNfwqY9eWq/Ze1tjZssnQQGZ4GPhAmtjCYFczhGB6hMAIUTIlsiZssdmRqqCXVlg3quw8PUQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8SyYKElcPfYNk7ICmP8hdS4g4mbxsTj2LqlvaG2Z0TyKtzrwYR
	JvlWr4NsATfp3BUZ9odH1ggB5mwzENn76hXKEAV/i9znejnZmkZF7S5muG8TwBnMxe4uq323e3v
	06eZCVCbFmHkTn6DRcN57Zzwnh1VT2g1EvA54kkMIuyi9NqOilODmCPzxO5DowC0ymA==
X-Gm-Gg: AYBFou3jf0s0PqU0fLDidUkuiycyaJOO2TuSJw7FWQ60UmU8CPQA6nQzGv/CqBUpMk/
	X2dBlI43UYLNIdJB83ftSb6wWl90eBI2NuEMQsJIt+bDygrfJ8Vxi+KlZ1q6lxnETqxpU64uVQw
	YjefH/9NOzr1ppigAHxGzDzqEEdlJMTuH1UGAKQ0nIndlOX5UBJjtpLVWTYQsrbpPCo6DKJ/6YI
	MxwXaJVpIus9PuOZX+B69UwJsIejCtejdnssGe0EgbodAabQhNWe+CstxusXxIigxod9YFjQds1
	L1j4g2OERL6NChudmF9m3smzCE8JhGjaRsO5fe0s0ptnVxRJx3eDJivQe57IwJHhEcDqPMELJWs
	WRKREtpIeVD6q5VpecTXjq53mlXQNKzfygC2Nl0vf/Yjuqd+jm231YOq+MeswBxQiDAeiYtFPod
	4=
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485704185a.21.1795178835214;
        Fri, 20 Nov 2026 04:47:15 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485697685a.21.1795178834684;
        Fri, 20 Nov 2026 04:47:14 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:46 +0100
Subject: [PATCH v3 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261120-fwnode-for-each-prop-v3-9-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LlJfTzXZqPhPYiFBMDDbJUjl6+Z2YhN3yTlXo0CvUjo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4fvRJL+ZveX5BmMRTVI0xMZXr6Ij03Kqcz
 jdiUFtIQN+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6TaD/9Scfa0Lmv3m8Q4KKZfDFfFDgXcmFCrRT3z4OcdVe8A+4n8W/PM7KmtlLSNvizw33X9lbk
 mW/EaCE5U96E/gUBeaJahtpbIA06luLpOEFoJbJfBvfVjUf8bnfdqxobohQPdIH/q7bvW2mctJo
 LrjxB4o0+fyOYN/Gg10IsxUdPRIZ9sJamZKv7FEjpp1pAf0nXqcxkgHKr9GbRdoF9X/BRGqpdWa
 7hANJwMpl0EWcrnNXtLmuCGMRkNMaLMMAN53S2dd1jj32u1f2/od0+6wDeaQSo+92qT8Kuhqcsb
 IGFYcjC5vmM5QpEYJXYLJTrC2LmyTMD8DR9u2uMLAKRzLsIzoGJTERPugK5GXLwlKxy9C/1cbaL
 z0FEBUgnCNNwvpx7kKOPrrjx9qFZxitecrMayh0j6zjvdCjA708U4+g2Q4vSFirHZW9cV9ZAyN6
 Mc5TQJIk7SssKkq/WqApM71Qxai10+7XrESJqpuo1+SgpbrOFQKt9Hm+v5mkbTpiNOJEYYJyw5W
 bNM+gNibRYcy5Yn/xByAholEFTCaUM2wW4B5ALp77np0orZoIM1+IpHNHgowTnvPoIJ9Jsx4mGU
 cGVDNZ7ME3DcWYzrDdY6G00mCyHww+XJXkAX9lELkyhz+9YAU9z583D1exdDcNZ1gNXZ4OwX/kS
 XykOGXolGEzkWbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OotbwaiWas77lheh4oe83GxV3fI0-_Ig
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004153 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4PV0zXcyrX8T
 VqxU0vsmtuODEiZLQifDCvToFbELGde+INUuGpVpP2+Myj8oj+/aeIfZzqvw34p9QwYRAzwxE/w
 EqITgV+Q5/7DLdQpvV81yYDXkP2LMbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8+FDm0GM+dfy
 q3X+VW/hHLV662hQiz8O9nfnt1z4XYvBppfTQnN99ObYRA7ik02k8PfEctI1OlLdKrNgttu8HuG
 22RVLHm5/ljEy92Dfen4woeTPAPpeBnD+0P0QsgXymM71F4uPIGawhQ36e85qWlEpAoNS/MdwQI
 CkMBD9bp0XUkkFbBuuE7AYwOHXVqtQakuCEqU57WPByzkJ1I86hjgLy3t1pqJ/kLHudZB55wprX
 iLSCUfZX8lajfJa7st4hGwhOCZvWSh7t0iGj8/OaoYwaETmUxJzoNpRuv1XsT4r6kGGitdWlREl
 zGo1m3zon+f9IdhEa5A33E/ErR8L1sdJcgvuUMlOKIMbsxGZxQwTua7AB09xhXiQQxQ6wxP8ecn
 bjO+D8tLT4/2gBk5X3/ZcugDauyG6LZ+J+f2BieRUTpuMNsT4qiEWBy+1n+pwtRhFDYbUQUCjAB
 xrFw61w6XuSbfw967pQ==
X-Proofpoint-GUID: OotbwaiWas77lheh4oe83GxV3fI0-_Ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index f0e3edf07cf1a677a58022f8d76cdd6babf1c655..fbabc1ee489f881084033f7b92b42397455f5811 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

