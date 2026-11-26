Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685802;
	b=2Dw4MW4MxFkgFyI9zo3K1+wKP9MC0K4xxvB5pCJz96uI+jeNs0Fol8xO/K3TyOs0lnTp
	 TNbqqFGERYVErjqqSDG7DXZy4fGvNrrM3p9eIUyhfn76LTq/VDGyH7agkdW/UqHEVMEdP
	 shmlQ06a5IUu9POyot4lKkMRQyha8Jd1UZzePY/07Auhja5rRqMs23sqQidp+5XVULAwP
	 hv4hlLhH3dYb7xeAJnqF4+FeP1aQfJ6mCMe4NAHh5RQpD2pl6yommnAiW7uJ3NbwamE/1
	 nbK5X5sti3pZMAcZyUXs2B9vIGi/u4plDHNK/CwXv4+pbZw6HfqKDdfXsUH2kN7iCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
	b=qrarNEzSfPrYmyd4XiROOoeAvd6o+UGEYMRNDPwKMtsZ9hhIBPZ9l30vxDTTMsxE4aEw
	 SsNzjRzHfdWg80LlDru2Xk5eTQOoM9wkpxIJtZ91cR4Xn9EFfix4iEJ5Q4ySkZhzJQecy
	 6s6IkAPBzb4Adp7Ed66VgVWiijWt9wTpws3wZvJWeoxKA5ul+2yNRHcHYsT4Jhm2JwA5t
	 lGWWh2sseK+PSKPRhysx4HBcg56Uo7svkh43G1T3F+sh1kr/I4uQ6woUXfqks+vqkVaUx
	 SIKCzOAuORwArIFDZtXrYxtzHpSojSFt0DSN6UP48RQBJ+I42iRZ3Fx72EX11awb1AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAWTfHae;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8F606A6A9
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B8F606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAWTfHae
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7dW3548440
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=; b=GnhbKINvZiX4TlRK
	gmSaIjcT0BhI7n9pBjXuUWmNR7MA4/hWlzFRDQPNxvICCoDIbo2VIXGhhYNtrenE
	LLJNDvzP+jFPPtUnPdfrRQzzHSsxxD2rKftRy9cV0H8Bt9T/Td/ez5edQlq/OADm
	3BTbe+d5ERodhu3llah+pIDHbrA1j2Kd3EYpF8KLbzatnnkthTxIpLuYbtpM+9DE
	SQameL8twA5z/tW+Ykn1fXJmOhoWsncKZJzLPGryKdjbTQhn+JmkY+bry20iXoEY
	TMX5mQjB/EuJmdyzO8JEYOlxnOtW3KI+bsKjKqtBUhg/JDbUZeZYJt5Fyu0UsWXW
	6VuYXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauaeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so1623343085a.0
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685801; x=1796290601; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=CAWTfHaerpAtkwv7KIhuKEL/O7FhQKe9OE3t88tX6zpRvLZOfbzKAa7Z1ouCJXotp7
         qUM+HOkxLodC5hzyWftFg7+XAOj/tsl+i3dWnM3zPmQVbPD2eajN+BpEP9c0wtBVF55s
         e806CHY6f/fZVPjBXQRamAFja0DNtnbbMjd3AxgzqOnhOID8qVehl1Q1Se1ZL21JUR/B
         gOB3JUCC9RKuCgJ5zxJu1IL26iqMYCleBr0LT/gvqXNEuZnjewxgS37kBH6q3to5xp4O
         wFDd2j+jEJuXpgFSTS5Qc+z2PIX3TziwkZBnoBy6k9FtUDXqPSmkbm/V7KfVqzPN0xgx
         rkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685801; x=1796290601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=aBXdAaZHRA4p6CYhN7IxUngnN42oa8FwioTNZ3HDQi409xtlYTmJXN4Aa4ENHraqWh
         PYX30uBxGUGW2NoXED94qKjmYrX56Z6e5CwQ7TX687q5r2RgVu05f6Z98BHNNFNVdAst
         Chc+GNZhELRBs7TM00VD7VunrH1ylIvPLrJygtKrGfMdLRxPbMDU1LCGD8sB2Yo8rV1A
         f+UxZ0n47TSqWm5QazGGiGQq5SBbtsxLLpVrq0aloSmiZ8lbyDR4SdXXeZKbfBThq9b9
         0TI4ki6lpzRgdZXG/CXkhhiTouoTgZr4BSFHbWCfOlHniC0Qxi1YFg3g/rfwo6PWY0YP
         SbUg==
X-Forwarded-Encrypted: i=1; AL+hErFPuC7AUQszyZ30qwUB4hvoTCWZaZO2lKazyWQp2PTYw2ljmb7BMqRauq6np+ZIzhKGL2TtXUzhyA39bw==@lists.linux.dev
X-Gm-Message-State: APuU4Z98mcDPHkmBECtV3RnhEYxBroLDXKExfUKKh7/4lHY78OHOh7ET
	SL43gXX0IF3Oew3T+wg6/wpwhAZw+aHzggpuL+GIRWolzhLqvqYYoerkSKFOcGtVFpLGvkWqvAp
	hJg9cbsyCEwzwE+RfN8oeHgXmuBhzlEY5dwAf+WX6So86ifHftLpQCO/XjmykLBRCaA==
