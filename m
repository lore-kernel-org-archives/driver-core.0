Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF192F6904
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951101; cv=none; b=hToy2cSCKfABrHoA5t18UMZQ89vVJyqqmfIC2A5lf++Sux5QeWD3CQEz3UaE3QWQgBPIAq1NWak2W4dIhQWjnJmEqrjQdGKU4JmVjb6cfiaY7OP9tDqyfXy5ewj8oQKdvQSck1O27lSZ88j1d86VtQ18rBn86pb/EeFVZekZeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951101; c=relaxed/simple;
	bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHzwHmSSz5hEpfQk8YGzoQZPjzcxOyU3uMFsGvq7PJFwpSzgHUCsp0rDbZvRtzjUS4AIwyWHYgM62a7ETLlpxhnVmZbtc110O8dLQJNxtMZ1b5SqAL1Hjpo87emqGIsl8R1qtjJ1i6jwS6rtTU+uyuFs3QvBXKy+FDFkJWuDqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg7QXMgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlOviLyK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg7QXMgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlOviLyK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N96VI81204755
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=; b=gg7QXMgwOV1shweU
	RcerV4o2vU+G0PAZKT37xgsx1XatL3FYPGu/gX41xZUkofpC9P0GYLlein6D+KDw
	uEghegjDPPw9vINbXnFQeKoT9F17MvLu2/PkYcA71HBO2y/0GGBcZ6tgAn3dSLru
	dKlItWKwsvh3dGq3UtzPScZw3oVG9MgF6ri4t+TmdbArx7Qv9sCzkAaB359X6DEq
	wcDHWDhKNehWssmONfMoxmcFpB5Xcym2LPhv0DUfTnDBaeEmZ2bV8MmubF6AyKdg
	+qvh5YssFPbg0mGgpQ0d+dbA2NB26kTqNX5ib9SLZLE05tZ6nnh2tUvgXvkA4tU5
	AbV+UA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqggn91jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:31:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so122951785ad.0
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951099; x=1777555899; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=dlOviLyKa79V2jwerUhs4r5M7tJRMmJQNsLtzddQLbe8RQP/Z+v3OyEiYA7r+JLQ2X
         aoa4dWMAJ5UHstWD/Khl2QOK0l64ke5UtQp/c1D7sVD+2yp3TxsZ9UpotoUYRpeU4BMs
         YnU41FgNsPtDMmG33kZX5M875sdvOvaLfc25PZ/QyuyJzSZ8d9T/4Gaxa4Hf9urPwUA0
         t2Sr8tV+owZ9FW6x8yfF8D57ws0VBLxWJ93+e/VX6LHkwdf8HLQnNikMiGRYKNjGTXS6
         lF9o7KLNedaDXotxP8IROqLRcOPcLJ2FNFKxxL/h554DdsIoOWEzaaL71NGfxlIUZt3J
         i/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951099; x=1777555899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=abV4VcRVlTxhfHIqOW2kHNrQbSKd5iTltYRTUuSGlOrARmYBmn6G/EhMy1L82EtNFz
         EbX8WV1qIQCgBOX9qi6p/oVoGS6mGqkMcfL6DBA6qZlGEh0WtdALcGWCBXEDzuRRs8eR
         XjCZb5eEh5ngz5qDN+N3ki5dtS/WaYhDL0yG2W9o7HJbBUINddo/sfotxJVcM7Mh0Olz
         lYD/J4uHVeoKAaipue9fpPs8/fB0VCk5XP90KkhqnoOM9bKLRUuT6FaCQCUFE5ABX/qX
         QtJSnF5RaaIigir0gyDCZMtfuQCk7NVb0EMiF+k2damzJUfleIYhQmz2T9hiAT9i4bRy
         /XTQ==
X-Forwarded-Encrypted: i=1; AFNElJ92JYlpfy8zaRIuWY+yOfy6icF+xND05sbItBMy6RrBRv1LeQ6DaIVpYMtb0rRE7iCotA9JCHeC/g9MXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRMXFy8JLYdCYS5MY3b5XIcNDwtuf/xMeJNNhKFVQLWKBywkbO
	iUa1/xCd5hCrIfYNiiy+XscYS839+EcSTyDYT0WkukFr4A51mvxQctZ1zZk3fJd5u+0zsqNZD7/
	YFgWYUVcdpsUG51TjI2wXZIm1ad53vo4R+ozw/I6nrluuqAVnlgsZfDdihDAQUvMrLw==
