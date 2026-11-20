Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178823;
	b=hYoTU/iHHvAXKk5dEqWXmhlp/bPwTva/JyGbTAdQz9mMgVBq+D9jzomZGV1z4mQBoV15
	 EuGIFYyw629UuRTzraBRYZl75BPrRnNIPd0jTFz1OIkY2fQyMmo35lMdsMcW4m+E9cjV9
	 qy3bNH5LGIG8PjLHPvY+9xpI7jdmhSIzKj7dCCnAaSurrgShCYqECZFmD+8rhEyuSNDUv
	 DbNbORPQwlvFIe4qAv2Q5R6daekm6Ip1RCezNwJtE9ng+f2TJSFjsCeATLkXuwZ2zikOV
	 UZZhg4Of8McRdGrNzbpgi5lG2epBuxEA1vpTkIcLMT8NkX3PYz35uNBg1zsyxQ+Oobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=xn6mc6+TVj+MCup8Mk22LAcpO9IxvWdHyuVv/fe7WdxfWmJgv6X9Dlb6DHsBjbPG2Olg
	 UUA8FSGGd5AcPfkKeKKElze+a6eAUBrEDTF6j8/kBPfGh2xvUt2RqLBY24rPYbkwKBHJj
	 kWtO7jJWvwDo2aVI4CsHktmukq1UNM17apIp+YrZAN092BuO+vcH3aTmJExCJSpNexLZ0
	 FPOUDq0m5s7BNaNYTDh/AIzmGvTQn+5qtdsAFDrE3COucv5OHLzvyh6bkophTPD8aWcif
	 MDGbxZ61zm0BsJM+oBp4o1DOZDWXeog7claHUwgIxXgFgx5/AX18ue04/DAVT0//7ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKcQLOrn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AA560A2622
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AA560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKcQLOrn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCFar51256942
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=UAMwMCcLhoJbJH+W
	5sN1nAYUCQGlFgvr/j15NPQLoqHS8MDQD3TNrbeZvD7We2T0ry/M6uRhu7MeP5Yb
	Vm/b9jVPoe1TTDZpJ4QsWexMTH+RpJHj1Vr7QUld74gZgxxZJEOFE4kjlFZ7meX8
	X8Qc+vzeWqRSXyGcC8CmIecSLkGx15Oym0RdICfwBDGPzbo0jPD8aLpfY3/AQcUO
	pH4kVuw/N9aFZ6bO1CZGkLHjAPP3F8ESP0hHCXX8TnCyH6k3Nhs6HDadABgo9QhA
	LshlcNIOcLXxnmFq49UVNBP2e95DN3lw1T22XpYIgZztX51I4X3cn+pDGxKiei/E
	Qz/w3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykqyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so185567285a.0
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178821; x=1795783621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=XKcQLOrnkwyFhnDDX1kkSjqrevaNgdQp7H7tM4wP8/Z/sfoHkSWqHVixYl+IUm0X16
         O2hoDwFQ8Duw2p9gKnbkE3ZZV0XHaB0Zzt68MJ5JPZOFKLcvrMWEIbT1QGV0xLEqaM0f
         p3Top1FLbAMQfMoNFJ3m3h1c5egdOhZ+QAY2bdZsoPalaMqzUjLoF90bJ1VWXqLJeZ+8
         FdN/LM2dJfeF+04leyE8xIzTz7fUCYDc74hfIIGtMaeW7U/RZNXhpcRGYHMhiX5jyVdY
         Mog4T8n+qZGo2SMSYT5cYvDupIMCTdP6ubgN5pm4L1x3ngLdwApxsbRH9fRygB7VLd9F
         ekyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178821; x=1795783621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=IiMs7U0zxAS8feciqytxTQGiKlQQF/WBPZsRVgMlir1LK5DalmaUI03YKz488csDPq
         z6hQkNx2Zjj4XPnUycjjlWH+v7ICRJwRsdJTa4F+wIBLvKB3WfZqmF541JQwEFUxTp7M
         x6XyIydftlx9G29JbcIp5urp/PpQ5194vJxrhqrQTtofplidjotAqlc/704NVwAROy9J
         OhbK3v+4Vy/Np5HaZc/3ZcSUF5hpCMJe19FFb8RxjXhg/rQn0Xnk1vDnd1WWWkT+UHI2
         rj6XQqP2GoXLs2vUOkIndUOe3o4YebKSvZsFZoT5xljtwIKpJrXlhlj7FIG38MNPCnzT
         yekA==
X-Forwarded-Encrypted: i=1; AL+hErHcaWbxJ56ztaIBDQIw1TtMsG9gW1LM5InML5gV/hETnH3CwR0scgG9zKfhxRxUXD8RFr1kW8wWyqp66g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yIBqoB9fnVKKEW++IlfWbhy2q1Sw0/oz54JhYkBOLYNjeIOh1
	GjeqfRmk851zG5Ha/PTp9FWZoa5iUc25c2f5Uhm21hLoyB+cMq8iOSiY6B8NZl3H1uqhZKHDIoe
	WB4UN5rrXFJI84pxnVfOH80jJ+BBKY+W10SMVy3rRF1TlmF+QIUDXCy3atnvoaUKb+Q==
