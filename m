Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58B3C553F
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442088; cv=none; b=aSZM0hIxB6DWDK9k5yDf/dWvcizm2jx2l6/u6yBcId7EzmIU+5UGd9VRqTZFwWeTpXHhI7aVn0Y2RWEIA3/uTT/Od+bd9XDWlltWqVZG+eg2Aj2HXB2OrMixFHmsaKQppXZ2Je79Sw6MKJV41zz8MLEd/bxZhC4DNVip2HN6/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442088; c=relaxed/simple;
	bh=kmEJ3h3BCBciNsEo0HYcrYwwyoiW4wt74444qCBaBXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tflTPNp4+JPpq7QcvxAReeuk2E6tTVJdhRvorzWsukQ723dCm12yWHfTDHipP+cuDMSxKl4ITJvRCXCpzfy04VASym4u8tmbJqxca7ybe0x/fjzYZjF1QcS86VdALcmC2+CcWLujqzyTdkE4Dg+UfXd0kKcwmGqW0G2jxv/fQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loTaOGp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2uRxrYY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loTaOGp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2uRxrYY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bi2D1776068
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=; b=loTaOGp4bx+GSRMA
	SUqbvQaP20bIMXVOvndQH1hMXClnypRT5w6UPdhSaWGRCS1QT9P2h7gQMI7jbLwD
	5ULwANBh7apTGOSc9bLOB5gyJIf5lIc+AVK0rdhHh0qiF4034yDdf7wIuUauwpRa
	S5FAufFnwy4XjKV8w3jzc0dro+wkW+NcPRGCI/ifz2ldfjW/Dy00aa9JQC6Y8SR0
	rE6yLUvvBSFCElpr0WDz/gJu9XqdQ+0pqtlyTctNGBmAtZDCdiN0jYhC3hAT+3gv
	Ug/vR72vXyGca6RnJk119s7f9nKoYHIlJ3d36QoehOsXmpy0vQuqnTCy3PcuoZrf
	2yFwWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39fxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:48:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4865113a91.2
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442085; x=1792046885; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=B2uRxrYYomZ/MAI6vPBQ0WBAh4wvk0XRDTRBZOmSnAgFV/GxDZ+gPriD8FWD5Ih5Fn
         bI7Z0nar8MCi9D7FwqsdutosYlHfXjE8t7kgpOm+k4BYItMuWs5lb2RBoqTsW75HeTCu
         iLT9HIOSyym29BuyQurAGa6W6gNRfY3Tt+CWAfxz/FbffVFeyo9qQt+616UVbooeVhPW
         mKwMVmog2P8GiyzRAu1NsLe1JTyCJ+aCdYoq1CEHaEe3XUgisCpDaCx5jgev3SsSYv78
         3GwY1TZQf+rEphcRafHs82NOOgQr2iVG2klKxVyGlBQZGGgSUqJnm86+Ogo0qOdd10TX
         g5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442085; x=1792046885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=Ef7mg3trZxw7Jk7dRdwcqJM5bEIyexFs4RWRFlnS6cJVrbqYknX4AM8N3X2Vx+YsXn
         b5aDZodDudr4MrQsbPoxGS+vPpmiG069zZV2Pcmfohrv9vAZbhNAGCfELfyCP2cD3Zac
         L+LoDcdJlrIuDPMEfrQr1amdLYxdYrR9K5/gPIMxe6jyUz7K0JQD+JSOuertXACyr/gJ
         dmOUQ+q/NwHXEoGX9WKwN8NZXRO9vvxMTJQn3yZ3rpa/axwkxrys6aPNwUdlEk3vvXW2
         fE7Hl620GVtqw44exqWqGmTciKS8GDLtxshfVGXeyY8NDdOkM4+BwnNai2nhnxKlA1Ge
         7pFA==
