Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801080;
	b=Uyg6UIBHFcqfOeiJuA69AGzD8kBJuGzk44XWdAj8jpiSt+zpEmlbXEPo+ftWMFy/ORA5
	 zaJYGxWkptUOrspr4sHpDu1WtG2uAGgOK5IkmXpsYgHvgLX5wr79vzbH8xD9o+2XCyJUP
	 9OW0AvfBmDHFTaj69NiAWSk1snjWboJHGn8qruXPRbBwGSvLwulb2ceJOeuEoecUHR96I
	 DXpGO2d6OPjsURYFCzQloF6BGvY7brltZcJNmIGoFahrDw1+qnXTQquXBp9JazaHjTwzq
	 p0wsiMldHgnMcy4maDGhEYGvWobWaVbt5+i3TnFi1P2ppZzOuyGWEid9usDchkm0fLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
	b=jjjrHFQypSkmwTuSuFGw6BX7Z4Suw2x6FDNyfM+gxdWwPmYHjixwDMa33F3wbk6J5I32
	 UrUvRVAJAQ4pgDp8WglyJOfxEjhw7GPIeBbdX2bHqKDXEiQmBWntlZ/djUML34GsWqb7C
	 gH8GzxLJX+sL8ys6dsrgPfyIvhI1EBY3gsuOIuT+/S/EYnG3eZJNbHI/yaPHARp/PtRcJ
	 NDq/t+X+XI4lAeC0kJKipdhBDiF2KFiD4hiNuAxTGtq608NXPt9p8puJdk9XpKnMqxUr8
	 Rb50NtVZ0Zb9/Eq3DVoT2eTo85kaC+Vvo0GAKKbso0iBjqsm3TFWDLbSntyymGUUk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vl3J+cJM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A449606D833
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A449606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vl3J+cJM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1KN1149918
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=; b=n6BlCfAplDkRIGJY
	OtZvEiHnmJxfVXUqgCmbQ3HY4qMos58f49uoPT2qpuxiyvNqXiZUg3EAZ5KwManW
	X/P1irYdeYwkWlRqhibdk0ToPW3KLNnTBRwQTibR6cnH0c2CL3909RF2qxFC5T4z
	MRmi9u6ZWWSk4u5RY207c56jDfI53aj3If+toqprwFx9Ltygiea/igBKX3yIXB1z
	2ASo1yVQ/7vqLDwKgTyjFS0FLODgtQOWhBH3BwSI9kvYT9eMd0/0Aucly+AJ/ijl
	ncAoe+ZbTi4hAD4DoJLZaXlEQGcrbpqC04GepOi+liW37GrSLDaBhRL1d4h7xKaf
	1U6CiQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y435q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so699661e0c.3
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801078; x=1794405878; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=Vl3J+cJMV+CbFQ+sAvGMKlBTso7w2RQwUPyl6u/iokVAmR2u30B7XqPym96AHaxZq4
         bLKAdoWYgUCA4lqvaHUKa2cjYfC5JnsoQ4x90LlaJJ+IzbJz0McX+tkl6X5d5rCmdmJf
         rT51X2L5yQbaOauGI14Uf9/uOuOE67vIK4sJATtkT/IdkSwY9WC3gGOHrsmdOvNLy+r9
         tDF8nxZe7xQ0TzsWzYOe99PA9+m7C18HJe1T8bg98tC0eDMo5+M2I8MQC9LJxozibjHr
         7DWdtXqbIHTDpPT2EHDH//AEbl+1SqtZK2LYLqnzQsAuq7FQG4twE7XYFBt9CtfFc0kA
         JMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801078; x=1794405878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=Q8+DKeloqRJ8iD2wxhn/oHBK6Bo2AVFTXOSB1BxPwp7WrHW+0uGCcIcJUDRtf+xd1Z
         3nGCrAx6gPAkFalUEJMqXE0Bs4zUky182vAvWjB6vSVK8+DT0aoivkk9hRBu9yF2HW5X
         LFSfoGQY0o/EBqrZFIApe+ixiGCGV/T5wwXkVHcLZNXbQnydxvUjGDUT/q3O48cREbGt
         7TxFvpZm36TUSA0IAw7I9kRXxdb3pgZ6AOiHP4FaBHZ3JjZAbgzk+ow1OgyPLiOx1p4e
         fVu5/N/BOw0LsZGJO+8U2qPglHYbTxY8q0CnlDdnziyFnqtLJy2+eL8ryZmbOrNcBmmW
         cr0g==
X-Forwarded-Encrypted: i=1; AKwUvBwbiX2Su9A8mL55q8SkiTHDpjrUgZ/9j/scLkkbyZ7R5JnuFwWv49yNx5IfcOSBBVQiwv8RM721CWPKjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9zXafT/UB34PUI73yD8DlHH2GAg1pTCasgNNSlBor2DRyFK+aT
	Se8E8SHy2eFnLWwUYBIV26BnR3Yv7k/PJ8v7AHWXhmRgibziQioZNlwolBVW+tn6ZPn6WtspNHv
	MwSCc9VEeQ2EvhqQkBzRgm1OABjl/lkvrkbfCrH1eFEzUJ/POqS9eiSaR4+aLE8nEP+uF7LVmzA
	==
