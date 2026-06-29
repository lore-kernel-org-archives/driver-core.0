Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE9403AE5
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724416; cv=none; b=WuhK2zAwvK8Pw3dMRRUxYha8YlT44MDUQEC4qyRXlbO5YlnALhqpPhkoKA+mgjQOQSJpk3Nq50p15wligSXK5PzvZekAzmhzjs4WFRsq4mfxu2S6T64NqsEGa4VSuj+azA1iKg4c5i57OuLa7ts8AiH91cYzhgCDDq/qIAsusEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724416; c=relaxed/simple;
	bh=YiZHp0QI3Ng/8lAx//2O4lFffX7ntR6tJ9zCtpgXyiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ka9lARfB0eBCJiHugYoi+vrNn52cxM81wQCwXwdVouUF+DL180wP02juQG/5eyQQS5wpvwXN1Ig6niKcMHCBlf0stMr2lOc7HM3WgteQpS0dMACxIdJ5Q/wAsyPEsN83nbKb6TdUFl/LTZYRC78qTl7cQ/e45+yTmS0MBl4trWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNOiOP5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqXI6W12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNOiOP5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqXI6W12"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r4Us2076412
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7o4Ira/aNei8mna5R2+2B+2M4PuHYmEv2lnl6X+uls=; b=nNOiOP5Atvc+atun
	45mZNhDx7q6EkdNaRDhn5LjMh6TLUjFzUhycSyCa3Z0uv5nBqXMOPxV+uSAke4Ku
	T7lMTA/09AOUgNWuRqRQ+d/zJTddMeOluwU0/40N70wtzyAnneMDXch6BBr7w998
	tDB8wNA5lT2pZlrzedKaDM5b64ztVvjDf0Gbs/SGiB48jRd7ISE1fLOXWLc5zYf9
	Xd4Qzg/SINHf5XYSXSgrtlAjVF/y2vohT5Kc9Yr7j3UtRtPUff6ADT0Wcj9A2m/t
	dgOrs/9D7nyS3eyWoxlNwgPKeCQ+C9ENwgsQy65LkO4wRNDRrDi8kxXeT5Vapuqa
	11H4bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gknq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4aeea5c3so110844385a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724413; x=1783329213; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7o4Ira/aNei8mna5R2+2B+2M4PuHYmEv2lnl6X+uls=;
        b=HqXI6W12uERZ9stm5trGpFo6sLgP3vWxFzhQy+K/FZ2sMFd/ns0rlRHSNDwbyE2a9v
         7a+0+YRWoulFW2n8mRuDsjUb6Is5DrghzHv4Rr1qpejKUj6Q6G+fItfjXBvgSyhg7nHB
         amyumkSyJNEQMR/D2D9OLHYmfqQ80zzvhOZDBnUUaSa8Eit8SOaqG3uIQPPQ7HoFebZw
         Oe2CEjykbaovXtNw7hFPLZ6eJzRqtPQVhlHRNc+cIajfJkOMkC6Py3ql7yAn0A9P8JwF
         Rl/wg5Ys8ESnjJOOjvhOFVqoriGMe3MNoO8EjiR0emmNY1xsvL+YZZDU6PQr7eN0FcYE
         ZE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724413; x=1783329213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7o4Ira/aNei8mna5R2+2B+2M4PuHYmEv2lnl6X+uls=;
        b=sWyaXIN8jJPf/+nfxllZQsfqJxX01NEu6wjWJFvmcnCPVImz9QJ95jkXKr73QZ0wUF
         InK8Ke2ejdX0VXMyUKyr20q2G5ake24YL4h2x3+MG1NSoVp3tYgEA09rL1YTralp5h/i
         dz+8HQ8a2XJ3tpc5m6sK7IFgDDmb2K//N2//j66bob1HP0JgLGd5P+6Z515meuaCz3tv
         l5r9Zs02SOAleK2rOlkC209Q3gZWC0YXP3r/YBtVzTHlWo4ADWZNmf/ci5hT9c8F+H7w
         qUA35K984oJG/l3EMkumGOQ9+3n4X+w74TCmdAjwJEXJBm0i30994X2KcJIJPPfSgUOO
         85yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Zd5gqkyE3WGHPzvRv8Cys7aurwicn/z9iMEapddZMr0Gn5FzH5py3o8RL1QP7DCjr7GaXHDRFyDw0fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy45MPgeWxxO8oLK1ckVSSdwunqgSeULU8ZilmH+b9cZZKOHNh3
	uxNkHYOuWyf3UoBhFvdatrAevBWHyllpbv6SxadThpdbPXXdSzyZ8m3CPNruJfbcW+HHNxij8j6
	h+7NbZc9HSlK2rVH8rC5+XHaQU30BJQAfun9rtizwT4FqRTqi5C47Wlz4ZOrkLjwg4A==
