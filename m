Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685805;
	b=O8RTIHmX8LjlU66C2Js8HlJHEKaryjtfusiLuO7mcEMZLeoTW/nbKyU+NQBRsZTTY4CC
	 14xnoabjjhtHXmhgOLfGz02TQdPNr4aegh+Lppj1SHWGDvBtvcYPj43KrBp30wkDebFYg
	 vBaukr6N2uaNjnkb78czpWa+IuD9kqRgzsTiwXnMO6uD7u0Ovxoriv9ZCA4My04w3k8BY
	 Cgznoa32ysQ/S04zXsC7mQ+/Qhs6flc1JJCRBK0o/F17orMxWAXz9pnL5pffIn7JaqEDZ
	 8znRHI6deKYt4/dYhsUD8elE7TvdR+WxGb7AVO23/SHuk/WtwOo1UsIPfEJ4byDSjhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
	b=pWC/Zg3TvO2tjXJ3lTWHjTSbKo1mE2n+jdPQTJYglLXFRkuejFyJGS+4gGjG2Z9nnRpT
	 NZhxLIRerWLvtUB7QwqA20dgK87jK40+rZ8ZYiJqFcWJ930Qg8OMVAkLSCUTgOK5opKUf
	 3n7kC2zye1krJwUzFsQ3nUytKfADXAbyLatPcPmQdmggY/xtSAgUiVpS8iF9v1TuM/SDx
	 3QDO62V269iD0Ave2upoACdMEW5rS1+a8/bFyfd0Sc8+B20lRm+EhzQlSz5/E8QnvMfOZ
	 NkZ6Tw6bvh7tqUKEjfGxZUvQnjvpV8RdVzu2OIZjboqyB1HQNgsN9ptO3WVqj3Dqq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyXadrQW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6B60A2618
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF6B60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyXadrQW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4dI2886570
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=; b=eQ1Uzgh1R3dpWvBQ
	Qc1BxFchNB+lggK6/aSLkCJXgQB8mMrq04s8FkDGJx7IR31VtdrP9BeingYme7v9
	CIwFYaZ+Db4vgpadfe1o0FxIdiy22Avam88BShLDmrYBKASLQsf7pL8NnGyjrsu4
	m/DShDkzCGeC1cK6aCcKuCI1QwrHKQDPt0SzIZokbdg6/uKJ49EXNRxIU0yj/GC2
	puGajCDeUVliAZBV9w7MbU41SSKqDrVwtTJ/Gph800ZP/+jwJc9ZxLcDh4Pgtt/N
	SocD+g5V5g8UzVfPbXCnhyWIpGJlK4eDdS/kYFjxMfKUeNJjJiEmn3uLOoumCaG4
	4cVhlw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgsvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92114c39cadso124664826d6.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685803; x=1796290603; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=gyXadrQWbw+QDK5Sy/Km13dx6+fAc2Syg7xckJ6gP99wotVehfT7MpzpIKxr8GQz6P
         e1JYtnntduvIrZp6156aDlGAlso8jmPdvzBipWlS/9ygYWwc8jrD1TQ4BkeN2lryuIig
         /eiFzbXMN5ytDSJiwcyme5LFveD/PuRxyIAeHP9pqZ4rxeGhcdn0YC/5z57ePzyi2sUs
         RgNXtMTICGxADzzuMabmQUtT3iOInFZx3QNzAKvg8mLa9CK4wMPSbsQrBhXRRZSn+9eh
         sOQU1UsGmlqmnrvG8tWhzwutL/uAnzt2ftGQOkJhScfh9iiF3bZ0uizSI3R1CaMTwqHB
         VQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685803; x=1796290603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=lIG+h6AS7NRsROwwvJFEksKJJ8UZOsHNABSmE3sRLpnFNixOqcyzdusd8RY7WPXGex
         7/6jZPaUGt4PR1mjA2RT4JJy1ybE45MMPAMDzW5EmsTJkUwqKcuUXQlByzM9UoN8qbt7
         JcaQuWLED5Y6pktvQDQ076xMcp+CXAbES3rfXzWua69kjg8y0UbhFMOyjqfbawPmnNcE
         Dl/zOSRIl6vOz7nKnv39y3tWlYqLX1wqCOvrrIkSYKanWt2Qw6HRGzut7SD/fr4hONNO
         ThQ3hWdxdibRTbjAJIgOvIqan/llf1iKcWgE7IWOZhxWPUuYyY37p79+DrW2rsmQ2Cs+
         falg==
X-Forwarded-Encrypted: i=1; AL+hErEQLGZSX6HKmxCIikug13qzIBO8xZc5s9XmHNGZ7X/y7CWvgBWvwPrx7f6xcZar6LdQC1RRSiBA5gES0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8G5La02lvCmMoD0TboMCz7YZJqgWJoSH51fTj082Vv5qXb82UN
	3FAY9NaAS7FnKvJDowaQtjF+HMNL47JB26vWKVZAf0fSIFgncvlYOcHtEUrSyRMGRObwXjVDygc
	FddUHtwJIVnnxdZ5nynYq7p49aePwzxEbY2D2IpTZiHK4AWgFY2u4CL5BSol0Y9V2Iw==
