Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DF414DE0
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455446; cv=none; b=A8jtqPjWtZUEqq9AjoWV/5tjRVHkPI/9IHFcYM63BZle7azr0ba96AuG4upWPXLrMK1A6EoMw0lknsoQ12/q9sUKvdQWSim5v5R1uFHZF7FOrLSeiBHqJGTKm1xnMJ/bucmRZtWQ3m7wQ/zuV/1i/WFSyst8A6mJUboL0a1LD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455446; c=relaxed/simple;
	bh=xEGu9ankifD+51CN5DkNsTxhHVikQCAqtYX1v27lJqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1kv4R4th1hRk6wyj0Ki26lyCxHFf0ZWCHYjwDLuv1lTYXErSVsrkvmUgXrmE4jXrgwnetTuJeu+2yj3Yxv17QvqB8D+OqbRdZOne5O7L6F9D1C3B5LbWR3kqOwbusMcom6VXZgqYprygtb+WWzkzRa1piLKOAvPQpeZp8KiF6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXs+g/RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/5Q2N4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXs+g/RR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/5Q2N4Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWhvG1317156
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=; b=PXs+g/RRULrKwZZG
	d7ZgXDcF0l3iHt+d7EDni4L/e/2JpumneCwNj0TMJBdWWEi5BN/oKMVyPGrXrE9X
	a5tp/fP3+ZEG7AN5cq0zkwU9lgR4bH4SnC+9NY9UR8n0twe1O1cffPdLL4EqyRWA
	3boEBTxgLnUcUVMJYChdnftmVtWOErOyrMRVtMliAhfdYB9fACjJ+mAFQx5Qvg4G
	ydnmRmCwuV5m9KNd/b+Z7fSrSZ0s8AH9iyNS6BEAqBJqsrA93ENF9+JLeYuQReBD
	WcCCOh+KZjmRmbWu468XaB4Xxtzf36cZDSAHSRpo0Aw9WaPU0Eve7MKTGxgAIDdl
	wkCuZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2ycs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so66308035ad.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455428; x=1787060228; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=;
        b=H/5Q2N4Quer9irrU2DVopJsZukp8tRADUfXbp1+dE9iR4cB0gXJWeLoleyvrEKRdLA
         1DLplJ7M45/tSGqPgXDy8MVejqNBdysxTH9vOmcLOXLjAOVSPh/WT0ZmRDKlBDUe0VzY
         Te9s+MIbrZxaw2OYd2oacvQZN7GDa/ieInfkJ+Fx9QbwXVobjo8vxiFK+PbBaPYqm4Hb
         GI8QvSisS0amlAK1Xc9krmOwudI2PqystP+Ijb2M9Ob/nmf8WbjRHJInwHEBvticlpsD
         6lk0719vmns+usb420JKDmERCbX+MUzNWA6FVfVMOLJf/y5BwECLUopZZ/vL6H5KthJh
         t5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455428; x=1787060228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=;
        b=rptMdUiSxDlA/V4CAhyuvdZFgodTEURNLklibTvVul2Y5VWzgg263E9YAP6WegNGO+
         q8o13SgTpxD14IIlIDFlgYr8XjVv3mDc5W8ZRLRHPjBCCZUh/st58VmHuqFZ12+HQ7Qj
         MReQltMojzDR68lz6kPITOqcnK98ReVWFWqQsGmZ7UoMaCnrNtwCe8q/ygHCzKdImtsE
         8mvH9l/17VCAz2kuyToSUCZazGGAaXUC6DVVBfKgro0sB9LCIaAh24bums/YjQVNkP4o
         W5RZR3bhTkQ7gUs0AMnEA7uIb5gP9oi8MAsXdByEfUAwBUvFAVJgbSrIK0a9CysW8aG1
         PWrw==
X-Forwarded-Encrypted: i=1; AHgh+RoV9E59qWlkWg4VRp6HUcghTnDzSZ2vJre8p//K9rMnV5JkmXRImRjGVX9ZgabyParF2GsDVVyHmxkUAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLyai0X1Q2NsRaVnxwfPdll7wEJlDpKDEgX5/g0LZgFkVTRcJo
	KoUzJ6z63hXsBNx//JxRkubAj2b7c4ZBRSEsv8scWLXEgWIBGjOU7k/4oNugOjZALQY201+ovU5
	8+71B0qCy3cYF+EfL4tpIGqV28f+NFvt0gGKf+med6px9K5SDiIjoXznRI5XIzKPfhw==
