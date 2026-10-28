Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188060;
	b=HhZGYMm/K0KNkLd8YvtXveIgM/vWKKxs+URjdiDmtHU2hWOBmDqFZe6YodK9dFmtmicU
	 TXl1GPp+VaAhUAsSw5xk/H4IrXDNkgtVKc7yXVFWG9wJRPH17ml3hYC7s64IbNL+TNss6
	 fUhtDbzMWfUXysdXshTMSahmLFyUkmXr2uuKZulbQtODCaT4wj4zOJZCbzukmUbCNPp8J
	 0GvYi3pSxERsFawOyIwME36hKDjeTYExxEpwGT8CDqIsl4E3qQVpeO4XOB2dKSPpLERym
	 sVi3MZPkfiehQtIDRNwHVw2Oxywn+x4RXjcjNKQRLbgOWfNOxtT+HymbbUA5zfrWMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=;
	b=QG/kHKGna/WB89I0APDfSVwwCx7aDWI7V3bwto8JWodbv4jquivTfU3C8CIqxX6ZXFv9
	 yWvSFgRt9Ikn1M6KRSj/2LFw6hfq0PPoANNshMkFCHSMvuyAhC2nSgBOlXf4HeZ1uawkd
	 gECperYEFMFh3UryqXW1FMx8cLvfJ9vbmBGzfxUpB9Hl6CEXBJMp+1q0H6tiUpuYC6Avl
	 3rMzaLl6bgnlzOvM/IfK0QZwZdYEjIgRdMzgy9LjGy14K/tZTYiUNUMKangRGfuQXD7KJ
	 og0ujniYRtFJos0a8hjpxXnNJE2Ifze2OAJNTeToika0Wz2/go+JbAtG4LrjPbleU2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKTUYAx5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMxiy52E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC43606A32A
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKTUYAx5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMxiy52E
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeDJp2082734
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oTRZog1W0kVUlnt0eMjHj8
	jyDlXn7iZFi9ARBq8uKVw=; b=oKTUYAx5YsUyPWrcDOxB8VKpbu/Zdb/STd5uLP
	poDAyMcuzJqWeHzTnKTJspnUGidC5pOUEqGa5gMMcJkFBP32BD4ZmmHFGfBK+YYI
	ss23Oc2Ggzn/q79T6ZkpOFqAf0RSt5iha5Q7cF8l+EBxPh4juzlr8Ai4nLd1Tbbi
	Efa8WcPZS+CyknuxfGGMsSRn3SJvo/8+HKptEzu3a6oIZLGAUIIco6uur7rZFy1e
	jYmV0RWndXTkz6U75er8buEfKOIhqV9KcmRrpj6Yj4ekBkM5cnFmNVrAZdHY0Th9
	6VDTJlHmksxqTfwHAsP76YArSLtUiN2v9RCQhYlQaoUJLHOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjputn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so784939a91.2
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188058; x=1793792858; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=;
        b=eMxiy52EqQ2P2o384lCnjQLz8QxbAkJPqimRP465XbbMbiJXKvoC4P0K2vpmReSp+1
         GNpIwRklTEoWbV0KhLyvq/krBddRmWYAFkqD/sbBbAeK4kJxwL2vXu0+4fbwT9stdycG
         qqEyZJ3gUZwXx0h8Lb6UUpYAwwfuPIMrKc7M6XO/VUqwB/jc6N3EzChsSjmT3wyHEszb
         /yD5wY2JpNo/CE56EdlUtMn0R0VG6odUUp061YWEHHgJY8U6hGC+qQEd2NQlhZnE9NDn
         Sa9b9ysNG6HZmxTPXfioMi7sjv8isQ43+PottCz3reNzmlh1U8rfC3jxY2y3N6Esfhc3
         hgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188058; x=1793792858;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=;
        b=fQkBd9vKyqN9CD91ylUdJlOaBHQxPOz71WKO01iOqz59AHYn7bXdZqFO2vMFExuWn9
         5ZKzLhgfbksh+l6vE901lDs/qoV3hVK3JYL20dDEw73dLnLnGfQERq7Rilir74O9wcK5
         0BJgLdKXxgadYSRZbPdPJw5J3Ke7rtv/zBnoZzs3jDHsd4hMi7QP8Ldxwkm3uxi3n4GE
         avlRcxCtZjbemxfpUh6GSt7EjUybcFy3mTB6xcUNtzY9irCn7RsUzg1yxUE2f9utKg/k
         n5Q44WfslCiG63PXqFC+OrjxLqPHEAYR4osAW6xirbPLJa0dSYHNxF2Nn2xvDq1maMCV
         WDuw==