X-Gm-Gg: AZFdTZe7PtyV+KysTlqrLwpyjhDCD81GtVM28RCyweLVEdmNgS/d/6WujC97q8IIcwC
	owzficQF0mUEX/Yq4NF/IhdCQkZx4sQHaGilfSSkuSi3POGLc1SWMwOvRxqwRpr0ZkFEvD2+MEm
	13hl7sIB43iQHCUX7liZPOOJvnp6HBwTGn/LrHDtN81r41z3ds2Yhb5PyLfQHYkVYGt/fDAUzyY
	S35whx/lTKm6nSU6ZzXGSp885umHc3l3o5Di8Y5Il+pE1ZgDLVkWTk0Z5ixUjBQevjiuwSlfJ87
	6LSJ1uJUv2wlrN78gMlUVs4+WJAyxtjhdwecQ/FECJ60p383QhFwcoJPsfRR1jWzg8zABlNRV3A
	obfbYyR4yrEliDxclIds/DagVFsW2Fvt+ichrTjgunjpPs4w+nJGA6YD9N+ziiKP4xFnfjyzELq
	jSFA==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539863985a.71.1795685803004;
        Thu, 26 Nov 2026 01:36:43 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539861485a.71.1795685802479;
        Thu, 26 Nov 2026 01:36:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:25 +0100
Subject: [PATCH v4 08/10] of: property: implement the count_references()
 fwnode operation
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
Message-Id: <20261126-fwnode-for-each-prop-v4-8-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpHcZaLg1iuY8wj6IMHjWOG6qRHq+3ydzmu44JzsEu8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UJXfVTy+LhvtNE560ipdr+7qsCNpwsh365
 sHEwfwrLSiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w47fEACiduOFuZ5D39+RtQMC82XPATkIZP00Ln/9WqBR4IAiUKBKohur+TZsFpIJzt9wOSyiKaM
 J6T6Qf6Kf0chV4Xm2uHvg0kLvQffYIqPPgkr399d4uxYBFqMAmnXEqsIl2YHhozmGjHoK/CLj/A
 eUEhj/wL+RE3gjCdm2DUj9G3cWRLJctMBZQzoQjiGyXgWBbPlfXpAqqOJaYEVdBGu9mAVtoV9+M
 m16dtpnDB2JPrDq7YmukkIxiU66d4pwkUaWfk0O8vQXoWs3Zu37knwKld92AXaPXR/x9ABBN5jB
 rUJw7rtSfVGIN/7BCBxgZjVGeNc3zw1TnKz8yKdLsUJRNlhUsKCCv+MelNjEtGjuebWIRlkqGWt
 d10L5ydRJQv7o/CJkLmXM2yrxMHVhlCJHUwLnY/p3lQeUGnhFIo/YxkaV0p7aEP+QAyaE6lIGwy
 3j5IGagl0G9WX/0Jaz3lKs6SdRdmLX5UO7+EEoabQwBvcelQPhNHYe7A7nVfcBcCyEnZzk+zWqn
 mZ+Lv2dyHoDY2yLPXtmGr55DUaLdOyYLbl6XjXE6F/anA61Fw44QakDHCd5c/mbTR3noyVzBUxx
 s2eTq5/lj2J9kriliFpQukiddxj0GPcE0x2hIlHDvsAkI2HX3ZPofSHrm1mHNkCIyxPaW7L0vno
 WIhmYhAYEomBamA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX87X/Wv8SXnyU
 SNUDijj722v/wyTQgxUFMXok6U5uoaFZ/aSiTfnwY0hBMELwW86JCTz8ok5ARruByXllMgJajEY
 wc0PYH/0dNaiBRQm2MUSJfYkP4/zSNy9Pnm/U1ybzPacIr+7Af944venckHimdphrVl14jd900u
 0UushClyImwGxX2BiFY4QpYxfQic73ktHx9apKYmgp9DGlLq+MppW/iYOS/K3LCYXoALb5s5Bbe
 4eeOHCnuiUI/A/JGEw9UimmVbd/O6oCONeo7DTMmqMZTUg3kOCXYgkCe4dOqDlGpNiLOZDenm8I
 ie/E6VdJ2Df6rv7YqloeRGYTIxkKaxJ7oM8vmZN/T7mx9BLmpQ93f8H+mpg7GGh1iFlCaIl/RLG
 1M5zv14z+UAq08WRy6kvw6psr84s1dorXjRwe6c1IV/0s54X2KvLvvD3wZfU7rWBxpTj2Dazizj
 0jTkQTRld9wFrnvaH5g==
X-Proofpoint-GUID: djI9cgQVeXAtEitFCSTpBPA0wAZxPPpk
X-Proofpoint-ORIG-GUID: djI9cgQVeXAtEitFCSTpBPA0wAZxPPpk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX6Y6HMeYtW4JZ
 iK7U93qjcEs8G80BcakJVPxTJCcgu7cHbIJkwpDYdSyEqJLgQ00mXzcln7kORJhBiff6gFHlDcC
 I27BShpDP1/Cvzqm55eAQu9SYnJbn5U=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07fdac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 00349e78fa51455696d0b34ee02ae55c20cb23d6..bf2e8ada7cb32d28437174b0cef1fb5958f2cefb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1233,6 +1233,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1774,6 +1780,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

