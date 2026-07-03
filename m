Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5C34388A
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091149; cv=none; b=mL0/8NCX3nLWezG0h7bXcacKl681ap40dYjOj3ceYDLd8za41YeRYjrcyOUCZyVEE396CZvfJ4COwPqIbQmwcXCP5gLAI5A2oSae9aZe3A5oKwyIoS45OrLVm+ChR4x+yepQ0v+J4TKYd6s063lbtLi4iL4ojsI73bSUNi6JCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091149; c=relaxed/simple;
	bh=2JNfmkrDXlzcvSizv/iAqx3lfl6qRnhrAE7oNNSShdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FiSMDljo4EjqYuwsFJoY7BCK39PUB0KTn9F2RoZpFDcD3zZzc3WBVNTeUEBBpjrSE2OggR3PTjlV4952cSf5Co4R0l1J5LNz8TrAjmpxVVbrB2ur2jJB58auohtkghTBnD7plVOVgtWrUF9YByggnnm/C9OXxt2tWBgbqzIh7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsieaRLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcvdG/TP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsieaRLS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcvdG/TP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663E0bFI3410192
	for <driver-core@lists.linux.dev>; Fri, 3 Jul 2026 15:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ymd1YdLxXbtUH6VcGFjA1u
	H5awiZ4CUoXHPYrby/Xn8=; b=SsieaRLSdLfL5RPxXFNoz3G7Fi5vTs89jcFp9X
	SVxukLqjMdIjzIVFqLb4guYkqH+n8vLqw0AGn76wq+8aNl3dd2F7YslNLdmlLsYD
	6UqO1J2QCwbvajiWhDg/MYd7QCbB4w5UQz5wv4YcgWtWxE69ZXyrMfuMFEeZSBW+
	SuDBuDYBqecyQcAmBoCrZS4Kf4XDolaU4tyFj/NKtVff9vvthwUm8KPjpKI4aGUc
	tweI4b/7DpPxNDTy3WOVxlx2AqnFAgDRSM3YBQXl6nV1WbZMlbgMIkxaQJt8Tg7S
	zgT3Ctcq2Z476NgHGIjXiNDMRDCktTRxpsSPQSuZPZPcpT2A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u31mp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 15:05:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1032210a12.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091137; x=1783695937; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymd1YdLxXbtUH6VcGFjA1uH5awiZ4CUoXHPYrby/Xn8=;
        b=LcvdG/TP8MVwmd8h5Yb9/zOmkjRRqV2I1+2JPS8uT/huqrjw5LpfVUhxwP/0HfKrw0
         KWksQg0+lG8Wv2AiZ1L+EaR7ukT9EDG77ThhUCbcnQ94LUHM+QkbHqn9V2KZqcWV1KKL
         bF5USXew5GM0mB8qr9o37bVxyofy72T9MxPvQKnd25DtqtVDnnyWP4tRxWyC+pV/d5Bs
         G4gDaxvFTp5zvhi7qw3ds7ZL3wBGk5AEh1UvwuKYat4gHbMNZte/l4RJhlUfCTNAoXNQ
         Q4kxTXT8l/7Cx4Bpc/Ro1XTvsczlmEGgXy+7IZ/HhxHn+xfH+o5r2fj/Plg3+tdIUdSf
         g8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091137; x=1783695937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymd1YdLxXbtUH6VcGFjA1uH5awiZ4CUoXHPYrby/Xn8=;
        b=dHv3HQuEaLqTJ51GYtHpdmEyrpQsnBaxMV5MyFWISdjtDXpNBe0OOi6qYO3/IXGjL0
         gY/WPpWNa245zc608MW0ziFP2CtOw4mzLA4kL+FZbQGk7IicYY8vREK7J7mwHA4/WE9J
         FFYfchM2cKFxYAlsxsilWWr2ds2XU0fZ8RmLi/0PSUZeV4vcJyLZBziq3kfzVm/CfNCZ
         SaE2WyQVLoJFkyUg6r6/G/r5vN3eDFyOXw5JExQvnAQHJnNhR1ZxvoG9NGlE9bzDMsGS
         FzmQGr+hMpLl6Uvy4mC912Qf65Qsg+bQKfRj8WXSO1gvNQIQX27ZIeVZ6ovR+OQ8JS9P
         zTtQ==
X-Forwarded-Encrypted: i=1; AFNElJ80ROAcXGku+hYHbkxSNjEERmCbzoUm+/xbngNVbJWwSPgxIAfzJAlv2Ttnsrj+9qsTEfTgGTYRYuQXgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ3VYIN+y5hC8/VAf1BIqn4sZ6NMXJXjYG5LAgHkNZjF3H0r4v
	qLB6mwJyalUUn5KTJWBuemXdWT6TXwpIGvHGvsQsjDU5dGNz5PkylBSpdM4T73T5k4iAIN0AMFY
	ccWNO9PQoWCu8AVhHWwgKVRXHzEeEezR5WYa2dELuFT2Xu6RCI92bvITETIvIoz2DAA==
