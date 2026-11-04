Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801077;
	b=c3mI5E8AKn+hg/crWl4P6/tKLXqCXfV0fWrTDtDr4F/kv4cSneHvxqWvhVA/GgZd6Y08
	 iJ4mCekcnvlfFaxgEppX6XfxbRl1aOtpCsmdvdkz8G961wQTiqT2KoYd4R7TFSKin1pRX
	 zEBWuIBN3G1Br9/6uY8K2bJv0CWEYJuN8faibTxvt9Z3eiSZY7o95kmN4blLM1KG++WfW
	 dhtCMWXd2KKfX2IEXElDnWnjNtZAwCv3n6x3YChDlmHJ9runUsRFzI2UAqQWse3RfMLsa
	 5QraHv8qHEUM7STlIUTSVmQoFU3MiKfdyo4hG+zcTyHRbxOrlN3fXbi6rnhJ0Y4GyfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
	b=AcNJx4jaWx/bvgWYOL+pSaP7kJb5qPeACIrGO2Ovyhl4NKCnN36t2CFaZWd7o7YEY953
	 R+RT718SKS290yxI9zlS0pVLvBQ1xAaq3ltX78fygYbWNQwsWTXrsDQ+lBQF/sKHJGiGu
	 ElD0cBCM2VDOWS6/GudEiJW8C7FrNn8TCuQbGC1x1DHkDjudMYlJ1FGWt6n2JnkSFdU3Y
	 YP9qgNLgUL4CE0kxmC+ek4SC9VJXOf2TTBETsFmksYLOvqu7YCTAd906zVzycciaGO1MY
	 2J3NEzEVTMZEe2M2AmhNvDdfLnx7V0GgEoXBkTKbhmCldGFBhCVRlNw/AVThTKIvktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbRv+IGw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC89606EE8E
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC89606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbRv+IGw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaMEV2729160
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=; b=gchuXv8rO9edzX4k
	9qDs7/iWqeOWA9XHdem3GvBvH613UiaHaQ4a2k3XuXl0vIk2+z09HP4L/ognem5D
	o8Xeue245re7R3yoKngvcRV1YcDMWvbWNF0j91pIJcumHa1wM5ODziKFoYFMiK/8
	LkzX1OmeefktfarLz+A3xY+nQHY9sso7EDRd78jzV9nFvR1jnURHIoqeQmARzK54
	FdbhvYqw1u3Hm9ieKzdPIG5R/+p0lkJvYxz+IwcBGWEGX1Puvd5Gm2oBaFfTuVD+
	GNRE9SLfjmKan6B8yCaF1PRHfhleWIBYdcklOPmFFvxKxK72c7zxHR7WUaRjrgzj
	dVO8yw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbpj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac74b0596so699624e0c.3
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801075; x=1794405875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=SbRv+IGwrKzHDPJzlEG1L9m3uvgpHSADm4DmDmbLqn4twEZF41sJBzLivOYVdwfVc0
         OmiKT6vNvyV9VHja2Ehf4fc4jUoKbsze63rpI3YHW6Bo1WD1/rL7DZNRqO4XvRL/9gj2
         ZrsaUXdu/1eQiUjOuM0p8I46cYpIrlCSl3l6KON/GvnU/W9s7N8BKMEH+EmkljDT1V6y
         Z7iZYmE23y4ONWvMcRyWF29TPdF0dUcOVSVDfCA76rHllepo5Ms/XwN4GaMkyKrcc3GC
         xoZIT2rePS16NPQKkmHXnIxwOfJnD+B6Dl5yw5CAVRw/pFT+BLXTfWzbDXEB8ceTnVHJ
         XHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801075; x=1794405875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=IcsLHwiol1SuuUeWwhkeTDJww4lo6lWbaCx3wEZudB37U5MhdvwWmjgBhcu5VtX1Jq
         l6H750Lnj8VR1yOf/z7R9i55I3yoefoMV8nigCPEaf8KIEA5fBK2jzaccZOkF207onCs
         IiqipFfIsZySC+oUlHru8UYJIXjBtO8t2TPpq5GQjLYv6xlvBiX4ivN2+t2RKa8rxPMi
         35vE8mpOszfn8z2pGlxV8jGddDCdzt3YZphPPtHwPvdJbtqEFFlgzYXpyvP09so5C4uM
         IWpeMmlVYgR5IXq2HgVxeKezJDU77I6C4rOlKjbp+l53kET5AgpnP/g+AMroMGipJ9aP
         ycTQ==
