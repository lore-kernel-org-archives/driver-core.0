Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178825;
	b=uXZKDj7ep/RY6Zh15Ci/jrzdGlnEQQRdyHKV6c5kgl5y7MLWv10x2FbKBolYSUfs3UdX
	 LKqvfrjaHd3f0iGSySp37Q6xbwnyFxW8+hxxsIXSl04T04SYCM1YUgWVQ4BNWqTfeVV3F
	 B4Lvpzs67+7zDFU4g3mmieoYflyS6Cp42Bi5tH3UBlQNRNa7uPTI6BJPCHC693rMQr4KF
	 rG6N/9twtTl5HgqlJEwNiDOGWCmPXcCGOLSV/KaS0BHPxVD+N4aVU+AM0ODHzTkXZ4si+
	 zQxQobJ95LT0a9PZF8TmX9Ili/0jT82EjcnrPs6KhWvShTSmEVMK/HIN1YeGzEd2yVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VW9PgIUqddV2ctIph8GklJCXOd/Fbs2bPwpKZj/erTw=;
	b=k6cgNGcgtLD4ILN94BgTX9Cj1hepDHlHav61MvUQHDqYuDrWnwPp6bH7ZvY65+wlxmaU
	 3dN1a1yi7kVp7jDJAOBCJeuKdsdeyICi5gTNegSLlMvv4j0V5PfQm8YYDp79T4d3FSvG9
	 o8TsC8KyLUs5/9p00wqs2ZXRl1a8tsw/z7fehwhS8J9jVjY/UWn/bSnD31SqAJyt9wy6p
	 jx7RaMFDQ5NV3C7QDXf2zb7TNbbv6+NMjXQMaqnln7D1ro9Rk6PkzrIVDUQPOBwkH7pqd
	 4toRmsvezjIG59tB2NiNmY+nRSGni/YbQID2L+IkV3RSckhHr5HODB/K3DNIVt3wy/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ko+ched7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqO0MBCu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE360A2631
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFE360A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ko+ched7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqO0MBCu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAtddK1083017
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VW9PgIUqddV2ctIph8GklJCXOd/Fbs2bPwpKZj/erTw=; b=ko+ched7bFDddz4F
	j8dhA+j429hqyz2yk5Ncmi5aAa3rgLQEWYbkwqZ2RN8VZovqVe/lh1VS4yaINoO4
	wQkSsHZOVJDkSGMiPEqNIZfepjZpra8nb5wETHry4dTe453aseWRXnQAuWxMOGA4
	4S8u27zNH1TTH0ZUt0OFWOWOnzE5RXqk5O1vEvUOdcNTAk6+s1nVhDFyn9j4Iwhh
	XvCUYN66Nm0Gm7nPM7q+uHW5hAmus9Zq8Wd2P7KAGxExFUjwNDUYan2klSNHEgY0
	xs8b0U3v0dkuh7JxhRSD/S9BgD8Wp8JOJ1oyUQOLTO3sz5EtAWYNCdD98T8YGE9U
	kJWByA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykr01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so148719485a.3
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178823; x=1795783623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VW9PgIUqddV2ctIph8GklJCXOd/Fbs2bPwpKZj/erTw=;
        b=CqO0MBCuBsZTz2jiIzVG+ZL0R2ujkIFTO+pR0DnkL10lJ+xTk9l9th1Tkc/OjvOadX
         fyE4OD3za9Exq3u7sI4h2c/gwdbdxos8WfolOnmyqlREGQo8XnE6RVAUHq5uLRCdCPA8
         YKXp2mnKaP/TlKD9voHI0cbm7Tt8ZRxBZGNRptkVk3ApiZcOsWb2JV9jopBpKYf3b0g3
         XVm2HS+y7IIjl5HC093CbhjoNEwxv03FDSbi1LumezJJhYSeWI9bdLvcxuWmFW38e3or
         2i1h00ua1mm3tOdVPcH27Fflg1ZMUoES8O4nnB2kihCExiLKtB79Q8lPj0swYWGhvcqp
         3taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178823; x=1795783623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW9PgIUqddV2ctIph8GklJCXOd/Fbs2bPwpKZj/erTw=;
        b=tBpn/dAMSTEcUxnX9p+NcmNO+ARA9rpvYtT7weXeSkfFKDGA9ZVM2kcjTh5THwUE0Y
         oldyv8lFdWb2SrUb7JzEVg7dBGXmagGFZefVp3Xahupt8XLQ79G1MjshlJjug41rbeoQ
         e9xjyYSoUm7cRU+vLBDMGWlEY/FmGShX0bUQR082aZpzZzT5Hs8+3lBeIvq1uLj/5zk7
         bGT2rQtLFE/nieraWAc2jnJyf7/GKkWMURbELKOuHOT0b1q/dRMy9UCmxxzpGQNvmLy5
         VRXjOdrQs46HQTu+QC7ZgNsg3fglwnYPlDa65q/dqR0hADBKuWEIkJ7vjOUnOEYvFt5d
         7rlw==
X-Forwarded-Encrypted: i=1; AL+hErESluqPOHh+P633yn/KxY1DPQB9ywir/5SYh9Uh2ya9xk3cwbPDrq/Xj/QR5rQ+FJ7SfLWmNkwiUprVQA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8WKjKtq8qy3ZLhCZ2emcnigCQCaqUShJBRDT9bAftbSVrsFFVm
	Cb6jCaUUGDq/6AZpd+9RsJnPwxrhZjzwnIOKJr7xgfAvW1Vaduvz06QyyGy26svz6c9FEiDJgji
	nuFshF80VqdIwDQgd7jW3n20Ws6tfm2FJFFgzXRExVqBVmFLkYQdlH6FOxTljhMB4ZA==
