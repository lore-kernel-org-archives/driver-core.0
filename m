Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D8420465
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378797; cv=none; b=RYgSH4tkYTugaK7fdFvXG63Ravx4b+q/vKXLAWGVaQk4A5WHClkeKURQVQHE97k5SDC7Db62Eezg4CgSUKtY6Vf+fBB7tmm0OJspIaCETPI2WXMFzeiXk6D/wOiQnUp9vdi1e3cLK86IrXT+Ihzp/nCoUv8qMZdX7XqCiAjCTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378797; c=relaxed/simple;
	bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyL4mqKhqd+6IgqCZ/oCfKXxpVv7CUcWuCb6YXKLN92XAnrXE/dVM0j6kYkXjt4316luRY0puxuisU4G1uWHB5WnTFqMCaL3rmk7i4dcOxMqPb1XZNNTDcgKDEeWlXVK5QaXlokiVZCgBlwBobCPzbFztSTkQbpA4qdm9WtZ/Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvCGd3b7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHIIeHEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvCGd3b7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHIIeHEe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8Sibm594729
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=GvCGd3b7ibiXNVov
	KGk6RyollppYoLgluhcTje2RH00hvnrzULm+sVBo/9CjHL+KQjbNG7+UrSm5TsFp
	oDOW2/+AxLOFkLsnFyyZ/iUZ0JqyZhsQGdTqE5dhQKAAaXUdLcRN2U44iHuYtkMS
	8AcygZtX6xVz68/d6aGC4UKivxT5syVmOcfHu2sxh6tXutAQJAbnT3AdODhGYo/x
	Ks+kk+z+IODcVD+rVfd/4+SvzgKpaqYXWSJ3ufqqb+H1N7I/+8ge+GUzwpCm+Pat
	2OkaPc/Ms3op9Fbt/JqvBejUjxVCYi3ccjEFJGgV58PdtfQs9kMiaILbHNEYL05q
	gqrHPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr7tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:39:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3755094a91.1
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378794; x=1789983594; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=XHIIeHEe1QCVzJfptRXjbpBt0vSuZZDIGz55R+ZDC/8INc4NgfHeKnWSaeVbbBhbBy
         PPH5hAaeabtjJowN7gea3titw7yX1soPuCyAf/FAGqeNNr8DFhnGYSMV94GonyaYGboH
         pdt1fb8MqPz1LKp6W1j9AhkbNFW/hiEuh6hJq8yZwuNO8RdnVnzIYk9Hg4rKMAZ5oY8G
         pk8YfT/4NSgMS781mVgt+iG0RSMtfxeMVpUqBdC/72pMbOe1C1HE95aC61wwS4Q2PDXa
         kSPXL7zSgisrP3KnRmazu4IycyXCpPNWaheYSpczV8vwfqGjjUrnfLkSmMH7O6tUsEGO
         gVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378794; x=1789983594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=N1r/KQJapNjpm40tSaT7ozeae/3kiPvVPCqgzAnYrnL02FS5R6VrVd+ksdf9ylBywZ
         RtMaP9ruXuEcJqwr+cf2pCS1jYIpIse/xGqX2CJhgWu9bJRIZ+JWCBjeHCnf+upSuHR6
         pC18gAYhFAdPVjQicauF+pUx6orpRZnrALMUTSfRX6XpUpShYFrSmJ05Q0y96SR0P9pN
         3wCj5nV/kQJxHPs6RSDPz7uteEOpbFo0b/i3f2eCUSsnGWi5NsvJoM/2yxYns0u8lf6Q
         7DUVvCk2aCSXUJ+3n3/gmN+342U13funBcPK8hk+Tx9cCsoqUNwtmyRUm1wURfGAGric
         mjxA==
