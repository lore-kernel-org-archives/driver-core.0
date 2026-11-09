Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218852;
	b=j0iw1MGRKwW/We32/2PaJGsw5JS6RktIlmg9dJQum7SoQ4aMIWqHE7UrQETgsi/Wo4Op
	 N0roN9WK01Z6vu6Hq/LVVDFO6a61Jljevf5BnYC2ZPAIlZMwrnjTWk1+bAh+h7uRrBnp3
	 ISNf4nKHui6gwolywl7s3HZLnnsqAIEO8AtUZkPaRAOsiFrKvwe0mBf8+Pma2w6oJOC1v
	 Ct9Koxx6LIY1v1PdT2hcIP2HZlS4Vdw4DBZ8+XDbi0iAEQko+91Dc+mEmsntbMPGZojIn
	 gDEmNxXmlqGy2mUiMaA7qLdhtw0VK9UV17v2/dmCrIShEtFiybx0hgXIA7fJvDIlfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=;
	b=pIoIq+7qFh8YgHqWJipUACCxuaEhg1+1E7P3A2f47hiifrUpTz1yE3Hb2HHB9mXXPvg8
	 yQBLJuztZZN+CMrhHh/BDH4zY6098RavNCyMJwEteS9meMxTaz5FLimMTjGR0xfSvg8bj
	 Qcoz5QyEtiH80fqPcrR3AjK1enVyoWE3wV8LKONjAjPUAiC+EfLPNF1+zzst9+weiVxC6
	 pr84xw4PcyUA3Zjb2iQcjAJJhomGn/2O//0S4i+dvXOsCA7Tqi1+X9gBo+GMIvePOLxqk
	 Zeux1B2U+eQ8JMhi5ZhKj3r7IAdPyvy65jESF+OISg8NgE2zEeWw3OhDrxLaJejDZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qb863sBI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gsvxvet4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEE606A322
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DEE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qb863sBI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gsvxvet4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v18m551294
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=; b=Qb863sBIHPMRDAn0
	hes8I7xH7m4yMwSRxsNLe/4HAEiM+QtaDNVayXp9m0sO1myCv43xXTfSyHo0UfZ6
	XOgdTP9+inmJQdkuOan2FHy+EW3bo+ccojW+OIiW/UjB2oLXXPFJ1KRChj9WRS9a
	4ZvldPqTgTLeLnHnojOY+PTMFnMVBu0VAOa1mVf4jDlB7CxQAKGlY+DsFlnjfXgx
	mgzko6BcUp844bHQwbRmDDfNVTVXeaEsBh0skLlXH+tJuhYtIPa9c2e2QH81h/dO
	c8zFafIkUW4TZ+0h1HZ7sz/K8r0P52vsI7LXpuqxjTMSTzwHJOEN0ZGCGAiXSimf
	qyP1SQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2n5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:07:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so699497a91.0
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218849; x=1794823649; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=;
        b=Gsvxvet4VJ8ZzHz70oe9neCIM1ccMCdpEYW+OYKIZDfrz/iXUp5FxfG97MoTQg21j6
         vlG33rbIJLOJWt9MwfRjhnX0zva0kDVMz8PQQ2PiNGCS9T0YVEU8zfMhEDF4dAIt4d6A
         8W+caL9vqOC8LUCUnCcag8/N+59aPYAiQND/YtdgfZxYsIfMy2aZ6t3Kw3WdUPXt5FDQ
         2x/go3cvHGTeAysI2gxi+eu4/Yfxf/YoZYV7Vu17npx28J0WOjiYGi+55qWhcoKDXVBy
         BvvJgu9HMcIkf7NXR0nCdOVwpQieuKZJlzu3oztzx4fJNCdO77+E0bFlADWiMEOQWBSt
         JYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218849; x=1794823649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=;
        b=sFgzsd60M11ztWzTOearndg/Z4+0wrMJ/Cr2XExqas0X6ZtGBm03mji7P9M1frh/LV
         V3w+7ps6oQK+zw6tq+efhWA8DvB2q1UqsShD2L0HB0+VXyUWha3Sm5Fv4r6goUAgwN29
         8IEaV6ncUesQ3rFoNLinxd8U6//Hg50rm0KsLLv4wdtVK5TQJ0n0finVGgLuqt8sNldD
         m6sYYpnis1YKZz+wgmPcmxlKejPXrE6B5MxR+i2fYjbAe/FHrY6HTCvjcYlYq6cH5SDx
         k5Z+oB/7CAYktJftyRxHicE2tt3i5ExoIEW9pkewR10oJ/VEasvTEOC7T7x7zE9QX+lj
         wrFQ==
