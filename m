Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685795;
	b=E1gxtPxoNuLY3Q2nV/zUzHnvHnzCJPZU4aKE7P87wTTwGVMI0sJ6xZ4Bk93/IU40LZ6+
	 F9n68AuSoVbUqE38UAcn/fl1eZSLystBVTDNuqrlPsCpCoYOHk4NaPE+QXgOQ8Yas9FA+
	 Wp7dWg1tZf6uCmxjV4MEg+3DbNvLVUlyhHYXIMzENRYLXZVBAD61glb4WPC/Y53dUS4Z7
	 0WIdk93dXJAUQ4/+7D/kVMPC/TrPWNp9v+Jnk2FVAE7HpPyaEwLeZUaQ8Iymefjau58dB
	 WE4CM2p5I2CiYRIGA9PNE/9GPbyVUSlVU2aiLxnEEucYCXdK3JCT4CWu4+SYXLpdhkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=Og9fj+eiVPN696eNvdJ9IGvrbs0HjjJYPjLEKl5Shk8icdeyNBHcXZeqDer5biaqkD7i
	 DQjQTp65R1Oz/bRQAKiGqCK7p0k0nwf5a1nOpHZXrpkrZhCbw26S6UG+8TxQYXgMJhyN5
	 18tuGhVZEoV2MVvrfudDGqOaLoBA7Ztggd3sd690aD5kJexxlxbeXFZWPROCYoAGnSU2z
	 MWdCyHYAApscEFtST6fWhRd/Kvt0CA9Wu8/eK6qiSj52o6BOOa1hyH6jNvHHhN3vOhnIj
	 0Z2JQ1IIHTxR6P4obHKHaCfuwzuXC9uCWWKLl0GccCK2xHT8QSy71PKgP5WBUrDk4Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAp92qRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRMvm6tk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BD5606A6B5
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BD5606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAp92qRC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRMvm6tk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AxIF2175653
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=IAp92qRC6qZl8kUw
	dH2qKoQmKk9Ad0X2uXjBsxvj7BW98KbGXr26eM8tcJEOIXugphWV7Ln/tOHEOaQR
	lqpjFh2NVdRV/l3dXbSmQl27jsfXDr+jY1hv9AZ4uSbQm1vSdZZnyP7druC36Fsb
	8MjHIrGBAlGaABrHzQOQryiOob3K93lZyzzDBFNYG/wIuFFtnqnH1him/5evqPm7
	o2A3K1wHTMUI+9zfIsU7CMN0IE4Q5Gu4cmx+W8axXAK3Xpjdv9WfC+ghiXt8EAge
	CfgAXyMdWNvSwFax3OWCU8mfYocl+yrnsgfS5lRBjn7uAwQdyXs+M3s1cmgJv4LQ
	8fB4ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahut0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so1037667085a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685793; x=1796290593; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=RRMvm6tk1tjf5PHzcWGvPAL0p0x9+o6ZvOfgCjf+zTz6dv3+HMVW3WCfOcY1cwBNl8
         M1F05CRcwnbWKBCh9i64kAoUow80YfeQ+/R21tGOv/aOMqRT17JbpulXYXfUU4KhJm+2
         0381BTDvxLeUkCefbestG3oUnyrglgfFxv2WNBfA7/+O1DaFoHoLsRAiI35grCiX8wtj
         DgqB9u5A8XGqECla46pu2ofzXcsHs5Wy9DhaO9Po+EczRVdAwS/zURAU3jwocWRMPdyL
         lJRLOkJVYXGN5qD7nlHmG/7+a33tEH4I3GHm0EkplkDwsWFdCF17ktSkM8LcblhCnC6/
         zraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685793; x=1796290593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=Zkk1LoGSLUUtbU0FuDpx32Tm5NRzw00nBMw06HYhnlwGYSeY+nxH+KnlYLVodCW2Nf
         K03jBEq4F/I9oGoeefPQ6e5vZee0s+5daDxSVxqFaWbzE3gZ/x+Pj/I+ODxB2rfNFbGH
         C2poTT7K7FzK6VO3CRW9FuC0n3LzvmcqI7keb7ilwXZZP459+kaIrYUGuAsmc8tE0rDl
         d56xDCA94kgxhEz/twgY2HSn3v8DW7iMmIlcrwKWxudk+ww3FTIPiAG7g7uoDcNuN17T
         QxvQICuAH8zwgKgnU4I5f6sTPbZHapceGidFoIqaBly0ag8F6ZVh8FXH0nFRN+slflvG
         NIrg==