X-Gm-Gg: AYBFou1jQmu/QAmtFTc5YPPz/O5NoE6q/H3W1AaS7f4u7xp31xZitryUN9w57jDSAjW
	Xih4/ExpeXwU3jbyK4RAvk75Oqp4LHTucnlJEPq4Yy/SbwhaXoZ0naw7kgkAYD2a1rTJe8XeBms
	Xr12pa/r/e5nQ2KPRBB9+TWAlt30x9fz9oVID7Fg6N6jsNoleasW/vlYD7fIqrBvfvRp9Q2XBwo
	s7z/cX4q5+ym/dt1kahM4SQMP7Wf3VBrv6yDyRGZMki4D9G7+nee1Ekq6kk6VCxRVRGxTy73zTg
	RdIXw4JwmIpAWLpMxLXQfsPX8ABS63q+BERQyUhY1s4Wq+ecfG87SVnAzpDBaa1zywqJQVPja0b
	NRv9KONk61lIpsegp185UYET6hbTiRTw4zhmkI27/jJyS2ayohf4IO1L6qT7USltZbt1jxj6Hq1
	06aw==
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593946e0c.20.1793801078036;
        Wed, 04 Nov 2026 06:04:38 -0800 (PST)
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593898e0c.20.1793801077646;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:50 +0100
Subject: [PATCH 8/9] of: property: implement the count_references() fwnode
 operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-8-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfcJL94RVspgN8CyK/snZo0rp9b0uidqlV9W3mfnsrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSrVGZJPcf5ImbusE8w0YzObuzDwHNwk2vf
 XWwfHOBNamJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w2USD/9+/oAE3ozJ0woCpNJfEKxkKc6OkP+Fp13bf7ApUWvG71blBdfNz430uIpxhii9lx9NSHF
 H5yKot93opIVe4f8X7I07vIwVAQBfP1dtTdnVWavMAELyhSWVOIQX2Lp3EFd4Rtky9afjzaw5CJ
 n2zulXoabInrDbALeCiYXy7xfflbtsynqdIjm6SLgnLpb4SURUSTbySU1yoF6hIZLyU9GmQ+Zm/
 A5D4lBHWrYNUZL0OIcWQvWX2Rq/S98QJJAzublBzvLUImTHuwL2SuDBQA/qMIjc8oKlukqHP+/l
 QGKLXZ/T5ru2K9z8VOZXMD6tyZBzMrVvhZSIBS3UqsgNlS5FSNVGiBR5bWprnwdgXI59W5smAKT
 toEgXdyTdb5o5ZUIziSIfpQabmoln4rKHRISWIGZQ8WuqucOi1iVa2XCEQKsUkLiy82wmALNRKD
 uPDnmLZQVGnDdSWcMrHPAQ/qWTFNV4K1lClnzSLHITbCd5uM4piou2+lxdYgbR9X36K5wP2jxS4
 areuRfuUDSYwSS/3EZBlTtUolLcKcPFlfrgY+TPvIuh8EPLSKz5Dc+BGF15ed3UqLsy8M2yU5GU
 GxstGJJLPGB+wYvlupd0Y9JXoZFvF0wuLIWD1XqR7FCCgW3to2+DXgWre+0LHZF5xUFVpyD9SjA
 YNWIV37TclMW99Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ykKGz5fJJVb54no8SIN1W3WlP0fB9W9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX/xWA/oJM4MGJ
 hjp19i4mQMA5QA/2gOTFRc6Q8r6BELpaXGnuC15zU4JDAMJeiO5rhwq1hFtvmPm5BwmWwGtBL6C
 /cIM7po5HaqTXZ0ynrlVhnzFZVLY/yEfKKkmeT4waK5V9mcwdy4lswwixjrMidn5d3sUWQF8zZh
 ekPTq0n4Zq5WJ6/erYlIuPYiNeRfVGn5AB+SyQaWkR4yoGL9pwel+3LFPTJD9TPDjkarGGPQBxo
 dg9o2lMYPlmHqEyllZsoQpAWzvjLjb/jdzS+yCN9972v/qdyaaRoTAtJEF/sn/RYWExD98LBF99
 W8auM4dx09QtRKvVZaIqYBvnugrMlbZ1vBtvFU1bCcCuAYXPWqnDOkw1Eciiyk4H+y2+IRcBuhP
 gRy8UN31jVbBh5bxHcRmAUwPIuyPfNbgIKDHJvvYFnU+8e3Ca44Cw3G3eDBC6QEI8IXWZA4HUGP
 3ZHZjVzcuiUKqhb7JMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfXwzzBRwO1x06I
 ChnwNjsHzlQctJlVcwVidpqF6RlwyBp2vyWpTr9kLeFB/6WVMrB8uc6GsxMt+xaXeXNpLtZzCwg
 AUfvwuXMaxhOZOS5DKr1vqyAwYJx40o=
X-Proofpoint-ORIG-GUID: ykKGz5fJJVb54no8SIN1W3WlP0fB9W9N
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb3b77 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 16c9c307633bdc7c9343782b1cd3bdb845552c6a..ae2561479e2382b241fd87dcddf52dc7f52a950e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1231,6 +1231,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
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
@@ -1747,6 +1753,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

