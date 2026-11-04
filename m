Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801077;
	b=odPlFqRVZU7ZfFPuGbh9YPu0JKma2mNb3wiiXzUaobDgmn0WV2gw1VAsAUYO/d3xOFhe
	 TKWp4DQhDjvar4QdGQMbAILlIuA9BLX9+5sz0DMKLLgQK9iOOKazMpll3hI3NWFS0U9TJ
	 KmsvI0sGDolJTDBOJe3xKxJUOVvcf7rg0VUIP6ereF7faR3Oc0fCFe4YrzYBwTyqfEXrH
	 U/QItYvs+kpM+RaC4hjCZXXr/4qTSLITCVfpuINdb00iXnqlvxu+OhKbGnI5gNO+7PMfp
	 c+AxrgfsT6axW4NVxN1VB+ju5zNPZ4oI4+fxJv3RzuO7spyyP7xq7x+MkOlCk+b9ZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
	b=RHddK8Kv1ANyxgKRtqP0mf6T22gWD2ekJ91E6chqu6H5sow4OVBMd4JnpWrXFr+TcEY1
	 AWbBVLYAsf1yV3WPygXZmFN6GwavUxs3FXpvhfCIoOgFBwebEAl5drNI4EsVBdqdUJSJn
	 wbvGFPMKbsEpHEd/RkRn9zpwBg1/Ue/kifndJQEybWz6iS1ATJdtNGKU4CnLPZ6ibkTfG
	 +/6mt3g2Ftj/Zt9LSt9QMZY63f3QMnaZ/JyAuihMgmrSz55qrgWz3OgLGaElL05GtB7v5
	 EMKai/3jRcVxyOMaUXbzAoA1cVwNmBXzH4YJNrvAHWpjuMq+A1YS9aNiPnKQ9noZInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRQZivv9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D9606EE83
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982D9606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRQZivv9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BoA5N1387861
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=; b=W8TE8KXWhAa7mSse
	KqJyND/Uo3fINN8csA0WHZcbmFl7o58YkQE6yUYKCSKHoncFZiEhoUB9yB/IcGpY
	lv5bJhF9J6qBLZIjG8jyykN936enW2UF1OG9Uj/4xGwFwk9jUQRRtOjGGqWzsmpa
	RTf9H3EWCGZa4z70OSauZu9/CtxDdBs/ZCrm6SH0ojWgMurFD9Y1jLXJnR3rqlwz
	yj+YdduA/Cu6kaCsFKOTCKzuYtUr1TmmfvVVGEV5NJz/s43L1P/VdA63capDaYVE
	WxfbYInzK5O6PFMX3QQ5vxuGTY3886ta/cwtsQh0Man9dDcVV36m2GvXwM41XBOP
	zCge3A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsgae6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacc615f73so625168e0c.1
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801075; x=1794405875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=MRQZivv9lxQnNYwm/VfknBIAUka/8fNVwKd/tmBfX8jCoweAtC3r4+C4ybtzLl6NcL
         J8wyUqIDqXMtpJDVBQ20NaznGNJnLgAGVln9f+iYxoEvI6OBZF7kjsnYZXnhivDK1Nhy
         qzxshxGeONYDfBK1y6XFiSN6BSj/aese4O8zJ1eQSNBvsSS9IpNQ8PppXUh+TWTCimu1
         2pufVEOs6TKbEwVfonykDjysfkZJNcfKShYzXfDgy6BNHceqCTbqXnAfwmNRcD0B5p3F
         65/PVFyvRXcF04OPo3fl42ahKn6lhzsBIKx6AkrSTBVdzUPIVvf48XCmmfmmo7XhUZX6
         CWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801075; x=1794405875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=oN01PTyAm406kp42CQl9aBddcJqbRBg/9MQPtkuBp30stcOMYOl8FkxTvtAT8bn/yZ
         g5uieeUxRPHV0s5dL4mMgl8gDIDBi6PU3JHLbBO8VqsI7pSg/gLObkEBUc/QqvJkPAdE
         x3nmEQydXnjl/IStI696vvhYlFjZcsenjzYVYtH/nzcZYeIMN31/XAwUbBvTDLQZy/lg
         lZckkew6VWhjiqQUSAizwopdMt6JCRUaH71+pasPmO6VqsjqpbKwb8hm0hVCGE3qg4FA
         G7x9RClE65keaZwRagnIAj4cQ8w90u5IfKYo66uuvT90a3Hg1TUN03F2X5DLgwN/ksHm
         d7UQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdnyL8AiRJO5jxvud7sGIoKbq0UPZig+8QklVjgcXQN1buyTqBs7nqosFtQ8lHWIwENuxgjtrd7UrAuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yzRrzFDwok5EnGgI35HXxtc+jkMVAhbWpO0ba4szUZlGAceih
	kCKdAMqdT0a9Njk+ERmvXTl5QL/ozaRjqND+Zqkx7nYPqJFraNDrulEnDIvpCjsJd+10K0mlILx
	NKHuxRrkztw/DxvBCN7NvLJKMvfr9Uvf3vPhl8k/WWb2VYse9zKjQnuBNHt9AYH0VeDmEd4CWnA
	==
