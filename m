Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85F544CF34
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455446; cv=none; b=XCipQmqOPlNzjGLC5pYlaZuQDfxh4TgV8fDfvp+ZH5iRn8COHvCoa0gAs9elTKf5jPzHZLJ2+H3JNZmUWnAwkECSPMT8NXfLCMfvhgrFbVVFC7xUCaveqcdhMFsMVi/b/zEIn2OMOVWy0uR9nRjzUGfz0l479s8RvB3+14APvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455446; c=relaxed/simple;
	bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDlRcK1CFh6JwiIfMg+zcT8j3VkaXMnOaOpGojzSWOKsu7487/2aSbp2hWj0Soh5Yc9oyoxScQWeI/pj1M282CWuCs0yWxrVARwEruB/duMhn4+FNeMyZ4odTpa9p7nn9uJDvCaDB6LlQreqom11cz068/fVZPlbGF+NLoADDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoK02wEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uv1zxBA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoK02wEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uv1zxBA3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWipZ809993
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=; b=SoK02wEB9yOl4Uvc
	PUfHj2hxwTjwcBMizOpLdDnD3ySXVEyvEXAGvRM1wpx70/oc2IJju7hbGdCG9wwF
	LbKuUpfppX5yHuHsbNTCH6LfdVXxWBS8s15eM00ddqZx4zOXwBfItBodVU9TeoHJ
	jXJU4vzphURwxfc5/UkA3aRrh+QZGQeFiy99j21MF5aW6YhUJR3P4dXgK+/sl7M7
	oP3Vi6qxoUYhKp1B5FS3RbzAQvSTUPw62fZg7C5IeScOOP6XkgblC+MImJ4sYPNq
	gqjxqKl1EvJslhb5sSibeu1Jef3MgHu2/s4X+knaS2tYC9vVJz22wZpcHBWQoOeP
	y+xJIw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049dg5cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee894b3d8so56033935ad.2
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455439; x=1787060239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=Uv1zxBA3HfRBy8/Uzg3GozSH//IdwtmV2fNyRBoZ9/c/srwaEuTR7fCjlrCwkXGecC
         jIhaMT1uE+SPduuWGyY9ACYPCzIgdB2FmcwmjJRAGkTjBZJ58DzC7cZ1xgxQsX6rxlsa
         uM05FdxJhC5Yf7gGmnrytHjIzpvtFiiG/tC5lxj614fwAUqzLrl4MCrp3Ny06d51f+9g
         Wofd+buiFywI0gSTmACkUjV066T4ZYAv82Eyea5cnT6dtVaAzbPDimICsPVEytWwB0Ms
         nSCBrGvqw/mhJXJkKx7E5FmFda9ixay3mV7f4lUm7SwUYrxR3Uzl+LU1oSCKBs5+Sw37
         mdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455439; x=1787060239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=Oql2OHA5wRYrl1rs8viwsbMZKAa0SBqDejzenO3fw9vTbTCr9eGRRCdJwtK/Iea97a
         C8bfxTY0SMaaBK6WrQGIzT/fkOFI4KxiOgciRdaeicv9sMPi1m4KNeg3u79+xQI6Pdyn
         5I+p3vgzbbmd3tVyzNsCjk4P66dezrK3vA7wBlIjaJQ3S5aJPyob6gbMDe/rDJL8TyPd
         t7vpzDPKAxSVT/kRyX9BNnlb8fKRpiLwtlbgxmXxBb3BTZJNOg2RoY/Ojow88NVYjRch
         dJ3SWAdiJxH4VC4wttHWXpFY2g97YPAVQOkVa6T5aeProutMTxtPI1r/jE4XOZ2SJ5rZ
         zedA==
X-Forwarded-Encrypted: i=1; AHgh+RpSoWqDRHY++cr7kR7UraajbnmS3MbYUXtYXnJfm979t2CBFpDO510FEE9aWdu+jMy25cF+RcJAUH6nxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHtz6lUtTO6eV3jS65bUWANqR2r9wyQxOdTAYPoqGqzzuOWnC5
	7PmvzXlZoJhqLOWO3+dC7CgCkSzz7fQ/QzRHQcnwMiaq8zhRjqBNxUMb4xHk4AVzIBYgWkYVMfP
	h1TeFZyF9xaqSdbsu8mQYWhShGGoryL4rLVkTliYI47/dp61LjXn4kq2H/2mlic2uGg==
