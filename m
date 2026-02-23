Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381BD34BA28
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831683; cv=none; b=XtajrLs0Hb7o8xPMMGphubu+QfAvsNOMi19gF+OC9lsKARBs3LrkDrjJKkoLy/4TDe4cFwMpJJltAMFsnejPu9iiSHawiUy+Nd4ACqWIMT1c8dqprCa39QbDveYietITeQZdF9887Oukgb11HOm33vNEaa2F9fWim5w5vpvKSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831683; c=relaxed/simple;
	bh=NdggOG5IZsY7LXa79Nq7AL/G3ae8FCgqBbMs7M+Uv2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezsplgPLrM4Flyf+p6dEaIVHX2uQfWD6UbpEstn294pUUUanxP568Btx4B6sPUDS2A3H2puqV2cfok87IE+cirVDHLRG+TR5w1h30MktYGXgmqxFm7N2l6aTJKODMM1GLAW90Kl3lS9lO6UxfONaxfwhw/wlZEodnDr5/UvITtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OR0kQOaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAG3JdFm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OR0kQOaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAG3JdFm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5QShA2917608
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=; b=OR0kQOaV8mPN3yp4
	O4ooXQ7AMGaHD/vk0t/uniHvc39ZF0bY6yiA6wRIgVnd2zwJmllKwH3nmURftTsR
	uRwNUWNzXJfjcBuSn89FBRiGhezEOAu8mK/OqUxVcj2jUvYHEK8Pe1WR8DZgAVgU
	v8fkhvAiCSOAsv07CTnGUpakv65K27hZ7OnJOGXCEYopS/QA3HFpnFTX3AK2dheg
	lEMRXRjPu3Q7GNK0ijrV9Nx6jFhWIWseomXEojpOGB/a6tiuk8J6YLbmzSw6wfLU
	gkL6XIel1ooBiXNQVu0rStqwPjcUZuBaEceEUqO1/gGjxd/hJlhc84MkaknPP7+K
	CiTQyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603ks6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so584088485a.0
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831681; x=1772436481; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=;
        b=ZAG3JdFmBKZ4a7jCiVb4jDQEHsDvfuutv5YdG0Z0HjOlu2bNKdiqhCsc0ZKFI2PgVP
         zV4T3wnDcWrMhcU9sVIKlfMxkNgrFv6t4jZBVaSKa+Ew91dxqjYB8cFc15Tu2UvRf1aZ
         lEdeMqFvyH7qluMotCw/KQ0AfRAvMADdVnvof6SWCDVuwPgTGCMf4Yo+5x98HdjDZzxl
         0elRDSzThCVjvZnpy29zdmv2vCMSRTQw+mWDg0iBlzov6dUaZX4WND9qdyUhleNgi5K+
         fEXSEBdmzA7FI0DXkLp3xDGlfUVyCzMU1GHHoPBuLC50RzRv1MvaVyJp3EyphSb3kjbd
         xYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831681; x=1772436481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=;
        b=dBPwvG0XhO663nuWz9919qkoPLbklUrL06fIcJOzxgvrBEBmTtsK1nUHSYGdoJlYWU
         RxOnxDHQHvcWBwJbfob9z2heQ4QRQ6SOUWsUXwkps3bixWjoKxnn5DOj0MFXpRSkmK2T
         S7hglJmKwnFhc4UurDQxZ65Jy4sWsHc/zp7RgyE+83R9Dn+qCzdKpibIw7Tak6kpQck7
         POLxyQ7eQF0Gg9t+1ewHBS14cIhtoWD+ecDBNSTJJQOctKCcBWPUQlCkg4beMZed9Utc
         835hCjQebaTZHOxrJCUVYX0IZybhz+ru0Cas2J8te+rn7V+g8iJXT9zJ15RJjJAu55AB
         j+Dg==
X-Gm-Message-State: AOJu0Yz+Oa+JLsxwWVKZUTzb9Aq8tmhoaHHGKhJ8qBV1gl18O8wF1kwT
	3jyBvo6cs+l6Mzw4SVKo3RmxrtiUoJZDLCXvZhq18A07lR4fp/v4u+I9j29VknvFTjKjKU5i1Ve
	yrb3zICywZ8qbeWPRKE2CwdC9iNn6C90I41rNSUXzxeSTYxBpTTj1a2Z8e5OvdFP/PA==
