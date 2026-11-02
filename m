Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630822;
	b=QZznfE/chPuwKmnfR1kDX792DPm4i5gFOyD3ZQFqCrOzU6M5QnMKteXuItT+n9tINNGt
	 hcYvhuLKnywTwv+QgQ17ZeRIFn6vML1nH/EcrsfMjHDWd/8nO+gZq/rW4PIwB5WyePL1S
	 6/FVGWmOWa9+m35KKGerunZw26hG7iqsli1RIKh1x3xu+2y/gcViM9hqbyuoB1seFdZfa
	 3JWIlI4LkWgBuGrEkFpkARoHMiyhcZEphZLCDCAp1ijHceoC5QW6XODKiZCMB/JtscC+J
	 xyspSHzfa364tZ+dvYhGyM6IQ1a1f+6yTMTzfoTt/9AOAKK6VxE1Bokfu9dWuafeNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
	b=znvH5LztUz7KRgGpc88puDkSebaxe/QAO7uNIDvUbBMk1bQtjDOQEmjj+SDfTg1efqAY
	 qSfeSMa35kp0Y08RykTyvtx3an+Yalpbsb4UVrUGNy/i4oadYbuVXNwuwr5xeWpDo6iv7
	 EcFz0z+hC6PxiJ50sCmlyV6wZ5iXpOEdenTewcNekonpc0tpaZO1zSDq4iBx8qf4HgsmU
	 yc7dGzXduC25S4q92Ru7CRh6g9SG6e9Cm02cs/Vv/rweLk4U57ESaHA4BpQMgWGL003Qi
	 9Rwzji7SfItjJAAIX7Ds21OUZaduJdk84VUPCQGmMSg4bQ6LUi9YSLrPZVlQjQb+/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGY7swdt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RbhOWx60;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF616085542
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 14:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF616085542
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGY7swdt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RbhOWx60
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpWJH477185
	for <driver-core@lists.linux.dev>; Mon, 2 Nov 2026 14:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kshJ8ilku53BZA7u6QxWWN
	nkRsV6tkRQiXc+t6nZXtA=; b=iGY7swdtNcKNWt6Nr51LKWCaoLr7rQqSjYKbLi
	djhl4Q/lc94srtJ56alt5d0hlmRqvC4lrZVFBvUHVJzQNLu/QbpflRgWODahdLBu
	jjuA7nLYvlAFtnAsI3EI1BT04Wl6jokF8XJ96zLL+TwE6D/2igfBzGTPiENbvQRC
	T5xSRxCciXHdYefnrhy1i3yXT9iLJL++1DlQ7WguTpzJHnc0iwm0aWCv3sqRyb8L
	+fYD8KINjTdQsNci6iAuzNGtAAkvxPKIxfjpXT0nVIaYiJQOqviUsBpYXrKAosdI
	M5K2cPBEQ5x3zie+z1/VV0YYAn0FnBCv8jL5igxzwuObnNAg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19mav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 14:47:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso820992137.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 06:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630821; x=1794235621; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
        b=RbhOWx602crxH0Sstp4mAxMreLo1kqYIn2hSkiotdFqQrzoBKLIWdbpyY3Na9cCvnv
         x1yR/uQaIg09MLh1TXQDNwPw/8/ooWAhCops5esung8x8WmTnBJHNnLOcLAwNZoi0KE6
         GbCmJ3hzMgc+uzBWayuvemBpxprEwywCftEtWdkCjRcF3G0KI+fmMQfg3+AwhcOeLnaN
         cVlcC/seZABHdEPqCB2qoUG9iw9zZwxmcr7MLe8Cx8278ibymh3rJ/F1strIcC3dXDdq
         Ed4k4KjW/u0AW5FDvJG/hnoILejmljQ4gnXHJ7RhHDw72jwQsY5wYBhZ++9mM1xb41Qn
         3DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630821; x=1794235621;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
        b=wTCyYtXh/CaDBub9UX/+cTRYD2lU8lcPzOk+Z7XDAuCjbl56ojh9v2prhIXqpbAcfC
         KXTLGHJZt91CKMcc1SOmqL/6vlSatj7cKPalCOy328q46iI5GoP1DjFW34q6xZwHTlMM
         K/vWdMqjpSHsAwYP7DEta5TnTP9I4kln5/XMlheDZcV56dlQc7JLyOFKxwD2wJcPrAMo
         zlmm6xn+DPKQvB7Mzf5k9ZIY4jOaZyp8uwe1m63mGzwUpKGvAVNwF6ew51NYQrBaxy1n
         EpEcpDPQAG62SLv1a9vOoVq+3XFVT3hZ8J9E0hGDyE8lutplVWNHuRPs8FUzGM3Mf+Kk
         NVQA==
