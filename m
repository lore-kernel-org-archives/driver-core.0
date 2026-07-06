Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2894C6F11
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341952; cv=none; b=D8cPp7lB/ZG2/JgVcnVFXpQ5UVi64ZGwFxgX3WzlKQifooYBl7tEYTO8pT6pImhpKl6s3D9PaIMrDSdLZNsH0N+xKFpYUeTAqHDfEOq8TDJ+KmnAxay1q7vUNyrgF8I9fdDtiFmQNOgm1POcV0SJYt536pFFY5Ldvud7zEJvpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341952; c=relaxed/simple;
	bh=uLXyFApgr30TTHInPgHtMrjb0JTo4ifQAXB9pVDm0JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgL33lAyYPzrC/wGFm8ygPb8zFQsTTa4lu7csZ+pasHXLD8nwQkHJZxHtEkCdCDzaYXaipMTVvfDVMzkH069W+tcty2Zg+dy1k7LtQADm+wNvhfRp5Zs38Oj6tKmUCeFKh3adwenRlxyLNXO7TqoDFcz6jXx17EUwObhjRRpGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzwPlfeX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IND9oNhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzwPlfeX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IND9oNhh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVcS219069
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zax1X4XbzWPUvVXMfqloW++pJk2JO1xOHc7DAhzePfo=; b=WzwPlfeX2hhdhkII
	9mnkZNBd8gqlVcTDS+eavPmnbC7oMoyBni7znpijGAwUU2FZu9zSDwwLl1iAYZ0K
	joB+HxaCm+VAbrupM2n2A/V5ikNIeDfyidY4PqG+PZFZ/FOU3Hi45HGVYbBYL/d/
	y8TbNGeskzt/7YM9d517vcR3/L0dhwC/CKql1pMbkioLHRcLDrpOUb24jUmBTzae
	cm0dQ8l2vMPwZ38md/dVJErOhBAPAyq1GQDdUmXsHYvppqFuSWBLop/RmoitVyCW
	fbEl1tKap1vDrMh6A71dJd/+N4ZEq3d4RSqsPDBlUHc5UfeCROUdWNOdgxxJiuSx
	Ug9/YA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs93gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:45:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9a2b95b5so463831085a.2
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341936; x=1783946736; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zax1X4XbzWPUvVXMfqloW++pJk2JO1xOHc7DAhzePfo=;
        b=IND9oNhheJ1Fkqeb/aT/YyI2YSrc/50Gy/KVgux/ZXQWGK4xRf5N1PjCKimfReXRvf
         8f1vjeFj2+o2bWbWSOatnO9I3c2aIqow2zikqU8zI5pGao6Jeq2AUFjBrIVV9XA5xAzG
         4X4sK63Tn5ymDMlVbLPqYWaBFS0kozpztl8euL6p2kJHDp3hCb5o2zXL1qrr0PAqUlr4
         0tUS+vKmIjcFo9rM49sNOBe695/vkiT5X+ADn0g2KzX/4cTpNKdVDGqrIVvy0caoHJxP
         c/PpCE6nzUhmALp3sC8JV9m9XBcoUp32ffCS7RAWDe3U2KO/DMoYOpVZ+z+6ByK94RnK
         fTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341936; x=1783946736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zax1X4XbzWPUvVXMfqloW++pJk2JO1xOHc7DAhzePfo=;
        b=TLRuIGHQl5kHOzduyuqFb+SnLVvRnUFWpibpFhTHk0tXvQxdejaBqrZcqgvn2VZLzH
         /RBqqtPVv2bdC8jjFpYSzuwVarelmsmG1bB4Il4P2/sjJTjJaOeLdjz2OSYICFGZZDlQ
         U15JLlHvW+reX9AxP1TfjfUU/3XMdCc031V5gLYPIzrX+9N8q67RuIK34Ad2m8o4p60f
         q6hxN+DysNcD9nO8R7sVr5bgP/zjRg8xLv1XVKfSuZmq02elAwrfw0+wQhrppRnXNDjP
         +lttC8LJZhvXXIejOUgP5lxV5/DZfVsNMLxvesgvk8ruaCAc99Ab+N4+EJZkz+hZ3juk
         7Vvg==
X-Forwarded-Encrypted: i=1; AHgh+RoRp2UsMAz8HXqFHPVU3mgVkjO1DMCkrJ0UQAR2Ev//rakewfKHgbK4KrwPftdYnyZ1Bne+thcG4AjibA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRaviXDTiXjcIPxL3eNfLIObAnaD+YqXWqvxZwDum7qemm1vla
	/1MCTF3qR+vpLKtCxZ57X2+yEE4R9TyoQ65Vqx4wDGAITyMdDYCwwG95UseyG+zu0/k2qZYUwua
	49svVwkneFIHd6Unfhgq+aAFChTes47V43ycMqzdG5UPoSR+rqHFvG03PlWqo8PbvEQ==
