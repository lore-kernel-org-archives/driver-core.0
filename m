Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584840;
	b=4HfnkMxACXfbe9H/VxgtUlaBP4zTlfUuBKbLzidZ6CgLo4bx2fWIJWxjp3K8j9rrLcr7
	 Iw7IkTvu8Y5mE6J4HTVvHYN4eF7cZg18CGBNTqUTcRDJF8TyaDkA9UQaJ4x29UlUbMF0a
	 ARaLcTvqeV1NtC5n9KRNJDel0PTEti6kE9FGBc4qxFVwApdXWgh4PVWMWluZ2myog4yrK
	 9O+SPlXJHqcJvESDQyFVyjxREguNBNGPuyYsxyKeuuHRT4G2jh60FVWvrvahyCFVnwAY2
	 qNWqeu4smb9FqtVKs+nY+0FpzH+nfnWv2HXSklO0yYK7RwS0q+/Soy8CNkWqEIsqCVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
	b=JzokIvEYrBXjy7IRwLQG1F+I6ecwFaXJ2mmGgzuLiBnzHg3q0uhNPfp5O+vzdF00QMUt
	 sCGhOC4cseugNsMhpRdZ6vycMjIuhdz4/vDlBaxiddwHdJGMEkJVOUjaXR7SAfHudjw9W
	 CctkzmVZ6IiwRlb1aA7qaEzJGtnk1xE802fB/45KJ+7KigWStBuqszv0KiJ0nw3iyBSGM
	 v17WSRNIKXcgV5i41l8XFSMlDz3DdJnzIDHDD9yvoOLDidlUmcOnvPdcrWEVpY+zulQbM
	 IICWde3QHdfMOb+rBbX+c2YfHLdsvGZGLfz9vlmM2mdF7ASwAwhSR4qQ70om0ghwiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpMr4GKR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hU+d6lCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04360A2631
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D04360A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpMr4GKR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hU+d6lCO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR8fN737249
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=; b=OpMr4GKRlhgCOGW+
	oAGSvwB0vkJOOjsDJOtd3OP053b9V4LeAyAyj8vA0lRFB44J86PJQ9RFxOLDHojJ
	IwXzkvV/h1+Nmxy5xNjiX/x0d1B4/iC83yuZv0evZgcJljZL/cG+aFWElWOmr6gg
	J4tc0bDPU63W8+KVjnyO1SfLgSRhT3rlLiTk4V9GcJmMvPzhCUNolVltcpOuiNXb
	f8URnRdMXrUE3MuZU+8U0SxRPRVWrBS0dUIfj+wKibew0Cef0CwrLrbcDqtMQ1cu
	FteLYwh+SR7/t7hGG2UUMkBi0X0svHdsWsuzgV0jmMEP3n5O8PdW7uAwQPQZsBWk
	P6yQLQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so203665137.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584838; x=1795189638; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
        b=hU+d6lCO/n63UVu+J4WfYAJ3pkNo5hOutDbxBqFzYWnrLgvik31XQZPDvCxP73H2Lx
         I4EQ5cGMbflddk518+3EUvn1PzhCYdT6DZcwcK+dFM2ALxQ8FW/WlxYeAUN+hvyKR9ec
         I8QjX66eZeA0oEXz21YXoDtYqTWwND1tsHFga0+XkYiwcJV2aaMGcXkBYJNZfbz8FVWU
         2P8CwP4QCDAWGT0OqWIxLDq/b3vTTfKkgwquzDGC+lrTEldQPlqCDyKEvUzWhYmgOEaE
         Y2Kg9TsZgm0lXZVki/eTaWvYrKaantw2GJf5gyaY1MH/ia1eLDwiYFgZHdScalxce/1j
         Y5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584838; x=1795189638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
        b=HhWfklhRN7FsiuUD0QzmWJYG5mNUEmiTP32+w256HWDugyW+Q+KbmNRxIqOiHDb6W3
         7Pw+/sFYr7b4p2qc142HGHBeupRlOR2HE+V1EYCLUpPOGUufodgyZcNFVzhvigmaj7UF
         I6KQaqDJDKoVEKnDXngN4H+kx3Tb0CpLNItmyDc0/zTebjxHjOCtZ9chEsMguh9uX6mV
         /IN+a50IR+2Wi1fdbuV2IifFwTaVCkoxRCbDauRVQkdkZWLUnVJQRk3h48SQ8Uby395w
         KxjTIgrxKAZ12+8gCoRFMsnv7jR1fPReKt9zq/AjiZ7tOs0TXjV7A4jRH19kSalmpTio
         t2ug==
X-Forwarded-Encrypted: i=1; AL+hErFa1bDvCUwauoz7rNF+detM89O5xtwx9yF3cKH5CL68dqMacnzrI5Aa7ih8ivrVFOQcnXnIkPJ/D03zTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8/k4r/4/kDK9ofTjMaNPAZ/TpBYVPLY3ZzrDk6wfSD91vzclC8
	8XWJu8f/oaWMmgUSHx7PKcpSLkK10CJOHmVBNKkvBbffXFIXQfFkLE1HhcUcpFMrxmaPFGWSag3
	TtYd60IxCuApg3WVYhqw3BIG+uB+NM0Sf+eFyZnsr3VSFjGQyIsgMBuD852w9Gp0iSQ==
