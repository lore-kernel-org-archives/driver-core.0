Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584847;
	b=4vzKDNUhytFH3LU9i2CvkLPm5VODeydl1OEX9PmViTylteR9Cl1bT7KXCugsXnUA5bVP
	 27z25HqGUVJ9VP3ci+lGoVR2L1gcSBs+4+zHdx93uuCzF/VH0VCRU/ZhvdE1QkN2DDs0+
	 /PubCRej5PwOTHY12Z5bLFAHILDFLI9LvmL+KkY7UeBFmzxImFJv9cPb9jvr2ASmGrkCV
	 /jD8xpp87MseCErwvVS0UMM96w2/IHYXs28fbKi8r0Qluo5sX++YCmjS1m9mitVlvedim
	 nlmBJu1oXH9asq13g1YDz/GwSiu70vY5YqFw7OyNEc16hgxKD8I5QQ+ZJC9afBGtoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
	b=PnohlttgHPP797Dw+X7Fw3C+bT3ZLBWVe8JczwbN7DnLiQIinMw3UKIIhh88g5NKKSH/
	 OgDGLEXHQkgHKsz+9QB9pQJ6hit/IfkWLGIOpIUEmBX7ihatameBvlKtGarx/gC6j5GCi
	 8g5g9SUOTV4xpEqMoXSij8Y1sSRy3R1xtxhrX3zX29DaVNa9Hga7Ur09zzktfOrTP/ASC
	 6DukncfT1ItgGKMnT3eI0fcmQxq8id6ib2m0E1LCZYobDB5qXO4EzWA+w9kdT26PurLJv
	 UGxGWz4ZkALwzNEIKyc+bar4cc1JKnXVYJinH0esA6r0H6VwJqIpD1FhPI2RzTC6xhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh4PULTz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AE60A3834
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962AE60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh4PULTz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRIM3296047
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=; b=iekG1suwraLe5Iwp
	M4S1mk3eVyRSu1rhTFQzNkopKjX99A0qeNpQjDdXsC611k2wve3nYNcVv7yRBAEa
	3Roh+ewvTQ5+dTQqVgKX+AD25daTjH3RFnyWUeW1YQ6sGIB3EY4UUiIlCFdafRwL
	hv+LqyAYbx1ejFXkcMSqrOwxhH8V/u3HSHad1QaUVCqZKPbwexJpqAJdbU0jfz2X
	WQkUgYIn1dbWCyrYKrdy6KNrFxZOaYT8Juy1ExGUtBTNd0+RJCe3oIa6ArCbD5oZ
	L9ogVY1HpbJsUCUnNFnaKeKQ/ynQiaFvjpl7/C459O6Cn+p7P9qOtlgO3TZo59xh
	UVfJSw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6t0pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:25 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67994010b21so1447293d50.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584845; x=1795189645; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=Bh4PULTzdIU7r5ZHImPXQkFMO9PGlIcLXpVBmHKIrrqUEqGjTvXx34q3w/Nwtm/dNo
         e5XTK8Ys/RZabGeOcsxJpJOeBB47+sy+CFB7G9AuGdhILYiOy9P+21wYeelkgPrq06u2
         jvZto4GlG4gbMe+F92ayrLq8PBQfBe7FR9h+ApWgGnWoEQjdOYNymoAgZswPMW3w7tEF
         uc5t4E/dMBpBn+dgJF3A0xJ4vEVJg7lIBQlD3k8fKO+NxUOzafCzHk3YE7lXNcbEstAD
         Ppui/3I1mRR5KC0nnYSfeQgFLoVtVSDc9f7Ej9HqCrfpWrOAVw6wlYHlRVtIfkeE39wJ
         xUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584845; x=1795189645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=CtFGOs2uiww6NjxndUlCXbVKr4aPrlP1a6FjI/5QDMVezSrKRUu6EvZEJ0uA4g5HYq
         rTyMFwpVaNp1oPHg8erKXOX7OzMMDb6xF8r0glpDa1Xroto861LGGj8t4+oq8xoPJuMg
         qGR/hOzXebNrWjhb7pPvE2ImtCD9Urqm/hMt+RR2u8zXk+DjnUOqZ4hhCXzLIfgxvIuI
         83+/FO0DJnsSMvNMkEwUe+wMVMXIkNKm0ZlSvykSQnz7BmzFaIiE+h5yN37OtuBDCYog
         h/E3lCrV7DdhMugTkdtF6AXVR48oHah3ZA1Sv+y9d/I20Dp3Qg0JGijEHzZuzdUbzWov
         Ah8w==
X-Forwarded-Encrypted: i=1; AL+hErFyyGyLFVrB+C1rkVo+3hCrWFAVeN3fU6x8nSlUuQqWkW150ZABON4xTf4sJTxGaTAV4thW6bOvm2ux3g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Up286VtP/KsTiqgkU8lvWcTsSMi8cxL80vloj8Yksu/SEVYIA
	RSOFV3H22KZO+OZ85/C47PWkfpUjLKp1dzjyYkfkNy3R8F19b0aV9VYpiyd4i3bg/T/35UoOoCs
	HNXwbwkg7qj4mTPRMO7MuSjpaHRZD8UBVqFvKTDZ2OPPhFYxq99zLIVh2bVB5vY96nQ==
