Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178834;
	b=KfnUmo2MsRmCkCouWKeRKvgTw2xCAmHoufYTrwL+J0Pj33j70lB/vwJYoHywH+XFfO/+
	 Nj2MhREQ9q2Q6jyXGSKKhD+kjTmg62vyYGYHGGuRZjzq+4xcA3xAh66F7mn2korT5uQVM
	 k+dlDyV5HOzakyV6fA/wY0JZZXu7SnOEgU2Ptf4wrbRk0CWHwZHEMwf/lhrFTESeeMco0
	 MIMORRQVEicEla2Pty/hFkujmF7UQsmxF3/aV50NUCUkuNvgwX8bstY/bnT7RdxloDnrb
	 em4qiu4IYmDevoc4oH+CsjL/J99CtAuNMQZlzNY257HxbdOFemq1rddPYlJl3w80Dig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
	b=YC37WFQ64FQPKRx87Di9CFFFvweNg6WfVAtmNasxWuiRjvAK8lGo2jOH1M0eecQUb5ya
	 AV9Q8gL2Ydg1J7wOHD6WBvyFTRlKp5+STL4jMRjXqnUNX051Q6tp6RTicstTHWd5+oCpv
	 TXsupB3burULb/DRgY0xJ6vXy/CwN2SMAcOdnqUanS/lapSkdZP2lE+XRMHiamr9YveTS
	 GUec5C3QymsqELHYqujZPvYJIYQPOxFbIFB8beITkS+nIiO1PO6YuWCVBv5DZlcpOK7z6
	 /WJIy4vYi+GeXHGp7cMe+41hTgYNdfpp+aUcS7U9yjoGAARg0cCsSuKWqci4r4051Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mive7c++;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdavuUzL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4360A3802
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB4360A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mive7c++;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdavuUzL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjuc81168922
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=; b=mive7c++G7f0aeIi
	tU5sPnck0E6Dn0U0OiTsRiS0pijJUrn/kt1DYm2ucaK4Td9V52HxTozQdgyD+eRe
	KrOaoBuFOocyl4fw7G8PYK+4a8rh633EGPQjcfLAMMSX4zfSTNBZzf1OW4tda0LK
	56DQb1FByrUvQO9KQQaHI0YfXbeNIyAv9tR3HClJlVU6wvTGlG57x2kT9phtQPZb
	Zx1Mr+HBK3VDye1BiuxHjovr5pMiM1S16VPt/lPRxB6+PZHUW+rMtkiu2M3BOhX/
	gzIdnQQ6TefS6g1GNnaqvxp06SR8hz9vDLEZJTq1OQhQ61yUCFP2XUEenZlv0y81
	l9kLOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5usfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso367722785a.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178833; x=1795783633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
        b=IdavuUzLkWa89Q8dSjw/vCJAw8zr1f6RcfL2saYGfrhth+i1/XQBp9HzBtqhZzZj0x
         9evqlL1+tmOa1yvaWecCn8HilcAZPuJj0nJZzTsolf9lzDRwzg1GjXLBkus+pHBzyZ1f
         kthndRsqOafM/oIzsLy7V4SjKNq+LuvA/hW/XxzMhBFdzHhv1+Nlm/Iw2ToLJaEw1OkF
         6PZQJ4o9uvMG8T/lZCRac9jPk+nuK/3tQsWIbBFiwMaEd9m28nH090PVP73aMU9Pt3Vc
         kqfFzb+V+CKOul67ZQbCClEt5dp48sLryszcUXF9echVMQNMPkeZRITU/YWCBJT2Gjeo
         0N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178833; x=1795783633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
        b=T3SNwLs8rfkxgAUqHiwFsi/RGuoSuRz/lvzkurYaWex8DsYRUpvqkNdJ3wpyDIAB9J
         CaSXubGB04EWpZi+PFL5DPhmE/+8Hp+ZaqHnxEZz/TQwWR6KBYaIrnRh9GF3B8EdouHl
         EtfRbjyhxzRarow7a48dy0xYIFyYAcZYOshBG9orLZk8e09iVljwOtRUoH7gTVPDKsEa
         uVmZqqGZqydRVu0MDUi1J4rTIaX/WWfjVA8EY6BfSRMindY6UpOcQXs5jr5mRBaWwn5g
         9TtdvhFmVXjfmLoeXO3oFOslrhaeIIbvw8fqrjgAFj96eHf2pUzinzvsPReK7UxrU59u
         xENg==
X-Forwarded-Encrypted: i=1; AL+hErG4+Qtu2x+TGeHYPxBX8aLroJ8n1PC66v2m3sAY9zismuVwcHm3zWN7py8x+Nx8LNOgIzJajM93Ui6nWw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+TN8wA69x4sjVjvm0lqDTVYJweNFrQ3Kpu1MXU/ARe8ijgwtuU
	lGFITAJCda3e3JAbV1ZRc2+7wcBe6GeF0J45OG5J1g02SOkdFlpUrwtLFB5cYmz0aIpyk/eUU4T
	Xa69M7uIj2twQf25jHFgSlFRaasoqB6YznnJ47aLdU50aaSSy7w42e5hSvGv7C0dG5g==