X-Gm-Gg: AYBFou0EMhipYGHrZHUXUvt2iEuqHduP5AEppaHVfr+LZBDlfkTwk+D7NcEF59EyX7W
	Vw7pfm1kI6EP4Eo+0saefb1b08R/i/kI+ksLzuCHfWCoZLzpv5k85l8Hy3j9/4voX3v5fVHTQXG
	I84ELdoubJGmPUMcn+UL9k+uSOU5iF/9N4g50vjK8XO6vvca6jgYiS/wPvv3oDP8vb8Fww78EcB
	PlZctowY3if0hDD6tV/oZMILDR25j2DLkVvuspIJfVN8cmSwEfGLJ0HBb0E/h034lU2qoNCehp5
	ofBzj9weX5RBbu/+zAgo/kZD3c2TdJW8FyefjupW3aXjU3uLbGQvqOd0RtL51s17BOKOXwSt4Uo
	bQ2mIFEibqz5szPWgf7PlpAQZCDjS+RNQ6fwONYp2FZ9WCacCdgmQHOsTGtTazDANXoOXow5wcl
	I=
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr444310585a.46.1795178823152;
        Fri, 20 Nov 2026 04:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr444305585a.46.1795178822702;
        Fri, 20 Nov 2026 04:47:02 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:42 +0100
Subject: [PATCH v3 05/10] of: property: implement the .property_get_names()
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
Message-Id: <20261120-fwnode-for-each-prop-v3-5-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k44LD99l6+yuoAWvft0Vpp5Uhsi3XgcWFZVnUcvzOe0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3jVJ3t+7uOpkpf/ma2oevHqicDxvGj6rBl
 oPQT0dmTv+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 wztCD/9paaR0X5QgLZYpSkhTLDTDj+2CoshL76CwZ1C/euxfx9tQSoQJ4gzXzbBkFkBFqsUxlyt
 GNNSODrG5PYw8EjJ7vDMp48Ttka9c9OQKOoe3eWtu+G68YsiZI3GE2aBE8b8YaKFdP/w4/S0BcG
 /PVGqrbKQT06pLdEEM9gLJnwgcDz4HmRK5DUYeBZzn7VNiC/SXFpkvwYodJ7WDrkHJAfiJj06fV
 qel4dEHCkt61LsEDdkukVtcgBmcKQbGJDMcwPke2dFdp2ap6cL2vHro+W4tWug2vb8+wNXgPbRF
 mr00uwwasIhDyZgV3eH0lUPQQIzT2v0wixQdqAXuavckz4zkemVQbMDjlwo+I/sncQobi6IdmhR
 ux+nVqVmwREhNaSHZVR+WMQMIRowp5vY1azSPvpQweYKZBmjulfqby81nbNdvEVfrQqyi/Zu+EG
 XSyc3pusKBiDGRWdWDENGtbgMsqcUyHI6KEKY1iC1QbhZdmf4OGtDuoKT+uTSALX0IOM0P+/Dmh
 Ty/QCv14O/KHiziP6X2ihEiRIhDjSVJJyO0vu7PgCORHsL+/4NcaeI0cTm6AMP6mZ8imuRR6dN+
 dS+VwgchE3FAUZHUC4CrUgMVZTRRo1OnrMOEpBmwOOU/jpCR1vkGHPLgFjDdXCT86Hbq9YxAN+h
 Jj9EW4TsfQgs0yg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8MyT8HapY/3A
 JCEEZ8yOX2tmOrnFk41TpCgGdhW+IW3xnuxlz7gBm1sdoiQsS6mwu7bRS0wDqUKuVtqIBxcBs0J
 uC19wAkTPW0K5ja98jHWy13oDydKZpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXwiHgKLUO34N/
 oNAt9d0cz2v2lBwYjUQAWx6ZwW0w0s7AT1tAFcm06dXsULR8TfwvnT1BfIQK+GY5wtvQ2Nntywm
 Exs8qT02AF65YbW+vn3kiMZUCzhB3LnPMNGbc9bKNHFG7WghAefTbewHr5YYuIRmOgazWquXSAe
 nnX30pV6mbElSlv+3nbpk8CuUFxzqtg6s2aU6BmSO8U7H6DKr3asc9ti6ll0Tl8V9MUCneq+axT
 THGzTqS88O1oz632/dI09rKNQSav3IQ2PsUQtmWYPE7/bLOB1pCZyJFyLOKW+7YB6gEKmNY5ZRn
 X0nWL4itNJfoLCR+23MI4Yfq+05NmgTv4Gn3lrgUqh3WmPIjVzHQx1Ttkn1zhbiObQiTRp7UIVM
 B7/V6rSZG9vLL6dks0/xzD0BnfrzoKD8rq25W7UtqXxFn8rTnHNZ9kuqSO13cPAa7c6H9Is3hz3
 1AKCVCVcL1Sy1QC1Rbg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004147 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cT0tItDctYQywj5JGBkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gl0sw3xPR2CcVSwZFR6SA-ZmnSx-oYMv
X-Proofpoint-GUID: gl0sw3xPR2CcVSwZFR6SA-ZmnSx-oYMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 3a272775a8b7967bc0d35d882a5856153941cef3..f914f0475e0be865afc9753fda5aa40a08a10e25 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -27,7 +27,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1120,37 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
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
+	if (count == 0)
+		return 0;
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
@@ -1712,6 +1743,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

