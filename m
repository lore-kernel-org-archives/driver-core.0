Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BF3C553F
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442055; cv=none; b=i2Qv+OhV/4JcaWePo1K0ZMwYfHFSlpSNK1sG9E9Nc4ijV6oHC7ZBytN1+vpSMAnb20JRmfAo8y4Y/+wFKdcUMxStylcSDgmTP1SxrGGjNpi0ZkGW6GgCk2KiJtqwpvnce1TIzdFC4b5OLfU12NBOXngA3cq/rL7tpkLqey5DaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442055; c=relaxed/simple;
	bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4WCtegzcg3niXERTKs3HOX6LiialbZlzVqc4A0LqeXtTBMibLb4VCWdd57u7de4/SAVxGbABYHo5rMhOXo4NqfqXAdZCKPopD+hYOl3w0UF2W3VCnQPrYXu4w735ZE6rbUMpA7DiM3L71ihs/zZTzzZkMm5pmVfnOSdJacSVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pck4sEto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQgFn00w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pck4sEto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQgFn00w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUTo1775343
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=pck4sEtouPHply+j
	N4rqGchia3wA0pQadXpMbBUeZqsKdaVnQXkpJiq7/Uhvogo/0VbIcNACedUfB3tY
	1zGnNcXUNnE7hYFbKU+HCyw+p8q5VhpWb6+KylcZHGpKTquJwDl//J6q/CmN5C8N
	49s3yh6IrwMhqJcXgptFn96A2sP7uA3XLWU3C0roLx5R2AtiXLajIrVKrEj1HVhw
	h/gO178lgx6HTI5EaG/460XCHqcgWx/bCATgEYHWItlDttz4CONRtfoh13wuAyXl
	5DvBHmCQv6XXr4FXRCiGisUgfKiod9UPpqVyUDUlOBjvG35XOzWUebJPkmBMhKg3
	yZmGlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39fsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:47:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5444967a91.2
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442053; x=1792046853; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=NQgFn00wNFW/Vh4mQqGgCWsf2X5hl/XSt/8OgC+mKxTijmlbmAVFXac3c6QrMmXRWu
         fGLvgc7vvcIS4/B+13uUE1kyzSUyvkFG0y69OS++c0bC1CmhdqeYMf3VJKN2TA5lbyeW
         l845n4P2QUH4tRN6+QAaKk78TunqBOGCUP7XOn0h6CnV73G99Lm8kD1EkBU09jHQHN11
         KMS5lXglzbxHG7YwydMy7QWudbrkvPdHr+qirn6FQqjf4gaf4FDOXDfeaA/92wHg6Ir4
         90TE+8V6AH/262GibA0N5Yj4oP2C6/iZj3rIkPF/YzhjkeNtDvhbyPNZ/o73yCnu3x3D
         XRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442053; x=1792046853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=pzTY+PuvNf7XvtxhqmIldK9O5oaJgOBKcyojyPyRPbZ3iVRh4mWkbTFyXbRe+I6JnB
         zJdv0qWxukpaNO6alF+kRmr1t/eNAAYFbW/ivODa21O3s5FAyveQwTrid6rtxrEUGUy+
         xoUYp9/c9oLAPJ65e91evobNI0jYFHJUsHzyjuG52+5WbCqwYWvgjIQf5AFqZcKvPMfE
         OmeGQw7QFnvFVXKnB7CJXxYk07eb0DuX4LRF2vssS2o9oZKTW8w+0V3rzGti7ZpbQvDz
         w/3CB85ngINOXn0rNGb/x+pUqS+7lKaL5U5hvrHgeKZz4FaHIdjALdV0YO1/8AXZ75zb
         8CJg==
X-Forwarded-Encrypted: i=1; AKwUvByaOdeIN08LG7hyZuQA8i779xeWDjSxVOBXM6cAEHWEuE0d1RNGeWzuOSgRERZ2MnrHvJOnfZ7F5PO+3Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLYk65F6JQScaWnt2ovhPHE/TInMuqzy8HtDridjDH9l+kvfBU9
	kt2FmIU3UZMsgJtyM1Y5SgtFfi78RCbgwVp5xM5mVg0I0e4cMbyL1WKkjwoN4lkLUjE9LrWmPxL
	8xQC0MWadGhC0iG1kJLG/a65u1Kztq7Ab7ZJawhIhFDO5f8kFYNgBNk55fYP5yqoVDQ==
X-Gm-Gg: AYBFou2bS8MHSw0gkRb+PZMB4jzwcsu7T5weKk03LeeZHLSOzXv2kR1wMD90amTXl8p
	5Afgy3j8phTz5aqup5p+PerylsyLjyZAeXKDFpkbEucGzYeYmzuziD/sbIlq/gxSFb2o41tI4Lo
	fwDkVTPQwLuT+nPed5tPk8H48WpJ5VMGD3Uo0LTmougBBHq/1tGTkIe2rIiqJ3sNfKH2TIiOnMx
	g3vqa0noGaxfQX6DdNfWozOaCLI59hf/7chSCBz/3GT5STxL2pybKnzm3DLKm7pxm7Io8iIdUm1
	MmKMeFd/921KJSMOxDjw23DCgUjDtWScmer5ycCVX827HGBUyqCXDX9ynyAY2RKmohOQD+VCqjV
	7PC5baqfzGi/OCQOmEe8Gxz25/BYURyghOpkWrzmuCJD+Ko7O5SgxclA=
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138295a91.10.1791442052705;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138265a91.10.1791442052227;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:31 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:11 +0800
Subject: [PATCH v3 2/8] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-2-35196c2b43bf@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442021; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=+oEui8TWP9g+43keyW0RGKQR6one1M7JZqzaByeLJ26nfwJu/nWDLI2OcGMGJDG+gftRieh+t
 2ePmuc/bBELDbzzZnDigIUCwoY0oUrx1oo5x6KBw/akurJKSrEEEgwy
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac73c85 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX0VJTWAwuExc8
 woGpXBjh8R8Q8YDo0f0xp9hbt748ESJgAweC7zATpwDrt9TOAUYfsnfdWX9Q4xpkvJpW1C04iNp
 LOSF4DAdCswABY+DVrK5FDIrQz601V8=
X-Proofpoint-GUID: byWl4yBzgFH6AcJ-1_RNkeqnLqqG2LoV
X-Proofpoint-ORIG-GUID: byWl4yBzgFH6AcJ-1_RNkeqnLqqG2LoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX9PnQe4m01nME
 3pu8VAmlul9+4SScsHAndPa+56Mma5hL4M42Hj3LPZIK+MwcmIUp0aKXPsyaGucGe4l793486mB
 7QUd70yVCPIA1oguQP1/chfeXgVb9M2laauRvi0wGcRsq37Jf7OofreVgTL3/uimYTxJuHjO2oO
 2Ml7rKiN9xlNqFfLTfppRAPiknDx0z1+txeAxyHTunQoYhop0b3KvKGfq+5RnpIxC+5ITkNg6pm
 C6OoeWh2u0cYb7KqokVwr9JoUmisYWhJmco02e+CrsIYiZUIiIVB9IBD95xcHLz613Fre+gjr7M
 8DNxdBJ4r+bRi73Ji+bkeJ9hXsNCyZW2qdevFlYST1FsRaQrboMKGkNn0aiUR7+UFPmF/IRkVzl
 JbIn/9NHghjIbZNSgIN8NseXesi7rsFyd51Ty/kcd7LwPCsnJfcYzxY75PDMqTbUJbxTBl7iONm
 Wl/0T2Zr83NzvCsS+6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

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
index 6da217abf689..c68135ee0ffc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1