X-Forwarded-Encrypted: i=1; AKwUvBy1X3HNXwXpF8o1MMs8K+UgEWqMkHEZ9vUgJP1mR0Wt7yE8gteNvCcpzG3c/GGoeglNIrRb8iGWoZB1mQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8fl98OXiRdXchaPbPxRn3v4yQgqnW2Sp/n3QhIQyPLBpjDSj7E
	YXZ86GwCCx7JB1q2FGttJ6v4iOS9oUgor0URcqOdb5gurrLfXXS/2Wzz0H0FESSEPcK8oRtvROM
	pKTssr+zhi3nPYFISlk7e7KvanttJoZxuBbOAxjuHbFMfh8yzN7KlAZbDS00CQ8rNOg==
X-Gm-Gg: AYBFou2M9lhsmgqffqedLm6z24TE+I0QkqnJHtkg7wZEwp4aiOukVbfgejGBW1LrYLH
	5paDY2BKd26yHoWzjEP4QZuS7ooIg55crkdo7BVcFRLK1WfMgirjt0jU5zIEifsfTDHkQTVPpWa
	SFXHhIev19fXDo+UevOgDWW8RDw5SRHohP0pkWRX3ilHFP+0vbtPxqHAh+t1CkfBjpn0HVaDdrf
	Qg8UHuj38/bbXRySN/HFe/tVugQfJSkpfXA924DF/cP5d9W/iKM/nsIMc0JomHLHfNJV6fzkgyg
	DFhniJcIB0AjG7sewEKDIbyQyR1n3AATX6qt3HQmzf61mqmwmcXGbYUVbscVBtGqlWrCULB2vyb
	wiE9l1hyn0EscFaj3Xz2kwQI0rAp/2sr89LiIrMnfeK9u51/1KBFH3qMBQQ==
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr3314635137.30.1793630819128;
        Mon, 02 Nov 2026 06:46:59 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr3314617137.30.1793630818177;
        Mon, 02 Nov 2026 06:46:58 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:46:57 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] PM: sleep: Fix hibernation resume issues
Date: Mon, 02 Nov 2026 16:46:49 +0200
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFmi6GoC/yXMUQrCMBCE4auUfXYhTUugXkV8SOJoVzSGbBWh9
 O6u+vgzzLeSogmU9t1KDS9ReRSLftdRnmO5gOVkTd750Ds/cBq53llvQOVZElqJi334LG8o52H
 COMUYgnNkRm34DUYcjv/WZ7oiL1+Utu0D5itbCoEAAAA=
