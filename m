Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188095;
	b=cj3CF/D3mMlUFGc98o/BSB8BiNKvdkL69D0ye7N//vyVR1PXgPpJKRAOn+ctq7RUuFvP
	 gS7zSlklAwOMkob9RXkPP3jCuGwLIJcX6loIWs/dhFN0H9qGWBpzAs7UFQoesuZTxF/BV
	 hGKU7B4mVPNRx0fwRqxdo1Yq8eFe0IF1SKxYxkKJCBr+sI6lNgLWuU7usRKwp4S52k7zu
	 OpGzUA/TTiyFOk0KCej2qRIcT5AOgrDzyzBLSxdAnu9nzBp4akY5ilWhHX/39DXi71doz
	 EAbq9K0CFEHs4Uc0jwGEMg1sA3dtgkhKmu9lCPH1n1F4r140kfW574fJSTLnCCC+xhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=THC/W7h8lxX6rHHVQeWaubAvSSm81SgPI/aEIuWFkWv8jaurK3h/Qh3zOpEnq1MefoVL
	 YUqFv1cIg3XrZNod8mMxd19+jVpJFzwqqGzHbaJ2cT76DG1+YR8XrpFzlyo7fpwzBXREQ
	 ix+8n87x++bOlhteT2fdo+iFEqtbPI+wOlKfr2/57T0DkQP9m+TADR3eSi5VuApchdhgQ
	 wRwNkFjOYlCLayAVpOlFYtBYsmD3bb64oTy2oidmQv0KI1vIuC1Tx3l/ntVDmAx48qMus
	 LO1V0ePkr4EwOkJURxV5Hyhrq2DEpxOe/RFFVEOJpcpyRrzWVY6YS2+dSjmq5lrwMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH5a35r5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A6606A338
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5A6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH5a35r5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6Ek1012047
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=aXsC2ItG8FlL+JE9
	KAC2z5roNxozGt8CsUW+hq6elaEKAV/ncRmKYtMZPRCnPkDPs2TTuZ2OiGK+giQA
	b52xmXp2aIVv1zqXg4QlS5N3m5ab8Y8YdUaeRtgIg/hIVu9zpzJL0qUskj1AXMo9
	y6I3KADqPUEsGzxWv8wKderFC9PTw5zhGFUC1NJkuCQU/tMjHzuszpo3wlsS5nb+
	jYfWcgqvGgoLTHX+85QB5NOCAVt5SjguJ4+WRNOgeoHQS3+u9uzXjXTVjNjTShlO
	OlWla+SI/vc4PNEPHSSDOJ0oVZyi4lfe1Rw+rw8nogqigfJ+0lbfgzKs00x2aObz
	a8GDQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg85r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e869e00005so10694645ad.2
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188093; x=1793792893; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=RH5a35r5dIynQ3FvRDQ5i8njgSml2P8BijccRZuZZ94TT4gvdxZaut+oH4QFzyJW73
         owm6R6QmpgPJwDuaV6keTs3C3ugAbv6oiVmImZMYnShnYoP/QZf2IOhDpQthPXNdq516
         QH5lYaOIFbWcu41mACIwOU1/vfgsZNdTg5TKIaPOTnEwP07gvrRGtKFgjOzq7E8ITa9q
         kvzMdg59roC+j7xrJiR5SM25WqCgO8JySRWEQHyo4ZZgnd0BKd9qEDUFjkay3iiJuNXt
         K1r5PBLNqAMBbJRj6p2qUSuEOQLlOXtQOpVUtQRukVZAYf3DiBkhYi7ZjyGw9l7c8r9G
         A9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188093; x=1793792893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=siFpfwxFilCOiLPVcdnTvRs+nCgXjZT5dictCk08yVVnGFny6BNlZDKuItPdVy8Ray
         EBkPrBWdvgfZfm9cew6ZkWjLwSEhLycnvOzz/y+yuQ3n3FoE3GN0cqj3LAY+Em5RMj+T
         7mt0v3hXObi703v5QLMNk4sXNU3ZjO4cEf0uQcjX7JuvS1kZrUILDESEx/G1Zb4ZiPql
         G8vx/yUqr065VLoaNqwQrXdj7c8Zxxt9TWogyRFv2yzH4/uPRt0REer8Rp11l3YRod4C
         9B5lVTqsMClXj3HesoYUAsI0zd/xkzkPLWktfoiB1l7ps/jZFUkNI3YZDF7tyR/360gp
         9YhA==
