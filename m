Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362F33986D
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747177; cv=none; b=WL6wr/w8tNsFjCnFoE0WIPteT6M6bVq8K5VOshFqgimurY2Afd8G3ax49OLnJ2vIAGb7B5Qo2iZbwtWLXaIKlWykS4+JgFZ3WZgaeDohPjgBu+3EgnuOLw7xDxBsArXFFruZwOFz2kC5wLQbLPgYUuB0zRW0gB+XlOZXcTP0Ewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747177; c=relaxed/simple;
	bh=97oQa5AwjxFqQNenF0OHDjBYeqUlG3QZw9SpgqUFg/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Twjj0tUJdcOLYp6HSDeZsjwMa+rPMU1IuFJy0hqXq/cjy3F2jPOcdmuDiY59mOLNVfy/iVIsT66BEqjKKSSL6Oj0BWPlqMaCb/EXhUKHCV+dfp8zt4bOOvLjxG1C+JyaM7fBTFeze9tk8rFXrx+060rvpqEsiXjd12U88bCeFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmyWobAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsWLmbzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmyWobAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsWLmbzs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmujS1803377
	for <driver-core@lists.linux.dev>; Thu, 5 Mar 2026 21:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aB/qAvAOoxaYoPHOVqo1Lu
	xW1bKORstF3vnraKsztao=; b=hmyWobAZWCng67anBwjrdkpCiiJKDGm4+8AGJW
	HAs/GpY604tzpYZzSSGi8fBcsyUux9Y0TM1Jj45Y5UbASVkd7wSKZ9HgParcwsgl
	7aTjFNtjiDogZGpPpaaSO2u4Y+AYob9kAR1rbNKVuoHPBRL4wEuOZY73I/elXT1/
	68GdSedWfLo11zCR8nnmW781X/UZRaL/wGmARIkiV31omtZLyIM3wBhQAKjiCTRN
	nujZ+jcQlLeuFeATf2+Xp+84QtjJLVBBdncDMYKzfna7j8Y+LDzUoEDmjrkmKRRo
	Vo5hC9nRfjlTo60Y1kO02bvehZ/+xDnPEog1IqAjlxW/ZkSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhtj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 21:46:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so5768456585a.1
        for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 13:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747174; x=1773351974; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB/qAvAOoxaYoPHOVqo1LuxW1bKORstF3vnraKsztao=;
        b=XsWLmbzsVu47qZXsECyGhgQW2VGMBhhbf62TYlJynYt+8Dq38+si3SZzwG24XW7VQP
         t+K9S2OZrlAUW979jvAQ3zM8G6fE3cmIwUPmdhbPy+pE6XOvzY54pzm/lDk/BZVFEQ3M
         LSWYTdolDlXjrr92tVicvuWN1TnLc064KaesbRsUjvDsa3nVWdXHNQjSXdFJw8iJ/qI/
         H7SCGTZazdmUaBTYr8Jg1TdW2zgzMwYtLjXgvnavGXVmnDrsZ4WIXIE94zJtO0daBI9R
         /DNVsUNTw1HU1j0SWocoDtIeZGEFGPEKo+4KRXaXksNhdRVNmUDSoenLuiagzA9fjJun
         dVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747174; x=1773351974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB/qAvAOoxaYoPHOVqo1LuxW1bKORstF3vnraKsztao=;
        b=U4LFgHQA0io0A7KpIn2mXDUrFkNzKMhtyxDolgRkS5+29+6oCxM5i/kOCEYdY6K2tP
         fkbdsY5Q9stkKpP2l8qjwzYkkDG03opEK1JR+m8tR9dmd9O03K4YTZwAq44xTLkiiOix
         0tzi82JNLRVFvAw6srwuJmDT9iHEZxD3thDogXC1SHC4DxvtoTUtNsW+Sa7TgU3V/TT9
         NJMa7DRNLYb/rZ8tvt4fT/9N2Mjd0y/7Sp6IokkrH4eD5HOgtJiZwXKhLvh9P61NH2GA
         lfUof7JsBgVjG5lPsTyMOah4xYTxAqwXw87uLzXT+1ejGUfeAQT6RMeAqoayD7AANlGS
         +rqA==