X-Change-ID: 20261023-b4-pm-sleep-hibernation-fixes-c39e49aa6600
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpjDCDxjyShMTioaXJsBmpTOt9aj2od6L/uCbcKk7O4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJdPWGen0uj+yjZxJs22KFL+4uFJr+n3DwDQ
 6RkFmzZWwiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXQAKCRAbX0TJAJUV
 VmEzD/9cS8LENi3UEa0MwSEH5UXPCIzmHZqlPVZg9sHCdolXVwSQ3Y+Z64HNEIs6nUt8JSSNE6e
 2SJCO1KwAy9lVx3JJ5VnWshO39bXf1o9gpGLYMzxZuqcadXHHhRovuLVPHuEAH+/Hzb/zR755Ui
 YxzE7k2xQcuWA9hyzhIFnHRvrm+sbuTh6/J/jYrur9gpwoy0Ls9ml1bAciTXl90hsWk3PX8ncKF
 IjTDlmwIKan3oVyj2nxzmBFO9FodSxcp1q0Gv1n74SgVDNg3i55LFdtyqIc9z0qonmmSd0aNUye
 a+MNZXRjsg94JUgIE1NVXeTfHSw7upItC4FVWyMZnE7cK47uB3Qj1lew9jei/nXijh16TzAw+uS
 ZqN9iL0BU/FpcAuoPPhPOz5miWHoV+yVlq8Rq6DW+t4tgoZgiOpEDDRgprkAsHOp9jlp2wRd6d3
 wKydanQYIx90UKDRrI3dbn6BcrtgX33yLX9ZsBG0/nm+zXS+tZ7/Sy+WsoesOjzFdH266p0BpsC
 mb3f/D39Zt4V/ME1vJ0r1QuDKg6eaSRGVEpGwcsneKMHZPWlD4Y2w4mIlW4cvkWCdGlCdzVsQt2
 eGRby5SnWkNKAZFeDmCRrXmv7dqSJ419cOfKG13La78jl374sC9ymMC9LxJoolzRwpk2FzzTyhQ
 QflY5tF6Z2SbrSA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: n7ayXQoOIDpQRdlp9nYzlG4H5r9hWApV
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8a265 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UGObRx22djLrfVSxTIgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: n7ayXQoOIDpQRdlp9nYzlG4H5r9hWApV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX61PCd5eavUZU
 yLquwf0Ds3ClW3kY6GNaMy9SSU1jQ+edAJA6vOjNvMQrGLCCkVgU75LEQFee06RIBKBq7M18M9v
 13LFSLPvPrRD2CtUvh1FhxejidEoZr42EfjW9n9iJb3qzETOyoi8r9b5LSt8ezwr4Zf+FvdNQ1T
 eBTzriPVVFGKtBHPuh/7DVHJC0YIEuf+AP6v0pB9EHWGatPNbac1N+THDQyP2VoudUys3MyJgxQ
 5BTg1LjIjlPhgdHq0FsZ+JBA8oZzQ87fIlcd9ZEhheMR+eIGXWwdIwLo9QOc2dbKm2n5T/ftq09
 U85rv/Q4lbazb47h00qZet5ItDSfRdAPSgJYXi2+V9mutmAsWeUsOB0wJtv66PP3sRbj9jzdZ7s
 +Z+wcY1RoG6pKSZMOE5qPTj5VhrbrorWQQhX+6qd/33ZR15JNTK0/2xXtWZX47QYaptG+HkCiq+
 CoOuI78XpYFWpQJthqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX0TAYZlOGFBlV
 Bm7mBCoDbg0FuXU0yHspCxeMyqzeDJ5Quky+O3meqtOryv6VaTO7rvEIWCGXurKDnYJaabblsTO
 CDpnq0lCIQVgQeJ5JIXKBSwY30XD2p0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

Two things the PM core gets wrong on the hibernation paths, found while
getting the Qualcomm Glymur CRD to resume from hibernation.

The first one marks devices without PM callbacks as active when
restoring from hibernation, even though nothing resumes them, so the
next runtime suspend of such a device releases resources that are
already off. Seen with the CoreSight devices, whose AMBA bus clock gets
disabled twice.

The second one arms the wakeup interrupts for the freeze and quiesce
phases of a hibernation, which can only abort the operation, since the
system never goes to sleep there. The WWAN slot WAKE# of the Glymur CRD
fires as soon as the modem is powered down, and the hibernation never
gets to write the image.

Tested on the Qualcomm Glymur CRD, where hibernation and restore now
complete.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      PM: sleep: Do not mark devices without PM callbacks active on resume
      PM: sleep: Do not arm wakeup IRQs for hibernation freeze and quiesce

 drivers/base/power/main.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261023-b4-pm-sleep-hibernation-fixes-c39e49aa6600

Best regards,
--  

Abel

