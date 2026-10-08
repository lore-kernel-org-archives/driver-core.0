Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05503AE6FB
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442047; cv=none; b=KapTMj12NOPJDjI4WgVwON885YcPmLuajs5VK30tAr8pCM4bMdue81P7e1hc5mHxdkxt43mac8D0ZxgC0AIn1KsphNh9B927q4BEE99xU0aImV94Psc21wKJ36Pms1aIwRmoRuxEKtkyqj7hqfMqpYfBIkTDchw9LLSOlWfVfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442047; c=relaxed/simple;
	bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKkI7ujoN2GfqxZEwk7V9+c0B97ieADemQjEt+wdtnZVhb7HdDwwTnxBhofqgFJoRMC5pYBtazIjLQcDp5yOVggzOsuT5cZhUL1F+Cho/j4+YYuiMjG83AR5xJaI16/S4DY0oHvpirx92U7yxNmbRHqU3mpPzyxDiItCkzPbGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3gOwE0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPsFGnDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3gOwE0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPsFGnDl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXJl1157823
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=; b=J3gOwE0UxVt5ASCJ
	avXMitw3WNXtFM4PLC3UgIHCLMy4gVBVfgn0X/tin784mXgNi+QH24Xhfj8OJzEo
	YDEIyOJo/qU+mocS6gbCUT3oNo2o3ueIduFJEUhFG1Q7cN8/aJB+hNYYZka/+a8P
	Y774p77QyQvQGQeDVzpSBh3qN/kcTXfL9Z7XKdSedlIADYftOlScDeqzjGrXGQKC
	9NVB3u/Fn8VvoQhukIPISNKgTNazPMv9V8Soi9dfSWShGL85KvhnbRyirAWHIIp+
	WF781xLXhQl89nIm92/Rj4Cero5M6Dw92eZz6cFUgLZDDIupYyPUXtlf74SvtM2i
	1I0KmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51he3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:47:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so7435539a91.0
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442044; x=1792046844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=EPsFGnDlDNFAQjTdvCsSTk29gEHSvdp+4nwUi0DHCdzaPe0JY6Fq0ohUq1mOq6x32o
         UOXVvMM2ZPnwvEV+Fbp8gAkvfjO37St88XnW4QYXABas9OJ9loMBIP6apB9Eeuy48giv
         0flj/EWeSuV/Nb4t1vm5WqI6TxJryXDd+OGx92VlfBNjSH/PIu2eIYqTHyr7IPTRgygR
         ih8LbouAT/0LcRV+UZIpKbnhbR+e+W8ceiVOv3HdyEHcFCkvX6s8LDN/dwhAT6CliHV2
         jZKPHfudwx4poMivp2io/x3f3H36LM1qDm9LGHZ3L+0EvzfFTFxH9CPcNBGzwC7Qh3Cj
         IOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442044; x=1792046844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=lkNgArWLxUhLgD6ZF2cvYzUz0hNiM6i4U6YsoFuNhwGduwGKyHeobHFrAzF4oZIp8T
         Rxj9SNRQj8f9x5Q7UFqWm2xrULeUJqL4VLqaEIgYjzRvShklmxFNM66fomf7FWgYFK62
         YC+qwfuy8Yfuejo6+JsQEskAsyD2y10JzNOkfWXzRBW3a9+e5Viv9ToKHAsmrhLrnSiS
         KgEG97J1fFgU4Q7Bf2+OeBQWsNGYJvsT2sy7AlPjWRNzQWXzwoXhRkXcVNNf0rC9oQ1K
         xiv2xRpYPuW1H+uX6B7kY0mwRPnsM/tomXhBd/bL0Ej/WfP6u7BfW2R0f9ih6PZX4tqU
         mX0A==
