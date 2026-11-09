Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218868;
	b=fSt0F4fdO2kN/+e1iQTcbTrX6YhvDRQ3XR8zhNezPwmKXHmAD+5vHiTUUhsYT9MHN9Ej
	 VJjPFkv/gNftBd/exQEgxkqBgH5ABNxmMm9rxix5fNRa+Er1cw7f10KsHTXGBv2/qKTZw
	 481aB0xJ76LM2P3+lo/kmpnSTji+VB7eBTeP2KAokv8d9/E2/3jfIWJ7tBKCm+vuTmXKu
	 2f8zjRR/+zpjAvn5yMwTYBKkbUhxEam2DPRf5cuEXs3wsyWaMNZjicZORLEtEp0gox4cw
	 aWg9JaFV858CRB7OYkBxU09lghHW5LE53GDFySRcuIYnC7ubqC+ndI1gpxQ77rC3zTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=RaA5291jxoD0o0gp94rFOIFCBOePloA6fUXN3x2aKC7593gdsvYwUYIiC9CRIK2suI4p
	 uCqLyIhwHH26StD4KcqhHWQyrK5NWP+uel70znKwXnixJ0LnrvQVZe0CAghRu6krVyWg1
	 hPQXbMfiw1QdcVirOcQfXZavfo3uZGNnVdQ8vnMKZ5W4rzIX2qbf/R79ZKRsk+511Mp2S
	 VLwTT+ncrd2y52T47WKZXWcvhyRI/EP8iZWdvC0v9JlfWR2MYv3Vq5IYkLMCdd/yM+E7R
	 XkXPEjZX7sF5Y4nAFSOGYPwwq9aMzB51oYLsVsVYQrWfD2BKiDgBqf/+YclHAyTzawQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXWmCYAp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38765606EE80
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38765606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXWmCYAp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vDKT4107887
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=bNbsAyBBBX47e9R8
	e/n73IMqaFJxB50b05woDjdvPpwV/cafqvJ6Y+b2MXb//LgN0+r2Oz/Mjp7Zrz5S
	AxSiaEhKEs7Z1O0RaThalq0vYzPwOWIguspYyVKuo9+BVS8PIq+ELy6TFU03pyrc
	Db/G5joaV1/eZVI7Km6Ztx/vyRIp+xH1WeXV7AyEmBZ375TI9Vo08cv5glb9/PgP
	CF1Wild9WOZT4j/tjtlsdxAu23epLhz0uAe4DW4AGhv1V8bf5dWsnmQyoX9xPOqK
	ao/YNQZI8NB7944kQORemBL/Ovq/7RYn0VofNKam3iD3LPmW4c4cE962v0NpK9Zv
	hd1ujg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx81c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:07:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so644850a91.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218866; x=1794823666; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=XXWmCYAp7Trbn5Zz8nm46BJdKLWmodiCd9Wrjod5qpMsHvG6Wr0ORpxrzhVEM0pzkW
         wFvI7/Nlw7Y0hm0Dp/+XqsPHpRT9qfr9vepxVcgi8jF00BXfTTOG1wVKNrA3VjNhhL1V
         CFGkVEbohN4w968zUI5QnkKo391Dl9rqLsegSGgsMEa7Tb4pMEln7T2l9LHp7+Nz/vgh
         EjvBifaTrN+fJVCcxm1HDZXg2ayvvYO35awVgg/NljEVjQNO4IWgA9lv23AeBtSNXnZA
         cjZSyT5EcVXz0Oun/fqwiZXdCpp3z4oc4vgmwtcIk8yvo/REnnOVOflOdMAZ/cq7HYZs
         5luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218866; x=1794823666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=Ayf93UflSEvJdVKY5AtPgGfHuoMD5guYhizKWvujN2O3UwNi8JuLP66fpyfQ/1+Ymt
         Hu6vZfHfhl9mCbVKeAztfwnN9RCnBux2jCD3R3udSokgMJvJR4d66PRktf8BMXsXIiVb
         U1m0dnCHZ38l/LJzs1MS2ImtgOyg7utakAYtd0dabq959vzA6K2cpclyngmR6+56AOmO
         5jTQkDMvOCWS7TSkyoIzSxjrdGmXrzD13SXcjMt1yddeQszQWseDf+/qhkFgS0c92/fP
         XIpt8v/DjC4sbi368UWOw/i/Y5uGKL+UWcPEbtf7SDCVh5637bH4ToSqstiiKIaW9MEk
         YXsA==
