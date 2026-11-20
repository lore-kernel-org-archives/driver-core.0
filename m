Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178820;
	b=oI+dq7eJShtGbvHDQDY7uzztxsTbu6wszT0CiG+wOIIBBkh+g1TYHtqRG6TqsgfBxpxj
	 zgduYnN3bkEGBSuUxGzY5xp/rGBxn63Y9WywHHXtSD+KnZLn/s9B2gzT305QNIxON64YL
	 c7TYXuhPGmwq7AG89ekn1MPNY/WpvWHp0fDTZcBXLrVo2AYfjD4Dwp6YJIf4t66t+CsYF
	 iuH0+p+/YZYiMCcmqHs6S/murvwvBk+sOLsMztxM67n0X0rHtSinbX5i7X6U8DIXxqi+R
	 K+9Z0GVY00l7nPBOzC2CpYbsutkjoTCtfKB0JzFWfWZeKVorkiFROhSO5T05eEOMC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=V2ihlbrA2ZDwNiWibAwxiciiWutOYxwZQoTKIG4WaCNgGW5W3WVyPFBzzE2rdYvTuNcZ
	 j185D0bWsYiAQ5LLDgsrjlV3BxeZpYhRvyafGB+mL+8feaAMvotMQQH2zHzOs8i2hE+iH
	 dTbEUqd+FvUqBJh5QlSZO9c6/Z21ZXtpc7/xlOC2JroAnvgBMSKjQPtRvioCntAskoFJJ
	 RpJfXkFOUnXI67/59wnJSvqsjLvBw8H6dDKd3MSe8cvPY/C80iS6eK9W/od0hSZWQ+bVm
	 dHLzrRT0rMd40yu7UEo6c7j10A/TYn741uq0Fm37I7vYo4npwU1wvcgNzNd1UPpAUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHzxJiVL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BE606A33F
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155BE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHzxJiVL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgO33107630
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=NjEZIDq9tn4Z2X5E
	0HaiSmEYxLZfR95m0e5mOAQrJ36D4UvFWOcUkPlkrAzmdt/SzrPUpH9YNvLqe+6/
	se5miVwDJmett3+70EUwKaCq8F88mLX+WFnVQQmwsmnUpTs5W27KVmO18hMKX2y0
	AuJsOqQMbXBUTBEtKr87UK1crqQkuYbw3tNl3Xu7FVmLGg0qTUAh8niOmNbXLCZk
	WsmYv5U2hFMbGOPUyAGYvNB5Cbj201pRjoPvQlrfAnc/PfFIbzGuskjCh7hrAy9V
	QL7z2J4ER0w02AkWPbiALFCC2e1wLQILLEpsBKRRV3kUWvVmGBHWCC4LMXB4W0p4
	Fwiq8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso199070685a.2
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178818; x=1795783618; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=XHzxJiVLumB+758YtFZ/QtxLLAHUaKBEVd1b2jT0Htz3Jqx5XYg4evkv3/rQ/SXv4U
         Abh/fP0g8bugtO1xFY78+nBVIEIz7XJ/kpa3U8Zj53ae5YhY60fs1tlHdajKJSbjiON3
         fuLc7ttzAWOJpq4x+ExxlWcqQOEZSCNWtIKspzlwDTTmoSdsOQ2zckrTHe3+uXq5JPG/
         bLvyT4h9DyMblps64OIO0z4AEKa3oTzsL1v0w+VKRvBBsV/RWYngzf7GMFkRkrMKOn/K
         pB8N273u00WRTkbG6ftj4tiT3xzpViIi8ULWVtEX5c+X5V/WM79SHkB1yzyv3t744V6d
         6+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178818; x=1795783618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=2Kc4hD5kN9i/jTZEFeVZ9PlpkANE0kpAT+sqGIGdPg8JbjnkkatI2KLuwLTgpvWjxr
         PmfEs9mXtJt2oFem1vURqf9OZKnWm9ZLsSvk8P/SLvG1SSZMme8lACht2Chmowdz1Jnd
         XuRVztD/9oV5GHl9VUPnT/N3ifZrm3ZULc1evVZzYHYbTDSMUCXxV0MW1jDhCR89FXXl
         fnchncGCdfRYb0gbcYTTRS6VQtRWxm00rR3RQ1s20YfpRTkcJIAbdw2AX8X+wExsDlkC
         J1i14rrYQpkbg6PnY+tb5uasbDCtf9eFOfHYgdGPNlZkQSDqYa5LnHAtjUHp+5Z/yOrr
         VfjA==
X-Forwarded-Encrypted: i=1; AL+hErHdYTPCX+rX6exVIU/oMtaBpIhcaRqqWZF7AP8/ey46E/OCbptJJEKuLMsJFt8NrD93XXOKOsK/CIltlA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/VKxtUDfHnKNzPgMxBAyjENk3EiR3dPnzz0unfbOiffEhxzWNt
	vtZ8P0e7+RGKh28wc2gmnOJOM3ZPOkbPkR3jojxBtElMFH9OodPPrbUfgDdI6bKgY7Jd7kxGzuU
	unpY0VKlkjnSP+DIMIwqQAkKyO5BTnuGa1ilfuT3MzfhsskwGSYtMFIro/pzYzmjflq9XAdxPsw
	==