X-Forwarded-Encrypted: i=1; AKwUvByIKH0W93XKJeuAteHvqriEI2hbRz7AIkXVM7NmtVSjVJScijRXKicy64UGsEu6lIs3CBbQdh9MFUEytQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yIyp40jF0yUSZ9ZH5/i9yAaaW3z6UDchUIBE9qr05VdE/+ecX
	oT3cyoDD0EtvUPK5MrUpkotus7mmMfHH/7voBc2vmPzVEZJhh9ewqcP/nLj7WiYVbE0wN0AuLWq
	fIm4++Tf2Uyo2ef8e7p9uliOdxhN4RImwkySHKmjNv29VhVr5GkBw6jYyxNdYoKZumzF3I9i48w
	==
X-Gm-Gg: AYBFou2CP1lJVV+3aixvR6XIQlQ0b7K+OPPxrIV92sou8Yeoucc2YgsK87ToG+Pbnb8
	o5Ke0gyBLcYE6nc56XGZLlrUBmGTJc2kwrErnQMy0VZ+IgvAYQtzQVCIRIvMt1FSugtEmNo0u1h
	jpJ4MD6uoh6z3z3/QBobTQGiNkX3fTYeIMf7HEIGiBtl1h5Aox9rgXC6rnM8D/OXr10Oqe5Wanw
	Qt99bgxP8wwSP5XFozfH5ztA5elhbB5vUPbzAPpilP44v8ULwvmkLxQ3hkCwIPRrBqcrbEhh2Mu
	w6hwVpelKj4iwGqIRiX2gyR+XnLdQKaZV0+KBvGfeIGhnh1UU+zIp0WMFSxb1jBb6HkcnQI129z
	EKot9grNfaCb8DjtebDHlI3pShbdmLYMO5/TmyCWTmg6vvYEUghgVMkgf39iCWt+H5URtrLkD+5
	QEaQ==
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314486e0c.7.1793801075046;
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314419e0c.7.1793801074572;
        Wed, 04 Nov 2026 06:04:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:49 +0100