X-Gm-Gg: AYBFou0hRve9jugUcEaXnNIABb0k5NwJQERd6AM4HGQTTv1mLAIcCHVCDOH13omTUZW
	0xumHkRP1fSX/Uy6gwW8Q5yTcjMtmlquvb5v0KKDyxaok4V1Tf+2D+BlVFrlHJY5Itnv5taN7ei
	dJIMJgXdkMAXTOZajoLVS/z+LvZCM/0qpEP60ceaMN6+7soDHp32vyaRe0JON6I4AQXkAa0n3wY
	KPyEkmg0H75o0QcHZtcmTnskUf6rjs6KI5nzNvUGjWtVO1frkBW8JIUG/qDoi6d+ab05kNGeCS7
	LzvcsEjdY71Uupy/yF5+DlVIaMyrymOo9IdzhdHhTJnJIGJT+cTCXgRRthsJDbEMzh1nylqZulS
	CVDYwIXoyrvZfyGz+Ui9dJNBXxs1G+mtIsPcv25MJgAk31xXHQjF5QdJJf7KK9FtRs81n/QotWx
	I=
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449853985a.35.1795178820838;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449847485a.35.1795178820256;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:41 +0100
Subject: [PATCH v3 04/10] device property: provide
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
Message-Id: <20261120-fwnode-for-each-prop-v3-4-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3PDjq9bQKPjkTMTdlUm3r6EuwNZgwKcvA6
 jSm1HIhu72JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6y4D/kB0ChgwLoHAxKfuVspn2U6iejfyGbyMWeKeXaxbHy0Si/yLGe0wKT5QwN4Fd3leA4UbK5
 MzyqKqV4Z8YdcmhaEP5nJKGIEId4tG2SorN0mZC+L44P3RgDqOVvFy7OGF5kv63XLTBgT/42M4T
 wq4479LNWVbjCFK5k7ZoNOReyenKeA8Iyp3iwMtRmK0DLf+rXjK9CR5YG7kzSvqUtwUQNj8VP7t
 jk80UsnzeP55CP4KNqtBWPcx6AXKlZ0sJFR1Gfgp3h3WGKNVCAurA7BNKsd9YaUw0/JgQdPpxIr
 Q9kV+/akEb6/mwSwNf+0IwZrahSLTJKlMIYzDgqMkyW0xnEoES+9qwZjsaNNXFNv144Hqce1RYw
 A2iOH9Ao7UKBFvmrmvEZ5X8wSmFrcOJ/TaiCJ2LgyhfFvqIL5QBnEtYbfSA0uv3+ayqpX0iYx3x
 uByB+nGi+lL2ZmJAFHwk14fYruBd0Ly1I+eGCsUvP2Po8biW5AI6Gep37pFDo4DrW4BFfm3LfmS
 FMAiTUn4/EAG9eXYB0+22s8UDaCDMMwYKsblP0xsxyztls/mG+nJ4fi6Wp3v6RxGqrbEIEVlemF
 NtgAOsZ7sNPUZIjCfVWEWlzBLvNrsrEBGgZWs5JAO6dBP+6//F4UZstmM/S1VFeAWPQR7Rm8gmx
 1Ect461AWSQAECw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX6TsQ00IKizzB
 hzL824Pp5y/DXFNSDPr2fLRadxgZcO5zlkcCL+IaB0b7FkyyucNYEvcVkhNZU5HWuwVq1ICSQL7
 bkS4PD7OoHifRuMXwvLmOBUcsFezNL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX2l62rqhnLUJu
 8NJu1yaroJAXx+e7zszEcBZXfrtxvjE69TTtlJtsk6lg12FnL5wvUC9YgqTno3NpfQNlP3Vdwsk
 CYRE4UOZAwZgEVdtBL2abXCoYgtHCuFUfqLVy+Fl4pARroL9yLei9oip8Ln1uaI1q2Aq0oyw5/J
 GomEoVSUGYWs5HGLNvhnvidHdo0TmjhnYqRpjRKGl8JiFmil82fbNfL3qTMIdJpb8LMieAE4WjL
 PiFddofpj+m/quFqVZ3XM0MamOEFCCnUz21oxgZY1vYO2UzvMpkahdSVD0ERN9qmMO7fCMx4166
 N7XFwpmxfVbhMzoW7C2cKWqIthDC2+Ilq/X9P/ZyY6/NiHP3KKEVair46xAOon3fbGlRYZsKpYZ
 fKN0swSMzpt9x9+4jF9bbMU1zP+yypeVZusaC8vZb6pYmhHjnw4BdlMQoIb3aOsIIzTFMe/qfic
 d+/c8wa+7Sgw7rGfSNg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004145 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dnyZm-k4CPtk0SRPWdEK78iIPX9DfCwr
X-Proofpoint-GUID: dnyZm-k4CPtk0SRPWdEK78iIPX9DfCwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

