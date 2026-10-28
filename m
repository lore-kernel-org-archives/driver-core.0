Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188077;
	b=L4pXcVP7PATuDfIcQRLGuh72gG2GPYMGYtovuyIKq/x4gHTx6nGEvHHpjea+Ioq6b5Kt
	 wOUUlw7ugF0Ndk8VaAIQ+ciFlx1mtRXU4G08nyQ8ZOisZkL17UxuTS/Pc70/+LLxnuChJ
	 GQJrt2T7DWqFQXQjnwzisyHzwEhHEE9afm0gHMcb585IROMgPGgOEnB70r2w6hJTG6ssZ
	 M/KyMB48JXzZFEM25d1cQACv45K1/qRBYBvyvTxGhaBWt3xNtL44nCyZqM9Ygdw6/3dXY
	 Vdam2PLWpQTHVDC/yIs9hlAlE41m5ZlYyv4HHF+crXZLbvT8aqcFym2SQO9GPa2zIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
	b=4Zr9k7xslNo9mCB+6NSTOcCFUn+60J9PAa2pZeA7IovqYZ5SfnoBkCy8nQ4nxBDdXRdr
	 FaTAQlY/C5UXW9xSPR2NhpgP2BsxSyCM7qCzdsRFSoKQiCPUyzO/Dh2vk9LdgbBXqG4j4
	 egVNqq4OSyvhkhktWLduzikJP8hsVDZRHUGbXoWJUlpVGBM2+kNAhrDxOZdY2c0X0be9/
	 rQGT2ZldlCNJbQLe30oap98p+8jCvrG2MzS9G5J0JQES1LVK8Rm30DBofP/ZqqoAgHxHy
	 +6/34p6JOzwCo1Yu3LzYdQ74X85Hv5Gk9ldKQkc88l0V6pKYcO4tg/2BuLMb9RTBTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMNVABZe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96A606A31A
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC96A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMNVABZe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4Jd1053321
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=; b=c7yWPNL5Vbl5HhwF
	Y9kLuiFzcg/+wthv122esAhjKD4S/YIOR/5NgwWKmWr3JcrQM0Ajx/yo1okU+mvr
	LhXx9Hr5Xu/eYhRyYOm9JDbrICGFnjsu6jF35KlFgWiYOm7ZDxC7n9jlwfsKWKb0
	DZnB0aTzTPURelKiYnZy/Y2iDio+ri0oZIttxcNZJCpJkMyABcmVn0cY6iT8ywqM
	AZbCr6XVBiuw8HWmKyYGX7KzcFvvfG9D9PsPK+mRGlFl70AnUxQybsLT6E+swIZo
	WQ8iKdHh8U7Qmoiei8i5l1raass2Hi1CB+T3zWQ+Q94YC/0CXhSZCQ3cSa5uIwKX
	AVl3eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9754-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:47:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaae62796dso9594825ad.0
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188075; x=1793792875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=FMNVABZe4Sd24TGBQycEChG6sduucS5Arr2yDIA3yRFWlsdzN4gKJyk7wZ88Whwadl
         LjPMNfubKphMNi3y2/Ivmzf5SszhJiPi6pSDE3c4wofdOedO+uZ2R+IKvcmbiBFqUXel
         ke6BV5M5Z0d6siYKFm8/R50PY7Rvg2vdrF+lZYfwkdQeHrwyq22PKo/yM3xKxuSXP+Yu
         GOyFvoON8toKRU/lyuPkF+fZXG343N6noUDDkBkxVw3rn/On9Gse/E/j9Ot19zP8+JUT
         MmmXIPGCz+9ZnIv3g2BqrdHQ3168xCCspr1Pq0jGWkB/gNa8GmANrVGPO4LVTrzLWqGK
         LKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188075; x=1793792875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=sCo6C9PHxhF8klJ/JvR9YZvPHhy3aZaq0r+nwKyPZqtspqN/zX+A/RU8zR1tpc5div
         3mOt5miEX8s5Wy5leMCZu8trzKv/pcndEXGCKpeakKFxWLvb8bbqM1OmeEDtONzLI4Ru
         9ZQuB8ubKKQHL4zl7YalKe4GWQSq4n/Jnt/AhtRiDhgDuJ/RrAK9h0PXARkP+5L/Bpx/
         /DVUOa9r9qCx+6nbYhKLqf9zkim0yn2HkLqI6bHCWj/gXi8inQcTYhrLao4/Zr3QwNuW
         Q1QIE5OtdjXoBcz5cot1H/iN5Rs+oVKu0O6Ecp2GQqLMJd4mv1t4PQbIy8/SdLSeEs4V
         qhKA==