X-Gm-Gg: AYBFou2LxG0BsoM4qkGrO2A8ByyRFfJ5m1aiApXr3Y3lrCfGTUJU1BUmd4L7Lp5kQ8J
	LlOiejz2LjMGV5iCdJSw5698O9Cwds1l7IhpgE9YmUEOm21PCUxI5opnczqsZpGkNulkP2uuasC
	PrBFQyTe+SDiSOX/lRrqrlA3Y1oaDRkNe8RJuf0NjsQEMHyoBkw3vhSJgGTxn2nl5LbWDFUilsd
	PhQmDJPLOdRJSWst6e6/oSMJ1zGfsLuluwzVvWBBFH0zhkHpZcOoTrLw9QJCFJqkKVlXUhpFY1g
	7//9lOpUHHIfChouDKt3yhUqsqy/QG3dyHI7aBWGT6a9+Kt59PyHLDFos5F10kVe1Yi+bI/UjEc
	tBp1tDDZ24XSvF/1ATSfQcNLe7mRTovJybrrxxEPCBnNszRqYdX1l1E0d1x0f4UfKuFS1IeOjrI
	BEuQ==
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944723e0c.13.1793801074938;
        Wed, 04 Nov 2026 06:04:34 -0800 (PST)
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944269e0c.13.1793801069615;
        Wed, 04 Nov 2026 06:04:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:47 +0100
Subject: [PATCH 5/9] of: property: implement the .property_get_names()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUearllheTUa0mAxFBQA4rgfpmwyh1HyyvDmdireIIM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSMudMNgYFqcJmZ0DLcgsCP+qirtdi2op3S
 //eoHjcXWuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w5yqD/952xG+8H9EKe/LRTYijZFEaI7dbjICEKB8Nx0sjEwcYjqdBdkX0oHDq9Q/140tjPQSf+u
 qUdmFsX0hn6S820xkPwyyBg4+AE0oQYD+GabGX23mtxW1HzzaXaX0EE/EIO7Rgq9eQxtDqbPLK9
 kbqiniYPqMBbaBmtmjWgVwuJ0foj+FXKTtw95VwYd95a1/fV+cGb3OXffG3FflbxIXHVxZ0p9IH
 VA0B9agIHy8sRzm+pJKufG2sd5PGB8NLotn+zNMLTJbiRvJxXO/TPluKWty89//xYOQt8gr5jvW
 0OOIVr+vnBwi96VTpN0KBoxhE2acadMuU5PVAmFNNpUdiialK77WyltSv20jRrG3mzarDMctQL4
 /rI3XmjAyOWxrgQmoLx8REtpu/BbdheaZTlXUee00w49zypxx6QxsnzhRvYoUSBYAaDy2Fc1esh
 OSuUqmpLnhRVF1RfozKZOKpUgfq3hoi6R144EPidufa1CVMmfvk4s28C8diZQb706YSNBPlJCsj
 x/Zi0ljFw0fH+hlrBrb2K4PBvX7HduzJCxpPIbR8V4SzAaS5Vp5jrhJhlDGzDbALi5G7uE4CRt5
 QF3KnUhWpvDRhzBn+K6fbv8UXdtVrrFfiVnhJE1I79zRBKUWOhJ53fubnCpzH+/9Kit1B4lUnbx
 gRgmnYNRA18XMmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb3b73 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QAC4ccWuAPOjo8k0q0QA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: gk7uyzxrmVyBCgU5GEZXtynsWqYkUAqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+0r39vVrccRU
 lmaamSr7Med5ef1cpARa/UCPBQgOYzEeIIM8BJMKbx4BRDyVL3f0p+3ulIIYyBoKURiIOqW0l+x
 97wkYMhCLbAwvx59MaKT5RDULsbINnwe+Sq9Ji6xrL2DYcJdgMrC/t/CgbtiXe7ULjpqfjWMgpM
 sq95jKypMhjhXFax3+5A6ZPERJugcUpAlErr4n9pDJbSgR4BzkP4dPBGP9Yug2dp7LkOqqvakmT
 i+Y0hkF09czNb6ykXFMeDGQ8XMbZxzmLHYKTzSG4TnfUMQYijgHhDrWQFTRZ2kVAnN+cAz0mWQn
 08CL4ZVt47LdvbgujbDAMfN9EHso74seFLN/02ajiCmhrOcg6CdWw6UtCuEhZObsSApRdswmpxg
 ad8oKG7eg2EIr9rB+stilOtQE8TK41Wql1Ix8oqazzdhJ1d/mjrV1yhYuv+HFIJkk1DgIWkI85U
 29c0BnScBIH0vkvLAUA==
X-Proofpoint-GUID: gk7uyzxrmVyBCgU5GEZXtynsWqYkUAqO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX70YocdAUTtjP
 dsvCgIA9ts+HVfiZ/6AzSaWiUhd6ya7E4LpfI9gl8l0tvVi7z7pfM/EyvD18MV8JZNjNpx5KgDp
 aXqswHjgSqu/ZnULHm0wY0lOYfTZnpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..16c9c307633bdc7c9343782b1cd3bdb845552c6a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -28,6 +28,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1121,34 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
+					char ***props)
+{
+	const struct device_node *node = to_of_node(fwnode);
+	struct property *prop;
+	int count = 0, i = 0;
+	char **names;
+
+	for_each_property_of_node(node, prop)
+		count++;
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for_each_property_of_node(node, prop) {
+		names[i] = kstrdup(prop->name, GFP_KERNEL);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return -ENOMEM;
+		}
+		i++;
+	}
+
+	*props = names;
+	return count;
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1712,6 +1741,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

