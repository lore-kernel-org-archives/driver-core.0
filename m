Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218842;
	b=RUcWpJR2f+UkpRUljwlPePEHEdUimdn7LEpbqpyUAeNpUOTwdIZQ2t/G4ObEo0+JKJkG
	 bU8Tw9ifuuLC2qDHr7XE6pwuvfhLDKqEp+1Z7sNuaXWFrIs6ONmcDgQoJPBaxpntV0Iv4
	 pkP7XQ/mTywNzR/wuIGicwrEt+UUcIpqGQKt5t1UiTKAFH9rhFp/cPtbtGwU9Ki2ItaVW
	 CsmaLeeIM3r7WgB4eo0qKY/z9UfOAoJ2/HdQYxpiygRmDmdTY/UDI4oKcPb6UuHwJ2cM1
	 QrcxFwpBmjV0SOWQCm0wVKCsbco0jrkNzOhpQFssE0zMpLKj9+7NR8xhUwE785MEsLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
	b=oUaaEW5juy/meRctByhNhqmkrTCD2kSfQ1cZ6C4rdCtyUq6RutWQugnDNmZT6sL/Rs5K
	 zQrlOASkKhYlI91xJS0KThIC6ZZLe1QiE3nH2TiGBYUXZV2PG8KB+84VaUV6406X18bMq
	 3CGrV1d4UlPRbTOGAUzPJAtK1PiCVUDKygE2H//B3zrwADPCiWd8vMHcL/99UQOhvZPSV
	 INtCa3Wc8op5HvwsyhhSHF9Rpb64qlX59kI0m9JpTJGhzphEYLkwNuZlzruO/IFOXLNq5
	 8D5b7F+m1XZxiGFIatM4YCmgBcdIqeJZmsp2uHh4l2oUNDkfil4FEutTWgKgNG0+gvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a9of3/qL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ktylcmjA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9002606A339
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9002606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9of3/qL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ktylcmjA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uhtA4130803
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=; b=a9of3/qL/4+MO8WB
	lGHMVmTU62rb7WextgOeaYfECVNulD+JxEQXiv2o+3WOcNDeConh4zHrNfl3wtP1
	dmEnFp9YlHwyAZ40/tqS8Zkb+FYvJ/SVdmXTQH4q15PvZ/t8MYHf45rhiN1JB//c
	AJ9xFAQaPE+q29gR6sjkoBSwTyvu9b7EtbGHTDxqvTdkviR5SJ4yMPYRV2ZuwxCG
	UveAyYACnh2FZJePJhAHvhUOVNOXqWIcYv0/DjUa+tfz0eAnQTqcESlF3giJ5pOa
	+Y4BucgJ2WmW0NgK+P9xS36u43OYJZqgjm6bdT6twduSjkB5yHQyQUOBuacZlZ20
	BbSGMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h5rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:07:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so708571a91.0
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218840; x=1794823640; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=ktylcmjAVjJhGc3SYmLdphxLSSgUKALQrUD91jM1nrQSxP88Pw8DR7fO5WbJt7aC67
         jd6WaP0QuV5Ya3RRz6viabx8NiaaEATFo0z+c1m03EaMdkWPBKPbkPAdQRoqEaNXXwWi
         KF6ms5EVK+T881/9ineVD3Sgp4K3TWBbdVq4l5HAbQ0I1mCxY31Y8aQThyc4BrnDJXmz
         NJCzWdEL0iV8IAc5CDxYDb5SH93PX1aRsj6oBFj4fkuITVjnsD+ZYN49itlxHWxqmV4Z
         2bnyHZiFT1xWVnnO1dFKRma1heUqMFrSmbF0KG6ODQXbBXvUEXCxFut1Rp0iBfmDK3ff
         q3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218840; x=1794823640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=FPwDVcoxc9CCoEYuUxZjgcZEJE43PGC4MHhJL6mcR0uV3/gGidDEcMITts+xYlx1nm
         SXfGumxUduC3HP0N3NITwi/RXNZlPKDJpekReXmfLdWkZaEdmcJL3Ie55zdTwZ+g5CQD
         +jiHxcd3VHgGP7DvIEegO+S9ol2yh1GWRez0vMRtlAiewQRxWsug0wRF5bKzDMHOJlVl
         Lssnd5gqZCKZXGfmeMnY9/xtdIOMZ03zWj8put0gwmkfyG6J//G73b//iK6/xzs9RBeT
         9kB8eHehwHLRUyePxVipbquIbkHtsjg4GUnBaxpfT7/nLH5e3XhzekfukeSCqepEgjUs
         mKvQ==
