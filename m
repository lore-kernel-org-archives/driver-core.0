Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685793;
	b=sSzAgAuiBi+ifrYX9xo+UyGmUWO5XT+xuYuRbI3kGxBNCdWSzrPja466Ci4VmD1dMVug
	 MHcUnSmrU7OIa+chW38+neNrpORsGZvgNEPOF/TXMR+sM1vw4uWXdHx6I4P5HZWLDw/7o
	 MmU+B+oRe+05H3i2E9lOuDHaMeFe6RZiKXKn0ypRsDZZA9y0bZEeueKRqiI+ZYvAlBdXg
	 UEy32On8itSr3TQ1rzJuO5gHmmj8DFsuii0Gw8q6NVTNX0YpTFDnoKfXWmqsfb3xrWsc9
	 uXaUnhIgNzJj3GGO6smOF+yA3+l0FksAfHkNrrgds+BN1aVWadohCjTsqnpcfKnReNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=x5qdljRxvDQWYd/77RHmiTFHnrlOFJ9BhFvlpvDc1NLqAayTFtPgB/A20Gekmx0J2MXB
	 xMJrI4cdlqE02iBaBpAcytwPUtm3WIzcBZZ74GyZ71xL+6ykE+O4MAkcoJzPaKKAHQ/Ni
	 torfObp3WDlvc0Yb2yE+dlAmm8U1Z7FFRhqiojUe76oR2wBtzy33uYm675Z/hbEeWmXsM
	 r8ZF1xjxDUmcp7RMqWWQmREKp1q/KiINpIWnz+Nofxx3D0yIG13+AotcCdLA6EUwzo6U4
	 zfEOtm9PRYwl5L5i5CZIFou+0nqtAkuutJYVJPSRkw4qQQJya6oPHh5sYMxdnVd0Y2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Snymp1tQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQ5NtcwZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0289606A680
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0289606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Snymp1tQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQ5NtcwZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuUa2594835
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=Snymp1tQbwXOgvYJ
	UR5nPhUcqdlAQBfA/AWKoX50FuwBTMhKjS1B9vlClTdGAdjrfRTneHKVgzHKGGIN
	OpCZW0A9WHfYntR6yEo6+Zfrx1JOaGah4y6zuLChRb5cLJ80HcjOtP0ExO5u/0uY
	cYJA2iWbBw/Oe/zVZ+d/S4nDguWOkY2R7s5gz2uIC28MBvayHTlGd7IFjooqQms7
	WCaD120hC1S3Xtc72Dp4iQaVYZj6RW0lQNai2Iz2sMuefv8mFqyaOHHJVLIBsoZ0
	C4KrZosOPHr/V5M4AKDRVUhbAZTD4DF98JkqM7c8e8Rxt3kQWND5YKPfdGG1B5fm
	AXN+Gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sag7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso370137985a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685791; x=1796290591; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=bQ5NtcwZ/3H+H8uc4BMauwitIj1QtYq7aNRXoqhmrMRBrnnsK0JNPSm3zB+QAs5Csc
         FdroXS+VcubMACIYkQ3GIfW/a+dPDMrDgbkIdb97gpPFl4fiXE0QizQO0LD5g6Hy87Sg
         iPXdggTxmsVsaXwTKOW/+rSXSLIgE29JE23n/mgpKFa4UitYAjab+1n2BRGevB/L/U8+
         hh2yiSjD3Qg/DNYy0R91abwTSkViGSAi6smNu/cp0JSZM7m4d/rGRYqf898p0VuVs53b
         dSkC9bZKjw1IUd9vlxuUndTW1Ox4lmRAlo+QULruTpIaydlNhGSwzqpYvLPVj4oAb6fe
         C+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685791; x=1796290591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=uTLVxt1suFa0oOekVCP7j2RJ8hXxX+m5Iar5DrXyHGaI6RaONiI9Ah7CQbUdnOJCql
         ZWK72guroXJiwUL1A/hWvU7fvVMRRC9PIIfgjXAeaB6DbR2EOjCEbQcmrDDsO10l+DI9
         8mSmT6MlqMp5P4qouh9Z+LtWTLisLTC98UbYlfkI8H0ibQi1VSMT1gndlIbqVb/wGUlY
         yQEJQj9cgLYsV4AXRJ3Nxn5rqa433/zBr7q6xK2ulOiN63ErMwxs1yi6T9OOXsvXucHt
         ZoG+BoBPPXLU39KO7oOlQUB1WXXOV/QHFBevPxv3HtFAC0vyY0I/M3rt46yQcdCgGw3P
         cNNQ==
X-Forwarded-Encrypted: i=1; AL+hErEWubmKYbQfE2OqGjoo9D2bYgXO1BjcOisPFAfEpsX/eXg/zq+h4n+ssgjVZunnSHzv2VsEt0FLjrIxJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Cb60qD86Qo3ulvXth897MMWxRmdP7ibLxq2hPu4r5bixgmzxh
	aLL5gsvEYI30K6mn5dNFOKH0cYgKCGmCphnnW9vfhHqGLCYzIAURICmYLhh+SzgUV8tmmKDQ0TT
	LNlGICQd+LMz/ULixB0j2oPOvhEaRJ/WWmcpgxe+E33QETJ+kcwigUmTia4NXQtK+Qw==