X-Forwarded-Encrypted: i=1; AJvYcCWaU0Cq9l/3K3yxBlmSqQ/0hA3Ff944bmMl30QnVgZ+N3OKIrXsdOQLn9QQW6sfh4sxjolgj5DLI1VJ6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxroLKSV567aZaH8OOCtwyWuMpupD6/WX3PU9HdF8uKTeZeBeAi
	py0eH0RYW7o2lRPsoLX2g5wHwnHCsjP+Y0AP7SMn7xJF97OSMlQ5+Kr8sTRzs1krBaclm+XLyHn
	V1kmQylWfiTxjGHCbOCr/5nipBm8YzeLiFcAyZyhmeHmQT4QYCmdE/TjGIDlMRtPiSg==
X-Gm-Gg: ATEYQzxlZB7hxbAvYtFsMrrs314KlNf/zFIyIat1HhEMAgcl3jbT7Ki2TSInc0A0xZV
	At6OjhcvNcpG40WulN6juL9sEZar3Oxi6OUcg6e6hbfRfddht3GsRuXJYdI/+7pmLshOmV2BUVK
	AAUDgkOvjMBCDnFenahuum55TYsqRn2csUts3j7MQAuK62WlRYZXLqZUKkCoZp4VD7oKRRmrEIx
	6T9GuNNB7J9tEWbXGW7tPlou+s5bSu9Oj5j3fDYm1JbQKrElAfEcfiFKwoOsEU+fY81c8zvnqzh
	FIc3O6S8AcsakXmMFG8C/4EX05K5dQA346YtGroFcrj1jsF4UyhdqkTw/lxArgsynxl2TwzVBmS
	KoJMFn88q5eyzfEEGQLfSEEAWUnr++9Jf+7l8k6Q05Gcy
X-Received: by 2002:a05:620a:f0b:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cd6d515328mr509285a.69.1772747174155;
        Thu, 05 Mar 2026 13:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:f0b:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cd6d515328mr504085a.69.1772747173657;
        Thu, 05 Mar 2026 13:46:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/10] workqueue / drivers: Add device-managed allocate
 workqueue
Date: Thu, 05 Mar 2026 22:45:39 +0100
Message-Id: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT5qWkC/13Myw6CMBCF4Vchs3bItKRcXPkehgWXURqFQitVQ
 /ruVhI3bib5JznfBo6tZgfHZAPLXjttphjykEA3NNOVUfexQZLMSUrCp7G3ZeWVsWc/Yl+pSrD
 igriFOJotX/RrB8917EG7h7Hv3ffi+/1R2T/lBRIKarMmp7JQZX4yzqXL2tw7M45pPFCHED6ua
 GndswAAAA==
X-Change-ID: 20260220-workqueue-devm-d9591e5e70eb
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=97oQa5AwjxFqQNenF0OHDjBYeqUlG3QZw9SpgqUFg/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmYRxyzCwJtuMtPcmgwwLLBsg2Fv+yT512eQ
 cjU6/+PRz+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mAAKCRDBN2bmhouD
 1yMdD/0Rzss9RkGRF5nKqvTWC/cgAO+EIzsrFPQrQxvOIyduZBpdUjVFhj4xpZwybjIg8hJkNWW
 xK4MLqpSkM3FPPTnPvx7URqpkHMVFAzZpYFTxJCJaEg2QNz883y7WzgF3wPnB3nTAZGTD6SkHiw
 7qtwhrzLR9KZ2RcmBf4P+zbHd6MvF/NjWgpbHf6/JHoSHF3D7e8fX1iWFI2fcYFTuoMLAXE0kD0
 DIJlbme/ltg9kAdbOfpnduvC0zZJ9DenyqGciETdu4u3+pyFeaL6kqJ+ncBGCmHcPyzVi10eaI5
 1dNEaW7ewsE+9TQWQzObBBWmOjRQMHGxEdeZJeToxploMKivPdWsBXLsBA/1EqqMTztOp4L0SaH
 urVc6BYdSEDLI/M5jCBPYAga+DVAfmKi2usRylz7oQm4fKCHHnfFty7UHSZPRkCNWPLcfdbKzUO
 5APGiClU7Lywgs35JbsNVrQ/bbXCjr+OyH2GoywqdFYNVQCmWzPbC/jdoEUPIIxI30hwJh8zG6B
 AM/3gg2VMporqUwUGLbaU2n5xY9zqlaJp+XsX9ghJgrZ0s5KuNb1zKhcVBFvwBgu9BObHEqMWh2
 xZ6pVDucGWY+fjqjq9elSwZ62SlrH5fyl+6CUcVJB2JSFwyaGA933iHQU0q2rvQlDwbd4FJ/ElD
 F32GZygtedFkMRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9f9a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=5RJr-VCCejNB9LTRrg8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 8qQyCtKOqy3VQu9CtC6t60OfB3vIRw5Z