X-Gm-Gg: AeBDiev2mNTGX8d5RXsNGteUEN1h+5a8Ff3h+HQ0KUINX4Slzz+46iZvws25uXigrUg
	Oe2NwLt9EkgSB9hG3BRZXO2DOtk+LCeb3tGGZAhRqepzD//bFN+ftns1d6B9o8B2ysTr79vZenJ
	ks2FUwxxlxfhZSx3Pdf6IdtCsDlVzMK3yDA66SkQSsFaRPjNgk0TeWuBze8FWu70UJEM1kFaltz
	vof7BsuIjDNZwRG0wjOIYz20KbqhM/h+sFKUDANI3gj4XgjiqcX7SgUAPgPCzOtXRk9jrn/ryzO
	XJUaK21Ph/df2xMDeuiz0DItCuC1keEAFaXAkd2Xm5GQrRMYnX+ZK35pjGdzC0su+BJmlps5EV5
	zVwL8dXcN1Y+1FzGAR0laOQnCUj7j+BhB4QUN8jEhA1WqPnAApz8KpfU8T752VN7EsQ==
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214914185ad.26.1776951098370;
        Thu, 23 Apr 2026 06:31:38 -0700 (PDT)
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214913615ad.26.1776951097773;
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:40 +0530
Subject: [PATCH v2 11/13] media: iris: Select DMA_CONTEXT_BUS to create
 firmware device
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-11-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=1132;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
 b=bQ2hOZeQXviL9nyF3kRsnvZT4zluN72vayk4KkSLYRcfIp5ZJavRUHXeaeh7XDtSU5FxhOQqO
 0m/xHMr57rABgvyiSf0X1xDEkWlvlf58cukHzX9Ec8r7jTMd6Tw/pND
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: SREaYSt8a96APByOJgGoMgttHevPGHiD
X-Authority-Analysis: v=2.4 cv=YZeNIQRf c=1 sm=1 tr=0 ts=69ea1f3b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LyCF3VY0PmB3I9bQj-wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX2r1vDxBoT5Ha
 qpecjxOJsFN1/yHLp2cSvGf0cyVS/AZbJOsBq95AqFWePpaNYSpuT2NcoM7sUzXvLAB2JvoU66X
 ko1toldmIsSvfWutYvjqyFXOs9B3kxUfTYjKd1YZPwIaDCx4m/dXj4RyF4B2NR9Pk6Qe8G4kgdp
 4dYbMTCre3yR3uofw7eWMpJAxUSoKkDvle9skd1REUzfPICrPMT6sDjCp2QEEDX430BGry1EQvn
 yfR5o/FNwX3hDOjtiMjHd4He8n6r4htkMqV1TNjDgONvda1mhRe7udKVGjyf95yXwF6LlYNgqDA
 6ws2rA3XN+P/MRdwQflZUukvM2dg95A2E5YEaCHvSpT09J/i9AqwHkA8SFFzgrdloDqOVIze/l7
 13Lg8PcNelKGjFXsyeMdDa5s2/78eD3EZMZLQTRbK4ZM0BTPow6ETdIYUMhtX4Ec52KtWqPZbMr
 xJqBwcFu8Y6/qaZyReQ==
X-Proofpoint-GUID: SREaYSt8a96APByOJgGoMgttHevPGHiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230134

Iris need a firmware device to enable secure PAS (peripheral
authentication service) support in case of non-Gunyah. This device
requires its own IOMMU context for memory isolation. The generic
dma-context-bus provides the infrastructure to create the device and
configure its firmware stream ID.

Select DMA_CONTEXT_BUS to ensure this bus is available when
VIDEO_QCOM_IRIS is enabled.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..de1fc4b07ff8 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_QCOM_IRIS
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
         select VIDEOBUF2_DMA_CONTIG
+        select DMA_CONTEXT_BUS
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various

-- 
2.34.1