Subject: [PATCH 7/9] device property: provide
 fwnode_property_count_references()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-7-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CscP3j7PWUDfKaYGcKxatd6g2T25BK7kN4l1KEUd28=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSs2vnFhnUytszIj7K0MWGPjj4eH7eynMe/
 zjl1O2hEWCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 wxbqD/9x7yrGNGnGGwHE/5F84SboRgKxOd9v7VsB83upksyfCmrNUJdCvj8btxeeA9qzgCSClcD
 T2+FVNnhuq+bimeEhLsXJVc5Mj/CfnYLlLf2HjYTBw5XKhY77RyYO3/zL0ion/h+N/o3GU/Lhma
 VF8h2/k11CBVzYr1/hKVcN2UC5jnTB2dHJyx6lZhWY/gjBebAny99BGE6EyfNNQLD+HHJFgqtX/
 C0uKfmTKduexOOQX36t60DS2U2psmBug0DC+dc4AXDLq3lbfkgndojubKYsuBF0p+/D1sDt0zI0
 ZIruV+1C+7YdqLbPhKHvqcweY6qAQoQn6IFFQnJJD819mEy47NLuqS0pL+SfoZdF7UpNz8G0FrK
 fdryDWH7y14b0ytPPljq6G0ngevcTwf7meR0wMlSLH/HWzp0doxh1r45gpfIzbU1Sg//kXPHGMH
 iGn8BXYBDykkG/EysgPwId5ZbrCICEEpOUVEi0CaqYpNfiLGCvLIht1Jwmhp4NgoesgamhlX8ch
 UWI331eV85JS8aVnHQMp9Qd4WdJlUN7LCUSDkEwzGKUa341ySKsI7OzA4xdmVhWtsUoLSCMGjQe
 aNX0J13UCtBnpMjdzB/6iszkDHGi5e0UDr1TJjXcQAMUb5v/Aw9JnI15RStkZJ+fAr6N012X6iK
 zmmFwOT8akGpUaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb3b74 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Fkd-W6vAxR8m8IrCRYja2WecwR3A1p5J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX8zZaJQVOgiLd
 2bvTSlh9xjfnuRuqp6VKnrYyfKEmfVq//gy9BAjYmMYAqwCUUsXWlfWYYNMRKSUbHhjbNxwzQm8
 366ghki6wV43RVh+CqauBt11DmxgOKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfXyAApHJoqXp3m
 gx6p0kkijB40PQRzU8+B9vaE5xruMkYNqqgtt9tOdKaweaL1FCTlJ8b02aa5wLiE980KMmVkLxa
 dyxT/0yVK/i8iN51CD1/9ecsM5abBeGGnvNCXUw1EKwGRsLo22hbXLGKrifuSq8PF4APeGQWzoO
 7Z4mCMFBf9HI1L6fjsG+2Y2XD2icqMFj5avVtdeQboRnXN6oOoGMuPwW0+6/GPgigiWQ2klpx06
 mRdfRSaf0b3bm1BP+QW/1wJC4n6grA/3NhBAqE5rAcnyE6Ws6/DVFncgunYtgmAUlJMekkMNS2E
 707gbuFUfQLEP2Ipz4Y3uJtrF48HGRuYecE5QlrH3H/HLmkq7pk3uRVQW1TO3dfI+RI2rhLekMI
 gc7zqrUKKSOP8mndR9QCSgJu60QDzenaSuNOqIm2pHa0111NpOWbvs+PxuqaICCF6Et5cFYO9B7
 tzGSaQ5pJK/kcITN+oA==
X-Proofpoint-GUID: Fkd-W6vAxR8m8IrCRYja2WecwR3A1p5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7b0df3dfae53b6377dba91330aac746684e8adec..259ecc4dc31a7b07e2ae5f53aa2424de54ba8236 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -654,6 +654,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
 
+/**
+ * fwnode_property_count_references() - Count the references in a property
+ * @fwnode:	Firmware node where to look for the property
+ * @prop:	The name of the property
+ * @nargs_prop:	The name of the property telling the number of arguments in the
+ *		referred node. NULL if the references have no arguments.
+ *
+ * Empty references count too, so every index in the range [0, count) can be
+ * passed to fwnode_property_get_reference_args(), which may still fail for
+ * empty entries.
+ *
+ * Return: Number of references on success,
+ *	   %-ENOENT if the property was not found,
+ *	   %-EINVAL on parse error.
+ */
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -ENOENT;
+
+	ret = fwnode_call_int_op(fwnode, count_references, prop, nargs_prop);
+	if (ret >= 0)
+		return ret;
+
+	if (IS_ERR_OR_NULL(fwnode->secondary))
+		return ret;
+
+	return fwnode_call_int_op(fwnode->secondary, count_references, prop,
+				  nargs_prop);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_count_references);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/property.h b/include/linux/property.h
index a70f3c4c087dd85390951da950c3632f89c6cfd1..9f0b9aab5920513cd468572fa96dbe3371609591 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -137,6 +137,9 @@ int device_property_match_property_string(const struct device *dev,
 	return fwnode_property_match_property_string(dev_fwnode(dev), propname, array, n);
 }
 
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop);
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,

-- 
2.47.3

