Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44444605E
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455435; cv=none; b=FcF3enIo/HCD1AKEcPNkJbVmFpy4y4GjbAf+tLy1XuebIRHSQxYv/dGkQebx86LGcBeoIfI93rb8tIQbv2NsfrUHQQhyWhLlhrnb4MuyEajRJ2AUnSaKUX+K6tCQhKBjGJRCKz7Y+ZUneW0DWzo8KCT7J2YRuuKgkVo4LkfDUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455435; c=relaxed/simple;
	bh=ryf8Hd4nI6jqhAT1OBjk5xfOQnB0C6q+0/GQIGWdgsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjNLXbZEBtqvpLyw72LNB40fbb/A3fqCoEiJHryG87tAdQsDRHMe/SCCQ7eEwi13Kch0V6YdeiIqQ7yQ77QEX/cTDou01rR9CgeggGHLmHXabtf0DYHe0C0HDsIgZ9jsv7KNii6MO4RHUyXFEQHgKucwuh7xnAB0kdcSXIBpHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHfArXoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwrUyiYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHfArXoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwrUyiYb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWjpf1090661
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=; b=cHfArXoe1G1igSv4
	ewt79K0VVekUNzoomiOcEQWrTaeFUqUDcu9SOViG3o0wuhGlrokUYjzOMKOlFBw9
	AP6yD5fv/IiyYJ8gHqTz6xs6sHrW8cDklbvVxOnUOfHPtPGDTN5Rji5Y3MjxXCPi
	Ub+VcM7YtpcgM2CYs4hC1tVOMKcw5dkQ8LJeSFXh1L8cAfHR2xlWEYd2QoPe/MNh
	lyW1vyRQUpaF6kjyMaeOTGm/58IXboTzVhboURHfH4XOEgiCchwys1UBod/zjKiz
	nwdsddHtognwOB30uvsWpdNvSL7Mq7Q3VBREFC5xLSkCB98Z8pqKHvPiYBxxWXpy
	FPycjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049er65n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so74085305ad.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455410; x=1787060210; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=;
        b=BwrUyiYbxwcQLGBny2H+XTx3FIJMbhgUJAxx1IUoFWLKG0HL3zsapHU2bb1ClzSVIQ
         6pcJbBuGdauoQP2fX6pDjFXaRPFZcJuGS4d3S1xWNdvSHX8dratxpi/g7Pj0hBgBPQS5
         A2u2qguZBnC1gP+nJ/K471r3rJHiEZAPn5a63oDaH4B24WDrmJ/v4cm/s/+eUvT6aCeP
         MOFm4TR/ov4otLhG822ell/ZXy2utD2Lg14DMYDGN2bnrt62PM1qGjlYmv0iTO9ihAqL
         79oDu+pC2rAUbkDuoVBt9D3Y7YpGrkWbPP0xWCDL6TIkqknMwYMjMEL6aez7oOzvnKeJ
         MsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455410; x=1787060210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=;
        b=drfRNujfbbhUChY9rj9/ungWUje4IrE+eeLyciyRogVIogXHGb4Wm1A+8EAimcqtmR
         AYmke8btON5o5ZtT43DZi5c5WaCqfxzUabBQlEigAQal2ruOXr5PnYm73nVPnOthHL0H
         n5U1TpR1zLdztEmMhjUqK48NOhkMLdcUL/CgzfP6NlPn6bVPNAjrxm//KXHlXpvouhEM
         aYOjSF9LvuafSHsguiYYUErjNKP15u/TEyRo0/J7JJBP5yILf6Qp954JFD76LVsjnjsG
         Ga0ssNbo0OW4awER3vqmACiOKIaHxCdSHzwmEuvdvKoW+xdQ20V2hU44c3U97LPMP3Cl
         v1lg==
X-Forwarded-Encrypted: i=1; AHgh+RprkKVTl4OJve0OMe98Q40wAdSfLfjso9ZkJ80C2KTvyEZFz726mTe7hUyLJT6YDjz2DtAvSO9n8SyJJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB2drNTm2qeBobuAky575x3DAxuCOXdf6stlQGfh4TNvMG/XWx
	/uJeyJmn8/EIpBIOZQjGHQB7o99faBLUBl9YhemMlzo8TS4M9IrR12QDMRFslKQWeY+FH5b9BUZ
	e7/FDv7ZB6ivX0VM0NM3rh0gw9D2OgiOEb9chjD8d2Yu5upWQ/4UwOhWjyEpIzGyy3Q==