X-Forwarded-Encrypted: i=1; AL+hErG5iSZSkaEwqzTwsBkwJ//3+sFUGFTuKBh+efD6GnkANxQKGM754w/XZYgWdLFqMGBgCHqhhL9rgw2KTw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9c/xnCjwn7/MfClvOb4z/LKBhVLKgs4K+83ELcBgFGE1q40RCU
	/GXiCLrLm8aPP2ANRNpqvDDPqR1JUNVHgUlyFl+ZIUnteNcMJMLTtUDxWuGTjKXRpiOOExZnMHA
	FnVwKJcqw3rsTV7JyfOnALEyQ8SlFV8J5vRcWK2gI0PW0zuVU3Og+ooHZwfx2pOWviw==
X-Gm-Gg: AZFdTZfzQclyteROcWudVv6BrxOVjmcRNAbJqvrTWNQwm/zi0arH6OehgAewwxlOt5+
	rd3UUasfZUVylm9/T2UZx/YPO8ESYDJuvlcl4qFwHaIv5ylw9Ht6ZD2+KfoEFnShISrmP6qCs7t
	TBi2nCiUt36GTk8UlcnfSxzOEiLdYW63qAYoDaFcQBu8UKO6v6EQGbw2qdypjKUYmHN7frtHCyf
	LBUTULvFakl+M1BW5vQDArC6BvqTDxdwaCbr+n9fB3yleeXxeUFWeZbusHNCt/bj3j2QAaXM+if
	nxuggJ91dDAOkEjEIwuZVbq22JIkerHh9LY11lfr4YYeXRVpogeXsnyCDNCzPDKV3WflM4CZUIP
	DPBFSPMYiNCsbFDxy/GxUWbLEKKDfcmeQnM+l6xjTW/TyJLv3bW+2a05sKleDkYetnAB8yaSvqk
	blXg==
X-Received: by 2002:a05:620a:4386:b0:949:ba11:9612 with SMTP id af79cd13be357-949bab0cc38mr3252448785a.69.1795685793262;
        Thu, 26 Nov 2026 01:36:33 -0800 (PST)
X-Received: by 2002:a05:620a:4386:b0:949:ba11:9612 with SMTP id af79cd13be357-949bab0cc38mr3252445185a.69.1795685792680;
        Thu, 26 Nov 2026 01:36:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:21 +0100