X-Gm-Gg: AYBFou2s25XUuPuA9ARG9uiNiTHs5udIkvgNSXDkSgULg1ZwtMUOyHml+cjLnm3IXgo
	HQOxs+qHnBhkcX8n/TCCVrcru9A1XvsZpT9V4appQymkp2Tg86ze8f1ptB/ffco/9X6CNjXA5ry
	TVrDBIy62L7dYfJaKTYZEntHyh9nnOIX6bF/zrbefIjzPl8WnMh3TJoOUp+CgPh8kEx49McP2fr
	TkkO1dmQDqxbKOjNtcRMq95GFdnpQGIiryvbBl25vrcsEIWFKHeJJAzWuO4ZBbKWydb56egapww
	xUzFB1ruAAjUG93bXJZQDwntWcnBylKFxyA+qNfq7H35i6FZa2KTcAwlj+VMNViXcQWEWijn/ki
	cTw3zhNxpghCSQ9OtEJXBPibXqhQMG/84rCGW/X7IVEvmNFhugVkey9le5MqujsKPSi4yjs9djk
	4=
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr701838785a.21.1795178832651;
        Fri, 20 Nov 2026 04:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr701835085a.21.1795178832194;
        Fri, 20 Nov 2026 04:47:12 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:45 +0100
Subject: [PATCH v3 08/10] of: property: implement the count_references()
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
Message-Id: <20261120-fwnode-for-each-prop-v3-8-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1JYcW0VA6RP94DZpVTOyfu+AL1354zezooQUAMBcxYc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE48xRvddI/0N7DCqZkWBsifUkkdYI+c5zBJ
 vU46Rr2pqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6eeD/9FM2LleDI1LmF4XiZNQpXqyZxO5p6eXgpPVBhfUheIYi62FaI39M4l+qez4yLaX1zeW76
 dW5RMQie6Acezli2k0Yi/wTU4YfuHMlF6+veM8HQ3hzUZ4g7B6G8t24Ht4ev2QXihHfsRWFwJNb
 R3pQgTB5yJvxikhi25Lx1qC+CfEEPiVtYnCpqUOD7lGUO4Owx76xEcPSApmYg5g72g2jMElnBfV
 z7Z4pXKK2TEQ0JBglqCht8mZidYacc5Nrj0dmq2FwhE/2wGsvo+rMtVYLyKSOXTUB6s0AskLgnC
 wHMM3CLaz6AFr2BNJsfW0wlCWMJz4xYSPDcCctad+ketRddAWj2fh52mvwg2Zur0AmLjcDdy4mH
 s9aNWlzMW9/dPV9Gom/S15MII9bJLhnnxbyLN0k7pWLKKlvcftVZm3Nqm3A/NBlvwKY+LIRUSDz
 KU6TK5tSYq9qHpwJ1SQIu18hQizzuQFho7vVnrMZ0tVHpzMGil9lyVcJ+swqhrVaQ1L0YVZUKzK
 Cm0Ckr8DsXxsFY+emjQNA0TgPfS/pTj8KrlDc4lgYo/C2/u6o6HBofhaGJmu2VOjUo9X2Hk2nZe
 iSPEWlDeeasUNsF9rFmP5VJp+YOsdh/STmk/ZV2cU88FA/2rBSZYsbX257OXQ9PueqaAAhhbX1E
 AJc3sMoEMzH8r8A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXyeLxDxPDbhyK
 rCi6jmkYqasd6vA+/kYwm2/g/36+2zYcNCT4zpPfvdPgfyWziN/8ExghoZA/0DJvJYeRK5MBLcK
 qGYHEgjSgtSNaV+Y7xnEx0gsEHdku3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8WEshlPSQrfD
 n+nxWtrIJxEk3UyyVgEmc50V/JyO9lc5ha3sxBqJrWjLR2RBaEYCZw2gPkadh9TNiwbkuYS6SOY
 TXkuR3aDqzasbUB9WJEI1IzzHpiVrFHfBcJ1ea7nNenVqFKlYprfTBAn4MJkoDf9x7XfuiIYs/t
 LLXv7MjF2mjVovqWlJ0rcL0yp748g2oITbWG0I0WEzW6yS75ILAILyBZpds/cUnI7WiCXeSX0/K
 nqCezRCUlyHDfslZxoGUo2XN4ew6TCU13DGYPQOMRRNbLhpL9GtRnx66pAPoIllcahJkNzAHUPc
 xzfhn3T2JRDEJ2sgzs9RRamzuS1f4Kkb/HgJwrIErLtfCvu1aa2LzRcZ/wuiafXGzNxpH9AP4ty
 LZKw8327u1Y7ZU72zLaE9aIdh/vzRxK9DMVPHWM5Xe1R3V0VEZJHkftDzETdHLyQRgtWMg693/n
 3BeTJk7hY5YRNXKOibA==
X-Proofpoint-GUID: DxthqJ2pdUpgzmAfQmhY-wUIDvdpsen3
X-Proofpoint-ORIG-GUID: DxthqJ2pdUpgzmAfQmhY-wUIDvdpsen3
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004151 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9arfEEHKbLAzJOUiRygA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index f914f0475e0be865afc9753fda5aa40a08a10e25..4b18cfdba802048364dced99af574a415815f790 100644
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

