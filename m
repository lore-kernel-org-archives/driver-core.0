Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584836;
	b=HliXZu9JvLNsMULGhEdhQXsZBsNoRvwJp3InnxPDk9Hr9NYZF/pP0X/LwWzUa0jawvRv
	 LAGH7kXEhV78BgTmItMII7dkW9J0EnvwfzNmRTxYeSRg6fX1nhAgSYmWUdHOaPrRHxeDV
	 WtCHgpLfFPQnBvT6037U9h389rXC/NV1Sxuipbxe80ya0tc1KuQk/po3Kf+pPDqAWcaqJ
	 UqZSee5n5/Wi5eX7ZSf8IpUStWSVqUoelDVwgkMjAxMEQ29KQcgRGuFoDlH1Es/r2TZ+8
	 gTdPxOIsDiJQ6RNOFedCMMfkp7UWVRDbHClLh6hxl7VA2YiMcH33fgdGduzfxz18BmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=E5q7rBLZriQltyp+NZWar4EuqFCZO5BjiGk1y12Z408AbrcQAcRz1SC0LTq+CcYX3q6U
	 WRrsZCKM9qG0WRRcq/2XbP0XZ2dpFeHwgRF84t3R7/kVIi5P8UEgMkiF1JvBae4K00im7
	 aH9lAeQGFRH7bFL4UWIqnichwXuKw8S6/pUfZdxzFDLwV1VDH6ytg58o4VMoSpf+UPfr6
	 RpnE+X0zD5ni92nOBoYa2yandkvzafjvNGNP1i++Jivh9C/BXfY9VU/Wz2EUeyfC0WLty
	 0P3eU0HsTft6GEq9aDINY+jlfh1eiL0F26yekL8n0oSoaDOU5I/dRVRVxXw4E38K5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyUtQzwQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97DE606A8AE
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97DE606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyUtQzwQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5Xg551933
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ayi6Eg+O63IiTBLO
	aqwR1MzJcaQbQY+c3boQA+MX5zk2g6EET6JG3rVQX8Woz0bMlHrl5OM9GU6w71aa
	+/dZsWCbKNphMNNbckUtmF7riqhc2Y+jOnlFRS+OzZktvQRCKbh3ADhAuypPOKaC
	BVxLJUscjeaSjGGSNgZj9ts7Lx/8oA9Hks3saOq/BdDFn0b8IQ1mIzL71o4H8Aha
	k0aE5YOmIO2oJP/y+d0IQe19Twc4Vs0z4EMgX00Z4yvFTYQ3lOvCreIDzt/OM4gw
	xVGS4wMHGm0SGrMJMAXdZJjwJ+uInlv42CT/5THt2xc8OWUVFTKbrnRf1K55YaiB
	D33sGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwbpa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso436378685a.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584834; x=1795189634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=XyUtQzwQX5Hi56JqLJ387gtIZJqLCho+EiwqcCbXjh7BF8JiJWgXuBGiiwpA4r3KU2
         a1ZJc49KnApffRWNfj+0PLbtv5CDRRBIT2GtZKaLXaHU2TdEzoND6rYIJpOrWTpWJKxT
         Z2Zihj9I6CMwUQxDSq0yF/7kVE4NmCtbbOscQ8dEGgiGgSuKF1tIhm/FBsgF7YRA8ODf
         qfTpyFezJ0PEQbGcWSy1zpkDLkZpwpkoCZ1Du7e6b11Cy5/lSo5DfceyJ4z9+PoTat6a
         fVrib61Bh7EZ0dtuYYiA2EHtpvrl/IS3cqeGon9Oy5PCOIr/5P8GYread+QnGTzECycX
         jZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584834; x=1795189634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=YMWzHgEonbq1VR1OaG2dn+pg8Rqjs0K+lUw/IOZJ4mnwHky1i49niJ3W75n3ETTSW1
         CEw8/5HM9TE77lpIZYuGSDKIB139PdcHy5r0K0AZs6C1l6dXofcJWzppwoFE67vR7QC/
         xrP2HrxqfmrsVcI1CUD+M1pqK0YlBeTbfKhJ1BHoWMvQYajCJmrI2w1ibmBhLE3MrE6c
         orpFp5d09Fkcut0I006Kmo6JxOjDdIgCFR6fU7xhTLJ1Yptmavy094u0tHEfQhaait7J
         wmunlsPc54qIQNBfyM0AXhwpDXpQGbk/sKvOi+TI4eX7xlnQcGofTVu/WsODWTxcz/XW
         UuNQ==
X-Forwarded-Encrypted: i=1; AL+hErFvoR4gqVpqMAXKFMyVYUZNTuODzYcq2leOE0x+1iM2be4Zyaq6DHa8kqz9WYEwzeMPjCKBDYJ1CC9GiQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z84s1a3EO39gQBitpzDulNaZ+PKy2KhXwuOnEJo2U2Ff+y/B6qA
	15clRIE2PkOOkRrXgAYg/Ye00Ta84MSF3ftaF5OC/pGGLhN+DCzmddwPx5lOHyvS3gjqHOCdYml
	OU9DZPIVBWxygKUE5oUqCKiDNg27Sy51f0qv9Acy/Q8fl9yR4dCfLm7tEf6N4cUqb+g==
