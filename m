Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575847126A
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856273; cv=none; b=XGTYmtDF1QYzI+c7rG9m1dL+XM97wA7zWR5xZnG5LO87yWnnnjwLYLf5fp7CHjYfqXFaiSvxL8sjwPVHZS6PjgQCxuqHqwb6E1awgv2N8quNbYMslpB+udTCzyGw3Ysx+VOTx9CDCXrVHlwfgR8xKyVF4oLzXouPIDRl8GM2N90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856273; c=relaxed/simple;
	bh=w3Tm7OSjd6BtYdmn4xqgUFu2yGZW5nk0fGhOdZ9Hfc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lg6TItl3K2k4dAT0z8g1vK9Ao1RbPKpU1KZWcFce5HG44+hz9LrLBxbY8MSCuOvrCskXq5z8oPk8z4CdmOWowdh2t3W4p2ccpfOANI98LDgaPbp21fKlAvqgBA88qdjHrERb8FNbIupUnTLgPWBVLrGYvHZxpe2EpaoPAEFl8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgOMcJBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq6WcPQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgOMcJBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq6WcPQR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LsE42154272
	for <driver-core@lists.linux.dev>; Tue, 8 Sep 2026 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sd8Q+d07StmL66OYNUcWRl
	yrdGIgjLRVfqZtsm6rMMs=; b=hgOMcJByVLz7w9JLC94BM9yOam9yjfqwWZ4yo+
	CJ9DtqfA1XHUkvznEmxJXTXxVCr3bvEXvmV9cZfo8YsDsU+7iOWJo3tkT4k0ZpAd
	C3nCfLLA55cw9djNl18F22ziD65eJCvW7ZZ4gzmknM06EO2aHeCiJlh5jh09/sYU
	k6yJ9LTxKCUBgmcS0KHk0pP4EuSMkEg5qXDnJrcqgrEHCRzxKx4RYukYQK57d4im
	eZppcJvgnVwCoAizo5EqzIQRE1NuXDv/RLlSGExEvrhagrhMclzh7vdP7wqrX7fd
	PfQvv91RzWY6dhIPGoYVfXt6JAx0oRBDddurbkyu15llhUeg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjg56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 08:31:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso6122694b6e.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856270; x=1789461070; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sd8Q+d07StmL66OYNUcWRlyrdGIgjLRVfqZtsm6rMMs=;
        b=Aq6WcPQRHp+2OMyg5KUjX/qcdHS/Ek6zamTSXP8MffZUP83+aj50sdFGfui5WFQWx+
         M2nG9UOyxtVaLDKFZyLFgKMXpV9CLPPJEuY5WKTjzV0N6PsU4zDkfD/OGxT8ErO9mN06
         MRGPWnc9UiWU/I3kaECAvMMpo3ZW/un2frIFoJvS2AsbZiE6ho4lxbPlHRiuL2vI/m3/
         mrd5oqj+KghzRJLynizoUWlcLNPQTUiGzAqKCAeMYlExI69bjmd9iJt/KtCF9lVGsRlc
         jmAICVYcHO5x3ovctAHGDrZZkiCezagEuONM3GzE0SbY6JhrKYBE3JcixnHrFQ5MQS5l
         sOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856270; x=1789461070;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sd8Q+d07StmL66OYNUcWRlyrdGIgjLRVfqZtsm6rMMs=;
        b=dzdjhwBXw0Tuw8oePyoWLaM/S0IM34ezH0aIfGp9KoFZdPrFdfhRxwUowiOhaLJ950
         Ceo+5mDV8BF1JeridsQGNzoHyJdxy2YaX1pOCqcG68Uy/UTSy355WmqFwO/mTvIcAq7w
         UGb5r9VHXFAqwjB+N1Z6ohsqya162IHVYrTptJ0UrHBCwy/ybWDRuDvrHEDR1cd7GP9Y
         +5D+glbkEOmfrDK4zmaw0VaeyP5XrG+tWpExybIn4ojt7LlAUQivWzOUy3UoHFIBwUS9
         g1A230UR8evL2VJMci/XCRbuknmyGkvYMm1r4MQ8qq1Fk1Fw45xrebeCaNtqlIv+cQaH
         8dsg==
X-Forwarded-Encrypted: i=1; AKwUvBzQbjTB2rI+R687iaNnGD1L2kmRHX6xB5KACixE+ckpsAOQpffeFHkcuq1V0nftfttyZ19AajSyqA+Wxw==@lists.linux.dev
X-Gm-Message-State: AFuF++mtriSqXyZE31X9lnMvGX0AxS4iSIpu50UxUfp73w7TyYpYMWEr
	q/I5g3C5Ct5dC3VGstvptunQ5MnYJv0LLkBfyMgJ8EyrO84cifZ7n9XwAEsgRnJTV71BqJaZOEG
	ItN2i/wOm3RpJZFPusJX4Fl0NFrX1FHx9/AH6Lo87djwW/z3Z/SoExtvNQ/lNiuzT4Gwlou7//Q
	==