X-Gm-Gg: AYBFou0VRPDopUrQWy132yKeig2nMahWP4rxII45axwTqI5w1gmIRnu+cHkJgB//640
	+LeilfwezA0cw3Ed+HhkgZiExk+NBHrTCaHKZUrRX7LbvKC5Ildip51BROBZrvajSFW0ANpqUhA
	egMrIWOF+kPWdoPsNsm2kLX6L03TvOfX1k8F7H1oVmvyl45TzQcuaPajh4cMKGEWx0tOtEa4oaN
	aFAgB+S/smnsyUnIi0hdo2m1YDIFHMdnf3BsiFw1VMnvSKDD15+9Wm31JpLJQUTmCrMxjNtASr7
	/MHGIPSr+pUJkEo7AZA1G2A8MIY1UqxqzwibqETZ32Rk8nNc7CZG9ctiYqH66kO+fLEIJ4pcqRl
	cQBb5eOGpxrX50QXGWCfBjm335BhwcvQUgdYkY9A0ojeSX9BFm9EOD4jv07oJ1KNO7pqtOHkaLG
	8=
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449540485a.30.1795178818357;
        Fri, 20 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449535485a.30.1795178817851;
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:40 +0100
Subject: [PATCH v3 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261120-fwnode-for-each-prop-v3-3-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2YIXomUiP9/eRkoyZzWQkqxyOPxkHquCjX
 15WcGRwohyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 wyGKD/0aFMoAZkgBZHdI4bxjsR6xspltaKVqqj8fM8pz5k5lJatsHR36nDle+C04E8L3ip3Rws9
 aVGD6HnZjtIDPLqidEbc5Mjax4aHWXq3WpwWO7oC/GRFsDdLYWkQLwbJWmIF3wWCIzIUJC4IrzK
 sOr22Rk+bFBM5DB5p1zXrrSfjdWeHukDbg7JOGPpi9DRSGRRLvAlm2zt9oTbGtSpYA0HQRmdYJN
 KdPC6OGSROSHYkJ6IuteD8y/j4Qi9O0SF+2Zqp7ijy3dHMsKByeV8J3fHXeeNVhZE9RJ5MYKDjE
 W7ViQJYpTz6o+HUXnAK3mXITMsu5SWQMJQB1P/cD4tDRmUuaMbUtesJ7ff1ht5lc7giXdx3zCkT
 Z/uA5X//2XRBWYlV5YuCUD0X5MUGXO0FtOLs3ampXNHoPxqHhegoAcFiK3Scpmm9/L/pHKm4tWq
 itpquAJ7pgNYIpN5Q2G+SS0gtYLNKirsTbuJ6YLJK1XbVR1xol1t2A+JQFRLVCZgYQHEbmPf/4O
 /f6puKDBmqsY53oJLUsXDOo9oB76eNaRY6PTSjf3zt6aXaOMpMUIC4dZKRUOxe6jFqnfroWbsCP
 xBtYg3V63MbfPFDKsCAD7o2rn5twVnaNU6UT3IgF/dRIhm97XwbMbcydQ1liHyxbxPSMMqVv8u9
 6hNsVEEpyC9oJLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX+jWtuKhesYx4
 QUKXmGHlk8ig6aX6m19trG7nP6qgCJGsqNP6n0Tydrj2uGlndG83OqjLGvA60vsx4hZvPa7YG+8
 I2sZk0suiEozTnaij0nzAP4S2WttI595BTR3AEeFnHHkihrSx99iInskMqChS33vOGc+/GBUHFi
 MEDdbULFYa5VU5Nddgg3XKdO9con6xRysL/4raiiACpae6ziWiYKAoHNyarFyAzzG9UwTTAduRO
 HoQvV8/TUDQtTT9opSGcIZ6FG+L/F5BKJYnLRowmx1vl39Sbxo9TKuuL6m/+li9bTJzGlz3Jsmz
 fvb7m30rbUN2uyYqu5O6E2PVsBHZymNB6aqH6M6HoUtg78b5f+tk0fgB2p9Uh3Z4AHjmLuV/LDc
 NzwY0+JNJcSYliiqGMVeRofckdqP337ngc0CmVckB4sXePEf0toSc+RMNdAvqdam7IK6UkAOA27
 PQ+6CRfapYWIh+U+w6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX+3siqIPCjo18
 JB0rUZUu7rZlaN0egwbHLbEYC8uIbkDhZAjOWkeKVFqVBUXY+AE9SAcQ6FX3iru9idiRQWgecwc
 Ig6ajHHic5QRm8ajxYBiV1v4pJzqoLI=
X-Proofpoint-ORIG-GUID: Nj3vYB8t_8C5ikrvcp8QiRmuE9PUbpcy
X-Proofpoint-GUID: Nj3vYB8t_8C5ikrvcp8QiRmuE9PUbpcy
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004143 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