X-Gm-Gg: AZFdTZcFWBa8PvLnGxNdNmV4XTmFwZgRlXZI++BtXfT1bj5KjVyHI9XRsCYwqfBP1HK
	gaHlx/F+2mu0PMcc/CzXeVt7eOgbh6xY7tM00Xwl9ZtlQapauLIthwgGLbIQCF9PWsY4bI0JqCl
	NSyygzQWQrCU1Dw9a0herxL7O8SVwc3ZCkFCztoD6NGrxXJYgNeHocnU50DTjQXTMrN6SDrRNZk
	byfNtHArjXEX/RA7+WJNgfAF5cQw1pWwC8hpW86MtOrrIjSoWr6/mTZnik6yoi9Z+4MWpp9TKk8
	zQSdZtJ/ZIfOmzDGObFm8nyYQJHKt1MgO0vPCGgfPLJXeG3K3bZMCl1m9Gumh2SB0IB5vloRCH/
	M4IhJWHdwbbWROiQ5ZFSd/5KnWmscOEvOQHnG3c+gERE3heZq2HlIIz/DnIo+qvJB/U+S3rcUdu
	Fj8Q==
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3919431185a.29.1795685791026;
        Thu, 26 Nov 2026 01:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3919425885a.29.1795685790530;
        Thu, 26 Nov 2026 01:36:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:20 +0100
Subject: [PATCH v4 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261126-fwnode-for-each-prop-v4-3-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2URr/jPQGWV4ocfEMBkT9vyzlP/x5z4nta2
 opKoVqfN+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w0t/D/0fV3KTiv5Oc+A8MP6rH8R6y0Et7IIXobjCwmd7NEyBcY3txfL71qDkaQy11JUqpyrGFXp
 wmq2DsCm+hTkcfIrzdLrd8IeaRTAdKD/gBgkQC6Eksdp59hzkduyoBQaH//86MdUnr7z3s9mEW6
 HO6elHnSNaTZd+7HZXV5pBv4ReQjOGdNquCOMUTzoxdWIjUkMhoh8twPPoz1GJHnhEPLIgRKQ+u
 NVsQaoav959uFzJ1XkfiBk+IohAHhYV8pZg55RYgtOIcS7Ix9sAe3sWZNf9MHC3xSV+AliEaXT3
 fl1YJsjgTSILi6P3ZbAkdUTxNysv/WWZjMiTmn3Oea/e2dFg6N6jbrHCvkMn5cR6K1KOMWQWBSM
 XicLTZV+QjLgInH+4ETZhSRmqGg0LQbylv927jI1QWsZb6eZmfBAwDwmYa7yHkLzFGF6LSCEP/C
 z4JZqAB7Oq/AJlRC5pshnXQMB3JVwIK6kIecB2XBZNk8XgldJkJ3i5tX3N/KaarkSBFoHVF8L2j
 2VXdXmm4AYv5XJN+w8Ne1du0M6y7H1h11YCgVxexWULoJw/f1x+0s8iuNnSLqW/Q+NEt8n/0ONE
 xyri/+3blUjWSUjj8aoP+y7FMgXvEDjCywBXY5oqO6H9T8mP044hz9PNh7BNi/nsm5Px1BSg2Hh
 AyMOsT/jZyQmkew==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07fda0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D62KK33egHmsvS5D0_1X_84Af-TeWRGV
X-Proofpoint-ORIG-GUID: D62KK33egHmsvS5D0_1X_84Af-TeWRGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX8F+8jEZ0NVy/
 G3Yq9i5ErZ/vuzfalqY/sLUR9oRCeiVlBQPIZXCWyPWXSbEwVl8cYLGPPohjy4WBplVRIja7Wxy
 5yPqFv4wLm7/tuZRQj5V7PviiMSjmN0rloMfw55/DIzc59c3vm9BYtoLiY6qG+cliy0ra6AgcGy
 wj0j3iVamcdQQ5GO4pfFYP9XbsbzRhf2QRhZKKxru+ogvjc8H+RjISfyoh1yAkmLHRPQjeA2C3k
 /n82ZakFXCoKpC+UcJcaoa44GTbmRif3vO6/zVLhGi3MkMnPn/KzLuhQSdHYCE7JwDb8W772LPO
 cO/MX27+BKJKpaVIC7AN7cb2lG2/ItUhIsKG8aHOWSGJFUdv+Jm2mGXm2xrT87sIumwPCgsnTya
 R/GU53dL2TCDEe2vpjE88FshYQKZYDg4qFofKoKAdpYrKNYZ7TAXcVsZNaqbK4Y/TgUFDnJ53fM
 qiENmbGg7wUHJk7NPUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX5ps4jVD6SG4O
 jP+XAH0XedoDNLg2q0YB3o65pvAwjrK8tqpNxyaXuWGTOoE5g0tvw1D+KX4OyBAvqp3p2Lnu6I6
 CNcfD145i+GB6oPv8wqmdCxTkCxAR+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

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

