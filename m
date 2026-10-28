Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188069;
	b=4XV4RsGARktV5Rg1qzjmGgARTLkwneDgVoMFIUUoWvuTywILa4ZnumASePuwQQpIv+PJ
	 KrafvvAIH5rL/HbvWXOJJtfYbIqyIm9JFtAUDjGddKEqyQBVHVeoy4Ixc3UAt6wtSTysb
	 PBfLC6/UYLl1R3QxIA0r7QzrgxOF3G2XVMHHBYsJ26uO0Z9hABQAg9NgmKco5CHVRxjLG
	 gZVKsSyXv2FTX1QvQrwsRslm++h4gJA+k6/JN1IqRIR7NvPmLTERTY+6dzgUU2LPEAtLZ
	 i4lT555Nfz8lutA2coyOH3qEIKh2Brqfrwo0fan9usy9AF+8jtNqmCKk7dhIXwCEc1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
	b=LVX+hvyr89DSupBqetVUUEZmBxLvQSF+UbRPR8L2+48TtSyrio8HbdRNrBUUuzCYIljP
	 k3baIVkoxgJnLQcASnpDbbQBBOJjPgcpef5fpw/z33tHvNIP7wDc0zkBg5QO/ermTYEJR
	 HLyy3rV0Gf7ec1IHo2Wcyqcl4+r8j5hoTN465cI0JsNOfn+J/VTyEEt7olzxc5zisyWtF
	 DzXlcsSiBS3uLSDM7LwjCP+RmP5Wpp2VPJRnrGsxR8BJtj8IjSM3yjYuP11twrEn/rPL0
	 p+PNxKr9GohYyeDEAD1lzdUw4hFCx6dsJ0xI/VLZD8YY0AYZCYTnJ9PURui7xl+7WtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9uDQ1HU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BB606A321
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A69BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9uDQ1HU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3P3994580
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=TRk+cJvThlrWvgUv
	rRTBz/Rw9AnzGLidu6z08uAbGk4UazAMri/Q/nTdPIfPe8hV0fBdjTKHzWdOUvA6
	SPNn8xzWgw3TVcz50heEgFer+p8rWas3ePyTTEaALZcRh96qm18UZtAmeWtpetOj
	qSWsXZ6ChUZzvjZ5yLXCh3NOf0RQLMQ9kiaU2NqANrRxLVaNjTYKx7PA0Tpr2c5Z
	4N6mrIVMPeA8iZuMvRQIenS6aV+kplnji6LuVS1Cp7UvxiCA76TrEjjalPZ/0wBC
	ojdt6StbSSxUMu4YI6olw05K347k+YDd0+zZ3W9OY5+Ze654i10JQqdhCqR+H43F
	hG95iQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsve9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so6979985ad.3
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188067; x=1793792867; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=i9uDQ1HUPJ9Zt3DcbUXcLkqfy43lvfgMcpEg7f9bdim+LTzRTf2H6SIEPoukJKAZV1
         u4YgBBb+CGzESYZbfGKbheEpHzuIYYkTrL7XfxsnTmhKnNHBoC69Rr+CZyM3ifBiQdmU
         AIfnV4X8CUm/Chmhkwa6gzMQlXz+xQ25Z7GaoJ3Vv9/aHE1/N+rj1edSjRRF4qGV86HQ
         iJBIwY9fQP0M7L4sr1hFzmnpaRPaxsNyiByUADp6d+J3YTGssvx9CVkgJ33TB9A53uje
         jNMn2LlqLHeJC+8pKkg43zjP4O/OXMZ2t8f/Bk+guIrDjOtcTsxP5wPCoSRcGnHpvLqs
         Zktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188067; x=1793792867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=ITqSkB2GXNA9l4vcSrR80DlupIUWYyLkgASuprxVRS9SC10jttrLzy8D0lkBN7RDox
         p6jFcAQFpmuZE5T16TUkfE52j04llBQv2Pv/uvIbnsfjYJcn/gIfyaEyWPQI3ikVoVRw
         p45v5nHiuw3efFK25hmUC4a1U+M6crJtR/ur7uYmkmh/hVtD2OU0jPtJ3zUDeTJ0L/OR
         VE+Wuj9utcgpbreHCtTxrcfbs1DAWpN/S00UXQJtYl8Zoid6m06WdTdoVRdEfOUiaq8v
         QoBVRKWmD82GqamUrQpzDOCH2lbhPlj5SjsnvndvsinxpL1KMW0VWa3/GgTQMN/oQeNM
         9Q+w==