X-Forwarded-Encrypted: i=1; AKwUvBzj/41uVX1afrnNPMregFMcDgZbIr67lLDxdQ/8kXt8J84GcNvMlJ6OPiv+GqG81XqkC+/trgk5nAK0Lg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIiivKiqzQ1G0w6Cj8H+7PejB0ArQG4cfkxpniTjYMK8bZKW4wB
	OIU8alcMEZlmN3lDCDHH9cmneAKHLZKU68/id3oC0F18UR1eflK+mEg1GM8+pvqIEk9SVUF+K8n
	Ed5FS6DN93XuC74pol7+fZrXBF4++/AV+p6xPpNjW/WkIuXtgUlPwugIl1U4CzQlf0w==
X-Gm-Gg: AYBFou11RBypHArZY2Z/tqHe9mIbKC/aPqV5im98fD8i8E1BcsaQWgwEjD/NqQMtFc/
	1n05Vs+rFTyZ4uEowOSgTB6Vi7RDWFxo04g1aKSDalnhrcrYroRU6xtZW5B0zNtzmSF0Z/IHKgQ
	/Eqxv6mE55WOfEY8s7nQ8pWBBYt+eCndwPi+0Tie2dMSB7aPBfVsTx4yLBgYBXzZHqjb0t2SiXK
	gzSd53Rq8DWcVAarcKZNZUl+C4MzN8SDX5xzehUc2y0QqxzGdKjcBc5mctNXXEQ5ycHm32IA6Us
	ver/rHYhXKUg4DgBJAtUfMGt1JqH1FWxPGvHAVmYcKlKTby6poAaiztAD5YxKLonDAPvHtqr/Ic
	lryY0LZzbnhwXsoB7ATaODQ8M0y9MqM5x4I/RL+O9bcs3rPgcLAm/ssdbHNkha8sMFwTpg+8uz/
	uKg795DzDy8F+rqs4fb9DmlYEoMFvr
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577545ad.1.1793188075435;
        Wed, 28 Oct 2026 04:47:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577315ad.1.1793188074861;
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:42 +0800
Subject: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188045; l=1777;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nnENsS345tQgPHx3zmQ+K+zRXVP3ubluTbm6JNHyQSg=;
 b=h2ds47c2oQRKF1vNQUB/QrBIE9LXmZDGjjWF1lGMsTu3cB1/hg297KQ6IRBkgJXKaeVT7jVaw
 5SRqG1WLBWVCC5cujL3fHmxMtZq0KcEeT34zoARvsZTVwcieLZR8ydF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: W7Bly-G7P6u_oTXaMqEFaxN9boW4GJvq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX6f5uNhnLTffm
 ZdmoPn8LqyQR9xv4aQYAiUpwNzlIXdVCOGiFdDM5OqawKJWurkQIJiQrWchlbd33VCcSqr4Bsxd
 8UTZ0PhcDoW98AH6B+7YvPy01ovJT6E=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1e0ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: W7Bly-G7P6u_oTXaMqEFaxN9boW4GJvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX2dy6W3Igql7n
 38Y3KKuW7finWS9deqD97YXImHKgYZ/Zw/6WVdgyGpzrlTmKaoptOn+gO1YIQf61coN+G55wSAL
 /qQJFNq4svftDJD+Gm79CivCN8RPFKU6O+FfIcNB/edhT/hLnwcvblBVD5XVHO/zuXc2CQTQgTA
 xtZfpiH0dFS5HQazt3d8B+EazEDVYO3ThHM+rRuUT3Gfhz2UMj2bYHxJC5fulM3ZPIc+Gcc93IY
 +VIoqeYrJH0/hIWETgH/WgH13zukXllCHtnGPEr+CFBR/SS0AxH13pPJfsYKYIdGSQp1ySVDp8J
 gCf4xvAHQb+n1+qYZsVcUsPxbJSErP96WqOnRBpmvWEQotytT+8tBnhfF8OitXhA+0ZNGlBqlL5
 dDkPnp32rC1l7JibnB8fE7OBkcB0klChzItmLDPQfVT4i9ZuA3f6T8Cht+HFd/xUuJjlTRxmh5/
 atCFguNk13ZldqiYwAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 347a5a6d6a1d..0f984fcbcae9 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else if (msc->iface == MPAM_IFACE_PCC) {
 		u32 mpam_fb_msc_id;

-- 
2.34.1