X-Gm-Gg: AR+sD13LS8lTeJI37peO2/jLFvTYQMEFdXA6bAHLu6dz3WYiKry8LIy5q6hZlzkukGe
	lKUacBsVlAqC2j26Yxfcy0kohM/BkBzWeZIIt7OnbXn4wx16LJ5AVdCFmZeOzah0C4Zb2ZziYRg
	MVLJbp5u9sERKBrpkrfLf116KF4Q7HK1BCt+LgTAns+q1sYGLCHY7cFPfFK84BTDZtnQP+tTBaW
	YMkRiWmDbw7zT0/xE2dU88oBIM9aLKAqnTPiO8r5zrEqpMTdRJS9P965jpOMH857IFwdxr0Jzwy
	w8Of+QgQJcsDeR5ZXCRVQslxer0HD8x1SMM0hxpQLM+zhx30NY9xm927e95pxsmC0NGHXlUAOkV
	kV5lzhCsRHKWAUJ8NIfr2O88CFSLIUlcrRBmwSUxfzL/Mzn5rNwt/Su6m
X-Received: by 2002:a17:902:ef4d:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3179824f5mr47183665ad.23.1786455409571;
        Tue, 11 Aug 2026 06:36:49 -0700 (PDT)
X-Received: by 2002:a17:902:ef4d:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3179824f5mr47182825ad.23.1786455409155;
        Tue, 11 Aug 2026 06:36:49 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:48 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:34 +0800
Subject: [PATCH RFC 05/15] arm_mpam: Fix device_node refcount in DT
 resource parsing
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455321; l=1766;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ryf8Hd4nI6jqhAT1OBjk5xfOQnB0C6q+0/GQIGWdgsQ=;
 b=x5yeS79Rh62eUQVQ3gSGWwDDXvkKDLnAyOGYhwpSc1e05BrHTfEuigvJj8c5TUPwqxk5SQKrp
 /idl74HvQpZCB0whsc6thSG6yJJVYowhyPJBLVy3zn+p/4Gd93Qx/oe
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/wbEA8A2NbpB
 ahpwxkHM7oHhUxXeZA7Bf6Cho8oNhwiQuZ/hjPVVb5r7Pe0MS4KOg1gyucb2Xjcv+zPb7KO7cv1
 E5xbjkWSnL7qWR1deiXO9a7WlmFUi8w=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b2572 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CToXZ0GCVVG03vgtT4YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: k5-GckmkbEIeTXuafme1LKxJvZBlYPx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX5JLjpIYrkKgX
 jwbA5dkDQTQDprSplylmpNeTMEMidyM/+96MkY2Mc9u+uqmsfAaamArWFP2ocQmYSW6cEN3z7jU
 ojHaiVp9PnHBVUJVg89tZdobyCPIIkfwPB8vmGQRNrMsSPcXCoRfVeGvI6H+DKpKk06CGi5gFI/
 ZB093BRj1kaOaLfC8hjAkyIOfAMcn2eDhIWljtI26ffbvyUj+SJ+eyUOHxIHjqZP7d+lCZ6P8X7
 karO8f7MA9GN02KTfOwYsWgxPkbZLXag0DUvw/tyk8OtVChHjQ7m92FMyN4k6caqWYMHgzolePu
 bIzGNTto8V4qJRsDr6XXBEncub6uoO81HDFeAulyazC2NmjgfAEeVP2eOApLwEuSLhhJK9xwcLq
 GDWakIuBXZZ1l22JUqIufNjc1OTKYr2Usc73si6FSEfLksY2+MuHtgu/petB1L7ODH79r8LDg73
 ecx8LuPXmrzxuBGdAWA==
X-Proofpoint-GUID: k5-GckmkbEIeTXuafme1LKxJvZBlYPx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

When a cache-parented or memory-controller-parented MSC is probed via
device tree, the parent node was assigned directly to a
__free(device_node) variable without incrementing its reference count.
Both the parent and the cache/memory variable are declared with
__free(device_node), which causes the compiler to automatically insert
an of_node_put() call for each variable when they go out of scope.
Since both variables point to the same node but the reference count was
only incremented once by of_get_parent(), the node ends up being
released twice, causing a refcount underflow.

Use of_node_get() to take an explicit reference so each __free variable
holds its own reference.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 975ddab771b4..559fa09128b4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -280,7 +280,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 		type = MPAM_CLASS_CACHE;
 
 	} else if (of_device_is_compatible(parent, "cache")) {
-		cache = parent;
+		cache = of_node_get(parent);
 		type = MPAM_CLASS_CACHE;
 	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
 		memory = of_parse_phandle(np, "arm,mpam-device", 0);
@@ -290,7 +290,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 		}
 		type = MPAM_CLASS_MEMORY;
 	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
-		memory = parent;
+		memory = of_node_get(parent);
 		type = MPAM_CLASS_MEMORY;
 	} else {
 		/*

-- 
2.34.1

