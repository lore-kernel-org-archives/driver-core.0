Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79001320A34
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455442; cv=none; b=K+6sJgyIhPvRmjsGdl7Z6cIRYRbEI0vFe8/Dq82vpcndgOr5eJ431VP6wsvT2mmfuxCf+AelfnOi3Yjigb5IhpyqUC2zVXzOKSDVQV5ZyOQEsOSw9Fe+LkS9EsEvCywOiaPVgK3r5z8oMnODHzba7N3QbC0iEyQicmt/Nih3mBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455442; c=relaxed/simple;
	bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9W5g9Yr29cjep/vX05mTHBFXKWs+v5q13dXTyvKvUozvTPVKmUWuJOsM+ExSiM7rIv66w18WDhuzIWN7D62Yr56/F7GLXk+T5RcARcjdTnOjBuqjAIdNUOYSVrhQA+iSH0kR4b5Pf5Z3+tmy8zEG/3QrLyIkUhb6/9cQd7F9pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCa8nkAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is2bFwEV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCa8nkAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is2bFwEV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX5vU766976
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=; b=mCa8nkAakfH/D80b
	zyTHpDkqvojSwIXBNnhYZIZI7QdX9dVkgbNXJRUs8vHgsvVN2QROA7gl1btD3r63
	hY2bi0XwNCzLDst6zKZRfwsTkTm+ydZZyIawmQ5OVtsXiksAqQkF5Uud7kP6j28W
	1ZLCjhZ73hiAYtSQEiU9jOngRZxlxFvwaFbZ0sz4q4z2NgSZtDct4FraF+l43oQ/
	OBvorePnQaumb+geYkWDRoaCAvSEUmpH0Nzl1nohK48EnH32MtSxP9L4G9tCejG8
	WAiB2+ovwgMHO46gZ81ZXKzV6l5P0xpmeskp2ZIKOiQcq4vRITbR3u3ZnzPxXDye
	z+gMYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so43538335ad.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455422; x=1787060222; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=Is2bFwEVOh98BYJTvaJFwbxcchJjt3YtVNwd5GzNBMk3pnsm4jvdTW44/rQn+/5A/p
         620pl/KM/JYdiRVbKGmH7fbikD3w8Q4CYQ3AM1mOb57rj+7WKidRRpY/JAWpfTdGAcI0
         prqRp1zlNAVIW/Dearhz6S3ozgFaoJd35ooNYN87cIAV2k+IjEfHdm6EifjVAdzWvdni
         G8Z5y362+gjS6Re46W1ixt7Z1BlLTKEwrNBQWf2DhWIa+Oqgbggod9xNEMK0ep9w0mfg
         yf7hHhnQyvaIdBSc1kAxbTiDMJoDRm1oDW9K0NcporndW4OjgF6EOuwtsC6+1d26/XwN
         +5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455422; x=1787060222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=ffVL6Xz3j9H5i8dAw/v3+V0/BU71zJNNDLWjwgEhSl692FAnkfxAiQw6t360Tsy5I8
         fTKF9ehWLskNItvPJp3ag1aKyLYxQ3i89xyXWOTMmLGiqDfRPC1Zxvb6yG4JVjHk+2eG
         yc368Bd2s1/vYQ7T6Vu0VAS2vUTErnDuFM78G9FZqq1SvRNJwi681neyz+8orQ+uk+FU
         rO9XgVYtODTals95r0FHQBJWqULy7t0OmtdmlfeGg7JZ8yqJes6+q6WT7EfeBX5SPH9p
         AarNkA9j3YRMuDPUJYiy6GzP5abitjZJ2pgAw/yZ2UI+YFnzp1JEVKWlBZOoG5YTLP01
         vIhg==