Subject: [PATCH v4 04/10] device property: provide
 fwnode_property_get_names()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-4-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UFL2eWa1ZnlPyXIe+eu3NDH2BDtxgindkM
 qle2Zcf7BGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8ruEACK/zZo1BDYPo1sgvFBUDw5zsXDSNiM7OCb+9Vg9ICw5+sNdKHjQUYKn/VjG8DU8N8iYzw
 vsVuP0rttxGsPtjK68aEchLxrTrHU4EPawQoU4UZXvxHgNRQCRbHBeKimuyTq++AdjVwMSfX3dZ
 RguXIHFAOZtVo3HMTh1YXrcABHFzIg7ZY/OJyeI0knTMUxuNEeCgWYpBwfPVTplcQoJLWahh0fo
 7sGucCydGHn7bq6It6uLVEbvJvVZKRINvao/KdooCUPFW6MrCg5dH3nfjVwM23h4pdcB3LkSeqf
 kAjrIGQ8q/Fe8jZZk/R2D/T8cOQ+CS/ZbEN9EGiCrYR6FN2myVFeM3Nvz36qH6gbGDSwIsLWFXK
 ufWZxvT6pc+CwU+ZBEg30Ix5euq+Q1lYf2iMLiZwMJo2TQ0Ff+t9Nx+K39DM/cwKRw6Is6MhDiC
 dqd44UK1vTceSfivfDmmJi8Vw2E4NbSiHTNn2uRWThcfN3In50A9ODo7ac5odnntiEGt1CbYM4U
 CxNlDnkgUHhFFZC2yYoztJ+q2uGf4dbNiAU9NCstbSOgafCtvEq4krlif9J1n7iUjq7RmnNjXem
 lcIZX9LokgGTjQ8QzNpwWaTWIQSg64LRxSu59pZfP3MnG0D0QIaMBJ801V1j9VefT68eJqi/VcB
 jY8cFOAF4y851tg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Ii3bIifkZsO1NBP6KE7o4wIIrUsXW5kl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX1B9vrgh77nE6
 GF3lRL4XNAjs18iYoYKuUmgNllmXd8JKAuak/dguA4hAJlyls/A0KQMJFf+rX71DvqOfkFCwHqe
 HdMgul4mvvVYui2PoPbYvlfkwoAAAOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX41AmbGfhMgUE
 lo5Us4VrXu2hhfmEUFfCWkZwR7gchN8nmhfjQwoqZ9kmMx/DmCV2LiKZEyKSvFUw6NzssxzCGI1
 M8Imr5kdODNd3OV7NB10lPhKBo2MP+gmxf0yMBukSEMSHjFP4ZXh2JyCqJqKZoOcNYd0yXFrxV5
 CBIUp/lGJ1cQ6pMvFp4NdnaF9mTiXY98KWUrOTCyn6l07C7L2NY3ErqqvP1UbO841AcsLnqT8lQ
 6huxH951g3ZtDuEceh7kp5/tjsZf58kNfrkvg7RAVL40TYvbKSH6Ny7yGncDxn1XiiflMvoUtdz
 YaOsUzsRaklzpWQEFDOA4ZUyGrt/q9mH0Lq7E4TlFQp7eryk7bVO7nHLRbQnpe9ofFq0z4fcBLk
 kim60ACkxOLlfSGBlXTEI6sg4aLJUiZM5aUiZLJ/yo6c6l3YEvPi1l54FwsMEj4IECmFG/5Gktc
 TDtTyufvBirCFifDseg==
X-Proofpoint-ORIG-GUID: Ii3bIifkZsO1NBP6KE7o4wIIrUsXW5kl
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07fda2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 80 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7728116e296872b7ea4d4475aee72d95edf63eb6..d3c54c3d11c42ba4aef68687fc27291c7f33beb6 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,82 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names. Must not be NULL.
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once with the ones from the
+ * primary node taking precedence.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). If the node contains no
+ *	   properties or an error occurred, *props is left untouched.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode) || !props)
+		return -EINVAL;
+
+	ret1 = fwnode_call_int_op(fwnode, property_get_names, &prim);
+	if (!IS_ERR_OR_NULL(fwnode->secondary))
+		ret2 = fwnode_call_int_op(fwnode->secondary, property_get_names, &sec);
+
+	if (ret1 == -ENXIO && ret2 == -ENXIO)
+		return -ENXIO;
+
+	n1 = max(ret1, 0);
+	n2 = max(ret2, 0);
+
+	CLASS(strarray, prim_props)(prim, n1);
+	CLASS(strarray, sec_props)(sec, n2);
+
+	if (ret1 < 0 && ret1 != -ENXIO)
+		return ret1;
+
+	if (ret2 < 0 && ret2 != -ENXIO)
+		return ret2;
+
+	if (n1 == 0 && n2 == 0)
+		return 0;
+
+	merged = kcalloc(size_add(n1, n2), sizeof(*merged), GFP_KERNEL);
+	if (!merged)
+		return -ENOMEM;
+
+	/* The strings are now owned by merged, only free the container. */
+	for (i = 0; i < n1; i++) {
+		merged[i] = prim_props.array[i];
+		prim_props.array[i] = NULL;
+	}
+	count = n1;
+
+	/* Properties from the primary node take precedence. */
+	for (i = 0; i < n2; i++) {
+		for (j = 0; j < n1; j++) {
+			if (!strcmp(merged[j], sec_props.array[i]))
+				break;
+		}
+
+		if (j >= n1) {
+			merged[count++] = sec_props.array[i];
+			sec_props.array[i] = NULL;
+		}
+	}
+
+	*props = merged;
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_get_names);
+
 /**
  * fwnode_property_match_property_string - find a property string value in an array and return index
  * @fwnode: Firmware node to get the property of
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..a70f3c4c087dd85390951da950c3632f89c6cfd1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -77,6 +77,7 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 

-- 
2.47.3