X-Forwarded-Encrypted: i=1; AL+hErEbPUx/StRGiwMJ/KvUu1savPhNFGqm+9++N8Byuh/ixbG7eoBQHxAArkkzn6lBRH61qndAWBVJQzouqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+db83oB2l/K0WmEqp9Ni+AI3a+/hHTcOqXARWT3gK88BHLYgKm
	A8Cdd1vt8tyOMxFGUvJvtyg7GHvbkAP+xVLHbTh9jRROp+EQFGflCtxW6LD5ICXm0J19P8SPG79
	ngnNAChojggTzBwfQhsVK8agS8mV7QrwIwcO7e0bTMCr9RNvFjD8aN88DGjGN7fF2aA==
X-Gm-Gg: AYBFou3k6FwNNkdbI8rikLPVV+BT2cfYDKakigQPIj4R4KFeB8oXWwXTYYasbx+e5Iu
	pcS9FZ9uD/hx7RkS4k72NSx7j1WB0DVGQtOc0sjPHTX3OHx6lnCQREwicqixuvR8r5ZPGqOW+Nb
	h6Fjuh5FjVgcYG4yELjb0YpHUxbLt82K09GMtG4KXJKAlqU04CXHK3/sJG/7vfOQMhp2JJ00Eik
	htMagHXWKvck/iUCZ44k/dU3IwZxP9noZvqPILek7Fr59RCYpKOuMAvvtqc+9wRyVVs/NfwIckQ
	CNIXNidBeqcQAgU53M1BQei6gWGkw6p88gn/KLWDPj3eXlZADgaRgDX5XYFfoJf5eOy6f47Plj/
	ehArSHeH6PAoqtgB/aJOLGfBtm/5ZjB2KNfsPYxHKOH2i3xtOgMgwMEjUMGo8ere0+ZBg5SGmAZ
	fW/jRiHXwBrh2sgNGdmFxZFIt/AYdh
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526906a91.32.1794218839554;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526877a91.32.1794218839087;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:33 +0800
Subject: [PATCH v5 1/7] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-1-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218813; l=1221;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=dTfzizx2O8pIWKkNOZ5/tj+tagXJPodOMUlPeZeSs18=;
 b=WY70CK6+b3HD6F8igEKO8LA8i7n1vIrZlsEcst/OXcFuilQ4b/kjdatXb+vwpsWJnrgAaH+bu
 vPCzTswnJ9zAht0xJL7Sy2MaO2ckK12jMWNndpRwzyY4PojyLFaYyPH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af19b58 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXyVTYp8WZbLI9
 lh28zHuDWg925sZie1fXaUKmseAgBKXa/s+SgJOxV2uF+2Sxekw/5qCGJfQIn8Ma9dtLr7e/2HL
 n3uRsLP8rj1dXNNxzUsOFYuSKtt3Xzu1AHLylUzJi8YDaBd02Yr+gO0x854pCwfvzUk1+B92rwA
 fZfdcoJGUS5D5G7JRznisyvT/IT22OM/1yqx9tOVnaVVkHIjlT2BEY0Fo65b2pnB3ondHfrMaSG
 LfDXCSeQ3+nhLRBjgxgHZTc1E6sHZovHkjndgch0+avGxSTbLd241+Bi2vKwnJLjcBaGmspagjA
 B9YN3tlqME2+SxCrolI0MmY99IXwVIjlOBg4o5p5FrgH9+n+aVY9DleHESAQToNgIEGjfCjEACx
 qlIg4qxni40JGdhbeimyztCVK+9oZts0s88MLhwAIVxTGJiDTRWrPHr5eXIi+tccI2IRFPPDy1Q
 cwDr+07obPkKFRBEmaA==
X-Proofpoint-GUID: BS2jY2vvXpj65rRC_31dBHWhKkPttAKz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX8j+qXwo1YoUN
 eFmIBP6Rywu0vw343KoLVdYoFK2jj9pAEWHqRY6f1Pp42i9jCVmw3jJWLe3vjnF4QerUj+ZxAZh
 5CA0uBRTKRjgj4iLKZoK3+MLy4x4pwo=
X-Proofpoint-ORIG-GUID: BS2jY2vvXpj65rRC_31dBHWhKkPttAKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Cc: stable@vger.kernel.org
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..05f785328dc2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