X-Forwarded-Encrypted: i=1; AKwUvBzCc5TOF3O44O3hX2F/KVQu4FFIDJkfCxyrI6vv6pvB++Exoz+g0gmJAQIIJlB7PeHZyVKYUNLU8qe4sw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJQgC6/Gy3JcEMRi6NNAQswd3Xy6Lg3LeQLV0XzMDsWG3lqk0+g
	ZNH5QGwlQDqmAS25UI4PhpEbv8PBHZA9mhLoaAP6jqpuVB/VoWgSQw7RP20vZe7LstgXk/QFFW/
	IsiAne0r7e/2YrrqpRopCyZCNNTZy/41u3A+AU+tgL06aPmj7R3P4ai0Ysy/FTsqnfw==
X-Gm-Gg: AYBFou06hdc8L+M0LxU6m7aBMfV1bqOjctKzjEuWrZtOPZW3Cfi/COap4JSMdD3zTcT
	SlMmPtrwXIpOc+/mVJlk4FapXDLjRyy41UUSTxWMNabD7jWYcvlpz6NvrPKQx3bdn2UXCmtbKbG
	BOb2H/bL6jIYreWK2cifNKqjNcjdmfgHpM5HgWECy80m8Pfp0iv4FEuzJVzp8mHxxJLu7Y8Gw1+
	e8AkT/IVZwoDOqrsCHyUNPrxm3UPhjFMt/o1VkEKAGcmH8+1TIRxw+JLMwl/5KFJpQXnuoJha5Y
	SBAlpUsWiMhjhMlQzcvo2m746CYByWZd0t0cype89yKJxwy6G2ZNBjm4ZlbX8yF7ohq6HMXyT4C
	v+Ys6M+C+dDwjeNwda2rSKS8N0iyUGDpO8xC/EAp9OO5ffZZy2FA8nwU=
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010042a91.44.1791442044454;
        Wed, 07 Oct 2026 23:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010023a91.44.1791442043924;
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:10 +0800
Subject: [PATCH v3 1/8] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442020; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
 b=X7a/wNFXtXcHebbMyKYDrN8Yycqni6KgyknrSkGsyJg9T0nph6PauXToSrX6n1ceCcY99Tnog
 YgErdd+Gx+vDaDYSZ7/BJDwI+zlMJv4B/SL2IWm+SqL0ZqPRgAJk8S6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 3OWnb_egMheCoS9QDcOnvt3HOC7CyELq
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73c7d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXwMbbH+ueU3GH
 tw3q+PAoVR7OAj24UnLLgbc8q6fqiOdXHXQBbbZ2oQ3aMAcWUaK+eY8hgUl23tejsXvT6LL1hmP
 r0nrDopKIIHi+Ia/JQNevuB2Ge6Ecrc=
X-Proofpoint-GUID: 3OWnb_egMheCoS9QDcOnvt3HOC7CyELq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX0SpHS70CiUp7
 WBziShpIrh8eLg/mH//j5M0HOV6k1rVhmMaYhVsjsyupPcKQGIZj71iRrl3O1DswAojdEpAFgf+
 a+1RUFfG64dQ5zYZ4mboTdKH1+DFEWyDRwHuC1nNw4KeGQ6cRP4dMPmlejCX0tNr+wLjaFPurXn
 TWUMH2Cvn7agArwIcp3wusgMSERHsp4gLVhUSoDn0OtyAPGZEPNt+M8Qw2LHjhgFbrXzIR/iTG2
 frGPI+uFYSB1awZjSs4Ka3koRZwwTWnQfQ4qDcEABPQJGYjcMEZ2+z3qIIJ10GUMBduwQc6Wfe4
 G6eKfG6sZq7MOECIEhk8INyl0VXKg6LbBi6IqP4EjU2YDzj1nM81u1vnV3asj26B4zdXKpa3ECa
 cADqpuUSd7iNXWDoZL8pFpEYSYSG64LSFqzXBtIwEuBd/mA6+Qe0SKrfxHcGKokOQHKjx4kCRyT
 EWSf5wbS9zoW7Icn4iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
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