X-Gm-Gg: AYBFou3o5R93ck8kQ6N28/vx4q0yr1s4nx5iAozzw7+XlrVZ8f099+59KBINf+iowjN
	v/1QFtOkm0GZoaK7/w/l7KnTuj3lIdB28TMRV/2tXcfAJCceKtNSHEr4OrrvNroRAdK3+il73DY
	WZvK9VBESjxc53xZ6Y6+c5fL8kab/hRx19PyRSx33oQkW4RjFMEtDrpHG4FbHbYcr1V74/9hIx+
	kJdiuhJ/bWvBarslfN37aCo7phTV3Y8P09H6MzEcHA0n8oxvi1c4HCRVf83cnuGhib3PtqJJ2Gt
	OidUYXqn7WRCGyLdL5xWStpUhub6A7R8F3EOJ0RLZSzb43eypSnrqOwJ1vQA+jkMq6sqeeMA7fQ
	73aJpI5b9dhENIBAZRBuji8ngduJMrmBObxODsimoX6sKBsfxFy2UgvaomI76/Dk0MmpZGHpnXl
	nqvA==
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983713985a.0.1794584833598;
        Fri, 13 Nov 2026 07:47:13 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983709185a.0.1794584832967;
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:03 +0100
Subject: [PATCH v2 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-3-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3CCYRkoz3LSF5VgDezGuy7MTYSM/0TdLmX
 qVEWgNL346JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w1UjD/0V570v+6T5CVF4PFoZpn9KSq17LrtfokidpFBT7RDjt0GRYJmyKILIOlVrVDojHSNz5IE
 ALF8BoTy6aoU6ezLy4spqH3OC2kZzdtzaAg2dkBDAsHLjeXT5/QA+l6C9Jtre2CDtyAV/2TZfu3
 vVClJn4JVhPMDmaHAFWQsvSEODTOv6nFe8kuJ+xlmjRkoJcmKxzO58MIdNod6070QXKsdAOj4Pp
 J1WlcbOE7ohJPbiImQO4upzTUygicE1gmchdSj4okHIh5n53012m5vpVLKBCRweFnbUpLzhu9Pe
 jQF9QzJw8Z0s9DMHUZg6D6jxI/i79YzJJ6KPK0LgGs43jQAFIg+e/GaN6z5hWcSVco+n0f/sWYg
 2r22Fsz9+qknrFCJ0ioxrQicw78BXXeOLMQsNOATM9G3cHzy4Nxoe//20p+12c+vEyLva04Z1wU
 l1n5RtZVdhGgO+6zL/L7aE5IO8ZG7mIV1aXSJ+JkbWyn6K9szQrV49Z3K2TNAfCLEQEWt4xlFou
 L5kKlZY8oi7mWvpB0XVeXi7qo18prewpNF8k8AyEit5hNe8OZkyWLdENpHK+kiJZ8WYoBWyaAh0
 ikNTb9r9ZSTfZLatbOnya7dMYksWgzSjJ/3zgN/YiAF19+LkWm9T5CqXHtHmOeWZ3fWSZOyd0Bc
 UU0maWv1yZ+Xrfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7m-rjCZse6d272uj5FV0s3n8ZRovEeMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8V0RJmDT0Ixb
 QjKNqkObnR3KdNc73k32UXPK9t1Wi/qrC9sqXg9RAYUe2Y/nN8+hMEJM2qYBw0xLtRnW3x2XwID
 xp/sJ/Rx4kjEXWTt/xQar5huF0WdvMqf1hXXmf2Eo5BheM43BJNqqEuuJJbUdJxDH1QVOWnfHhl
 gf5oywiaJNExS4ws/fVDoYyGn1g9UG+6Bj9QIij/O4QMPBc4qcj8ETia5XmJ65MHQ48H7BnjblW
 PQOfscjnU9KReCQ+24mIvg5/MACjqIj5d8Cx4fWaRTTBag5PdA2/Z1/9YvHRg5cqt4f5j3T4OJB
 ZrTT3N+OkF0RSjL8R7hebYLQpJqaN8V9NfaJqNK9BEYbvAaXgq5HDEc5Lzt4tip4p6mtp1DFwO8
 qKivtsp57viMjw/EvZTJgJiBJYr5KkU/1Rs/BLeXuule36QEiFrQlq6GHS1BNjJMU77KDWgdOYV
 Dq7gGPy5OiVaAmVy4fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX6wPqOO/VaGJr
 8SCHxwATzgBrNe7jpnk0TRzbWZ/CMKujYfVH+7ASc0FhFLy4jBTiWT7cJP3qqLUZ7va551ay23E
 3mbQYZlLhPxHoQZwFl+XpSyqvKVBYyA=
X-Proofpoint-GUID: 7m-rjCZse6d272uj5FV0s3n8ZRovEeMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

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