X-Gm-Gg: AYBFou0X8tB76CcmCJOqj2BfsWtFc0DY62/K0ZQl/PSxqKNGLvtGj9SCru3WTCKT94a
	W6hub0OkKZPRdaB0LgOvXaX2Fda7qpVp7UKQI9sg1ZtZrT2CkVQ/73peqtuuvjpLmSrNB8SA+Am
	9lVx5rEy+yMyrEppYAa/U3HAp13W7lDR2PyWMK/OaqsnT1fItjy1utyFMFiru3BAJSzQMVeDRna
	C7cAu3YzY/ueT862sLuok7xgm6CWOqGmjllqK8tmn6vfgURLiDeSETX98IjSQBLUQ6NyLCpBiIB
	Tb2d4qqTqZeDeXTkLc2Yi0j2waZykMRYUkP8ywHybkN4zwWVhNLWAHHfHNkvmE+ND7xy2hwYM/O
	nKPBx5vV5uUjnjdqyA/y1PPBQCeCppbQ1PJH/WgA5/tqc5FEThHP8fHcgnqQuxC9ZLyxu1MUdGV
	VjVOu7qyGHF+ZSnRo=
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr16293422eaf.11.1788856270645;
        Tue, 08 Sep 2026 01:31:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr16293402eaf.11.1788856270222;
        Tue, 08 Sep 2026 01:31:10 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm34458641eec.27.2026.09.08.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:09 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Date: Tue, 08 Sep 2026 14:00:27 +0530
Message-Id: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPHn2oC/yXNywrCMBCF4Vcps3YgxFKDryIucpm0IyXRTCJK6
 bsbdfnB4T8bCBUmgfOwQaEnC+fUoQ8D+MWmmZBDN2ilJ2XUiOIXCq3yii5nqRgLPRol/8Y+Dyu
 nGQ1NLuqjOdnRQg/dC0V+/U4u17+luRv5+i3Dvn8ApIhJZ4YAAAA=
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788856266; l=2472;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=w3Tm7OSjd6BtYdmn4xqgUFu2yGZW5nk0fGhOdZ9Hfc8=;
 b=tGBCDRsP0wtfdqur9nI0GMrBbRReTMEqqzZWSEV8y3A5wEF0lqrSdsIqA07dSz1q8JJEsw6UN
 aOY+0FIGvGxC2beU6qunsJAFeonkty7SXl45FNPxD4SoBM6mdEQ05mk
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc7cf cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d1n3edTyWCSArfnwSPcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX2UYD2x56Skag
 SQOpKgQnBMnlFxChWPfCHiAaSJNjXlumB/KX7kzW88w6um6PNw3WO5La6VbG/8x20TIH3ZrI2dw
 oyhjADSgzCui8AW/DWd7NyYhUQid9C19bMTEE7XFFPE2V6vopsmmaEDWpy1013LJjRO6NvBD1T+
 pkCMPEaW4CJzSN95wyhYQ9TqVrX30xBJlp/3e9vMdA1FR2lTXG5Da+S/DAP3sWu9BhFkHqzvrVR
 8cW+Q1iGApsgnNuA2FWhlRV2/ipa/TWg9LjpI0MwYrUR6zCXK3VjIU2wXFnL7NY/lYA6XLt930V
 uLkvcTUB/X0m07n26Q+Uvz/gY/7dn0DLwn3gmJydEoBqaKwRxqAqdvsCQi/D9tcSeSJ8wneQcVN
 yrLqI4isz60c0aWnS2P8QsHRyDFFJqg365bC+inrvH3rt/b2T7jHQ3FzfGhcaIlg2+wmqQYMAMX
 OmW6hd78xgX0xrT4M2A==
X-Proofpoint-ORIG-GUID: iNLzBXnQWgjGFN2aaI3rBGg9R3gjXwKR
X-Proofpoint-GUID: iNLzBXnQWgjGFN2aaI3rBGg9R3gjXwKR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXzM99drQNJExV
 Zvu6yuUo2RCQF8pElwHTXPZixdyjICj1ZDZMvV5vcy2OcohcFWAevEVOU1009DVrktY22hZaZKf
 X741WEF6nMcuY+fR2bYe8QLa0XPkn7Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

Schedutil's ability to reach boost frequencies depends on two values
being correct: policy max, which caps the resolved target frequency,
and the per-CPU capacity frequency reference, which anchors the
utilization-to-frequency mapping.

This series fixes a few gaps in how these values are maintained across
boost transitions:

The per-CPU capacity frequency reference is set once at policy
creation and never updated when boost is enabled afterwards, leaving
schedutil unable to target boost frequencies even at full utilization.
Track the max available (boost inclusive) frequency before policy
comes online and use it to seed the capacity_freq_ref value, allowing
schedutil to utilize the boost frequency values when boost is enabled
later.

The generic boost callback only raises cpuinfo max, never lowers it.
Once boost is enabled, disabling it leaves cpuinfo max pinned at the
boost ceiling, keeping policy max stuck there too. Also track the max
available non-boost frequency and use the newly tracked max values to
control boost frequencies when a frequency table is available, allowing
the frequency to drop back to non boost values on boost disable. In
the absense of a frequency table, the handling will fall back to using
cpuinfo->max_freq, preserving the current behaviour.

Logs below for clear context:
Intermediate values from the time_in_state output and logs from bench
runs are truncated for brevity.

Before fix
----------

boost  policy0  policy12  policy6

0

4454400

4723200

4723200

355200 36958
4454400 650
4588800 0
4723200 0

After fix
---------

boost  policy0  policy12  policy6

0

4454400

4723200

4454400

0

355200 40147
4454400 79
4588800 0
4723200 0

355200 44834
4454400 93
4588800 25
4723200 569

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      arch_topology: seed capacity_freq_ref with boost-aware max freq
      cpufreq: fix schedutil not returning to non-boost freq when boost is disabled

 drivers/base/arch_topology.c |  3 ++-
 drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
 drivers/cpufreq/freq_table.c | 11 +++++++++++
 include/linux/cpufreq.h      |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260804-schedutil-boost-frequency-handling-8e6bf2387a4a

Best regards,
-- 
Ananthu C V <ananthu.cv@oss.qualcomm.com>