X-Forwarded-Encrypted: i=1; AKwUvBzAJHHvPDb2wWEVMSXxTFeanu+ZRYbfieu1L5hMENS4hO9bQTcC5NY7+6hGaR41QpZdwG0OnE8CxJQZJA==@lists.linux.dev
X-Gm-Message-State: AFuF++nRmxMG3P77Sq9+0C0UFpzS+PVDp1f2gaprrhYDnFHbkcHs0tOS
	7fOTGOdnYVYQGgAhNggZRomGGMFGjU9Nt9vpCJMlK1OJFMWfyRvqgyVesbKURi7VDZWZkQJGejr
	Mpd+rMC1PV7yJRJcm5n+PYu6wOfkI6cKqTknmPnZBAqlewUIn0JRkOHAA4tT8SX8hcQ==
X-Gm-Gg: AYBFou2hQC9W9eV5y0D362Ug4X+A+Ugljl1Dr6i1NkV7v2VEr4tYrOz1o8hGAShe9qI
	k4OEeatJLqzWs4vyt/OBaxHAo999mAWcySHeYG11NZu7kg7nRHd3EH/sBV5bbRAgXFGXhOBEO8W
	TzzeoSZ8UrKGxSOd0KChRwUlMQDhbomjGtrTsRTBLBiuinAWnE5QsfJgd0k8+PN+UKMSXfz1yJ2
	zyHovJPsXOcGpl9xfXitpOA0e5LE2GX+9mXHGNL+AhrsPHj3FxAmDeY778z00IYZ9qFS+bvXEiL
	xGmE//FyoTvlp7bom80QT/Y2+Lcfq7Oy9sKnjYuMxb76ksVR9EmmcT8KUjS724OR2UsvZhOv6/0
	cj7V+Bv41gmEeMlB92/2RoEleNSUMALUH7kJdSevLcIi6asXBH3lCvz9P
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901796a91.22.1789378793863;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901732a91.22.1789378793357;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:50 +0800
Subject: [PATCH RFC v2 02/10] arm_mpam: Fix MSC MMIO window size off-by-one
 with resource_size()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-2-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378759; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=580EJYrRRaQFaJTBhTGLIBPMftpDItwYKFFvVgVOBnIGXre3jEMO3P5n/lbQty+QF8/WDbE3x
 ujX3TeCQLrkC8JlprOX1id1zXH56ewGS0cLUd3xaxTFVmX6xlGuwBU3
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: YcpQXsiLqm8gXSPh31gpk7jZPgk5m-WF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX29OgEHzNFMw0
 AhduzN4khj7aYx25nzm6Bw86DXpAtgmUsmo+d48RE8ugffs/LbXKMBe9Ig+6noXMHw4FY+bOTWP
 9RKgBVy+9HOoRQlDU3AMZLkPALXM3Ko=
X-Proofpoint-GUID: YcpQXsiLqm8gXSPh31gpk7jZPgk5m-WF
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7c0ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX+N1hznVh/DPc
 vkG5TokjhDEHunkkgteER3NcFrK7CHCkIrYUerxHh+9VHTh1p0IeBAgcTpZ8N0xgC316Yc9+Tw/
 ovg4NqtDaqEvrjBULY8rBXHOtaB7vI3Rfo0FUdlcmSEUk3JLbAfTZRDouIRmQd/lDuNU8a8qhoM
 3Q9Nl981keHKwagb+NTSIxHQzGbHT6W60ABJ1P+NFm/0S6mAwMS8tYCfQzNdGPLnwPGI+U1o0xc
 Ykycca7cqd/KX8kUy+SVzE7+Jim2ZS9oqXOL7pdFik9bEUtWAcJXBFTAmeh92DMuRaUtBRizsGv
 3UWSpYsVDz0aoofebiOdB+bqqnL9YL2OAidsy/ixml6SDJSiiASH1xABRczVX4ncnIDztt0xWMV
 /ZGlp1cG/kWynwVsON72AvnaXGj1BmwFsXN0sZmVmiKy7MTRJl3YCaYMsGWVCmuEkvlwf1WfZgE
 Vr++Lo8xdv+/ri48qAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

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