X-Gm-Gg: AYBFou3ChYHXB6uFMPM3Qgx7Fgvnqwgy/Sa31XS2ORyIFHJ14H1MFqQ69gUrLrVZ0IW
	K7zy89EOWv67v3cic+Z7sUEhTZx9upqs6ifLlZu/t1T9ukYWwBLzlX4Ir5jFUugtTKAo153CC9y
	OmO+TydkPrIQTYKvMJI1RcHGi/3kWFrCuZTTY+hqJeCYde+8FVA7T8D0ZLOGo1iDB6TZTa5HMDX
	fwwjIDGtKMRAsRALPUa1wB4CoJCFF0+vTcPVVWvuzzj/h+aTmP0C0HQ1dQxT05ZkfqDqva4jyEA
	+z7KMi7xQy8uUpFNp+ZJ874YSMhgLDXUy49n2ZlLv/ZZkuIlAOupZEApG75wKulx8gCJRkkr+Jr
	Xayt2p/Ml2shWlvHN+4u4VF6/IvhytlrsdPsCL79qTkZA+l9ZRCg+oEYLcpEqtF0X7rGn5HFgBy
	i3mw==
X-Received: by 2002:a05:6102:511f:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7d64d770275mr763676137.22.1794584837847;
        Fri, 13 Nov 2026 07:47:17 -0800 (PST)
X-Received: by 2002:a05:6102:511f:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7d64d770275mr763648137.22.1794584837303;
        Fri, 13 Nov 2026 07:47:17 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:05 +0100
Subject: [PATCH v2 05/10] of: property: implement the .property_get_names()
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
Message-Id: <20261113-fwnode-for-each-prop-v2-5-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ByGt0Wun0kTw8gtxY07rIdqBJJaAvKUMm2U7zjbf8qU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3LzKXZG+ZjU7qzjenQKDou5yHKCzqPZhLQ
 LzzR+h51yqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w/4ID/0Tt+LpyDARJ0d+BKtRxYefGN4cbRKTHJQr/JXKhlbiMKuR3UoVMhLlfPEuceLcw9J3WBP
 SvKR0EoEih/KGjO/UqyHitem7T0QiX2cTqnOrTSKh6uAyk3LUPv3FY2d3xuu0OmzhAeQ3jk0cI8
 RrMOpg1DtAxOIDWXvabOm1fvI9VL2yJNp4GJIhBcx2Co27ZYFyPs2v0ak5YVwfOcg3NMR+7QX1/
 2m4xf8zSJRKcpDKNkOIvXDlD8qDBpqGxbubXWWFKSZI4TpSplk0pgBNN1cRiuu8O95IqpY7oD0b
 RTTjmG3mNjycBgmkGnU6k7fIai/GrujJRTfT6fR2nyWV6ukXzriiIcmETNS/dnjeZiC9GYP7niW
 EJDCjGqy7IT7D1+xizEXPRyQdDAyhpuHmAEPC02sDHOfZvwWm6fiAJ8P77QJ43XzC+6JRPpyAkF
 6e1MXWQuf/EmEHuL+kA8f4DY/e6qsqW+64N5ko1YD6tgJ1sZvx3Qrr1bo7H7Vlnoh/SWh/jM7SF
 QXY1dyx0UYw4j6VTOYkOjP21Cf8osZudyiCM5Meo0O4W7kxrzx7PuxxUKVB6pmdaPH8BI/uQi8A
 VWzQEszf1wul0oBLEBVAoRkXz0VmH9jVO6ESDGfdjl2i8ojONLBEGXiG1rIf60+KHl7g3NePFRK
 ADxUtbAmYECsXnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX9PoNyCt+u8xC
 yN9Je7xll7HKk5HGH+fGPMPz1MAvz9aZuIaG0AtqX38Ae6nlSo8CZtnwZWwy2NWGr8FmPJ7kfr9
 fBHj+ezh76HOeTGHQ0WaYbqi6nhg/zc=
X-Proofpoint-ORIG-GUID: o95s5I2aPTj-yVO6t19trrYaL57rEhsn
X-Proofpoint-GUID: o95s5I2aPTj-yVO6t19trrYaL57rEhsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX45n3RTVcyXFk
 FBpojD9KTsdEG+MNGIttt5mzSOVOVynj5mqhhrOvC8SbN/Hd8VJEnXMtxDh9A/BzrivcXQueKGG
 1V2195iDh9AU0ekWRolVP1FXkSwbrR0O55J8g8Y9OFNsKhdZJcFhYMhXnay9W5ABnds34xWUWhz
 60iI3wopy7fHgt1lWV8n9AUU0Z7JA1lyhytoHsnIJEZogrQKCjLEh9WmXgC629Bz7MSOpE9r95N
 ZedKrNtZqyoXbvKns30l/cQt6rB+pkVU+qpPg5zPg1hTq96YFxnQjUL3TN7sheVAUlmuUurHM76
 PDOdW3fyM+VJyX/XOw2HVpC4f70uVbS91uQ09xoDMmmpiMlQi7CSRckHqmsU40bB+EEdVh/x6q2
 pYtwFt5Piqncypm+5Hv+wE4SMukB0iNvICsyT8sH0R+A+pcPNhQyhPsQNvf9ocn6znfZ7Uu+QSD
 ZiKMo1Wgj4dX0gEtVpA==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af73106 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cT0tItDctYQywj5JGBkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130062

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..53f2c84bcb96d3a00f3cd2371010628493d49bc4 100644
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