X-Gm-Gg: AYBFou3RcAap3sDQGy0Dgg4VIqDGw6rV3YlbJvKK0TO1yOHyBMoGCPqA/H0CuInn3WK
	Omji3lExkM0ckISumsEGL8hHnTTopB1x7TxcF1bGBNNPXVp59rmT5UWRwyIGZpuAJGAruCDlLx9
	4fe/v/WSBHL0Bhp83rCFJ+cr/YhfOmb563nmpletgSybUul3xRD9Jb0QAWyshcf9FGMewuwG4ma
	2ql5M/fLXFY+LFW1prcpD8ifzKcpPSsAcIThcLlNVdGXfEX9KgwYuyPfSJ9HgN/DKLBlQ2BYZcj
	C3KHo4kNEW+QmvxAaylZuQFMV4J/2ChweUMky8q7OHwMBXD6GcoZEX5vL9RUPIVVOgebs50eQIy
	CqNeVyNTNZpgvzrdRg58E4yCcwn3c1ZbjkCsYtPhtoWgwXJ2QvXdhO8BtfL6o05z4xQ178DDvaa
	iQRw==
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024500d50.36.1794584845102;
        Fri, 13 Nov 2026 07:47:25 -0800 (PST)
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024446d50.36.1794584844098;
        Fri, 13 Nov 2026 07:47:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:08 +0100
Subject: [PATCH v2 08/10] of: property: implement the count_references()
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
Message-Id: <20261113-fwnode-for-each-prop-v2-8-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BHN0x24xd95rb2mhrKGRQETyCRuc9VJoqjjnbX570po=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD450ufs2CwVIpCs23mOJpPGkbNozDQSNWMs
 7IW9kDBc4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 w+jCD/wIHVO68ZHJpmCBcn8RSkyF/jzaZvq1EgP1/4uD5r7F47ZOwTPPMLcD1RwLlOJbHtQ0Vq2
 YFupfXTyrv4pK+6fyFBX5JfE8Ev9v6AV0ylQZOJbesz7/bJz5gSestg/uBJc5ONJAfowsfNWmku
 nFh4LKwV4kCuJbfHCtc/AIMC9Jog5Vg3GzI2srmBCp5YHcweYKcpeYt+IpKwaBldPyNBk8avMK6
 qe/hSVFsRA5ADywQFRBGIy4ghvGgq7Hz70jx0Zv3vc2j8VitCD88MMuuQbOI47szWMpMZRR6L3h
 r0JKZ9EvpgMxFQmiQWSvVjMdUg5Y0/dUGjwuYFIWMa4RylfYWD4uydrXaYlvsVBLB9sWrAniRWk
 PS7fu92BO8MRfXGHEEeVSAle7/0w7C2uGUbHJumm4PXYtRhlbawUGgwgHTxh6dA3VNvhUvWY8Hv
 EyKYOt5kX6C7sMuCA9a3VCSiDZYdVICvSLovK5LfPxW+l1ROTDoPOMwb+qBNQ2jcUj98SOAagRQ
 aL65XoBIlV+qrUi1B8uW4JLGFynn8FNrA2cCSiLP3eUeb+tcxb3vV6psgj6oTJB8qia14sf1AsR
 auibpNS867CZQSAuPWaX0Q7uymbX/MoOMumWYasi7033hymL9Vk87MJPQz6YsAG6AvZqWlKcQEi
 YP1Gau68T3bcFmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX2O6iOtTL6YJ7
 cBussbVbMmp+A4RGu1QSB/iwsn3HWNA+BFO3x8b8fGdKfCPDV75S0UfmmHB82JptDGxW1vHxKzc
 0bO8G1pZImhNUxQaA+JN/9wt7URy8QAuzaj70fnxzOCP6sdeWCEUsANZUV1L/aPx69d3AcvZOUC
 QNIuo9cB+NdXILWoMoeKPleMw69OWyKD+4ju9NmvrPpAIAAW5SMbwg51ku3Gvg8Q4i1Rp3Jg2ai
 dat7NHnwKyofOMyb2U4uEiwm4Ybe0ImF7Wgv2o8e7VvjHIBpgP/mS6d0RWOYfcL9Hv0ITxK2wy8
 h7lBEqdBWWzz1WAPKltx7tRVZePN/GBqeP5qnzCisOHXGtnNdF9NQxPuqFEJkQZj/hmk+iFHLL+
 RLXzpWtnkWMp4XCq+Zgli/zl7RbXK/vMtfjZATs8nm3jL14O6wFJErCMvToACIqM1ep8/M+Y0Iu
 aS7zV0BWFApg5IXhVCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX+Z+NInXCCY0o
 8wChRV5I8ruJKePUbEeKZECM06FOGwrthSO8q7T0abTBsxt96w395egrD3PvoPqF+peUYQ+yE3e
 n8oMmzYwTPMxoPJmsdx6C/H5RNhJseU=
X-Proofpoint-GUID: aKsfPo-zAyi7e6BZ_sfGl9cby9RAuz5b
X-Proofpoint-ORIG-GUID: aKsfPo-zAyi7e6BZ_sfGl9cby9RAuz5b
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af7310d cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53f2c84bcb96d3a00f3cd2371010628493d49bc4..c2f5c338b6d1e7f3515be76d21ba6ef097e65e04 100644
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
@@ -1749,6 +1755,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