X-Proofpoint-ORIG-GUID: 8qQyCtKOqy3VQu9CtC6t60OfB3vIRw5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX452GLjGI319N
 KXuFuxzIauDYfvg1CTi5vG5EeLpR9YngDZpPBar5SG/nMkQzTSFJI2VTsRA38O5NqMPaUA6GQNY
 tyyoB32D36yCPIqcJ7O1uZab8BjRZaFm8uXrWzTWM4SOQCQpTOX6OJ3twR0ZqYClmiCGykv5pvf
 RGE4AAaunMSJsFN587+QhsCGD7AXcx9f6zmFb7w2+i06RtugCX37Iww7CYNRKtDksESbXyCwwCb
 FwHOe5HwF1+5rXaKIHy0KkxaoU1P5vZXoOU87um4HuT8pZnNwLKSpxaOkYfa2e1GhEObBXSq3Y1
 9XzVq29j3mSTTmAQt3QvgsHeWRcIfcHyb3LDqy4q4B4PHyTlegpQjzAq/02SStQ48MiSuuARPCl
 Ip3HzofIa8gM2/PmQNzqe2ZL4v/nloZ/Uxtm16DmOJ/w9nrq1xat/qr1gVvOXWgYIm/3S3ZmIqv
 sNZrsmeYrhTRqzwHd4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Merging / Dependency
====================
All further patches depend on the first one, thus this probably should
go via one tree, e.g. power supply.  The first patch might be needed for
other trees as well, e.g. if more drivers are discovered, so the best if
it is on dedicated branch in case it has to be shared.

Changes in v2:
==============
- See individual patches
- Link to v1: https://patch.msgid.link/20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com

Description
===========
Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
Any interrupt coming now would still execute the interrupt handler,
which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
driver,
2. Simplify any sane drivers which were correctly using
alloc_workqueue() + devm_add_action_or_reset().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      workqueue: devres: Add device-managed allocate workqueue
      power: supply: cw2015: Free allocated workqueue
      power: supply: max77705: Drop duplicated IRQ error message
      power: supply: max77705: Free allocated workqueue and fix removal order
      power: supply: mt6370: Simplify with devm_alloc_ordered_workqueue()
      power: supply: ipaq_micro: Simplify with devm
      mfd: ezx-pcap: Drop memory allocation error message
      mfd: ezx-pcap: Return directly instead of empty gotos
      mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
      platform/chrome: cros_usbpd_logger: Simplify with devm

 Documentation/driver-api/driver-model/devres.rst |  4 ++
 drivers/mfd/ezx-pcap.c                           | 27 +++++--------
 drivers/platform/chrome/cros_usbpd_logger.c      | 18 ++++-----
 drivers/power/supply/cw2015_battery.c            |  3 +-
 drivers/power/supply/ipaq_micro_battery.c        | 50 ++++++++----------------
 drivers/power/supply/max77705_charger.c          | 36 ++++++-----------
 drivers/power/supply/mt6370-charger.c            | 13 +-----
 include/linux/workqueue.h                        | 22 +++++++++++
 kernel/workqueue.c                               | 28 +++++++++++++
 9 files changed, 100 insertions(+), 101 deletions(-)
---
base-commit: 9739e59909e70058fab7a131d7bee60d447ab732
change-id: 20260220-workqueue-devm-d9591e5e70eb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