X-Forwarded-Encrypted: i=1; AKwUvBy9tZeu2KHqzkxAMFHqUtl2AnXjpVD3fQegDBiqqqbPOO6WAKeh5Hhf4io/jdzgRO/bLw8BWigDyJEejA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+/H8ssSm61HiVL5cBkenyROJW0yEaLyLmPXFiPAVsZe9tQIO8
	Ssy+kSfVgPP9x0kBBEv9MoMIQp17uCB5+rKDe036bzXUbslTM234qmiB4zOhI62XLeVXS+qIJJ4
	q3FumUX5R2AwUVb8naVh3KLlGQB9rtxvaRnEGLTgcwEzHJjvJc+iThByJfdLy4i3Hlg==
X-Gm-Gg: AYBFou3E941N+ZfZ6IDQ8JeG1bmfJXk+Lmu25ZatUhLsNUdy3oRtptE+hl3cdOw+m/x
	8AL3VJvKeJEJqcKAD9scmCfkGcPRLGcG9QxKE1Vf5W8sfu1EWhVFeuzWcr+9LNqn44Ytzg15sy+
	0O91+ePBh+LfpWVIOuAY9gdJiaKdaKt0qnkA0ezARhZSAul+vbS7xRwZq8dvGftKYL3phwLFjeo
	YwXnKaXad9SM+DCDBICOX6PhiboeoAvIG/YkfX0K6U5soJ38J3UqETQjNbC/G6YnxBnow+JQlxV
	gopLfEq1gMwf8ui9hJVpW13DbtPR3rdHSwZ7h2/Cu8fZBCbnkaLjFAnVMqRhXA1J0cLnk/Q138L
	PaevOnlGRelA1EDnvHOGfr2AOZNa8//BE1t8H95pi6+a7yjlDjyiRSQL/+EiDenYzxHjBAPOhgG
	47d6R0+ILyaPgATe2LBeJgkODD16f2
X-Received: by 2002:a17:90b:46:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3ae5824195amr1544074a91.59.1793188057834;
        Wed, 28 Oct 2026 04:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3ae5824195amr1544019a91.59.1793188057285;
        Wed, 28 Oct 2026 04:47:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:36 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Wed, 28 Oct 2026 19:45:40 +0800
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG7g4WoC/33NTU7DMBCG4atUXuPK/41ZcQ/EwnYm1NDExuNEo
 Cp3x2kl2EA2I33S6HmvBKFEQPJ4uJICS8SYpjbUw4GEs5tegca+bSKYMOwkOR2zG2kBDLVcaF/
 p+5QpzjmnUmngug9BOuVsR5qQCwzx86Y/v9w3zv4NQt3I7eMcsabydcsvfPu7lzq+X1o4ZRSck
 fbkwfXaPiXE48fsLiGN47EdsgUX8UtarvZJ0Ug/GKO092Iw+h9S/pCcsW6flI2UmlsThFfSD3+
 Q67p+A5CpaoaFAQAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188042; l=6430;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=gXJ2/d3OTcX+aSWArZnGPSQLM1rYFhxCK9CnoTgH7gM=;
 b=iR4QarYGhjfQ3RvWKyd98W/aRgOpf+uRlESlrJKRESx/NzzxuHxqdS2xXLz64gm/T76FXFwzm
 fD0w2wFvPYRB1RskulgaVc/9T/a/5RGppIHARSWAVfw9/maa0YBF3Hg
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX9TZzxYGoY1UU
 FILdU3LZrloYSmUUGKR/1PUw7dXnmKGnkL39MQNBFuNXTan5/w715luk3/KB25vxnDfQliLBv7m
 AAwZlQjI31ghck5QRYudxVpvHPNL5+TXlSO/2NCOS6XO3X3w7QNjeW/ZDb5V+pGU9We11objM2A
 vuK+OSF/6gUCfClperG0EJcGUyOx7C6a+bxx2xF58ay67qouMVD4vKOkJ386v+js3z3wdERByr3
 O6jnf1i43RTBAyCNS0VqTHwCj9HL9w5/33SWAgrzivXp63iN5+wmSmcTEuAjvgR9ZOcZYWdZzhS
 Smq+woU6gbL8lazWGEUXMA4vHoIEHEf6XAlc3NcMgG185eCa/E6H0r+qz1ZnuccKckRS82jlyM+
 1/9LgJFMrwNrURRrFlNMRve0CuOVpvLyO9ndL5E2CYfjVEp1nADq8bM6xJbpvddoNNtoj9x9RDg
 +jVu6QslOLzFhuKN1ZQ==
