Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801065;
	b=j81JcbA3NQcRGYmaOaKWgeE8z/4287Z37oeqDLKDmUCgSDQWKaczEMCfaQjoXqRG9FED
	 tOxG/Tr9j8YfN+ua5bOv6BzSz7CaOaHtAapDLTLsAQExe+HE13D32RC0oVyI+/MnZYsu6
	 If5SLBwNmBUlalH6GdhFbQ+tGluKyuP8wn/dnw1mgOGGCDHorhsUslCDMX5656qxisIda
	 /cYuvOgLvkG8/AqRWPufh8uoakgV1nG2sKjuxRPgmJw0R5nSGWB/o5SfIRdbk9YvMpSAq
	 wu1VJnCbJQ6bMoTtdCFu31P+QIopE641dMIhis+aaENiEjm+OEkad7TSHjFwdvR/ZhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=vjxF1YmbYaNUekr08G9H3KmDiqEMyJlMzKkKkcEHuv4GfcS1pTaB2qAVDpr8Lkr6bv7/
	 7epmbO4ekNPTzqv7WrcZVmFEaYMKVzqbSPszHTebKSv5VmftaV1BUreiPxJiK0w4XK2M8
	 dGL5lQd3mbZbfORimuldcoqyFdfCD48Voo9toFxQaTbADvtpRPmuYgK9f/wEe1JO9z30e
	 0VSu2RS/pdpw8L75/Yhp12JRZHNZpl/t2gQp1SSu1XMmupUOEvGg2BsWLgVwY1PpbIEzO
	 AKDMMDZ1APaMqtoxGsIOHphP6thj3cnxZrpdVOnpWlbpHVYSA6M6het7Y9iQkQPLE+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPeMvHvw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3A606A333
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD3A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPeMvHvw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba8RS2284431
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ZyMWzQsB8somTKQ4
	gMi3RoSQ0KBzQTZE959mdwa0DCr+eXsvWQEDJdWxLa7xLthPcip4E9US2RhNMUWO
	vPOamxpI7QvNV51/ZY8ZpCnK/10yZlknDsWdxAzy1J6UcIcgAivPuTHQK+lgPg5Q
	PhPIaSavgqP12V00C08tkIK3kBM7Td7NRc+pKl5bjpgs53iwESuA8GApOxK3Fo5f
	TH1Zqaglwa9JC2cChxqY4URyvZkKBs+gjb2u2M/2c/bNR5Gu5giyKwkGrAM3gRjt
	ZTWTtuVKqwXtUxboWAGuTMnYMAjgK7eApbNceCSHyq02GsYomazYmOBkFyUucd/H
	+4Az6Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec62c05c25so1657816e0c.1
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801063; x=1794405863; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=kPeMvHvwxorL0io5Zk3cR9teuOCfcBfYzWN04uZnXuxh7YCrLXXHJ/fwXIoU0IxgQO
         ICpHtTcn05a5bexxvihsq1uDJHTkzkBbxBa+NrNEhQIc29fGSfeBwioRUd+GenGg5AaX
         yha3eODXy8j7d6zovhCeokbaqHB3LW0DXwrOTZ8uj7/PweXRfcz+y1wTZ6jmjsddIw3L
         sbfvKXmCfuRisNfk1omVI4g1/q/UEb8zW07cpu1pleEb5bzsTd8y/0X+ZjHSVx47e+HY
         0tGdrDeDZsCvww2PCNDvhGroM1FcP8MAVOK762Sx5XU9b99dyAtcBd48mfuvN7wbYHMx
         r5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801063; x=1794405863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=dyN8QRkWNQbpSnT3Sw6CjqoYOMClo+h3dhn0C4E2UdNWJS1frmkowJTK02Msxt8j4q
         SyWeD0gGnbRYCQJezuZCt5EZ7KvP08M+YjGYhU5TVt6OlsctU336Q5e02nIXQ6nIoLI0
         1azYn/5CPj3fdz84UeGmIxODK9KnZ05crNSDXtIrHpt9nP9C15Uq8+wA7l8eT1g/Rd63
         AefoMivOv9cm4F8+hwA7B0m7qNudIU21VDh66RdF/fi7anULSqEFArl5FOr3nh5sB/qG
         /IzH/bVUqJqZESOpfBi2525zTlLuZCdJg8zIN1Jpq9MRKvPKbRHL/qbknw+FNUStvnlu
         k9KQ==
X-Forwarded-Encrypted: i=1; AKwUvByUaSeZLcvsadjV/XdVzRmBsItdSviMoerBv+p2Ytq/PE8t9DV9tu/wRFYiJtIENm/M+kTe7FJeRl1E6w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Bbd9Awv+UG7p0oPruSVmDdkM0qPTv5fNQ81l2Om4sCOU2Auzm
	Of9P8OYIOWehJe7YRdKoyopXKKRNz933sLAvUP3iC4N2J0ZwvsYcw7fViL6VuGaN+EZ0YXLtlb4
	HufJIWkCd3CX2BGSn/7GvzDLKgt3RLxLlUEwSPwXlQkraUwU+LXeqmulrcnGMv0tN3KaWdULebw
	==