X-Forwarded-Encrypted: i=1; AL+hErHv8oJ6bkevnjE7l7JxM7Tne7wdznoKBF+LMo5OmoEnDzh5XSI4xa3JIYw9Fi7SM2czscA8szZiOjBnxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Hao95tCLzz27oY04jqsJPnozsyh2j3o2OirqOLsXV0XV++81d
	J3zCiYebO6Vq1FOJVmmcP+QONDne9SFO56UECM0aojywwTi/V9qVlleu628GQbS85EFmoJmMY/I
	/1zfK9892P/259BRL6cunzYIeWvtci4rB5ECThMq+jq2QzsCWp8CgW4s+Ibbp/PgiDQ==
X-Gm-Gg: AYBFou3THpu+0Uxl458enM40DIWaR/y0Cr6ZsbJN+xAgKhuM2IVJu8reIz3iwW8ucHc
	0eJOFrcHMLQcckp1O8d0/+w7FC+WrpLM+m2PsIamE9vMw3ZOLhCK7Ei46AEZiJP2YdIB4b9iT4a
	qsRMZ9mixlmSo8Qdf5wWodp8rDn8qyWnDrx4tRTFqm+NiWztgib0pUlZSlAVc5gozWXnmo0p+C0
	8id39Sn+g/NCfGOFfIucSFG4S4oj4LCgi5d3GwX+qZzLjg1GbVnp25/wZz2EshESuICq4BxF6tn
	TPXeemnWb+zRYDZe025HxZpkBOek9lf0r+cPbOTPPmxz16na6TmiojpFknwqiea6Kj+UIpMdve+
	n8eqrXok5RbU6SiDuzaWxwxVMf1Z88sETMsD9lxvlMmLH6RRQJAWFUDMO0l7Jy48F+0RjD4N9sV
	eKx6i/TPbXH1Lf3Dfh1RBAN2s2b3dV
X-Received: by 2002:a17:90b:53cb:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b12d5ef7f7mr3152454a91.61.1794218849156;
        Mon, 09 Nov 2026 02:07:29 -0800 (PST)
X-Received: by 2002:a17:90b:53cb:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b12d5ef7f7mr3152416a91.61.1794218848687;
        Mon, 09 Nov 2026 02:07:28 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:27 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:34 +0800
Subject: [PATCH v5 2/7] arm_mpam: Fix MSC MMIO window size off-by-one with
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-2-150335a79381@oss.qualcomm.com>
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
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218815; l=1979;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=M5HKKySRXJjebPuf/KLcSrGcy+Dr1wAQmzTykz+vO0Q=;
 b=Q4QHKXfPyNxTfeRfp19balrlzMk5OdUU4eKG1aMyyqKAydxt1uebl+7SdXXRpbAEmQKQ5kN5Z
 6b+fSzkJixxCQwVFnssHT0MQsX9Umf3yTmY82A8IiSaPn1rVqaz8JAS
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXwdI9bduKvNV0
 nmdOAir1DktL00NsXRwpR3X87AM4sqVuT7sNmVLb4lU+hZorflVuAzr+FUjRohUJ3aUcrO2gM2F
 L96Ro7En1vn1YH5hCYayqRreoObj1wE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXyoOpaVTXYTbS
 DZKwxCN2ZyUphv2FVlWsvGYMCAHGkG0QLEkv6Scl97JOMgOKCF6eY5hZWsLkjfdJSvEUT+X3hO3
 uIqmENJTwy4KuK074b3g8uyUCamltESiGHlJVMVcSuswi9LX/9XcDxjWrhAHZDl3+eR+Ka7bRk8
 mNe1/rv0pbSGQCJfChtMNmAcj4tNAjBzwbwg14uYL1s8xGwN4KUolH1Afv5XryhR6n2ICZbAqau
 LWTR1NewK2EjSnovbJefC6rz4aXiBnuuIJtl4j/JV7Tpoy1F67BAdCqO0AK5iOFKxvd83Bzq8fZ
 q8t3dfXKbO1RgGv43M6eZ3lWz/4iWBxtRnsVIV5x5jNjAWyA+Q7GTtAZAA0CBTgXjMSlBYYrXSk
 Y+l8CTQf2rXo4bb3wcSnm7qLSE8tdJ43euM7XaTR3jkVqBJMPLHV/XW7ddC+6l4H72zVVtLpqz/
 wDkL2hsMiLfLsy2YscQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af19b62 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=i0EeH86SAAAA:8 a=s3E7sL18FQBPR4dFS-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: nvAs5mwx8CNfTg9NaUEK8Vfdq4FRmc6C
X-Proofpoint-ORIG-GUID: nvAs5mwx8CNfTg9NaUEK8Vfdq4FRmc6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

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
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 05f785328dc2..bea231dac7e6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2506,7 +2506,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
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