X-Proofpoint-ORIG-GUID: U9WkWoInfOG4B9al3TAI-zZQhglXuss_
X-Proofpoint-GUID: U9WkWoInfOG4B9al3TAI-zZQhglXuss_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX8p3e4reWmchO
 pzVwTBeJ9I8fM5SmZOQG/X4+pX59TUEcOVfOKhgQTSArWUdiaK+C4gJhlp/bss45iTuLdUcyJJf
 JC+MXzDCU++5/0gwGGcsoHAh5whOLRY=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e0da cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=663aHFS58uk1Hu7jYysA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse and Rob Herring,
with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. The MSC
register size is 0x2000, as the Kaanapali platform implements MPAM
registers up to offset 0x1FFF (permitted when MPAMCFG_MBW_PBM is not
implemented). It is included as a reference for other platform DT
authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes since RFC v2:
  - Fold the binding schema/example fixes into the binding patch.
  - Fold the foundling MSC fix into the DT support patch; remove the
    unnecessary parent cache availability check from
    mpam_dt_create_foundling_msc() to keep it consistent with
    mpam_dt_count_msc().
  - Remove the #ifdef CONFIG_OF guard around the cache_of_calculate_id()
    prototype in cacheinfo.h.
  - Remove the [Yin Li:] annotation from the cacheinfo patch.
  - Rebase onto next-20260918.

Changes since RFC v1:
  - Fold fixes to inherited patches into their respective patches with
    [Yin Li: ...] annotations, as requested by Ben and Andre.
  - Move the RIS index range-check and MSC MMIO window size fixes to the
    front as standalone fixes with Fixes: tags.
  - MSC MMIO window size: genuine off-by-one fix; the ">" bounds checks
    include the access width and are kept as-is.
  - ris_idx: validate range after of_property_read_reg() and keep u8
    downstream, instead of widening the call chain to u64.
  - cache-id sentinel: keep ~0U notation, leave cacheinfo.c unchanged,
    replace unsigned long with u32.
  - Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
    variables from unsigned long to u32.
  - Fold the device_node refcount fix (of_node_get()), reviewed by Andre
    Przywara in RFC v1, into the DT support and memory-controller MSC
    patches.
  - Drop the "clear mask on error" patch.

Previous versions (RFC):
  v3: https://lore.kernel.org/all/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com/
  RFC v2: https://lore.kernel.org/all/20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com/
  RFC v1: https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com/

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
Changes in v4:
  - Reduce binding to minimal set covering only properties in current
    use: remove RIS child node support, memory controller support,
    arm,mpam-device, cpus and interrupt-names.
  - Drop memory controller MSC patch (no concrete platform user).
  - Drop RIS accessibility patch (no concrete platform user).
  - Update DNM Kaanapali DTS: fix node names, compatible, ranges/reg
    format; use 0x2000 register size reflecting platform implementation.
  - Rebase onto next-20261014.
  - Link to v3: https://patch.msgid.link/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Yin Li (3):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      |  52 +++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  52 ++++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 254 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   1 +
 6 files changed, 341 insertions(+), 37 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