X-Gm-Gg: AR+sD10mKR7f20PigU8wYC4bKFlPgma1GxLTslOQjg63nsheG/SfiydIZ9ZBdtft77s
	h4eZ57tyagEZyW29ksWekXdL+ROyPcEOho51ge+FZHIBUBXpDbIyiFWxAzXQ5SYJ/fzjqGByyXC
	gSLufehIQUBWQwSZmCyPMON1V4Tq5EI3zc7tkVxqRqK1sRBa+TPjhLAGmtbe1ubAc+pKl/Kxizf
	ngHB5lbmOahBCanI3opxix8pSpWgv0WqxkylsrYF3AaQd0bE/Qw9Wq2p+js4tQbnQaivOytU8/T
	bA45EyvLF/UeAX1bOKgbjl5tz4iHnI6MoyPoC73lyZrA58MLCVoAOF+/Kcx6ZsYwPOi9lsGpSbg
	KswybHZirJO3IGoEq0aforRyxn4V2UruILv6XAuowZs5xCEAfZFaz9mdM
X-Received: by 2002:a17:902:d488:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d3177a2163mr36650975ad.9.1786455427463;
        Tue, 11 Aug 2026 06:37:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d3177a2163mr36649955ad.9.1786455426911;
        Tue, 11 Aug 2026 06:37:06 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:06 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:37 +0800
Subject: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455324; l=2590;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=xEGu9ankifD+51CN5DkNsTxhHVikQCAqtYX1v27lJqY=;
 b=nLawrdlW8eg7uzFaMNdvW5wUFGrxG1csc7DJAkmCcYWAALdt1xSxw8ndGkGreUQ6JwQGXjnFV
 FMqi1xwnc4hCwd91Lul5ZOg48Ruv5gC/Vsbf+ko/OYehp0AqtDClXhP
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX7zitrMg4ZJss
 HTQGqo09UZj8/4rsLugDWPJAIIY8HAMUBQ8jgVTD4VokpT5HHXw8hy3UNxnhEegbDgYZFhr4fAN
 EUSHFEz1/0TTXznryVUELns0AqyhJ3uoEFQA777okiQbkMtNABrj2ilIZZ0QeCCvqMA8hR79p6X
 k7ffirYLlhooavH5naBHOYDYVxDhWihvkWd/p1pOgC1rkaGkAKnpOuq2aCXlgWqFr9HHbarSBTY
 CyVzdiwnfjhJsqmcjKHcwrTHHRkAl63mERKoD3RBCeF6zwYVlVyLEubAEkrgIJDq++meH6IZIi/
 mlWIHCDGvTp8km7Isv6XGcO+6lPg5dVc8KlLZvEZBolukkdFyVIE1G6ZsnACVgro58wWi7yAgyl
 iluLnkkDCnazQtWJj11/lkP2lsTyncrTD5zrIboRQR9m5G3k3m9Vipc66dY9g9J3r4Eb5nnbA/Q
 l0NuA57YUEfNRPPsSDg==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b2584 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6Dh_s6ggWNQJvp08L6kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX8/Q1CxJoKuc4
 SpqgfAQ3sNxLE6bLrphbWaHPxK6Xi1GltvONlEIRmGPgYivuQTGyLZf6OcdT7yd5yfE5tQ7H9qQ
 sRncc2jLB74zwefbiQhJhwHYm2kOqHQ=
X-Proofpoint-GUID: pbuAKdgk_kxzAJrxlVEERkfEbnw4yVcf
X-Proofpoint-ORIG-GUID: pbuAKdgk_kxzAJrxlVEERkfEbnw4yVcf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The RIS index is read from device tree as u64 via of_property_read_reg(),
but was narrowed to u32 when passed to mpam_dt_parse_resource() and
further to u8 when passed to mpam_ris_create(). A value exceeding
MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
passes the range check in mpam_ris_create_locked(), leading to incorrect
RIS creation.

Widen the ris_idx parameter through mpam_dt_parse_resource(),
mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
is preserved until the range check in mpam_ris_create_locked() rejects
out-of-range indices.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 6 +++---
 include/linux/arm_mpam.h       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cc9fa1d78925..1e082fb60e30 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
 }
 
 static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
-				  u32 ris_idx)
+				  u64 ris_idx)
 {
 	int err = 0;
 	u32 class_id = 0;
@@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 	return 0;
 }
 
-static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
+static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
 				  enum mpam_class_types type, u8 class_id,
 				  int component_id)
 {
@@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
 		mpam_vmsc_destroy(vmsc);
 }
 
-int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 		    enum mpam_class_types type, u8 class_id, int component_id)
 {
 	int err;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..30461cd71199 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) { return -EINVAL; }
 #endif
 
 #ifdef CONFIG_ARM64_MPAM_DRIVER
-int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 		    enum mpam_class_types type, u8 class_id, int component_id);
 #else
-static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 				  enum mpam_class_types type, u8 class_id,
 				  int component_id)
 {

-- 
2.34.1

