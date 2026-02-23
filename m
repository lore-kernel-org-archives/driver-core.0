Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74934C98C
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831681; cv=none; b=jAC33uNeGPKbmVaZK8WS4ooHy3ni2GDYNGEI5kgwmkJV6of81ZDkPU+VFiD/rRDR7WwbGZdZzX3SZw1fDKCMOGRnMGJDY4lR3N2NUGezwhpnbhOVqS3vGOVlwxgyjByobvM4q5Op2nQLsGDtjexhZ6bVMb7w78kuTWs7kWnPXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831681; c=relaxed/simple;
	bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTCQ9JLrESHT/+XMjE8e5tlCqf195XWD5xfxPm+YXtF7kKboALnLK98mPKKGBWcJG14Tp3ubgc5VED26BWfag8sptJ3nSfPvM0xpsMN2aMeNilR3shuVmdDgd/Qob5KZj64YJlgSIqBnviAZ/9PZrNRiFraZlBkqMi0kMMQ+LyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imRR7dQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6W0qv+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imRR7dQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6W0qv+R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFuIlG1971340
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=; b=imRR7dQaLra0EmG/
	CLVgZzMTSjtFjvJGWsatrgZAxI4+8sXNgtBdn1m6ntzrKLeq9IoCDcJaD4E3psOG
	6JiFR1sLUNsl4jhyyPcb2jMWdYLw+O8Gba1KrBolfaV1Mxvk3w136p/s1b+JzTPk
	AU5y09iTzyUYHqPbbUQ2ARe3wymQutpxvg8ec6ZSR6cIjR5XtsDFRnYwDPw4WWF6
	5PwoXLBgw9oEHZYTw3BPH/V0UYAFGm340rZH25TN2XM+1m4fs5jNEDnrv4D7ISBZ
	D17OfkIqZG7l1taNVj1/E6iThifPdwIKFpB3KgEO4A53amQh1OXpdj2h1s2fNJMU
	fhRdHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgusnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso4386298785a.2
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831679; x=1772436479; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=W6W0qv+RyWgSS8Bv8AEN7ubqKLEvZ9piImcKqZotgfJXskwhDnXJZWJ7zyRbTfHSBd
         8gcLBhwB1ZsSSlsFZt2g+RvyiMK9Uinnyedux7w4LcndZ6DBWsid4JuMs+dwlAs/+Kok
         Jz4W8IVxEuuqrPGHxpWjjniBiMaybzFPWiKU42yZaMfCstMKTokf8lCG6Qh3Bd9po/ZP
         WjfvrXTwsm5FP9KsfiEhGm98cPQo6x+zvN2OtntXd66J+2ckLAgq582XrX6hRK8fy81u
         WCpUQsiMxw0U+Ra8fTU3b2R/oLHIy8eTO5K3UiQStw2kzCpqH83RZ1V80dNFlCojoTtN
         dLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831679; x=1772436479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=XXalo/0PF2kzZSRcmcVtMBrGE1YgmspQmVwIgjr/Sti76JCTFBpZl9ldDLPpMK0NHe
         D757fqfVKxgr5CweNDL7iR9xUxJEFueG3rr4sxgM6cC+kkaXAUL0IQIao0Hg8Uo1pf9j
         XlxMmmnAtYBFSZEu+l5odsTWyx33evRPFXc4hhVebLbjBYEuvWSsoCMzisXoB7nUmMdE
         fSTqs2Se7TGrNf6DMt/HEIypkqBcdrU+AinGPDSEine/RKIPN5fNCan8571A/w7+a8/H
         OhzpMg5hE7nNCr5GRZzsTBzkcTT5nfGY4KSic1wtrbND/iCsJZzX4n7yeBp5SJVP++Gt
         sKlg==
X-Gm-Message-State: AOJu0Yzn01cnfFOT4VBRp10Nlx3U8FnQQUpXlf5G8bXcDuPMqYDZiq7q
	SLkMrMPODf0bhEEUDsW5HmQu0/ULfRstu0+7uTj9yQjYA1BJ6J6kUcpxbwBrCfSJyflNoq5LJRl
	w0WJAAKX+yG2cppazQh1zDnfrrkhxpiLoMXBw8b1oS/nL4hzj0Tx9TiQt4kULzrQu2A==