X-Gm-Gg: AYBFou3QOiIs+k7E63MF6RiOfV84TuLU7QN7zJ3HWwKDxnPhexXWphuX6s0Qc2i76nf
	NXT6yFSvE8JjzLntOCoBJIHqKdzJdWcv7Upf0ranoS70PbkOfFHJWCxx1M1moYHMkUDt+txKAx8
	a3NGScmP8+ROzf1UW5EgG5S9Kyfn59KdihKjx0osUfn8yIEsgs1YRtUbeoirvZlF7iLmvX7UUdt
	cf/CGVoaAtQOUqredbsq0hWaw88PskMMT+7YOLCc9omJfc1oeX+dZobvr+vDMBXZ9W3leAkSVPb
	rcn8HHZXJWpMa+eXLA4gdPfbYI3ax7NAkDu825y/TqKn7x6dUY/npGTCvZDFbORQ4olt/OQRmIN
	qr/d7CZNRve3j8tUE/w0WgD/+1/RGfnd5VvOctMOkIS5Au2RiVwPC9xuGlxua8wzCG55oSrRct6
	qu2A==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306390e0c.15.1793801063021;
        Wed, 04 Nov 2026 06:04:23 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306326e0c.15.1793801062468;
        Wed, 04 Nov 2026 06:04:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:45 +0100
Subject: [PATCH 3/9] fwnode: define the property_get_names() operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-3-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSRKXWWkliovY8qVo68abtoXtQZqXdDFLls
 EQ9sf+1SpqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w1S6D/0b5eyCDtTat976om/WwrrkmeCrdTpgbsGvagClks0LTeShFP9+nuPD7PIJzrL4/pyP4M6
 osTD1xtFE9oFRr/JKicYaJUhGNjvhq86+P4Nk0irweouqKLqlsQoiqolxRUCRRKWKX/JOFw5UPN
 HwY2EWjrvKNLBv9U6+Nifpym/U8hKQweflNnRfIXMu5yaCEGnzB13cNCoSr5HL1f//BkvCEHlv2
 OPsSAXEeenUZz0HAqp1+xs49AiwTwDocOsc2pYSH5fYgrlshGj4oIr539GC3P6v8XvTk5ciwE21
 8rqNr1cD+xfY0XRI7qsGlSTq5nHwIkmkZMmzCZvCFemTxiQ7z+VZ7fi+sKJOjXXDcDae7+6ti9f
 BKhxyuCoZ9ZUZEjD+bi6CaZy0KjDzBI7MkJ6QkbfHnxjI6f7HBgQw8Az4RIb47ydJsP4RSSktaT
 ycW44vOZJCTTGF0I8DXuOsC8RkSLV5XQYK9ZwB3eg2w1ZK2577lrjRb28GuXgAwUP0K9smBW2/S
 05FciAVt+9P1WzFmvql+IeSba0EOXnj6DpiZDE0L7EjBVvDlAxtiJTyKlAfGM9HaGAZtOew/agm
 7GEz4McYIbAFzg58gtwRtxBmmwapSdtihU3Aq16E+xr+ZxaM48Qkdrw6gtBtwvCisnZthkFavFb
 VxhzvSv/E7NtLnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b67 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: kFP29zk8Py6GyaZGOs0G9yTAOBkNw_V3
X-Proofpoint-GUID: kFP29zk8Py6GyaZGOs0G9yTAOBkNw_V3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX1floOCiSOV+/
 2lN1E5AjKj+PUwdi1XRKlR5SKVyXXEbBUUxSBNirhG1ssc2+ga2YkxD6z3QR1jgoum0LD1FLk7/
 SHvVPGBLqeXNen0cdav4CvgC1hK63FPO//TeiHGCqftZ04lkHTydshksHLu15eR0REXkAFONgTM
 rz8IZeU+pcOP/4JhzNZ5BlP4KvDy/YUJxhbzD9KHl7oLIFqzaYsGLuZ8oqiBvGcHglt6u/wkSSv
 VcbknIeZeyo2sFh1tZJ0WZ5ZWjtdz0hfO7AbaQu+WH/blHesrGJ/4C4KjW0FeFLmTpg9OuAgg+P
 2K+yH/1QUJiq1R1AELgyWFBMw56R6pCbCYbsr/5SM1C/XRbU9jyEpknn7ITzBeQvEG5H604ISXz
 HZBwl0TEzAMLBTTIFje44PSO+ndj2tjc3AAvwfkIlBLOehrtm1KlClUu72uYIIlBPvVcxgzaMRP
 4Mw1sCcshxoxKK7a7VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4nqpaKyqjiZK
 wB9KxASbX7W6CP68jHKYSjj6RDCh+stG1g3+102ljjx/sgAGglun3xdgDfPeHbjq5O2VoLNleiY
 wpP7kcXbLpXBw/dJY81PQJe791PQ3mQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Define a new fwnode operation allowing to retrieve the list of all
properties of given firmware node in a dynamically allocated array of
strings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..2d7e0b9245d445d473c7317bd27058abe5750b40 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -125,6 +125,13 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_get_names: Retrieve the list of all properties of this firmware
+ *			node. On success: returns the number of properties and
+ *			sets *props to an array of NULL-terminated strings that
+ *			must be freed by the user with kfree_strarray(). If
+ *			there are no properties, 0 is returned and the props
+ *			pointer is not changed. Returns negative error number on
+ *			failure.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -162,6 +169,8 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_get_names)(const struct fwnode_handle *fwnode,
+				  char ***props);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);

-- 
2.47.3