X-Forwarded-Encrypted: i=1; AL+hErG09Tbt9KDPEm3kdConNYSmd839NvOSvZFvbBBmf6mInTJuYGh8EG+/9FE3Z0SM7vH87l+gUJbXpiLsqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9o3uZO+5zC4HsieXRuy09DeNNMXccdIyD4h+A0T06AyJR17e7v
	ySHJea+mGpp22C2JzAWZt90w11FX5lEbtCrLRB6kIW/ckD8QkxjNuWMOgMJMqqgKy4gFX0yPZ1L
	BeYMwC2oLUdLVe7OptcHHa+4SD53vuG01jeXetoy7KwONT7SmRdYMdUXXVMsKjr6vIw==
X-Gm-Gg: AYBFou0YTXM4PXbzr0CA2y9ZZtdSvCQI9FdTugU6d4mUT/AVYIrIqpVTF/7+tnH3zez
	jgjjLY41GrQUqFpWzkHc4XBcsD6iBwKgkaQMyrPXMqCt6YRVUmu/Xd5XTe0c9aOLuwc992y7Ydb
	BBYSTMloCKL+dHmgDIytQHGAo9Mqe0G0piOmwmr2yj3TvShKDSUIaNARSMauz9Kt/WUKD9uw8DS
	RKQlig9002D9KzrZ2+hbi6Ivk83hTyCnl+BDotTlj/U4q0337bsS+Eu2FB+Nwek/Uj7PbSK3eHW
	GxMVkd0GAOZnIvEZmxY4SH4aQ8s9FKDhjPGIFDzhlJ7gGc/KPlYwDhjvpwLV9MMojvXsCEP2xbf
	DYVV8w0sXbU4lGlxEQsl0CYjHKf3DcVOXKwwkJ3w4riZaKcAazj60a21yQeg1dQybClXa6H8YYV
	yWw4FYEaJ9l5tzjrmGaHftG5k/VHrk
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363410a91.23.1794218866272;
        Mon, 09 Nov 2026 02:07:46 -0800 (PST)
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363381a91.23.1794218865811;
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:36 +0800
Subject: [PATCH v5 4/7] cacheinfo: Expose the code to generate a cache-id
 from a device_node
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-4-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218817; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=ozOGB6eLM9+WzelhJAT3yEtCsqCzkfhBnvd8PVWm2gJ8zV1FxEktehv06soBEhpURkRFYpAcE
 GrCUpKAbEj+AXLMisyOFGQJAee0jz2pKuUsGzIKusD+cqkcXHut3kO1
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: Q1BoQxE8STxRuL-F2bisWel1kn26rJP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX8iEavKwSd8/k
 9jBqZqUMWNvGoqBX1KQDQJi0OzBfY5nIwzyst0yzAzUk0Vn2ytijeRVMwGZmH3QWCreVgJpaiQS
 Xptk/ESnklYZQemJ5JfoZsEoSVqPtPO4jYuyeFDLegGIBKe0HlF8zBU10jmu2ttDJMo2t430W/w
 vB3PNiWB57pfUfjG69yW6LRQaiNDpXFfDrtMMRXESR4N44smN1+fl4zGorILoirDoTdG37JSz0F
 3xul/ikipYgHv+FOs4BpjoB07VD2iOQbCejguLQ3uGsKgUKr9vvhJ8KlQSEZUaICqdmlgKMP/VM
 QSyS3d0i/QtVMyQ7hYNF67NuucnxoYvkVVciC2nBe1iOEp7COtdeJW9jNhnbINsTz7Kx/1/i/js
 gVJX4kut+3XdxiEmC435tAowt6GJ9WYxD7Az6jBumI5pao7TH9T/YPJILMHVd68VCY7AWh+hQ/C
 lD4G5qIzHLq8J6H6Nwg==
X-Proofpoint-ORIG-GUID: Q1BoQxE8STxRuL-F2bisWel1kn26rJP6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX9R1JSU0fwpmR
 ejhLalxPNinNdriqPYbktBGDG9HyR74d92JVlrZQUWuEGJSwUmFw3JWOVYJ41DhgdfJ041lFRKg
 WIRQ5Y3+1IUyV6O02al5F1qF4xPaeSA=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19b73 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..a4b10f3a9007 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