X-Forwarded-Encrypted: i=1; AKwUvBz0F5idt6ORlpWJPRvBymtUEK/T0cNpSGiEkXVIn+MThAYK7FJktPWFxqgTwPWed+HGnnXqn426HPXpSQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKaCpIUSiGjPhcwEkO94G9m43aiVfCVpmD6YbVCGK6gwD2rENEn
	619Lk3qu4dmEVMqvAMfX53GTMOOEgASaw+KCzByP/7L00UjXOZVzoHX3vb6/BSJPDRiB72zUHn2
	TP7JaDTMks64D/Ue01gnmNeGz3JGg/kMmE76X5wFpaG6x/IPW18lLr5S3pViLOP3WYg==
X-Gm-Gg: AYBFou0RNBHVU6Igt8GBQd1K35+4f9Eq481UzhQGKjAAc1sq9ErT3gq8KcnWA0gQPCA
	J9fWWrOt+UuCMZjmNZ/W2AIg4Nz178uQ9mpMPn+XSSd7Of/iVsEVQq0j1FjMGwPPmf1vQGeAjzO
	cNP19SzIqxh+zypQgaknwt9ZZOqt3tNVtodR+HFhUwaeBN3cbrlr4Sh0LpNI1Fo5Uxe+yGhCQfp
	oCA0DEmn0B0D31MfBO00wujoVNLgS6UUmKdHp8mrDXeXegG9pezDeKLMa/6PK7RiWkFts+Uh/q/
	1oEWebjjQt7kKuaDoL5g7zHqrrX7yzpKXvwGJL18X9N8vQr8jnVIR3u8j8JDC3p59obgkq/FksG
	pyJ5/lxQM1/GtkotGGm7QUpyEIzP2cd3fFkN30b3HFwdnMpmmyaXzpo0=
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337609a91.43.1791442084975;
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337594a91.43.1791442084504;
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:15 +0800
Subject: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442025; l=4057;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=IyjCt9e2HWnLpXHhmvzVNYem5pb2CZCxUbGNx8XbqAM=;
 b=AbRTdccivHdzG1PG5LEspniMT8sWNpqFZ3ke2ws2IwfWLlLEzGZ0uItRckFXz01pJZNhCd96T
 Qyy1ZPJVHLJAafN0YoLbiByqNGfBfH+Ema7zrFZkTpDEK/kZNEeguTc
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac73ca5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX4caJCA1z3vJs
 AFpDy55aXvlbUoMwNWFh3sfUqnjsKqEuVrrYxb1bvN7sboLg1CA+XJNB7R3RHd3ymiQCh5SLW68
 M7AoKPS6DG7qHA0dB+HMP5QEroEaDkI=
X-Proofpoint-GUID: 1shDxp08mfIty5lu0jqC3ZSoDCryG-tY
X-Proofpoint-ORIG-GUID: 1shDxp08mfIty5lu0jqC3ZSoDCryG-tY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXzmWnMJC5dfzy
 MAnob7RB6s7B+wjgXazpV3Vpt2hqegUoaPitxj000cZacd/vIHOTWdmn+CxMFiqjNRwa5WjiZCX
 /ZxrPzZtoQFuE1vxpAFJwXt8axz/aO3oCELj88g0LuulM1ACknFdSUur/zu+n6g17E2ESf4mi2P
 6o6GQM8sTeEboL3C0bpyJDpym477PXVgn/A1zvoWe61OAh+I+ubPcnF3zRWJ7EYRcnITUVYVjmM
 kl9/fCM5jhXOwAen2WHCCvAc2JGUHhn+tWT4MQX1T7UhSoNx48ogvfCBUSG2hDZHkeKOPZ8mwQ9
 2T2Gwgep8/R/1bdYiK6BkNfw/9hHgNmQghvP24M/6LxSRnQEkxNd/X4s19jxS6jsheuWyPLr7Ut
 ir8aOuiBxGcY1PwXRBEM1tDA9ITLZZA/Fx17uVCXOb3M32whZgRmL/DrjJaNmAeTazYWCEtgzGP
 aLyAVqPg2bnOhouaIbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use of_node_get() for the memory
  parent to avoid a refcount underflow; use u32 instead of unsigned long
  for component_id and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0640690eae2c..048d32e69f55 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		memory = of_node_get(parent);
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1