X-Gm-Gg: AR+sD11JHU1wrwJpp43JMQDQX6a2WyuUQGTXUJ5LmyLEURB//53Yc8q8PhRuwzHoqKU
	INc13mNJv0Gi7AEOC7oZNMpjh7RrbSWJ804cIAS1yH2I//YL8tanKdt1RhqPZXsNXwN6rwBuXWq
	mH4majkrcAKPdrHnnxAEcbwLlCdnLczdtqs2XvzooVOUOwQbyfjaC/+PKuUYDjAL8JMHHKbc/PF
	G+tUw+kU413zwk1IlI+ZyWdBxLoAX5TEcoCtjkv4md/KArhNC9oSZyog+BuypmqFzGCR0V/ghov
	/aYthzOh9+H0GaJ7XSTrmGCAdrYBqUKOlRzqlZaTcX/CqLGhHqo1qoKHsPmbkPkZ/cVLJOGwJiL
	QULyZzEJADWjVfsRPDqGWse3DkHXFd++C6DJG0cqpZjBtHH8fFmvOKWQn
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38736725ad.4.1786455439087;
        Tue, 11 Aug 2026 06:37:19 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38735925ad.4.1786455438579;
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:39 +0800
Subject: [PATCH RFC 10/15] arm_mpam: Fix update_msc_accessibility() return
 type to void
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-10-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455326; l=2343;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
 b=djr9aNve5wpKqWWshU5FALHWaFXPyeUA2cp7+NxrGv2Cg1uOxFVJpeb42e/p6hf0sLykNWP/H
 SkK7iTfzlKiCYQyIyqto4bOcBPKWGLZQy5QZEZH4A01P2XCbmeyACG8
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX1woKrFNiRqyK
 UiOBvIcZ1LtqUT7UYoxaL3bNgtgGi1+p8b0VBlUR5bpfOozUlZZ7nJmt9KjnK7YP0q5HLgbkzba
 8Hi7No1+GSFGPRI2W+0nnHggtrQaIFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX++Di/vVPe2oJ
 F/2TwWWKVUYk2WT3JiAM1Yq5o0p0b6pVvpckbcWTcPvu4BybtNG5miJvwDxpQjxqYORhlGNvUGB
 ETl9pt/Rq0vA+iKz2Ta+q8GHs86glUFsR1YEssKsB+F5GvJi4tavkr1iUv7us7gi1SURdqsseGY
 9YS+h4wVkQj/NsMh26NYgdZWiDlAC5Oipd+yEbSjZ4FtBTxPgBLEMmBihpoNVYBckRfT0tyR6zF
 PSg0oJJzNkVhtAZPswXOsH0t5E9qYPAlkp71wbftCoTJNNbgM833bbVYMQNwX38wMX7GTszTiS+
 mnP9siiW391pvPVDBr0GiUfi3k0Dfq9Agqr3V/MqJfPZy/D8yzK5TvmJCSUGo8P36M1Ni8Qll+P
 v/nYQfAO1Pp/JiA9Q8ziPdE4UbFq2M7Uwfn2jCA1We7S+QDH9ag1RzrWVbIjICi5Zn5y24rYGFh
 125n4DOl1LcAhq90Dnw==
X-Proofpoint-GUID: SsAaeYW5uDe6r0LkV5g6z5SYhy-HAk_q
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7b258f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WfV1sUHbO1VEJ8_JC0EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SsAaeYW5uDe6r0LkV5g6z5SYhy-HAk_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The function update_msc_accessibility() was changed to return int in
the DT support patch to propagate errors from the DT accessibility
derivation path. However, the function silently ignores errors from
get_cpumask_from_cache() and does not propagate them to the caller.

Revert the return type to void and remove the unused error variable,
keeping the dev_err_once() diagnostic for unrecognised parent nodes.
The caller checks cpumask_empty() after the call to detect failure.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 5d1854d97371..b0e67c8349c7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2158,7 +2158,7 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  * corresponding cache may also be powered off. By making accesses from
  * one of those CPUs, we ensure we don't access a cache that's powered off.
  */
-static int update_msc_accessibility(struct mpam_msc *msc)
+static void update_msc_accessibility(struct mpam_msc *msc)
 {
 	struct device *dev = &msc->pdev->dev;
 	struct device_node *parent;
@@ -2174,29 +2174,22 @@ static int update_msc_accessibility(struct mpam_msc *msc)
 			acpi_pptt_get_cpus_from_container(affinity_id,
 							  &msc->accessibility);
 
-		return 0;
+		return;
 	}
 
 	/* Where an MSC can be accessed from depends on the path to of_node. */
 	parent = of_get_parent(msc->pdev->dev.of_node);
 	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		err = 0;
 	} else {
-		if (of_device_is_compatible(parent, "cache")) {
-			err = get_cpumask_from_cache(parent,
-						     &msc->accessibility);
-		} else if (of_device_is_compatible(parent, "memory")) {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
 			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-			err = 0;
-		} else {
-			err = -EINVAL;
+		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-		}
 	}
 	of_node_put(parent);
-
-	return err;
 }
 
 /*

-- 
2.34.1