X-Gm-Gg: AZuq6aLCKmYVkC97qSEpsdf4AQNPT4YHyjlltPvfefJOP/Zdk4/N+gCSOGuxXfRYjMg
	ZT5sU7yDKIi03X1ecLWAvZy/jegVGuTKbF15yyG/xh+W59TX0erjOyzgsJwNafxmqlMWqqfO5wO
	Y9tFHNqB1G77iUlg/pUf3XIS6qnE3SZROeIwwzdZfRrNsHkOGtWhJm/kxTf0KgYct2utEpSWpr4
	U09HGqSDG8izze6NyQRy8hWQG0F2up5Bh/4LSii99J74F9YQbn/jvYP3hGMQqGewtOQxFpqL5nB
	moLPt3TQ3+BEOyas9NMYo7vRjRJfmapBlGBZ1vYrBG00mHYNMQsFDSg+NDVaQVx0WbytgrFX86m
	GXpxLFqDwRINR0TlIGACcvfe5XZemZTr3idpDmOdHvCu2GQ==
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr953129485a.52.1771831680578;
        Sun, 22 Feb 2026 23:28:00 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr953126785a.52.1771831680071;
        Sun, 22 Feb 2026 23:28:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:36 +0100
Subject: [PATCH 8/9] mfd: ezx-pcap: Avoid rescheduling after destroying
 workqueue
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-8-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NdggOG5IZsY7LXa79Nq7AL/G3ae8FCgqBbMs7M+Uv2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFtqPjY1qKyahTuUblrNnMhZfW/1VNWITp6i
 +IhXm5LfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbQAKCRDBN2bmhouD
 15FIEACAA9XT78ap89BEm6isO1fI6/YX3bggCblWINXzvuzlJGfwB3B0VnAFlTD6+y1zI1shA7J
 Eiiyd/S8i/yKNwjPmqMBhZrjNVdSEs8HdfTN0rvmHhgNqSi8Yyoq1gFJ3HtKmnFyA0qHpsvUpq3
 +VQQwHfPysAby0QYLjXKUwyRzOo41GW/vhM/sItWsdQRCPnEzG+O6ogAT4WiWGcX+Wmwk62STPC
 ief7WiwnKfWJXzieUqsRZVGqZd7mXQsNUrfcIBv0DINdyn0j8odj6D6xo4jgf49thmMDr5CAefC
 yG5p8y1WdKdh+hD1ddFb65TmYSFU9HO2AIzdLNTly7bNQ/GcQlQ97HomBZKTClUGuzTJhLmuv/2
 mwB/7U4KZr9+/VWT+spMEVHe2wGqrOzEKaxbaEIvN8DqgrgFvl1x1qp5/O6Z8UODnFLukCFY707
 gdcJRcK1CKnClIWcJ6w72wS1ItFXBTVBgstbzQ33MCr3IzqNDgTDQRi8lyJXourEeL8wOjXajGb
 qd6HYIqo1vKR5qtCH9fYdNXPAwCavd26qPmcpDaOH3omR1dHCo60MJi+A0c51ZTYkHNd02g77Zd
 835Pl1A8pEm9U/0tyUb/tGHKgz/oaVXIm7/AZuCOdlDJdniUZ8/PBzIMWpPeXMeLh7flqzKBr0S
 3fbO7I7VZezSo0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c0181 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Iaj16dx_8Jk8doGcJVoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfXyHkRYjTj3VA3
 gHdloJ1bqWnTV42cvOsqjucYEFllW39K6hHg+tk1bq3/md5kzfnPUup4hQ9pbhF6PD9lCDk0AAb
 fUUE1dAP3MJH/Phc6CwSCOtVkWbrLCurQ4NI0rpW5t3KHnRa9gi2KzrjyC72TmZPbz05Comf+EL
 /OKOuxm+KnhCUaHyYHS1TL1Wy7LPfSyN/xzV+Seww6fEvAQRvyUgqyeBRr2FZCvHSjolTccarzt
 TPPwy5Sa8deY7iqs1h46lOZp1lMAJJdKpDWdotvwgb9oykq5P0xyJEmDsmM74d8ohlu6U10aP5J
 uwQQtsaB+9EwAs09dvMFqSFrlyypR6W2+lkA5nhnqFFf/9suq1M4NphhlB7cJymwvn4IvYqymP9
 tlTu3vEpyIMKfB7cZWKUANLOdZ2W+ua8TIpRwhcLq7i4bWcc0pp7eC+ONfVCgFRCuVAVnPxMNZ/
 lEf7RTKSWZbMy/4S76Q==
X-Proofpoint-ORIG-GUID: 3Bg4D0nr8lXmrzebnbiV4bReSeO9U57N
X-Proofpoint-GUID: 3Bg4D0nr8lXmrzebnbiV4bReSeO9U57N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_create_singlethread_workqueue() from earlier patches.
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index b929559d84ae..a06fc3447104 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_create_singlethread_workqueue(&spi->dev, "pcapd");
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0