X-Gm-Gg: AZuq6aKxxfyAzd4XOSbcKPNzuw6LT586WW878ZeahgkE5Z34QENKiZiV4Xh27+TX0yS
	yhqpQkUHOMTCsk57YlGYl6u+nwtW1U9R1mlD8SRXL1SqSUrlxEfh1uRgsse+9IlRDibF2lU6DRc
	1CQ/g9U9KPnLdZE/LF/ohoDpaOLwaJJyVR5dDyy08ok3mE38RwzSnaDZ1fCavjYULOOddv+G4Jm
	FbFdedSEVmcmbJX4NbZ7fSiRw52vxs3hAH9Nw/pb64XkWF9Q6N1eFvCrtTmYDJA1pfBFXhBzJos
	OAWrLDOZ1sgI3jXoOF6ZZHIiLWLTfQvdCumDboMTU7WoYj9jF5wEtpCazvFE8PEfqT47Vd5iAoz
	r4v5jtJyhtH2C3wz3sXCn+nTzp5M8rPVa+rOt9LR2xNwjSQ==
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953887885a.24.1771831678592;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953885685a.24.1771831678191;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:35 +0100
Subject: [PATCH 7/9] mfd: ezx-pcap: Return directly instead of empty gotos
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-7-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFsdVOSZjLWU15fu6tXhkyH5o/JBZijmD+7F
 xJuktpOs16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbAAKCRDBN2bmhouD
 11hqEACQeJWBcnOA0HqzOwEkeI7B9TgL3mN+MiZFvfd+qLHOhNAN5GPqKlAoYXkpu+ggDO0qWz9
 oYB5wpEIyViQz6F7P1BbSk7JDPJNPXtSO8eCIPGH1pBauIFXYzYhV8mSvy5NBR7mEMYSKKu6Ki5
 c2HHxYRYV34xSMpIrhaZh8QRVvQF+02ORACguJKiqALZysCqUV7Lssv6LmOneLzlHwOmppCNJ2o
 TB7ZxS4wPCl6edlbVzZrMMFQ1y+DfwdvIux3JU9oT1PriOQ+M1ocC9uh319Y9tCqJGVUBStU4+p
 SMFlYLPr0BTBAPNFFombh5ZS68gj4DqMJ6Unb/ZrUU/4jkXJNA681W6H59pOUOXo8QIziJ7gdHL
 yLif6Cex6xL/Ap+5oN2poWDdGsdcuj15yxkdz5lyJyRdBSslo4p7EGLMPzdeqY79LEwoqKafjAa
 vU3CpssLcVilmqPFQ3SZBwFW06aflTmZkGUbBUB/mUUo7I8VTS3SdhS635sblTp41z5mhW/xy0r
 vvKapnIZlD9rOw5Xxg19beyLy37OW1z/5cm0mAYucel1XB/13lDUq0v86dixoHMc1KA1qdQC67y
 qsmaAQwI4e7mlF47O+yr/jaCE6/Z8x6wiysP1jZxhoPdIGKyBILkDL/5cNMwz7/FT78JNlj7SK0
 pLo5wqw2dA4WDpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX6mPp0wmTf66S
 aYhUs8Zy4/kBw191Yta4j/udX7/Cv/0dspyybKOh3rcfvTW1OH7SMLdDHFiSGyeTN2ohyD0lIV6
 dKYMdzsqciqRNtXVgWi2DOVdsFqqgaKUdsYOgrm9vQKgtcmZFWmANH1oOfPWd0HDb3sqerCUSFj
 AVqmPpJhSkveYdqHqHg+FvUzbbzENyGytLmj22B9kO0LZuZ0c7hzvvaAkm478VK3D/t2R2lN2b2
 IrPARI2U0oanymAGFW6vZqNS8QcQ1NOh8YvbHYIHfvbgcM0+k3gk7cCn+NAVCVYBnoZzORGzk5V
 O9NjmgKeLhmvoZx8IYrxOGkwE+Yp1E97eV8Y4SWgqGskWXgEdexTNDNFlm7WsjfrEAaluRyZL7R
 kbRQe6xjxSPF5WxKkmC4ydmlogPKgr1y6n5V864qLBg5MKk9HtiKExe9zwA7X/Mr9U4aZQASOT/
 asP5QlXznITZP6QELXA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c017f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BpUlhJWFD4eoFZN8roi6lJtbEi6LU_fu
X-Proofpoint-ORIG-GUID: BpUlhJWFD4eoFZN8roi6lJtbEi6LU_fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 13cb185638a9..b929559d84ae 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -384,17 +384,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct pcap_chip *pcap;
 	int i, adc_irq;
-	int ret = -ENODEV;
+	int ret;
 
 	/* platform data is required */
 	if (!pdata)
-		goto ret;
+		return -ENODEV;
 
 	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap)
+		return -ENOMEM;
 
 	spin_lock_init(&pcap->io_lock);
 	spin_lock_init(&pcap->adc_lock);
@@ -407,17 +405,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
 	ret = spi_setup(spi);
 	if (ret)
-		goto ret;
+		return ret;
 
 	pcap->spi = spi;
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
-	if (!pcap->workqueue) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap->workqueue)
+		return -ENOMEM;
 
 	/* redirect interrupts to AP, except adcdone2 */
 	if (!(pdata->config & PCAP_SECOND_PORT))

-- 
2.51.0