X-Forwarded-Encrypted: i=1; AHgh+RrTF9DikcY7PGLQe2PYJygyDWpmiubWbvLZBOsn/rY0sGFa61LJ/DnU+AM+xkPgwZensWvodNO6NT5YAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH9LO+n4rYptMcfTYI9LAAbQytgASHXRVWqW1LtQdk8ziq9GUQ
	Z6WY6sQZy5SnAoa0L3i4IhbpFZK4paZib4+Bg6I+sp0AxuLF3QcsfKbJ1Q0S1Lr1vn+MtHTVqZk
	S6ViDoEeiZ0g0qeqUDXu4P1r/u2zxdxg6A0akfCZPzCT5DGHIu67H/IQjPKIqkruogQ==
X-Gm-Gg: AR+sD10xFO2tebXOtRNmJm/94fYljMY+Ht4Pf3sK+K2IEkLyJkVBfqg/03Ogi98YzaU
	FPXXKESAKvGnxzlpS1OBwfhJ+/GAyAmuPQHGHSk4n6okVEZlOu1LWxvzJCTaXeLGZnoCjP5IvBL
	vxVmLU2totaynphOOmpiisFCnmz+Dyvy00d8Pt9sq9z0vGqn+871RWrhG2VvqA0P13l+kHJrPza
	4AGf1k3FScqKtwx80Q2TE5YUd8FXZowJQ9som/0UYYLL4xao4lhJ50SPJ1beEzGSwHCmKikcJ8W
	iqT6XEXZ6DFWVKELNTI+9ZWzQQFwXGomyM+p9H169M7En35WYQhcof9PWjXCDPtx9NDnGr33wxZ
	WhvdiGwpLn66l8w2ht7bHtD4JAj+2jHDQgMqfYguSG7TVnwpDmjG5tXxU
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43082225ad.9.1786455421570;
        Tue, 11 Aug 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43081055ad.9.1786455420948;
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:36 +0800
Subject: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455323; l=929;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
 b=s84p4P01mgVVR1o4H7MeEiKLbGr93oPLw4xXM6u0g3VS553DL2JR22LNajgYTtWXmfoJpDtj5
 xOTAS8ZQOGyD7Jsl8Seq3hYMSptmsxxLVB2XtBcIikPS2DCj/3HFOD0
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXysNkAwXggrKA
 6kz0512KfFjoPg8fhYCkwfA8IXBUiQYxP6vA77TidlDY+/GE7qUsapS2VNa7dPo/2kjsmX/LW89
 QnDLiEKjHpb7AcHweTi16nGgiEUF0Rw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX12iiB3s4flGe
 AqvTB/m6Gu4rflNrv9LDdL1xngioqf4y3shdDy+J2xM2deh5Qu3s+8GmK/NBAg6s4A0Q8SXUqno
 OtzRTUCc87HQ9cku5GYRz+t9MY/cxfInESoHnwLwzDM2wri+OIHuaypWp39wB677/Xp0xjqtN+1
 zIBlszTlyDzMauKIgtSPPdNiMC7ChCvBhnrdX0rlnaw2fnDPrqI6bYwTl259D8HIivoKYdNtX+o
 gU8ykDgiMTeRwzE06m26gPTQD936N8STQYvV/LohdsPmjLnxOYmZL5lyckRh7s46gMlsANInizZ
 dQzdc3zuIIx9JNdaLmIlbkki5RbMeSj+/7hDmZ9XLvRQnOFprMyWZJGcAyjAKUDSH/j98Rn68oB
 EqHUTT9V0cbna1spK5nSqYLF9B92OEAEMx01D50xWNLvPuPuXlIwJaDRAzO9cttanaImGUP6RFc
 MIBHWwAULB+BBAhBJvw==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b257f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tscwNbPNHAv0RIyyFlgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JyP5egouTDBQCRHQV4hPmatoSBDb6AP7
X-Proofpoint-GUID: JyP5egouTDBQCRHQV4hPmatoSBDb6AP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index ddc15249ec1e..cc9fa1d78925 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