X-Forwarded-Encrypted: i=1; AKwUvByFPtdPMvO+Trulhs9CCeC6HrNu4988I59iHIikZ4v7AFdQlWOXa9P+VSDz+IH+318ojj/AQvSwZzMM6w==@lists.linux.dev
X-Gm-Message-State: AFq9FYI9v47YS8qyYeMuqIElyl86iQwfVOuAscYLZDCZj2c2qVstuQ/V
	bfzv7fJ07ARNRO+/ip527AO1GBSyoUE7KKweJf1yghgMkaU5cNNcUlN+XrBVy7rS1JfA5I5jNf6
	weSGZlgOjUKHm8Q0SX1P00B5BJyUFg0RW5ZittCGZDzOtH1LZqBp2nwOeJ0fbq8qdzA==
X-Gm-Gg: AYBFou14pxuLXyrd/5qP9TkDWCI8aSaglVu1Gv6LBYpoRBTJuKwJj5wfJ18YkM+U4xP
	bTMl/k4RFdovxZUleAY8nRMayZ1ZXQVSNJu/Oh2EHRkOYa21Vv8RGtiajNKh5HQSGbelBKlqZac
	ucEKEXs4BuqWlK0PAYruQcHacbWdO4NWid3oJfcF25UV+UocRSOtQzhERXFnXqw2zVtPTqlOXBr
	niNU2cxB/EMTrpBLh7q1Q9O1u17Ri0vZ9A8+rFQGa0u1IuTP4h7Qjg20t96B4sZnPI+vTzRL93b
	mkpN65A6lyTgEOkSqSekBMPHptkV2X5G+11XNogwEWtqFNklLWEh6GVgu7gczNR17RHZhDVBgJb
	l5ZQ9IwJx+sn1202w3zlfLnipW2IUeHxtE+PDVa9seB7nD6+9Mv/QsVJDV+K5JWiZqW0DLqrqNG
	tcQJSvSTvPrQy7LffChOBHBiee30fc
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458465ad.59.1793188066543;
        Wed, 28 Oct 2026 04:47:46 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458135ad.59.1793188065798;
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:41 +0800
Subject: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188043; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Fdpc/cwPO/s0yoI6hre67PeGTToBFG3hV8kaAFSlrjU=;
 b=UXyHBEaTAEOkqMTuwB7THPKdjj01ssGYxm/IfpMHdxA7r668oZktRwEdGTTMV42sxolaMW+xY
 FtJ+bPI8nSvAFSvvjAcwSSuLrsk3Jwr1Ce18R83ntKIzfGc9iWxpMzn
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 5KPHRmDYTshxvYOitzldpz_km-w8-Kyf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+3d0lD/XbU4n
 nA1tHoqbtNAe7TwlHHxkzhNts0MlaoJn5kwLtUhDHTm22gFsUDGv7Z+pUnBy7YL5tV1NjgVMQH9
 XujYLDhVvtewjQR+EbYGNM4ffZPxwgE=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1e0e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 5KPHRmDYTshxvYOitzldpz_km-w8-Kyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX5JPqOTeEsIk4
 8KgE5wRyFxBc3Ui6atYEDnhSLQJ4887sss/u/DExXg/klYIglMc1ermbNcmSK+lxzw2BjJK/r0S
 CDnOj/2dU5ELcKhshaPnehu5xnoUo24kOrmc0avaB+XPxrKiPIoXCS8QGNyotAAFMYYd+UMiRCI
 Yncnv3C/oQ6muMrx6zIFAdeQXMh6yK4Xj0WZDBRja0NyMgB9990kqySi+eej1d61Elr8lZwSnPm
 Vx7uk0KUZxY7ZRcvCv4Fu1LT+50ZUcJen92ozETnifBTrRDcxTDvXjZSSZzU7n7K1b8uZ4wLErx
 G5rYeT9vf5kU0e0o3bbqdzLscPqIIonW4O+0KfALRwhgRPAKQH1Wq0idqmgXrbQt1WQTMXuANa7
 yL0f4mKZHYXSuD70KBbgiXr27ak3dVVnaZ9T5VH8cyOT8ZEj1295zkl9oVLUKjzlPyQh+g9Eccd
 Npx7Urq8Vi6fstQIv8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

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
index 48adc49b833c..347a5a6d6a1d 100644
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