X-Gm-Gg: AfdE7cnJUHvLtzgbZwG7POO2Fs8oSBruwVVk+i6y+qF+agMYcphXlcCEsXYZjl2JwGF
	ZCbGsC6dUkRKU5CQR8SI0zPTV9cWS8v3GnTGq3uuidU5U5kkX9cTVpG3Dlx0H40GS3Be6awuoAD
	AvirzHUj9Qm5QatmKvdIQGyOC3rlkGNHZjtIxLK6sVELex10oAoMusqDzXtXR7pNwJsjDHD4ggj
	HV7uK1ZS/QHtzAZouMLLCkegBcH6ZJZUrYzHyzVVtFKnHICsJsmFMvXKfPGpdkWcnXV/s2S3LmP
	n/DbZLyiH8v7TYQh+DeYNdCB+Tsyb3l75OQA2exkcXPKCssv7x5ScUH4U+RYBzsL19tcsIHvWG7
	61wiJyxj+3BuQb+RLGrCyazf34S4LPGqr9kEvXFWP
X-Received: by 2002:a05:620a:6888:b0:92e:76a1:96e2 with SMTP id af79cd13be357-92ebb5dd29fmr49708885a.43.1783341936051;
        Mon, 06 Jul 2026 05:45:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:92e:76a1:96e2 with SMTP id af79cd13be357-92ebb5dd29fmr49704185a.43.1783341935528;
        Mon, 06 Jul 2026 05:45:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:27 +0200
Subject: [PATCH v3 15/20] drm/xe/i2c: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-15-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLXyFApgr30TTHInPgHtMrjb0JTo4ifQAXB9pVDm0JI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M6Q7+TAJQm5eCNk8IdPrpLpvdQnPdPUQTjL
 v3En+SR8n6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOgAKCRAFnS7L/zaE
 w8sVD/9FSqpOFwI9xNUjUgfMc/OBmnlJ/oPR6pweDlgzV6UYHA7LfN0Pjqwd4sMEmMh6Wsnob5d
 k5RtgQ5z9XWNhsvHI3l87qGhsD19PPPZHOFoiCxPJH260MhNlWPZYBx2yweOyn0bN/V4wFf9g8E
 WRkPyr25sOK7K/X1ANFFS59a7tIa8LC9kv9YjPcHIjH1uFYiVkWjnW9ppECk8kTdvO8SWTFM7nI
 8WP23VpiT5mCUgLu55gknhLZB/psW83c9DQEEkuIrb0z/cGLCuYvEzVUn0XKpc6p7P3YAtGeRnl
 2rKPZu0LokRJGIl8gLTIMk0QIaIpPpX6qBRIVqQ200ie5Fkt1vDv1j03XvgAsNfgd5JmcOmDq39
 ANn6wdh+tlp175G5+WK1dITngNhOENduAlOc76s0TszKG/mEZ6hhU/iuqddrZCHMf4UezBFdFuo
 DHZaI8xhaz9Xh24q/ti1OQO4612k/L3WtW0Wy4N5V4C3miPGqdxvznUUccBigJrbmEXGqBe/vWN
 5ia+ZsPJ3kddXqmkVou5nmLPatbfYJc7IG17dl7Yz2gVIX9MFpeeqbGt/5nMDtteEtbn7bgghy3
 ZJq2uY2OlHmwjmbGZVO9n7FNg59XF8tF1/kAFLXE2UeZXrgpGxERgwyXmv61/0L5I3v5f0M9vc3
 R1N9ZRzP+87JgLg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: zmAqtxDVd3gobKOOc-lw5GMbMCl_FipF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/lnnKDCnIpgR
 LVfABYZV2l5Lh6yFsE+KYGwGFPP+VWOQuMEcCnvRC5KMo1RnMawtu7UIBf6SIiP/AZORoHL3tJ8
 Cyhkbbz9m4pIdOOJNOx/Yc7GVeoZbxqrklLSY2F0U/+vBOJzSNXvItDAKYQGnkfFIvcLaKKnowS
 w82/itb7p8Grf5kEMbHu8UUOS0LVPrLtkK0ZCtWUAyNM3GB/8rj6UYDzOocw0mXgCKZUEeciH8B
 zVTipV6VjOVkUuaSyhmKzpJdaqOl/OGPOub04bTewtM6Vn1hMXYtDIOgMIRgz06Ce7Y2je9zx6t
 ztK96S/oBsTg3u5Hq8Q/pj/pYRLkg2aQ98ckODtZvlGp+q+sDYNZQEIbACk5YYwzIO4h6MEelMZ
 YqK/yLS3Lke4eLLlJdFQg8hO1amT09K1cV+02WLrCKvPHxAljL8eJ6cRjDqvME/62a0IWZgCOTL
 FZPnIRxv3LCM8dSyZqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX+5krSzedr4xK
 psG7Zov7yIhGAp2ZKDbOFMgHW+tkZA07C5L9OwRetsp++/p1iCZkJxMmBjdtxAeQ0PGx2F1RZGU
 yoIPXYDzlxwl4ame/C1T2GoqprbgB7k=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba370 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zmAqtxDVd3gobKOOc-lw5GMbMCl_FipF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..af4ebd93ad8e68c95a14cdf99de0959fbe080354 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -123,7 +123,7 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 

-- 
2.47.3