X-Gm-Gg: AfdE7cnCxpWMDk6nn83nCbII6M6iZe3vP16r5wixQmrHIi9QxuaXwJ9UozbwuZ67UP7
	TSH1iFdXgc5Hho4A0cfLeHbqLdWkcb4HWqUynXnJqyWoiPPY+vk/wj+oZgw1rN9UFcNhc5qsbnW
	F/lGPmiP4vOaNd9fP+eL1TE/cjciAWB85M+l7wi9LSevZagGT/eWNabDcrQqym6xozrwQiRx21l
	RDlzVjIXDafAR5UZYG6p3d6pYKlsZEdJ73MohMFPRd6p94BX8fZPR8l1RezxWQ3HW/JuZj1I8ww
	YxaXsnQ7jKrVUZunJt7cO9QH83Gijv/PrQf3HbNWypKnRGh2bVWL0UMspFHbwQuCDGfoIL3RNhe
	tt4f3zCLkaOPXLoR82Pb9QteyAxEOediveuChvq4g
X-Received: by 2002:a05:620a:1709:b0:90f:786c:4a82 with SMTP id af79cd13be357-926032cb1f3mr3581741185a.39.1782724413012;
        Mon, 29 Jun 2026 02:13:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:90f:786c:4a82 with SMTP id af79cd13be357-926032cb1f3mr3581733185a.39.1782724412420;
        Mon, 29 Jun 2026 02:13:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:34 +0200
Subject: [PATCH v2 11/19] mfd: tps6586: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-11-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YiZHp0QI3Ng/8lAx//2O4lFffX7ntR6tJ9zCtpgXyiE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcRLZEV4wuAyM1XFVhA7zrIOgiuiY2Lgzwoy
 WvXthoR70uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EQAKCRAFnS7L/zaE
 w1cGD/9752d9n7/+/8T9TqF9iQ7G9zlOuyfPubcVf3N8oYfxQ+0pZy96O9R+C0vx5H1PXXRmjn6
 1MaB3Vt39w1WVmSUyqDJ4n8WB24AjpfYGTwAbI0o1lZERogpod5E3M9QPnnVwD9wPPhllmUPty7
 xj30SvOca8pUgImOxyER+gR75EsHqUPeWQasNVopAFx4mS1lo2/u1kqscnDBeqg6Y87buduJX0V
 uOUtSHuQ7w2vlhQ7NqgZHurmNliUGIpxzWfiGSSX3BK9D3AkZSWvLW8zctTGAHCPG+qBFzRVpQ6
 0FqFad0z86W86hiNnldftd2a9NL8dP7GfTyhmmggP/mzqh8x5/bDltnbVjzYzBrVM31qSvqxNUS
 YPD8Ey0CB/ZX/lcEsaoLCOsAHRQsJE+Pt7xReohmz/oBquTOGfSFv1jtm5jIY03sh44Qnqc35QD
 CAnMCCHblZZB9eCTh3y+FCKJXfxLvwMdtbMKOLf4azEE/0LB+S0PZrFvyocZSoMtKLtoR4aExim
 DnBupTzpN+mh2vq64tVXBcwg38pkExWqxEX1LAQUM/UmS1ByltvukbJRxqlHs8WD1UJ+3oTsxSJ
 w/mPtguXJ2fFOtqgczI61HeMKF4E2nHfhBqpM+JhFX/aZ3O/llYHjqsfXoVg6qzpOOoGiwcLxSI
 BcmB/XQ48OIAacQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX+livFCklJwfm
 h7t8L8h/ryG0Vdez9gYIhZa1owTOmcWn0UW4AACOkfWaxLdtoZHkugw6G5ytVqKaT+8DGAEelhF
 JIO8qV15wc9xyXRSZI4sJDgDs+1TrcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX3qpzI5SXsdzT
 LyLZGF0LAgQVQczNtIqiI6IFaWqwtulFNWZN/jUt0o4z1tuEGBfXC5RLebmSkBPL1H6IrWWsOid
 Y0D5Jmo2xupxFmaEdcq8U/u/H8J84LQmhx5ZDK6WTfEx14hvzfHdFVjoryWPyUnPfyLcvSnL8lV
 eMCo1Gu4TyD78pcl9HqSrtMgrZoBdH0SL9GNMSvxqaN+Pwzv/wXwtTD9uyimvD0ITgm/OmucsDP
 Yoj1g6GsTSzr3G0ZS5gcRfXw1AoPsNlsKJkqzS8I+sv5HNwotU0Eg866nVSV1VlbwLajGnCYzJL
 tj0+UwkZzmCwARI97qUe2XUNG7TOQ3weyp1iB6OmfyarrFY/g0UqVMdfhjGkgsGR5iJwMBf7YHW
 carkdHR43NoPd6jM32e6/6TAzyQIt/04oSzCpdB6x/0lKd++UcNAJRj8alVkLzFtv6rc6GWhd7z
 XhljNbxFQHx2FpvppVQ==
X-Proofpoint-ORIG-GUID: vf-u_F_J-Bub2fq_lgpSfUlQbKTtrvnj
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42373e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ESSmVKC5p6WdXJfq0SwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vf-u_F_J-Bub2fq_lgpSfUlQbKTtrvnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Lee Jones <lee@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603315ba76ce1fc501c908f1cec0d16..3cfd2f02b62f3cc370e0d970ec2643b638fd0fec 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = of_node_get(subdev->of_node);
+		platform_device_set_of_node(pdev, subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