X-Gm-Gg: AZFdTZdQS/MTQUKz0FVQPnLEmmn9c99WfAUDGZ8fi1O/p1o4MKXjsGySQKb7osq5XXo
	FHo7JTJDl+O2dUJZTmDNEHjnD8rUaR1luZVkqtQgGOFbwQ6IwHMXMgUJb4jfaBVg+jHkgU6Illk
	n/6kWN+o+SehmelTB7Sff4CTpwEKFogNwKl0jNiZT+FSj7bCLRbsQQo0asxQm9/wHcmxgH2Cmez
	bEytDbdCZz47T6omLZeU4UGRgLT6Hmwp3d/pc7+qi7CLyTm6Hk6smfNeb8I82pz+RyoUGMtHSq8
	RN+2YOd6fKU9s8f5KZv5Qz34MTIDZ4PpRdrmNOd8yr+mSLlfSWH9pdE8KFB1mj4J/OcVwV7pSin
	mkmqlmnBQWNHe25C23TArzwwEYf5Ud0tLfxgNQq6tjzMQwaM/1jW3gMburTqBwwUg3lJYjsgdqO
	q4Hg==
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819568185a.36.1795685800756;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819566085a.36.1795685800315;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:24 +0100
Subject: [PATCH v4 07/10] device property: provide
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
Message-Id: <20261126-fwnode-for-each-prop-v4-7-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mWA2E75AM7RdS21w8SMPhz1qTA6x/LrBIO16v2e7+rY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UisD347EN/dc8jXfWJ4e2u4IPz1qxiWy/O
 ewolVlXqfqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w1umEACtRjVQioGlR6scZndulJl2TJoBoriH4OQ+SBK4qhH45NDlvAaaMmrJgs1dwORfxX6Z6ng
 YYYbAB4L5GGkjwvFfCSFIlyeMdhliMw+mI0BdPzc/90jUyfIewR3jccpFZTMHw8MUNMtT8HJ8IB
 Aq41FesH8YWIP+CuVoyAAKAEnuLN2SMOiSoU4m0A9C5GgRXcWqc513DQxkBjPc7217qWEExVqi9
 yOrmcp6JK03mrNrnKkEJdRCUOToLhCDosIUw7kQQN3XKjymkGfCXVzugkgBgM9x9PM9P0d161/3
 YOrcPdz4ThIVtS0P2+/cLKDF67L0oAoYQu1G5fX0qEllWqNjnNGTx7TNcPr71g288meQ9OMtqBb
 NFnU4YYJt/m1KQUBmNceFZ8FIuZXnIYsl7cSBu29nKvBb2tzU/qiRehfBSkcvuRJNPjm5YKrd0C
 H8FxsmJsM/gBFf0HPbASAWH8iOHOfnWYhcOQ2v9OHHobqHN6q4uoIg1/HFuCfhhlNuyOCFDHi0/
 +KuNlWqr6kVWkLB5Bf4VGTP69uhk92vGsuVsH2W276GnjHMmnib/SjRQDFIejddiZon7du8ACsi
 5EJ1J9WXntxbLpZJ9BJLZ01ndaqPz0mzHQ7EPTcsapEeuoRVgePUVe1xCpGhoBcy8aPKNhunyLa
 E2mjAPd2EXHk6sw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX9zewKD8Gh5kG
 9/wAIXMymXEwC07B/PqQnS/6Ntf6RFEkce962D9BEWUmiBRPL5TF5ZUKeC6+U7X/DQb78hcltrg
 C2Ei0HZtup7CoOYpoirQOWSpq3hGG40=
X-Proofpoint-ORIG-GUID: I1R1CtMdgY_Dv7LL-8T9H7n8rdFoxD4R
X-Proofpoint-GUID: I1R1CtMdgY_Dv7LL-8T9H7n8rdFoxD4R
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fda9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX/WFRAnXgd7f0
 K+amsgIVg7EwNwDlA4v8jNJAVinu65Z3YH+PYAutgmgxc+4i2tW3d2NS2ftNbYfubMRBcRnWrcc
 zzjWSG5oMUf9YTzKDgkTN0AjHrtB26qHwspUm9WNxFD6hrYLwdXBluStE+CIpVPmR/92gLGuWs4
 0FlifrB3lG4CE1bzgVmdSUVPyhWWtCeKUGHsOisiiLGjBWXcdsSHXEu53eoxg2lXXR2adtWhnwo
 QJOg1k5hJWkXObAEoK4SnAAzAx8jqo9vUYDKFJsgjkVp7BnPfTLXAUGZkD/yTxlMlh9Tu+X74KV
 f7wYeHIZT6IDbWiAEidwLiHHiN2MFGJObDIm2oQTbXmy9j7d42dZ6i8nRa0ENP4LTnkLCy8CMGp
 SwzxMGV2YIx9jeO4RP0UVPt9lad0XOJfhW3x7F+ntaa7hvaw8SIyJo2fQEPUOjT1BoICr5+bcC1
 DGqL6BhL4h6B4pePIGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d3c54c3d11c42ba4aef68687fc27291c7f33beb6..3cbeb147134143cf68af3213ee75c371af363f2e 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -655,6 +655,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
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

