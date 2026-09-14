Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA70F4218B6
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378789; cv=none; b=g/VoEQY3xqEe60qqhE/qake2tSClqVbngytSV0LZV+ZkK1NMwXmlYunUgRGmGEOmtjMr8eJLfcC1MJYJuPLP3TVi0j2ZVM+ufXLeIfRt2a+s73yiW+CxrtWUO4pW8tduYNM3flrOL8FKjDOSV5UABQdIh8PeAVB9mgu34WAjUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378789; c=relaxed/simple;
	bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7NZcsKRThzh39m+NDDocRakXS2QEUPoMCBrGtRDaJm08FEW3tv8VAkEmu5tbxUbY4Wk9kg6BW7LGSs/RN6aRQ7tXlwqWwiVG01XPKrVZ5f2Rr4sWm5sTfLmja5RFuoZyZikIdx9y64MCd+G/+eqBwTqqbgiYLkQV5fcBhH6LM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwc0xs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/VbG0ly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJwc0xs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/VbG0ly"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jHjn3842679
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=KJwc0xs/gnV/VDUJ
	AbPpWQ3KScrRqB5m+kykYuRtCYi8CH0ADcKxgLqAD3GSjgfkqN/WacHGjllBQ27N
	Lqu7WHocHa/tadb82TF8S9emN6ojTDg252zI0ZOdI4VW8HZMSv0dkFzVD5Pfk9+D
	IybVvRN5jbYo1yae1kYDrQU+MhpTkRi89g1PEL2jwR4FJz1LUCos2LnToBZyVb85
	kk3VYBsZXtmQj2nPlGalwANd6u98BByZdM4Crx/TqsjDqSvX7uZ+bMxbawBrItyo
	rlUH7LZItb5OhqjSksgKJYWS7GlLoL5ml0dcZik0SDdxSh234Ew1aYzlwlEKDTag
	tVcH0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5yw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3785664a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378785; x=1789983585; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=J/VbG0ly6DEoKR9IwobgeX2gbxr+82ezaTCXm/wFrShMgp+yesgeMPEhzSPdgDYMzT
         XxqhplHnjmJFEWzy1oBhvaRknm+7Z7tmu2LTADsyW/U3B1PRGXMnxxjKbWmr5lWDTjK7
         BLn16zxC20ZoHZeSZyNzsLD9O0bjJBSjBCtUZQhq1lJp0I9xUJJKRpbCnffNF3T3k2cX
         O3PncAcF3FqaO6odQXFsCwcKFKn46RIVEbWOPZxax4XrWcuKN1VUd26RWGY5TZJqgtuR
         wG0tH6P+b3eqprcJ2oEXQ328slRBei9epKEhYUefzi23cxh8wvf42gYcLyq0GNrk6Jcc
         6Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378785; x=1789983585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=TLWv0MYFCvUf4CQcDIYMk4EEvFErjWg7w9qazBHw+T6urlGNV/dsDZ4EAlU9NCAYLv
         9HlpFTkTmedvlfmQCAMa8ofDBH9X1neuu76FTUh1Zqxq5PAYOfrEqx6R4p/VAHgo4pqs
         xpLP/qEMtl4hSRGSBS+K4LEEZkWhtTIVAkb0spz6LKnhJeF6xSPHhLKu4Pv/Bvr9Zg10
         OFiNjikGj9rxgZRM0bITqNkZ4EBMq0hvr6FFmI6N/5sqvHo7aA4hfnjckmmZ5tGt5L+/
         sfStQCzeFVwi01xPkGa4v9bwCojNpdc6p5qqrbu2O7H92UPwfd3nUBqNeZyhBdRHcXGt
         qwTA==
X-Forwarded-Encrypted: i=1; AKwUvBxLaCO1G0VXaMCUbbQn/yCvRXXy2EvgNCz/q60SwMOJKvQG3pts8SGVOJUanNONx6goGQMY17+dvbuESw==@lists.linux.dev
X-Gm-Message-State: AFuF++lrRfQzf0gHCEMTndADlHj2QI0bCrLBVwA2yx57yUOFGXsIx3/4
	LOQd2sQOLn1d9uzVXHYOas6DIVzdkhLUyk2mNX//YGCyeZgV/UcC3vBw+asQkYS0eNxp3M48eF5
	1dVYhMaMwinSkw1zfXZWK7IeANNsq96jJB6PWexmqx7yQO8T6XbKLDCZ1z0QUUVkh0w==
X-Gm-Gg: AYBFou1yHd6lX5zQYThH2eWeHAvQLKaV0UgDkBphN9e+QbXkmBQMsRs4owuI1U0a0Ie
	ASMmCJYEJcZlEXtsVN/d+dQ/KlawfB0OuDIgKaddJeLMNxXOEY5nPA1QS9D+PEuQSPx0jzuSuqM
	KEIXbTRpiy44Yzw07UcWwD13UYfdjd/jqZXMsVNpdnxhGUq5gYx2b86ns38JKtSXndMb1Berpw3
	KfVl5TcLDCVfswLtz8MjQavGMM7sT6XBiJrNDWFbTHxhbU8/SLntPlDokWMDi54lIomg0QZSz3w
	1fKQB8hG9nPnFjmRzz1oSu8Os8J3m7e/iaparm++Mt0vIf298LYgJCIuyWO6sPJpyoIGw8NLOip
	EToMSmXvjVs0IwH1wBPK4yj+IacRLKS9DEPIKTyLsvHGwJO+wVdOeftfk
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679898a91.6.1789378785513;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679850a91.6.1789378785086;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:44 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:49 +0800
Subject: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378758; l=1084;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
 b=8qVts8kvOfruxq59KFcdjO9xhhSgezIyTV0q1/20EcQF+DfUllQOZoPY0Owrd4E15wWT9eUt0
 Aa/3hS1ds/7BuqTY+P0ocnYLZ9q7OxXK12q95t3cvNkvuz4MnkRAN+f
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: TtxLW1b2Mt2G0mKcK_u9C31jcwIdaPxk
X-Proofpoint-GUID: TtxLW1b2Mt2G0mKcK_u9C31jcwIdaPxk
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c0e2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX0f3PEBBl8V8Z
 EI0Nb9G129WoozJt2dIBP606CNOi+PtlReGh6WW3dc/2IdF8Oo3j9PNOu/6KLmojaHVcD5vlO2b
 d64x/GGa9SoSQMJN7hVVKpYNvIHuLHHYlrEoadbq38If3pL3NlcwemIMuOKWjyWgfDG7T2JnlFe
 i4EoVah/Ys4YEEPprW2PLDIy/7RcEgHYiFwpALJx7eGN0n5QVI2FMiVWrndM28OHLjfhxzsvYeg
 l0LNTDpwdr6GIS+Z27RTieMzIr92E1cURBbAwrzUBN9PHC7ycgOtHK90LrjjU4bHAs2hMU7HeC3
 pI0PC4l6p+0wXj3vgu2NA0HOPQTu8bLHYeyXw2j+IYNj+hYqXhUZfEBiIjAYBthrB6n8L28oFkl
 I/Z21uTgNleh14HbSv1SyclhiMw5czeOX59uF8kY4MZGmLgWgHXxhRihCX3mIa5HDkxOclvSy2v
 ackQr/C0XA0PpifJz7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX3MfwSa1t0kc4
 lo1LAhLGfT5U29OdOGoUXix2JqA9RbwCJqHWB2eDOT2phgGU2kRwo+rdQBx+6DHpX2R3rWRknG4
 ZEzU23S7dMa4JiH91VpaxCIiW1y1YWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