X-Gm-Gg: AfdE7cnU91ruV/ZhEwarTFMyC+a7jOcY3gFWWF9Lr+cAP6XfJV+A63p5NZjvaN3G4rc
	hnuueWeyO4Ho7e9wjnevu7p9ymuXJUBUoeKK0H0b4lRFitH6dQRfOzDJa1R97NHyphd7xf3TnZB
	515Xvn64+RcR4slf+v7c8p5NmGp30zR7RO4zenVmAnCZMsLKQECxS5Z5D5GytEbOkFcIFHV3Cor
	3Kx86fZ7LQwvnEhHzBfcUnks08wcVp8s/QartJlzTCBxfCxbkSq/abGnVzrujhFVglmbH8K5DxH
	tCb1ZsZ2lcGTScx4hGzvLfHK6oH4jt3ny2spYq08CbrrNBianDsIp9iNL+aNPC9N6G+NXtpJSk3
	Ihssr9DITBG7l3WECaOguprnm6skV9k2HLSHQPVojbkXs
X-Received: by 2002:a05:6a21:48b:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c03c6320bbmr216508637.30.1783091136848;
        Fri, 03 Jul 2026 08:05:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:48b:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c03c6320bbmr216464637.30.1783091136224;
        Fri, 03 Jul 2026 08:05:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix sticky -EINVAL after resume callback failure
Date: Fri, 03 Jul 2026 20:35:19 +0530
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK/PR2oC/5WOWwrCMBREtyL5NiWJtkG/3IeUEJNbe7Uv8yiW0
 r2btivwZ+DAMGdm4sEheHI9zMTBiB77LoE4HoipdfcEijYxEUwUrBA5rfCrfEDznhQF7EbdKF0
 FcGpolYtdwBaUHlBVGpvogBbyIi3TuTlbRtLq4CBNbMZ7ubOPjxeYsGrWRo0+9G7aLo187e12y
 cTf9pFTRgtrzYlLxrlht9777BN1Y/q2zVKQclmWH3hXCEsHAQAA
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=1942;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=2JNfmkrDXlzcvSizv/iAqx3lfl6qRnhrAE7oNNSShdw=;
 b=wa/RbKyRfhqoKsEoOwy7Ku0Vy+5t4iXcub3dAWFoKrRUmmipC9chaycRNK38K1GiPTvt9gmHl
 FwNxT9h3k/nBTbI2jgcva0bENGK4CpDSOex2Lx0VQA0gLGMfefVLhCd
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 1fcvhOa7HnYbUmc9KAUwTYIJ150Mndsn
X-Proofpoint-ORIG-GUID: 1fcvhOa7HnYbUmc9KAUwTYIJ150Mndsn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX092PCG4+w659
 hE8g8PqR/2URmKyEVtjY19FGDHc0m6pkEy2FBic7GvnnUo/UJCJUveRZtBgGI9wklXGToZxm1Iq
 lKj1iojM65zoo8eEZRTxrwO5hnbyx/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfXwnjuEqIPfNFt
 o3nCFN/otC5umfI80gB6unWvmDlk/C2hiMtGa+DhbPA2M/qG/6CJbzotpo6+FL+A7XOME5ziD22
 Q2sAKlvM5XfAQ2IaqApQbnt09NHOw38i1omapkAg+4NmtgZLLgN5JBDNfmvrOpys1pshv0cYSRb
 tFlw+i0g7MalaqiYUGolFD22EnQbWRFgkI7fviNa9evXLAAAWSF6M3BipIyNvi4WiFP6tFx/QDI
 eGvOmjMgLRdUj8oIalpgzo+HhkCbXMnWQXFzbEZq2xC6OeWRSgpRO6KMWpZeB8ynOSQQOSvOmvT
 WVgwenVdU4XUpPZOEZ5YVCRLI2pTQYyVgd9Fqi3Rq0aO4I2nfhurmL4jIN56gq52UZpGfy5QoWE
 jtYA1kFYUQnGDMa2LZ20sr1CE2t7hXSju+UAYvfrzr0ASz7pRZGK0JT79sLluX8FrJeehDHQFb5
 kNfz68XTDHqiyg3l2Ig==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47cfc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=4GhjkeDSICfBxK9jGEoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030149

When a runtime PM resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  All subsequent rpm_resume() calls
then return -EINVAL immediately at the top of the function, permanently
blocking any future resume attempt — including those triggered by
consumers trying to power up their suppliers — until runtime PM is
explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  The first
patch fixes this in the core by only setting power.runtime_error when a
suspend callback fails, leaving resume failures transient by nature.

The second patch fixes a pre-existing issue in the spi-geni-qcom driver
that this scenario exposed: pm_runtime_get_sync() was called in
spi_geni_init() without checking the return value, so a resume failure
would silently proceed to access hardware registers on a device that was
not powered up.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Reworked the fix per maintainer feedback: instead of calling
  pm_runtime_set_suspended() in rpm_get_suppliers(), fix the root cause
  in rpm_callback() by not setting power.runtime_error on resume
  callback failures.
- Removed other patches which are not needed now.
- Link to v1: https://patch.msgid.link/20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com

---
Praveen Talari (2):
      PM: runtime: Only set runtime_error on suspend callback failures
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()

 drivers/base/power/runtime.c |  8 +++++++-
 drivers/spi/spi-geni-qcom.c  | 17 ++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