X-Forwarded-Encrypted: i=1; AKwUvBz95CN3BJgK1xCVggWjP9Ps2VC/Qx7qSH1m8Gq/gPRfIyEednf+a1YXMjPztF+v21gv+qszU/UzpBlZvQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIX6Pb8gJ56jkvp2/oqX8klHzeWlWE+03vVGFWUDXZpEgwuJOXj
	tkIFFQ74Yx0oIglD3v4r7mr9XIxisycJFSzHWxtvPGYWHenX593Th1RvgGQCLn233iRdiqaX0Mw
	KT8fcEWdvgn9ahbB675Qh/FAf6x9heq+FP+EjW4+rgRzuRWiITroA5N6lVsVEEsZcVQ==
X-Gm-Gg: AYBFou3fWq0Ylwn/X/RUfpolv69GA3XTaV+oPRZRiLT6KwfrY2Cmr9aFA+Vljy38hmU
	3nMTnjJNdjdiWXgP54alVY2gayZbF7Fdr5IT8JKy07+JbPrgoH8JoDv66WFsRS8fS/O/ubsLkZi
	i9iraUEVdXycuiIbvoaOn0KSTm2WyOyKqAnsw3mFl46y/NWk0OuJx0Ng/S3t5vSE7K49GfOIivU
	S6FysqP5e+ACox4Z1fgQUDjfi3hV/vb4E40Fdf5NPruqUONlFSEECBgtPJ841aUs8/J44T3F8IM
	dlM91sCAcDWrMR5v3LXorIXFmUvqPiZydUCXZKByFGiGLZZKxuZsSkDhEn0yR7vkQPsV8LChQ1c
	4iut9G/E50sltEtK1WKpXs4FZsV8SCdUrYs6wvm1x2mBy0jbdvorMhPLmxtdKEE+c1k23RqngyG
	DocHJmqj8Q2dIoi6NC/tfCh0OBS5Pa
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527535ad.10.1793188091913;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527115ad.10.1793188091411;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:10 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:44 +0800
Subject: [PATCH v4 4/6] cacheinfo: Expose the code to generate a cache-id
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-4-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188047; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=n/XKEt2Df/QRRSl8LRoUZx320ZarsgT1ChUAkMLf5iPokWhJmxBSvVq8VNfkWiupCG8INUGKV
 UphnCzwL5k6Cf+mbzj5Cf+NoXIJ7fNZzyfax3mT22Nr/pOTnN1hhPEm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXyGIL9LGDWtqt
 i0Uf7GcPDlEUzan6rQQI+R1O9HON6c5TYicQG0ox91O3O5tGqgbmhJXAgyvOvhjEZQsX88plDaU
 p0dfJ6La337AAaVQCNmL8EMu8erGE4Lgcp4oLkbT6hW4WlO0CiomfYalcFM79KgyHOdtc+4XjA6
 ihAYwTrIcTZ63RpuxfxdHq+nq9t1qimqvZMjrOTsdj7iSUgQT5NCCVoyLA6UxUHhPqgEmbS7Ltm
 gKFzso/XqQUMIp4OKMIdJavsTYNCeE/GDK1hEpmyAIylLCys6Azs9P4nTvK+R7qR08hIzVaSdVP
 esv84u+r9YFQP1s72Jkoe2XaOpsTPnl0kSTOmdhqYg8mtqSeTOxKfYvnyCT3BI0AW0a9ZD/ZEvu
 GpL6smwx3QLSDqcesZ8ORHYpqsRagRT2H7uAPK/6616kJExZ5OrRJS0P/TpS08zlCftC+eBZ01V
 41BJhbVBWVKl5BPh94w==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1e0fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: AfBgDTijpaaFa09p7myW3CspiQwT0D40
X-Proofpoint-GUID: AfBgDTijpaaFa09p7myW3CspiQwT0D40
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX9If97mqPF962
 QhfCCGHhaqsfelczKqWHjPAcOTbsuX3DAONJbDwZEvr9W3EyfwimvyEzOzvJAWJR4kWFDFRYvle
 Tu1x14GZDdIrP0EbkFTTddVIJyOswlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

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

